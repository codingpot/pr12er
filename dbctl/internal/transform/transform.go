// Package transform 은 데이터 타입은 변환하는 함수들이 정의 되어 있습니다.
package transform

import (
	"context"
	"fmt"
	"regexp"
	"strconv"
	"strings"

	"github.com/codingpot/paperswithcode-go/v2/models"
	"github.com/codingpot/pr12er/server/pkg/pr12er"
	"github.com/rocketlaunchr/google-search"
)

var prIDRegexp = regexp.MustCompile(`pr-?(\d+)`)

func frameworkToEnum(paperFramework string) pr12er.Framework {
	switch paperFramework {
	case "tf":
		return pr12er.Framework_FRAMEWORK_TENSORFLOW
	case "pytorch":
		return pr12er.Framework_FRAMEWORK_PYTORCH
	case "":
		return pr12er.Framework_FRAMEWORK_UNSPECIFIED
	default:
		return pr12er.Framework_FRAMEWORK_OTHERS
	}
}

// Repositories paperswithcode Repository 모델을 pr12er 에 맞는 모델로 변환.
func Repositories(repositories []models.Repository) []*pr12er.Repository {
	pr12erRepos := make([]*pr12er.Repository, len(repositories))

	for idx, repo := range repositories {
		pr12erRepos[idx] = &pr12er.Repository{
			IsOfficial:    repo.IsOfficial,
			Url:           repo.URL,
			Owner:         ownerFromURL(repo.URL),
			Framework:     frameworkToEnum(repo.Framework),
			NumberOfStars: int64(repo.Stars),
			Description:   repo.Description,
		}
	}
	return pr12erRepos
}

// TODO: it may needs more sophisticated logic.
// It assumes the input URL is well formed (github.com/<owner>/<repo name>).
func ownerFromURL(url string) string {
	splits := strings.Split(url, "/")
	if len(splits) < 2 {
		return ""
	}
	return splits[len(splits)-2]
}

// Methods paperswithcode 메소드를 pr12er 메소드로 변경.
func Methods(methods []*models.Method) []*pr12er.Method {
	pr12erMethods := make([]*pr12er.Method, len(methods))
	for idx, method := range methods {
		pr12erMethods[idx] = &pr12er.Method{
			Name:        method.Name,
			FullName:    method.FullName,
			Description: method.Description,
		}
	}
	return pr12erMethods
}

// ExtractPaperIDs Google Search with the title and gets ArxivIDs.
//
// For example,
// "PR-274: On mutual information maximization for representation learning"
// => []string{"1907.13625", "2103.04537", "1910.08350"}.
func ExtractPaperIDs(title string) ([]string, error) {
	searchTerm := prIDRegexp.ReplaceAllString(strings.ToLower(title), "") + " site:arxiv.org"
	search, err := googlesearch.Search(context.Background(), searchTerm)
	if err != nil {
		return nil, err
	}
	maxLen := 3
	if len(search) < maxLen {
		maxLen = len(search)
	}

	var paperIDs []string

	for i := 0; i < maxLen; i++ {
		arxivID, _ := ExtractArxivIDFromURL(search[i].URL)
		paperIDs = append(paperIDs, arxivID)
	}

	return paperIDs, nil
}

// ExtractArxivIDFromURL extracts ArxivID from the URL.
//
// For example,
// https://arxiv.org/abs/2102.03732 => 2102.03732
func ExtractArxivIDFromURL(url string) (string, error) {
	if !strings.Contains(url, "arxiv.org") {
		return "", fmt.Errorf("%s does not contain arxiv.org", url)
	}
	splits := strings.Split(url, "/")
	if len(splits) == 0 {
		return "", fmt.Errorf("%s does not contain any ArxivID", url)
	}
	return splits[len(splits)-1], nil
}

// ExtractPRID extracts PR ID from the title.
//
// For example,
//
// PR-274: On mutual information maximization for representation learning
// => 274.
func ExtractPRID(title string) (int32, error) {
	submatch := prIDRegexp.FindStringSubmatch(strings.ToLower(title))
	if len(submatch) < 2 {
		return 0, fmt.Errorf("expected PR-XXX but got %s", title)
	}
	//nolint:gosec
	atoi, err := strconv.Atoi(submatch[1])
	if err != nil {
		return 0, err
	}
	return int32(atoi), nil
}

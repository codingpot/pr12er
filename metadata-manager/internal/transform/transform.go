// Package transform 은 데이터 타입은 변환하는 함수들이 정의 되어 있습니다.
package transform

import (
	"strings"

	"github.com/codingpot/paperswithcode-go/v2/models"
	"github.com/codingpot/pr12er/server/pkg/pr12er"
)

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

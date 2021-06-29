// Package ghv3 provides GitHub V3 API implementation.
package ghv3

import (
	"context"

	"github.com/codingpot/pr12er/server/pkg/handlers/gh"
	"github.com/google/go-github/v36/github"
	"golang.org/x/oauth2"
)

// GitHubV3 is the v3 implementation of gh.GitHubService.
type GitHubV3 struct {
	client *github.Client
}

// CreateIssue create an issue.
func (g GitHubV3) CreateIssue(title, body string, labels []string) (*gh.GitHubIssue, error) {
	create, _, err := g.client.Issues.Create(context.Background(), "codingpot", "pr12er", &github.IssueRequest{
		Title:  &title,
		Body:   &body,
		Labels: &labels,
	})

	if create == nil {
		return nil, err
	}
	return &gh.GitHubIssue{URL: create.GetURL()}, err
}

// Ensure the GitHubV3 implements gh.GitHubService interface.
var _ gh.GitHubService = (*GitHubV3)(nil)

func New(apiKey string) *GitHubV3 {
	client := github.NewClient(oauth2.NewClient(context.Background(), oauth2.StaticTokenSource(
		&oauth2.Token{AccessToken: apiKey},
	)))
	return &GitHubV3{
		client: client,
	}
}

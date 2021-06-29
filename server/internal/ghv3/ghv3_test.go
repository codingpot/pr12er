package ghv3

import (
	"context"
	"os"
	"testing"

	"github.com/codingpot/pr12er/server/pkg/handlers/gh"
	"github.com/google/go-github/v36/github"
	"github.com/stretchr/testify/assert"
	"golang.org/x/oauth2"
)

func TestGitHubV3_CreateIssue(t *testing.T) {
	t.Skip("this will create an issue; so skip for now")

	githubAPIKey := os.Getenv("GITHUB_API_KEY")
	t.Logf("GITHUB_API_KEY=%s", githubAPIKey)

	type fields struct {
		client *github.Client
	}
	type args struct {
		title  string
		body   string
		labels []string
	}
	tests := []struct {
		name    string
		fields  fields
		args    args
		want    *gh.GitHubIssue
		wantErr bool
	}{
		{
			name: "It should create a ticket",
			fields: fields{
				client: github.NewClient(
					oauth2.NewClient(
						context.Background(),
						oauth2.StaticTokenSource(
							&oauth2.Token{AccessToken: githubAPIKey}))),
			},
			args: args{
				title:  "TEST TICKET 1",
				body:   "TEST TICKET BODY",
				labels: []string{"data", "test"},
			},
			wantErr: false,
		},
	}
	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			g := GitHubV3{
				client: tt.fields.client,
			}
			got, err := g.CreateIssue(tt.args.title, tt.args.body, tt.args.labels)
			if tt.wantErr {
				assert.Error(t, err)
			} else {
				assert.NoError(t, err)
				assert.NotEmpty(t, got.URL)
			}
		})
	}
}

package transform

import (
	"testing"

	"github.com/codingpot/paperswithcode-go/v2/models"
	"github.com/codingpot/pr12er/server/pkg/pr12er"
	"github.com/google/go-cmp/cmp"
	"github.com/stretchr/testify/assert"
	"google.golang.org/protobuf/testing/protocmp"
)

func TestRepositories(t *testing.T) {
	repositories := []models.Repository{
		{
			URL:         "https://github.com/codingpot/pr12er",
			IsOfficial:  false,
			Description: "PR12er Codingpot",
			Stars:       1234,
			Framework:   "tf",
		},
	}

	got := Repositories(repositories)

	want := []*pr12er.Repository{
		{
			IsOfficial:    false,
			Url:           "https://github.com/codingpot/pr12er",
			Owner:         "codingpot",
			Framework:     pr12er.Framework_FRAMEWORK_TENSORFLOW,
			NumberOfStars: 1234,
			Description:   "PR12er Codingpot",
		},
	}

	assert.Equal(t, len(want), len(got))
	if diff := cmp.Diff(want, got, protocmp.Transform()); diff != "" {
		t.Errorf("diff is found %s", diff)
	}
}

func TestMethods(t *testing.T) {
	args := []*models.Method{
		{
			ID:          "method-1",
			Name:        "Convolution",
			FullName:    "Convolution Method",
			Description: "Convolution Method is cool",
			Paper:       nil,
		},
	}

	got := Methods(args)

	want := []*pr12er.Method{
		{
			Name:        "Convolution",
			FullName:    "Convolution Method",
			Description: "Convolution Method is cool",
		},
	}

	assert.Equal(t, len(want), len(got))
	if diff := cmp.Diff(want, got, protocmp.Transform()); diff != "" {
		t.Errorf("diff is found %s", diff)
	}
}

func Test_ownerFromURL(t *testing.T) {
	tests := []struct {
		name string
		url  string
		want string
	}{
		{
			name: "Extract owner from URL",
			url:  "https://github.com/codingpot/pr12er",
			want: "codingpot",
		},
		{
			name: "Returns empty when URL is not valid",
			url:  "codingpotpr12er",
			want: "",
		},
	}
	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			assert.Equal(t, tt.want, ownerFromURL(tt.url))
		})
	}
}

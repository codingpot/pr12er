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

func TestExtractPRID(t *testing.T) {
	tests := []struct {
		name    string
		title   string
		want    int32
		wantErr bool
	}{
		{
			name:    "PR-274 should return 274",
			title:   "PR-274: On mutual information maximization for representation learning",
			want:    274,
			wantErr: false,
		},
		{
			name:    "PR274 should return 274",
			title:   "PR274: On mutual information maximization for representation learning",
			want:    274,
			wantErr: false,
		},
		{
			name:    "PR000 should return 0",
			title:   "PR000:On mutual information maximization for representation learning",
			want:    0,
			wantErr: false,
		},
		{
			name:    "Invalid name should return an error",
			title:   "This is not a valid PR Video",
			wantErr: true,
		},
	}

	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			got, err := ExtractPRID(tt.title)
			if tt.wantErr {
				assert.Error(t, err)
			} else {
				assert.NoError(t, err)
				assert.Equal(t, tt.want, got)
			}
		})
	}
}

func TestExtractPaperIDs(t *testing.T) {
	t.Skip("Skip this function as Google can block you")

	tests := []struct {
		name    string
		title   string
		want    []string
		wantErr bool
	}{
		{
			name:    "It returns up to 3 papers by inferring from the title",
			title:   "PR-274: On mutual information maximization for representation learning",
			want:    []string{"1907.13625", "2103.04537", "1910.08350"},
			wantErr: false,
		},
	}

	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			got, err := ExtractPaperIDs(tt.title)
			if tt.wantErr {
				assert.Error(t, err)
			} else {
				assert.NoError(t, err)
				assert.Equal(t, tt.want, got)
			}
		})
	}
}

func TestExtractArxivIDFromURL(t *testing.T) {
	tests := []struct {
		name    string
		url     string
		want    string
		wantErr bool
	}{
		{
			name:    "Valid URL returns the arxivID",
			url:     "https://arxiv.org/abs/2103.04537",
			want:    "2103.04537",
			wantErr: false,
		},
		{
			name:    "Invalid URL returns an error",
			url:     "https://gabs/2103.04537",
			wantErr: true,
		},
		{
			name:    "Valid but dirty URL returns an error",
			url:     "https://arxiv.org/abs/2103.04537?aidosfjoijkalejglutm_a232859.23582",
			want:    "2103.04537",
			wantErr: false,
		},
	}
	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			got, err := ExtractArxivIDFromURL(tt.url)
			if tt.wantErr {
				assert.Error(t, err)
			} else {
				assert.NoError(t, err)
				assert.Equal(t, tt.want, got)
			}
		})
	}
}

func TestExtractYouTubeID(t *testing.T) {
	type args struct {
		link string
	}
	tests := []struct {
		name    string
		args    args
		want    string
		wantErr bool
	}{
		{
			name: "https://www.youtube.com/watch?v=rtuJqQDWmIA => rtuJqQDWmIA",
			args: args{
				link: "https://www.youtube.com/watch?v=rtuJqQDWmIA",
			},
			want:    "rtuJqQDWmIA",
			wantErr: false,
		},
		{
			name: "https://youtube.com/watch?v=rtuJqQDWmIA => rtuJqQDWmIA",
			args: args{
				link: "https://youtube.com/watch?v=rtuJqQDWmIA",
			},
			want:    "rtuJqQDWmIA",
			wantErr: false,
		},
		{
			name: "https://youtu.be/rtuJqQDWmIA => rtuJqQDWmIA",
			args: args{
				link: "https://youtu.be/rtuJqQDWmIA",
			},
			want:    "rtuJqQDWmIA",
			wantErr: false,
		},
		{
			name: "invalid url returns an error",
			args: args{
				link: "www.gooogle.com",
			},
			want:    "",
			wantErr: true,
		},
	}
	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			got, err := ExtractYouTubeID(tt.args.link)
			if tt.wantErr {
				assert.Error(t, err)
			} else {
				assert.NoError(t, err)
				assert.Equal(t, tt.want, got)
			}
		})
	}
}

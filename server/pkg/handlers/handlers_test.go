package handlers

import (
	"testing"

	"github.com/codingpot/pr12er/server/internal/data"
	"github.com/codingpot/pr12er/server/internal/mock_gh"
	"github.com/codingpot/pr12er/server/pkg/handlers/gh"
	"github.com/codingpot/pr12er/server/pkg/pr12er"
	"github.com/golang/mock/gomock"
	"github.com/google/go-cmp/cmp"
	"github.com/stretchr/testify/assert"
	"google.golang.org/protobuf/testing/protocmp"
)

// nolint:funlen
func TestConvertToGet(t *testing.T) {
	type args struct {
		db *pr12er.Database
	}
	tests := []struct {
		name string
		args args
		want *pr12er.GetVideosResponse
	}{
		{
			name: "convert pr12er.Database to GetVideosResponse in sorted order",
			args: args{
				db: &pr12er.Database{
					PrIdToVideo: map[int32]*pr12er.PrVideo{
						199: {
							PrId: 199,
							Video: &pr12er.YouTubeVideo{
								VideoId:       "video-id-199",
								VideoTitle:    "Video Title",
								NumberOfLikes: 3,
								NumberOfViews: 4,
							},
						},
						2: {
							PrId: 2,
							Video: &pr12er.YouTubeVideo{
								VideoId:       "video-id-1",
								VideoTitle:    "Video Title",
								NumberOfLikes: 1,
								NumberOfViews: 2,
							},
							Papers: []*pr12er.Paper{
								{
									PaperId: "paper-id-2",
									Title:   "paper-title-2",
									Methods: []*pr12er.Method{
										{
											Name: "Method 1",
										},
									},
								},
							},
						},
					},
				},
			},
			want: &pr12er.GetVideosResponse{
				Videos: []*pr12er.Video{
					{
						PrId:          2,
						Title:         "Video Title",
						Link:          "https://youtu.be/video-id-1",
						NumberOfLike:  1,
						NumberOfViews: 2,
						Keywords:      []string{"Method 1"},
					},
					{
						PrId:          199,
						Title:         "Video Title",
						Link:          "https://youtu.be/video-id-199",
						NumberOfLike:  3,
						NumberOfViews: 4,
					},
				},
			},
		},
	}

	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			h := New(nil)
			got := h.VideosResponseFromDB(tt.args.db)
			if got := cmp.Diff(tt.want, got, protocmp.Transform()); got != "" {
				t.Error(got)
			}
		})
	}
}

func TestDetailResponseFromDB(t *testing.T) {
	type args struct {
		prID int32
		db   *pr12er.Database
	}
	tests := []struct {
		name    string
		args    args
		want    *pr12er.GetDetailResponse
		wantErr bool
	}{
		{
			name: "Returns a correct GetDetailResponse",
			args: args{
				prID: 1,
				db:   &data.DB,
			},
			want: &pr12er.GetDetailResponse{Detail: &pr12er.Detail{
				PrId: 1,
				Papers: []*pr12er.Paper{
					{
						PaperId:  "generative-adversarial-networks",
						Title:    "Generative Adversarial Networks",
						ArxivId:  "1406.2661",
						Abstract: "We propose a new framework for",
						Authors: []string{
							"Ian J. Goodfellow", "Jean Pouget-Abadie", "Mehdi Mirza", "Bing Xu",
							"David Warde-Farley", "Sherjil Ozair", "Aaron Courville", "Yoshua Bengio",
						},
						Repositories: nil,
						Methods: []*pr12er.Method{
							{Name: "GAN", FullName: "Generative Adversarial Network"},
							{Name: "Convolution", FullName: "Convolution"},
						},
					},
				},
			}},
			wantErr: false,
		},
		{
			name: "Returns an error when no PR is found",
			args: args{
				prID: 0,
				db:   nil,
			},
			want:    nil,
			wantErr: true,
		},
	}
	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			h := New(nil)
			got, err := h.DetailResponseFromDB(tt.args.prID, tt.args.db)
			if tt.wantErr {
				assert.Error(t, err)
			} else {
				assert.NoError(t, err)
			}

			if diff := cmp.Diff(tt.want, got,
				protocmp.IgnoreFields(&pr12er.Method{}, "description"),
				protocmp.IgnoreFields(&pr12er.Paper{}, "abstract", "published_date", "repositories"),
				protocmp.Transform()); diff != "" {
				t.Error(diff)
			}
		})
	}
}

func TestHandler_Report(t *testing.T) {
	ctrl := gomock.NewController(t)
	defer ctrl.Finish()

	{
		// GIVEN a report
		in := &pr12er.ReportRequest{
			Type: pr12er.ReportRequest_REPORT_TYPE_BUG,
			Body: "Bug Bug Bug",
		}

		// THEN it should create a issue with the following information.
		mockService := mock_gh.NewMockGitHubService(ctrl)
		mockService.
			EXPECT().
			CreateIssue(
				gomock.Eq("버그 리포트"),
				gomock.Eq("Bug Bug Bug"),
				gomock.Eq([]string{"bug"}),
			).
			Return(&gh.GitHubIssue{URL: "github-issue-url"}, nil)

		// THEN checks the response contains the URL.
		want := &pr12er.ReportResponse{
			IssueUrl: "github-issue-url",
		}
		h := New(mockService)
		got, err := h.Report(in)
		assert.NoError(t, err)
		if diff := cmp.Diff(want, got, protocmp.Transform()); diff != "" {
			t.Error(diff)
		}
	}
}

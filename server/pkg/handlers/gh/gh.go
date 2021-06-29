package gh

type GitHubIssue struct {
	URL string
}

type GitHubService interface {
	CreateIssue(title, body string, labels []string) (*GitHubIssue, error)
}

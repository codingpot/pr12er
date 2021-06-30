//go:generate mockgen -source pkg/handlers/gh/gh.go -destination internal/mock_gh/mock_gh.go GitHubService
package main

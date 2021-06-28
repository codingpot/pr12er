module github.com/codingpot/pr12er/dbctl

go 1.16

require (
	github.com/PuerkitoBio/goquery v1.7.0 // indirect
	github.com/antchfx/xmlquery v1.3.6 // indirect
	github.com/antchfx/xpath v1.2.0 // indirect
	github.com/codingpot/paperswithcode-go/v2 v2.1.3
	github.com/codingpot/pr12er/server v0.0.0-20210628060141-9eaef63d18a8
	github.com/gocolly/colly/v2 v2.1.0 // indirect
	github.com/golang/groupcache v0.0.0-20210331224755-41bb18bfe9da // indirect
	github.com/google/go-cmp v0.5.6
	github.com/rocketlaunchr/google-search v1.1.2
	github.com/sirupsen/logrus v1.8.1
	github.com/spf13/cobra v1.1.3
	github.com/spf13/viper v1.8.1
	github.com/stretchr/testify v1.7.0
	github.com/temoto/robotstxt v1.1.2 // indirect
	golang.org/x/oauth2 v0.0.0-20210622215436-a8dc77f794b6 // indirect
	golang.org/x/time v0.0.0-20210611083556-38a9dc6acbc6
	google.golang.org/api v0.49.0
	google.golang.org/genproto v0.0.0-20210624195500-8bfb893ecb84 // indirect
	google.golang.org/protobuf v1.27.0
)

replace github.com/codingpot/pr12er/server v0.0.0-20210618171448-3868874e9b7a => ../server/

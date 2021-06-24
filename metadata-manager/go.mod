module github.com/codingpot/pr12er/metadata-manager

go 1.16

require (
	github.com/codingpot/paperswithcode-go/v2 v2.1.3
	github.com/codingpot/pr12er/server v0.0.0-20210618171448-3868874e9b7a
	github.com/sirupsen/logrus v1.8.1
	github.com/spf13/cobra v1.1.3
	github.com/spf13/viper v1.7.0
	github.com/stretchr/testify v1.7.0
	google.golang.org/api v0.48.0
	google.golang.org/protobuf v1.26.0
)

replace github.com/codingpot/pr12er/server v0.0.0-20210618171448-3868874e9b7a => ../server/

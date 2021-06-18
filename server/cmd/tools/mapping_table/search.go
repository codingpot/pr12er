package mapping_table

import (
	"context"
	"fmt"
	"google.golang.org/api/customsearch/v1"
	"google.golang.org/api/option"
	"log"
	"strings"
)

func getLastBitsFrom(url string) string {
	index := strings.LastIndex(url, "/")
	return url[index+1:]
}

func searchArxivId(apiKey string, query string) string {
	ctx := context.Background()
	customSearchService, err := customsearch.NewService(ctx, option.WithAPIKey(apiKey))
	if err != nil {
		log.Fatal(err)
	}

	const cx = "4fae55326ddbe865c"
	resp, err := customSearchService.Cse.List().Cx(cx).Q(fmt.Sprintf("%s", query)).Do()
	if err != nil {
		log.Fatal(err)
	}

	if len(resp.Items) == 0 {
		return "null"
	}
	return getLastBitsFrom(resp.Items[0].Link)
}

package cmd

import (
	"fmt"
	"testing"

	"github.com/stretchr/testify/assert"
)

func TestFetchArxivPapersInfo(t *testing.T) {
	paperArxivId := []string{"1406.2661", "1703.06211"}
	papers := fetchArxivPapersInfo(paperArxivId)

	expectedType := "[]*pr12er.Paper"
	actualType := fmt.Sprintf("%T", papers)
	assert.Equal(t, expectedType, actualType)
}

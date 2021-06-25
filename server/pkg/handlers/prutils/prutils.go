// Package prutils contains util functions for PR model.
package prutils

import (
	"strings"

	"github.com/codingpot/pr12er/server/pkg/pr12er"
	log "github.com/sirupsen/logrus"
)

// NOTE.
// Each keywords should be all lower cased.

var visionKeywords = []string{
	"vision",
	"detect",
}

var nlpKeywords = []string{
	"text",
	"sentence",
}

var ocrKeywords = []string{
	"ocr",
}

var audioKeywords = []string{
	"audio",
}

var recommendationSystemKeywords = []string{
	"recommend",
}

// CategoryFromVideo TODO: Convert to more sophisticated algorithm.
func CategoryFromVideo(prVideo *pr12er.PrVideo) pr12er.Category {
	title := strings.ToLower(prVideo.GetVideo().GetVideoTitle())

	//nolint:gocritic
	if containsAnyElem(title, visionKeywords) {
		return pr12er.Category_CATEGORY_VISION
	} else if containsAnyElem(title, nlpKeywords) {
		return pr12er.Category_CATEGORY_NLP
	} else if containsAnyElem(title, ocrKeywords) {
		return pr12er.Category_CATEGORY_OCR
	} else if containsAnyElem(title, audioKeywords) {
		return pr12er.Category_CATEGORY_AUDIO
	} else if containsAnyElem(title, recommendationSystemKeywords) {
		return pr12er.Category_CATEGORY_RS
	}

	return pr12er.Category_CATEGORY_UNSPECIFIED
}

func containsAnyElem(title string, keywords []string) bool {
	for _, keyword := range keywords {
		if strings.Contains(title, keyword) {
			log.WithFields(log.Fields{
				"title":   title,
				"keyword": keyword,
			}).Info("found category keyword")
			return true
		}
	}
	return false
}

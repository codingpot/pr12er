package io

import (
	"os"
	"testing"

	"github.com/codingpot/pr12er/server/pkg/pr12er"
	"github.com/google/go-cmp/cmp"
	"github.com/stretchr/testify/assert"
	"google.golang.org/protobuf/encoding/prototext"
	"google.golang.org/protobuf/testing/protocmp"
)

func TestMappingTableFromFilepath(t *testing.T) {
	filePath := "../../../server/internal/data/mapping_table.pbtxt"
	table, err := MappingTableFromFilepath(filePath)
	assert.NoError(t, err)
	assert.Greater(t, len(table.GetRows()), 0)
}

func TestDumpDatabase(t *testing.T) {
	database := &pr12er.Database{PrIdToVideo: map[int32]*pr12er.PrVideo{
		1: {
			PrId:   1,
			Papers: nil,
			Video:  nil,
		},
	}}

	tmpdir := t.TempDir()
	outFilePath := tmpdir + "/out.pbtxt"

	err := DumpDatabase(database, outFilePath)
	assert.NoError(t, err)

	bytes, err := os.ReadFile(outFilePath)
	assert.NoError(t, err)

	var databaseFromOut pr12er.Database
	err = prototext.Unmarshal(bytes, &databaseFromOut)
	assert.NoError(t, err)

	if diff := cmp.Diff(database, &databaseFromOut, protocmp.Transform()); diff != "" {
		assert.Equal(t, "", diff)
	}
}

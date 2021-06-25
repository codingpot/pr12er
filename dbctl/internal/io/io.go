// Package io 는 파일 입출력을 담당합니다.
package io

import (
	"os"

	"github.com/codingpot/pr12er/server/pkg/pr12er"
	"google.golang.org/protobuf/encoding/prototext"
)

// MappingTableFromFilepath mappingFilePath 를 읽어 MappingTable 을 반환합니다
// mappingFilePath 가 MappingTable 이어야 합니다.
func MappingTableFromFilepath(mappingFilePath string) (*pr12er.MappingTable, error) {
	b, err := os.ReadFile(mappingFilePath)
	if err != nil {
		return nil, err
	}

	var mappingTable pr12er.MappingTable
	if err := prototext.Unmarshal(b, &mappingTable); err != nil {
		return nil, err
	}
	return &mappingTable, nil
}

// DumpDatabase database를 outFilePath에 dump합니다.
func DumpDatabase(database *pr12er.Database, outFilePath string) error {
	bs, err := prototext.MarshalOptions{
		Multiline: true,
		Indent:    "  ",
	}.Marshal(database)
	if err != nil {
		return err
	}
	// save as a .pbtxt
	return os.WriteFile(outFilePath, bs, 0o600)
}

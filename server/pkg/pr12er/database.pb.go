// Code generated by protoc-gen-go. DO NOT EDIT.
// versions:
// 	protoc-gen-go v1.26.0
// 	protoc        v3.17.1
// source: pkg/pr12er/database.proto

package pr12er

import (
	protoreflect "google.golang.org/protobuf/reflect/protoreflect"
	protoimpl "google.golang.org/protobuf/runtime/protoimpl"
	timestamppb "google.golang.org/protobuf/types/known/timestamppb"
	reflect "reflect"
	sync "sync"
)

const (
	// Verify that this generated code is sufficiently up-to-date.
	_ = protoimpl.EnforceVersion(20 - protoimpl.MinVersion)
	// Verify that runtime/protoimpl is sufficiently up-to-date.
	_ = protoimpl.EnforceVersion(protoimpl.MaxVersion - 20)
)

type MappingTable struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	Rows []*MappingTableRow `protobuf:"bytes,1,rep,name=rows,proto3" json:"rows,omitempty"`
}

func (x *MappingTable) Reset() {
	*x = MappingTable{}
	if protoimpl.UnsafeEnabled {
		mi := &file_pkg_pr12er_database_proto_msgTypes[0]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *MappingTable) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*MappingTable) ProtoMessage() {}

func (x *MappingTable) ProtoReflect() protoreflect.Message {
	mi := &file_pkg_pr12er_database_proto_msgTypes[0]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use MappingTable.ProtoReflect.Descriptor instead.
func (*MappingTable) Descriptor() ([]byte, []int) {
	return file_pkg_pr12er_database_proto_rawDescGZIP(), []int{0}
}

func (x *MappingTable) GetRows() []*MappingTableRow {
	if x != nil {
		return x.Rows
	}
	return nil
}

type MappingTableRow struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	PrId           int32    `protobuf:"varint,1,opt,name=pr_id,json=prId,proto3" json:"pr_id,omitempty"`
	PaperArxivId   []string `protobuf:"bytes,2,rep,name=paper_arxiv_id,json=paperArxivId,proto3" json:"paper_arxiv_id,omitempty"`
	YoutubeVideoId string   `protobuf:"bytes,3,opt,name=youtube_video_id,json=youtubeVideoId,proto3" json:"youtube_video_id,omitempty"`
}

func (x *MappingTableRow) Reset() {
	*x = MappingTableRow{}
	if protoimpl.UnsafeEnabled {
		mi := &file_pkg_pr12er_database_proto_msgTypes[1]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *MappingTableRow) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*MappingTableRow) ProtoMessage() {}

func (x *MappingTableRow) ProtoReflect() protoreflect.Message {
	mi := &file_pkg_pr12er_database_proto_msgTypes[1]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use MappingTableRow.ProtoReflect.Descriptor instead.
func (*MappingTableRow) Descriptor() ([]byte, []int) {
	return file_pkg_pr12er_database_proto_rawDescGZIP(), []int{1}
}

func (x *MappingTableRow) GetPrId() int32 {
	if x != nil {
		return x.PrId
	}
	return 0
}

func (x *MappingTableRow) GetPaperArxivId() []string {
	if x != nil {
		return x.PaperArxivId
	}
	return nil
}

func (x *MappingTableRow) GetYoutubeVideoId() string {
	if x != nil {
		return x.YoutubeVideoId
	}
	return ""
}

type Database struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	PrIdToVideo map[int32]*PrVideo `protobuf:"bytes,1,rep,name=pr_id_to_video,json=prIdToVideo,proto3" json:"pr_id_to_video,omitempty" protobuf_key:"varint,1,opt,name=key,proto3" protobuf_val:"bytes,2,opt,name=value,proto3"`
}

func (x *Database) Reset() {
	*x = Database{}
	if protoimpl.UnsafeEnabled {
		mi := &file_pkg_pr12er_database_proto_msgTypes[2]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *Database) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*Database) ProtoMessage() {}

func (x *Database) ProtoReflect() protoreflect.Message {
	mi := &file_pkg_pr12er_database_proto_msgTypes[2]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use Database.ProtoReflect.Descriptor instead.
func (*Database) Descriptor() ([]byte, []int) {
	return file_pkg_pr12er_database_proto_rawDescGZIP(), []int{2}
}

func (x *Database) GetPrIdToVideo() map[int32]*PrVideo {
	if x != nil {
		return x.PrIdToVideo
	}
	return nil
}

// PR영상의 하나의 레코드
type PrVideo struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	PrId int32 `protobuf:"varint,1,opt,name=pr_id,json=prId,proto3" json:"pr_id,omitempty"`
	// 관련도에 따라 정렬
	Papers []*Paper      `protobuf:"bytes,2,rep,name=papers,proto3" json:"papers,omitempty"`
	Video  *YouTubeVideo `protobuf:"bytes,3,opt,name=video,proto3" json:"video,omitempty"`
}

func (x *PrVideo) Reset() {
	*x = PrVideo{}
	if protoimpl.UnsafeEnabled {
		mi := &file_pkg_pr12er_database_proto_msgTypes[3]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *PrVideo) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*PrVideo) ProtoMessage() {}

func (x *PrVideo) ProtoReflect() protoreflect.Message {
	mi := &file_pkg_pr12er_database_proto_msgTypes[3]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use PrVideo.ProtoReflect.Descriptor instead.
func (*PrVideo) Descriptor() ([]byte, []int) {
	return file_pkg_pr12er_database_proto_rawDescGZIP(), []int{3}
}

func (x *PrVideo) GetPrId() int32 {
	if x != nil {
		return x.PrId
	}
	return 0
}

func (x *PrVideo) GetPapers() []*Paper {
	if x != nil {
		return x.Papers
	}
	return nil
}

func (x *PrVideo) GetVideo() *YouTubeVideo {
	if x != nil {
		return x.Video
	}
	return nil
}

// 유튜브 1편에 대한 정보
// `pkg.pr12er.Video` 생성하기 위해 사용됩니다.
type YouTubeVideo struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	VideoId       string                 `protobuf:"bytes,1,opt,name=video_id,json=videoId,proto3" json:"video_id,omitempty"`
	VideoTitle    string                 `protobuf:"bytes,2,opt,name=video_title,json=videoTitle,proto3" json:"video_title,omitempty"`
	NumberOfLikes int64                  `protobuf:"varint,3,opt,name=number_of_likes,json=numberOfLikes,proto3" json:"number_of_likes,omitempty"`
	NumberOfViews int64                  `protobuf:"varint,4,opt,name=number_of_views,json=numberOfViews,proto3" json:"number_of_views,omitempty"`
	PublishedDate *timestamppb.Timestamp `protobuf:"bytes,5,opt,name=published_date,json=publishedDate,proto3" json:"published_date,omitempty"`
	Uploader      string                 `protobuf:"bytes,6,opt,name=uploader,proto3" json:"uploader,omitempty"`
}

func (x *YouTubeVideo) Reset() {
	*x = YouTubeVideo{}
	if protoimpl.UnsafeEnabled {
		mi := &file_pkg_pr12er_database_proto_msgTypes[4]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *YouTubeVideo) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*YouTubeVideo) ProtoMessage() {}

func (x *YouTubeVideo) ProtoReflect() protoreflect.Message {
	mi := &file_pkg_pr12er_database_proto_msgTypes[4]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use YouTubeVideo.ProtoReflect.Descriptor instead.
func (*YouTubeVideo) Descriptor() ([]byte, []int) {
	return file_pkg_pr12er_database_proto_rawDescGZIP(), []int{4}
}

func (x *YouTubeVideo) GetVideoId() string {
	if x != nil {
		return x.VideoId
	}
	return ""
}

func (x *YouTubeVideo) GetVideoTitle() string {
	if x != nil {
		return x.VideoTitle
	}
	return ""
}

func (x *YouTubeVideo) GetNumberOfLikes() int64 {
	if x != nil {
		return x.NumberOfLikes
	}
	return 0
}

func (x *YouTubeVideo) GetNumberOfViews() int64 {
	if x != nil {
		return x.NumberOfViews
	}
	return 0
}

func (x *YouTubeVideo) GetPublishedDate() *timestamppb.Timestamp {
	if x != nil {
		return x.PublishedDate
	}
	return nil
}

func (x *YouTubeVideo) GetUploader() string {
	if x != nil {
		return x.Uploader
	}
	return ""
}

var File_pkg_pr12er_database_proto protoreflect.FileDescriptor

var file_pkg_pr12er_database_proto_rawDesc = []byte{
	0x0a, 0x19, 0x70, 0x6b, 0x67, 0x2f, 0x70, 0x72, 0x31, 0x32, 0x65, 0x72, 0x2f, 0x64, 0x61, 0x74,
	0x61, 0x62, 0x61, 0x73, 0x65, 0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x12, 0x0a, 0x70, 0x6b, 0x67,
	0x2e, 0x70, 0x72, 0x31, 0x32, 0x65, 0x72, 0x1a, 0x1f, 0x67, 0x6f, 0x6f, 0x67, 0x6c, 0x65, 0x2f,
	0x70, 0x72, 0x6f, 0x74, 0x6f, 0x62, 0x75, 0x66, 0x2f, 0x74, 0x69, 0x6d, 0x65, 0x73, 0x74, 0x61,
	0x6d, 0x70, 0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x1a, 0x19, 0x70, 0x6b, 0x67, 0x2f, 0x70, 0x72,
	0x31, 0x32, 0x65, 0x72, 0x2f, 0x6d, 0x65, 0x73, 0x73, 0x61, 0x67, 0x65, 0x73, 0x2e, 0x70, 0x72,
	0x6f, 0x74, 0x6f, 0x22, 0x3f, 0x0a, 0x0c, 0x4d, 0x61, 0x70, 0x70, 0x69, 0x6e, 0x67, 0x54, 0x61,
	0x62, 0x6c, 0x65, 0x12, 0x2f, 0x0a, 0x04, 0x72, 0x6f, 0x77, 0x73, 0x18, 0x01, 0x20, 0x03, 0x28,
	0x0b, 0x32, 0x1b, 0x2e, 0x70, 0x6b, 0x67, 0x2e, 0x70, 0x72, 0x31, 0x32, 0x65, 0x72, 0x2e, 0x4d,
	0x61, 0x70, 0x70, 0x69, 0x6e, 0x67, 0x54, 0x61, 0x62, 0x6c, 0x65, 0x52, 0x6f, 0x77, 0x52, 0x04,
	0x72, 0x6f, 0x77, 0x73, 0x22, 0x76, 0x0a, 0x0f, 0x4d, 0x61, 0x70, 0x70, 0x69, 0x6e, 0x67, 0x54,
	0x61, 0x62, 0x6c, 0x65, 0x52, 0x6f, 0x77, 0x12, 0x13, 0x0a, 0x05, 0x70, 0x72, 0x5f, 0x69, 0x64,
	0x18, 0x01, 0x20, 0x01, 0x28, 0x05, 0x52, 0x04, 0x70, 0x72, 0x49, 0x64, 0x12, 0x24, 0x0a, 0x0e,
	0x70, 0x61, 0x70, 0x65, 0x72, 0x5f, 0x61, 0x72, 0x78, 0x69, 0x76, 0x5f, 0x69, 0x64, 0x18, 0x02,
	0x20, 0x03, 0x28, 0x09, 0x52, 0x0c, 0x70, 0x61, 0x70, 0x65, 0x72, 0x41, 0x72, 0x78, 0x69, 0x76,
	0x49, 0x64, 0x12, 0x28, 0x0a, 0x10, 0x79, 0x6f, 0x75, 0x74, 0x75, 0x62, 0x65, 0x5f, 0x76, 0x69,
	0x64, 0x65, 0x6f, 0x5f, 0x69, 0x64, 0x18, 0x03, 0x20, 0x01, 0x28, 0x09, 0x52, 0x0e, 0x79, 0x6f,
	0x75, 0x74, 0x75, 0x62, 0x65, 0x56, 0x69, 0x64, 0x65, 0x6f, 0x49, 0x64, 0x22, 0xab, 0x01, 0x0a,
	0x08, 0x44, 0x61, 0x74, 0x61, 0x62, 0x61, 0x73, 0x65, 0x12, 0x4a, 0x0a, 0x0e, 0x70, 0x72, 0x5f,
	0x69, 0x64, 0x5f, 0x74, 0x6f, 0x5f, 0x76, 0x69, 0x64, 0x65, 0x6f, 0x18, 0x01, 0x20, 0x03, 0x28,
	0x0b, 0x32, 0x25, 0x2e, 0x70, 0x6b, 0x67, 0x2e, 0x70, 0x72, 0x31, 0x32, 0x65, 0x72, 0x2e, 0x44,
	0x61, 0x74, 0x61, 0x62, 0x61, 0x73, 0x65, 0x2e, 0x50, 0x72, 0x49, 0x64, 0x54, 0x6f, 0x56, 0x69,
	0x64, 0x65, 0x6f, 0x45, 0x6e, 0x74, 0x72, 0x79, 0x52, 0x0b, 0x70, 0x72, 0x49, 0x64, 0x54, 0x6f,
	0x56, 0x69, 0x64, 0x65, 0x6f, 0x1a, 0x53, 0x0a, 0x10, 0x50, 0x72, 0x49, 0x64, 0x54, 0x6f, 0x56,
	0x69, 0x64, 0x65, 0x6f, 0x45, 0x6e, 0x74, 0x72, 0x79, 0x12, 0x10, 0x0a, 0x03, 0x6b, 0x65, 0x79,
	0x18, 0x01, 0x20, 0x01, 0x28, 0x05, 0x52, 0x03, 0x6b, 0x65, 0x79, 0x12, 0x29, 0x0a, 0x05, 0x76,
	0x61, 0x6c, 0x75, 0x65, 0x18, 0x02, 0x20, 0x01, 0x28, 0x0b, 0x32, 0x13, 0x2e, 0x70, 0x6b, 0x67,
	0x2e, 0x70, 0x72, 0x31, 0x32, 0x65, 0x72, 0x2e, 0x50, 0x72, 0x56, 0x69, 0x64, 0x65, 0x6f, 0x52,
	0x05, 0x76, 0x61, 0x6c, 0x75, 0x65, 0x3a, 0x02, 0x38, 0x01, 0x22, 0x79, 0x0a, 0x07, 0x50, 0x72,
	0x56, 0x69, 0x64, 0x65, 0x6f, 0x12, 0x13, 0x0a, 0x05, 0x70, 0x72, 0x5f, 0x69, 0x64, 0x18, 0x01,
	0x20, 0x01, 0x28, 0x05, 0x52, 0x04, 0x70, 0x72, 0x49, 0x64, 0x12, 0x29, 0x0a, 0x06, 0x70, 0x61,
	0x70, 0x65, 0x72, 0x73, 0x18, 0x02, 0x20, 0x03, 0x28, 0x0b, 0x32, 0x11, 0x2e, 0x70, 0x6b, 0x67,
	0x2e, 0x70, 0x72, 0x31, 0x32, 0x65, 0x72, 0x2e, 0x50, 0x61, 0x70, 0x65, 0x72, 0x52, 0x06, 0x70,
	0x61, 0x70, 0x65, 0x72, 0x73, 0x12, 0x2e, 0x0a, 0x05, 0x76, 0x69, 0x64, 0x65, 0x6f, 0x18, 0x03,
	0x20, 0x01, 0x28, 0x0b, 0x32, 0x18, 0x2e, 0x70, 0x6b, 0x67, 0x2e, 0x70, 0x72, 0x31, 0x32, 0x65,
	0x72, 0x2e, 0x59, 0x6f, 0x75, 0x54, 0x75, 0x62, 0x65, 0x56, 0x69, 0x64, 0x65, 0x6f, 0x52, 0x05,
	0x76, 0x69, 0x64, 0x65, 0x6f, 0x22, 0xf9, 0x01, 0x0a, 0x0c, 0x59, 0x6f, 0x75, 0x54, 0x75, 0x62,
	0x65, 0x56, 0x69, 0x64, 0x65, 0x6f, 0x12, 0x19, 0x0a, 0x08, 0x76, 0x69, 0x64, 0x65, 0x6f, 0x5f,
	0x69, 0x64, 0x18, 0x01, 0x20, 0x01, 0x28, 0x09, 0x52, 0x07, 0x76, 0x69, 0x64, 0x65, 0x6f, 0x49,
	0x64, 0x12, 0x1f, 0x0a, 0x0b, 0x76, 0x69, 0x64, 0x65, 0x6f, 0x5f, 0x74, 0x69, 0x74, 0x6c, 0x65,
	0x18, 0x02, 0x20, 0x01, 0x28, 0x09, 0x52, 0x0a, 0x76, 0x69, 0x64, 0x65, 0x6f, 0x54, 0x69, 0x74,
	0x6c, 0x65, 0x12, 0x26, 0x0a, 0x0f, 0x6e, 0x75, 0x6d, 0x62, 0x65, 0x72, 0x5f, 0x6f, 0x66, 0x5f,
	0x6c, 0x69, 0x6b, 0x65, 0x73, 0x18, 0x03, 0x20, 0x01, 0x28, 0x03, 0x52, 0x0d, 0x6e, 0x75, 0x6d,
	0x62, 0x65, 0x72, 0x4f, 0x66, 0x4c, 0x69, 0x6b, 0x65, 0x73, 0x12, 0x26, 0x0a, 0x0f, 0x6e, 0x75,
	0x6d, 0x62, 0x65, 0x72, 0x5f, 0x6f, 0x66, 0x5f, 0x76, 0x69, 0x65, 0x77, 0x73, 0x18, 0x04, 0x20,
	0x01, 0x28, 0x03, 0x52, 0x0d, 0x6e, 0x75, 0x6d, 0x62, 0x65, 0x72, 0x4f, 0x66, 0x56, 0x69, 0x65,
	0x77, 0x73, 0x12, 0x41, 0x0a, 0x0e, 0x70, 0x75, 0x62, 0x6c, 0x69, 0x73, 0x68, 0x65, 0x64, 0x5f,
	0x64, 0x61, 0x74, 0x65, 0x18, 0x05, 0x20, 0x01, 0x28, 0x0b, 0x32, 0x1a, 0x2e, 0x67, 0x6f, 0x6f,
	0x67, 0x6c, 0x65, 0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x62, 0x75, 0x66, 0x2e, 0x54, 0x69, 0x6d,
	0x65, 0x73, 0x74, 0x61, 0x6d, 0x70, 0x52, 0x0d, 0x70, 0x75, 0x62, 0x6c, 0x69, 0x73, 0x68, 0x65,
	0x64, 0x44, 0x61, 0x74, 0x65, 0x12, 0x1a, 0x0a, 0x08, 0x75, 0x70, 0x6c, 0x6f, 0x61, 0x64, 0x65,
	0x72, 0x18, 0x06, 0x20, 0x01, 0x28, 0x09, 0x52, 0x08, 0x75, 0x70, 0x6c, 0x6f, 0x61, 0x64, 0x65,
	0x72, 0x42, 0x28, 0x5a, 0x26, 0x67, 0x69, 0x74, 0x68, 0x75, 0x62, 0x2e, 0x63, 0x6f, 0x6d, 0x2f,
	0x63, 0x6f, 0x64, 0x69, 0x6e, 0x67, 0x70, 0x6f, 0x74, 0x2f, 0x73, 0x65, 0x72, 0x76, 0x65, 0x72,
	0x2f, 0x70, 0x6b, 0x67, 0x2f, 0x70, 0x72, 0x31, 0x32, 0x65, 0x72, 0x62, 0x06, 0x70, 0x72, 0x6f,
	0x74, 0x6f, 0x33,
}

var (
	file_pkg_pr12er_database_proto_rawDescOnce sync.Once
	file_pkg_pr12er_database_proto_rawDescData = file_pkg_pr12er_database_proto_rawDesc
)

func file_pkg_pr12er_database_proto_rawDescGZIP() []byte {
	file_pkg_pr12er_database_proto_rawDescOnce.Do(func() {
		file_pkg_pr12er_database_proto_rawDescData = protoimpl.X.CompressGZIP(file_pkg_pr12er_database_proto_rawDescData)
	})
	return file_pkg_pr12er_database_proto_rawDescData
}

var file_pkg_pr12er_database_proto_msgTypes = make([]protoimpl.MessageInfo, 6)
var file_pkg_pr12er_database_proto_goTypes = []interface{}{
	(*MappingTable)(nil),          // 0: pkg.pr12er.MappingTable
	(*MappingTableRow)(nil),       // 1: pkg.pr12er.MappingTableRow
	(*Database)(nil),              // 2: pkg.pr12er.Database
	(*PrVideo)(nil),               // 3: pkg.pr12er.PrVideo
	(*YouTubeVideo)(nil),          // 4: pkg.pr12er.YouTubeVideo
	nil,                           // 5: pkg.pr12er.Database.PrIdToVideoEntry
	(*Paper)(nil),                 // 6: pkg.pr12er.Paper
	(*timestamppb.Timestamp)(nil), // 7: google.protobuf.Timestamp
}
var file_pkg_pr12er_database_proto_depIdxs = []int32{
	1, // 0: pkg.pr12er.MappingTable.rows:type_name -> pkg.pr12er.MappingTableRow
	5, // 1: pkg.pr12er.Database.pr_id_to_video:type_name -> pkg.pr12er.Database.PrIdToVideoEntry
	6, // 2: pkg.pr12er.PrVideo.papers:type_name -> pkg.pr12er.Paper
	4, // 3: pkg.pr12er.PrVideo.video:type_name -> pkg.pr12er.YouTubeVideo
	7, // 4: pkg.pr12er.YouTubeVideo.published_date:type_name -> google.protobuf.Timestamp
	3, // 5: pkg.pr12er.Database.PrIdToVideoEntry.value:type_name -> pkg.pr12er.PrVideo
	6, // [6:6] is the sub-list for method output_type
	6, // [6:6] is the sub-list for method input_type
	6, // [6:6] is the sub-list for extension type_name
	6, // [6:6] is the sub-list for extension extendee
	0, // [0:6] is the sub-list for field type_name
}

func init() { file_pkg_pr12er_database_proto_init() }
func file_pkg_pr12er_database_proto_init() {
	if File_pkg_pr12er_database_proto != nil {
		return
	}
	file_pkg_pr12er_messages_proto_init()
	if !protoimpl.UnsafeEnabled {
		file_pkg_pr12er_database_proto_msgTypes[0].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*MappingTable); i {
			case 0:
				return &v.state
			case 1:
				return &v.sizeCache
			case 2:
				return &v.unknownFields
			default:
				return nil
			}
		}
		file_pkg_pr12er_database_proto_msgTypes[1].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*MappingTableRow); i {
			case 0:
				return &v.state
			case 1:
				return &v.sizeCache
			case 2:
				return &v.unknownFields
			default:
				return nil
			}
		}
		file_pkg_pr12er_database_proto_msgTypes[2].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*Database); i {
			case 0:
				return &v.state
			case 1:
				return &v.sizeCache
			case 2:
				return &v.unknownFields
			default:
				return nil
			}
		}
		file_pkg_pr12er_database_proto_msgTypes[3].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*PrVideo); i {
			case 0:
				return &v.state
			case 1:
				return &v.sizeCache
			case 2:
				return &v.unknownFields
			default:
				return nil
			}
		}
		file_pkg_pr12er_database_proto_msgTypes[4].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*YouTubeVideo); i {
			case 0:
				return &v.state
			case 1:
				return &v.sizeCache
			case 2:
				return &v.unknownFields
			default:
				return nil
			}
		}
	}
	type x struct{}
	out := protoimpl.TypeBuilder{
		File: protoimpl.DescBuilder{
			GoPackagePath: reflect.TypeOf(x{}).PkgPath(),
			RawDescriptor: file_pkg_pr12er_database_proto_rawDesc,
			NumEnums:      0,
			NumMessages:   6,
			NumExtensions: 0,
			NumServices:   0,
		},
		GoTypes:           file_pkg_pr12er_database_proto_goTypes,
		DependencyIndexes: file_pkg_pr12er_database_proto_depIdxs,
		MessageInfos:      file_pkg_pr12er_database_proto_msgTypes,
	}.Build()
	File_pkg_pr12er_database_proto = out.File
	file_pkg_pr12er_database_proto_rawDesc = nil
	file_pkg_pr12er_database_proto_goTypes = nil
	file_pkg_pr12er_database_proto_depIdxs = nil
}

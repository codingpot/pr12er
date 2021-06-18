// Code generated by protoc-gen-go. DO NOT EDIT.
// versions:
// 	protoc-gen-go v1.26.0
// 	protoc        v3.15.2
// source: pkg/pr12er/messages.proto

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

type Category int32

const (
	Category_CATEGORY_UNSPECIFIED Category = 0
	Category_CATEGORY_VISION      Category = 1
	Category_CATEGORY_NLP         Category = 2
	Category_CATEGORY_OCR         Category = 3
	Category_CATEGORY_AUDIO       Category = 4
	Category_CATEGORY_RS          Category = 5
)

// Enum value maps for Category.
var (
	Category_name = map[int32]string{
		0: "CATEGORY_UNSPECIFIED",
		1: "CATEGORY_VISION",
		2: "CATEGORY_NLP",
		3: "CATEGORY_OCR",
		4: "CATEGORY_AUDIO",
		5: "CATEGORY_RS",
	}
	Category_value = map[string]int32{
		"CATEGORY_UNSPECIFIED": 0,
		"CATEGORY_VISION":      1,
		"CATEGORY_NLP":         2,
		"CATEGORY_OCR":         3,
		"CATEGORY_AUDIO":       4,
		"CATEGORY_RS":          5,
	}
)

func (x Category) Enum() *Category {
	p := new(Category)
	*p = x
	return p
}

func (x Category) String() string {
	return protoimpl.X.EnumStringOf(x.Descriptor(), protoreflect.EnumNumber(x))
}

func (Category) Descriptor() protoreflect.EnumDescriptor {
	return file_pkg_pr12er_messages_proto_enumTypes[0].Descriptor()
}

func (Category) Type() protoreflect.EnumType {
	return &file_pkg_pr12er_messages_proto_enumTypes[0]
}

func (x Category) Number() protoreflect.EnumNumber {
	return protoreflect.EnumNumber(x)
}

// Deprecated: Use Category.Descriptor instead.
func (Category) EnumDescriptor() ([]byte, []int) {
	return file_pkg_pr12er_messages_proto_rawDescGZIP(), []int{0}
}

type Framework int32

const (
	Framework_FRAMEWORK_UNSPECIFIED Framework = 0
	Framework_FRAMEWORK_TENSORFLOW  Framework = 1
	Framework_FRAMEWORK_PYTORCH     Framework = 2
	Framework_FRAMEWORK_OTHERS      Framework = 3
)

// Enum value maps for Framework.
var (
	Framework_name = map[int32]string{
		0: "FRAMEWORK_UNSPECIFIED",
		1: "FRAMEWORK_TENSORFLOW",
		2: "FRAMEWORK_PYTORCH",
		3: "FRAMEWORK_OTHERS",
	}
	Framework_value = map[string]int32{
		"FRAMEWORK_UNSPECIFIED": 0,
		"FRAMEWORK_TENSORFLOW":  1,
		"FRAMEWORK_PYTORCH":     2,
		"FRAMEWORK_OTHERS":      3,
	}
)

func (x Framework) Enum() *Framework {
	p := new(Framework)
	*p = x
	return p
}

func (x Framework) String() string {
	return protoimpl.X.EnumStringOf(x.Descriptor(), protoreflect.EnumNumber(x))
}

func (Framework) Descriptor() protoreflect.EnumDescriptor {
	return file_pkg_pr12er_messages_proto_enumTypes[1].Descriptor()
}

func (Framework) Type() protoreflect.EnumType {
	return &file_pkg_pr12er_messages_proto_enumTypes[1]
}

func (x Framework) Number() protoreflect.EnumNumber {
	return protoreflect.EnumNumber(x)
}

// Deprecated: Use Framework.Descriptor instead.
func (Framework) EnumDescriptor() ([]byte, []int) {
	return file_pkg_pr12er_messages_proto_rawDescGZIP(), []int{1}
}

type Video struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	PrId          int32                  `protobuf:"varint,1,opt,name=pr_id,json=prId,proto3" json:"pr_id,omitempty"`
	Title         string                 `protobuf:"bytes,2,opt,name=title,proto3" json:"title,omitempty"`
	Link          string                 `protobuf:"bytes,3,opt,name=link,proto3" json:"link,omitempty"`
	Presenter     string                 `protobuf:"bytes,4,opt,name=presenter,proto3" json:"presenter,omitempty"`
	Category      Category               `protobuf:"varint,5,opt,name=category,proto3,enum=pkg.pr12er.Category" json:"category,omitempty"`
	NumberOfLike  int64                  `protobuf:"varint,6,opt,name=number_of_like,json=numberOfLike,proto3" json:"number_of_like,omitempty"`
	Keywords      []string               `protobuf:"bytes,7,rep,name=keywords,proto3" json:"keywords,omitempty"`
	NumberOfViews int64                  `protobuf:"varint,8,opt,name=number_of_views,json=numberOfViews,proto3" json:"number_of_views,omitempty"`
	PublishedDate *timestamppb.Timestamp `protobuf:"bytes,9,opt,name=published_date,json=publishedDate,proto3" json:"published_date,omitempty"`
}

func (x *Video) Reset() {
	*x = Video{}
	if protoimpl.UnsafeEnabled {
		mi := &file_pkg_pr12er_messages_proto_msgTypes[0]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *Video) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*Video) ProtoMessage() {}

func (x *Video) ProtoReflect() protoreflect.Message {
	mi := &file_pkg_pr12er_messages_proto_msgTypes[0]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use Video.ProtoReflect.Descriptor instead.
func (*Video) Descriptor() ([]byte, []int) {
	return file_pkg_pr12er_messages_proto_rawDescGZIP(), []int{0}
}

func (x *Video) GetPrId() int32 {
	if x != nil {
		return x.PrId
	}
	return 0
}

func (x *Video) GetTitle() string {
	if x != nil {
		return x.Title
	}
	return ""
}

func (x *Video) GetLink() string {
	if x != nil {
		return x.Link
	}
	return ""
}

func (x *Video) GetPresenter() string {
	if x != nil {
		return x.Presenter
	}
	return ""
}

func (x *Video) GetCategory() Category {
	if x != nil {
		return x.Category
	}
	return Category_CATEGORY_UNSPECIFIED
}

func (x *Video) GetNumberOfLike() int64 {
	if x != nil {
		return x.NumberOfLike
	}
	return 0
}

func (x *Video) GetKeywords() []string {
	if x != nil {
		return x.Keywords
	}
	return nil
}

func (x *Video) GetNumberOfViews() int64 {
	if x != nil {
		return x.NumberOfViews
	}
	return 0
}

func (x *Video) GetPublishedDate() *timestamppb.Timestamp {
	if x != nil {
		return x.PublishedDate
	}
	return nil
}

type Detail struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	PrId             int32    `protobuf:"varint,1,opt,name=pr_id,json=prId,proto3" json:"pr_id,omitempty"`
	Paper            []*Paper `protobuf:"bytes,2,rep,name=paper,proto3" json:"paper,omitempty"`
	RelevantPapers   []*Paper `protobuf:"bytes,3,rep,name=relevant_papers,json=relevantPapers,proto3" json:"relevant_papers,omitempty"`
	SameAuthorPapers []*Paper `protobuf:"bytes,4,rep,name=same_author_papers,json=sameAuthorPapers,proto3" json:"same_author_papers,omitempty"`
}

func (x *Detail) Reset() {
	*x = Detail{}
	if protoimpl.UnsafeEnabled {
		mi := &file_pkg_pr12er_messages_proto_msgTypes[1]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *Detail) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*Detail) ProtoMessage() {}

func (x *Detail) ProtoReflect() protoreflect.Message {
	mi := &file_pkg_pr12er_messages_proto_msgTypes[1]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use Detail.ProtoReflect.Descriptor instead.
func (*Detail) Descriptor() ([]byte, []int) {
	return file_pkg_pr12er_messages_proto_rawDescGZIP(), []int{1}
}

func (x *Detail) GetPrId() int32 {
	if x != nil {
		return x.PrId
	}
	return 0
}

func (x *Detail) GetPaper() []*Paper {
	if x != nil {
		return x.Paper
	}
	return nil
}

func (x *Detail) GetRelevantPapers() []*Paper {
	if x != nil {
		return x.RelevantPapers
	}
	return nil
}

func (x *Detail) GetSameAuthorPapers() []*Paper {
	if x != nil {
		return x.SameAuthorPapers
	}
	return nil
}

type Paper struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	PaperId      string                 `protobuf:"bytes,1,opt,name=paper_id,json=paperId,proto3" json:"paper_id,omitempty"`
	Title        string                 `protobuf:"bytes,2,opt,name=title,proto3" json:"title,omitempty"`
	ArxivId      string                 `protobuf:"bytes,3,opt,name=arxiv_id,json=arxivId,proto3" json:"arxiv_id,omitempty"`
	Abstract     string                 `protobuf:"bytes,4,opt,name=abstract,proto3" json:"abstract,omitempty"`
	PubDate      *timestamppb.Timestamp `protobuf:"bytes,5,opt,name=pub_date,json=pubDate,proto3" json:"pub_date,omitempty"`
	Authors      []string               `protobuf:"bytes,6,rep,name=authors,proto3" json:"authors,omitempty"`
	Repositories []*Repository          `protobuf:"bytes,7,rep,name=repositories,proto3" json:"repositories,omitempty"`
	Methods      []*Method              `protobuf:"bytes,8,rep,name=methods,proto3" json:"methods,omitempty"`
}

func (x *Paper) Reset() {
	*x = Paper{}
	if protoimpl.UnsafeEnabled {
		mi := &file_pkg_pr12er_messages_proto_msgTypes[2]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *Paper) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*Paper) ProtoMessage() {}

func (x *Paper) ProtoReflect() protoreflect.Message {
	mi := &file_pkg_pr12er_messages_proto_msgTypes[2]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use Paper.ProtoReflect.Descriptor instead.
func (*Paper) Descriptor() ([]byte, []int) {
	return file_pkg_pr12er_messages_proto_rawDescGZIP(), []int{2}
}

func (x *Paper) GetPaperId() string {
	if x != nil {
		return x.PaperId
	}
	return ""
}

func (x *Paper) GetTitle() string {
	if x != nil {
		return x.Title
	}
	return ""
}

func (x *Paper) GetArxivId() string {
	if x != nil {
		return x.ArxivId
	}
	return ""
}

func (x *Paper) GetAbstract() string {
	if x != nil {
		return x.Abstract
	}
	return ""
}

func (x *Paper) GetPubDate() *timestamppb.Timestamp {
	if x != nil {
		return x.PubDate
	}
	return nil
}

func (x *Paper) GetAuthors() []string {
	if x != nil {
		return x.Authors
	}
	return nil
}

func (x *Paper) GetRepositories() []*Repository {
	if x != nil {
		return x.Repositories
	}
	return nil
}

func (x *Paper) GetMethods() []*Method {
	if x != nil {
		return x.Methods
	}
	return nil
}

type Repository struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	IsOfficial    bool      `protobuf:"varint,1,opt,name=is_official,json=isOfficial,proto3" json:"is_official,omitempty"`
	Url           string    `protobuf:"bytes,2,opt,name=url,proto3" json:"url,omitempty"`
	Owner         string    `protobuf:"bytes,3,opt,name=owner,proto3" json:"owner,omitempty"`
	Framework     Framework `protobuf:"varint,4,opt,name=framework,proto3,enum=pkg.pr12er.Framework" json:"framework,omitempty"`
	NumberOfStars int64     `protobuf:"varint,5,opt,name=number_of_stars,json=numberOfStars,proto3" json:"number_of_stars,omitempty"`
	Description   string    `protobuf:"bytes,6,opt,name=description,proto3" json:"description,omitempty"`
}

func (x *Repository) Reset() {
	*x = Repository{}
	if protoimpl.UnsafeEnabled {
		mi := &file_pkg_pr12er_messages_proto_msgTypes[3]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *Repository) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*Repository) ProtoMessage() {}

func (x *Repository) ProtoReflect() protoreflect.Message {
	mi := &file_pkg_pr12er_messages_proto_msgTypes[3]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use Repository.ProtoReflect.Descriptor instead.
func (*Repository) Descriptor() ([]byte, []int) {
	return file_pkg_pr12er_messages_proto_rawDescGZIP(), []int{3}
}

func (x *Repository) GetIsOfficial() bool {
	if x != nil {
		return x.IsOfficial
	}
	return false
}

func (x *Repository) GetUrl() string {
	if x != nil {
		return x.Url
	}
	return ""
}

func (x *Repository) GetOwner() string {
	if x != nil {
		return x.Owner
	}
	return ""
}

func (x *Repository) GetFramework() Framework {
	if x != nil {
		return x.Framework
	}
	return Framework_FRAMEWORK_UNSPECIFIED
}

func (x *Repository) GetNumberOfStars() int64 {
	if x != nil {
		return x.NumberOfStars
	}
	return 0
}

func (x *Repository) GetDescription() string {
	if x != nil {
		return x.Description
	}
	return ""
}

type Method struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	Name        string `protobuf:"bytes,1,opt,name=name,proto3" json:"name,omitempty"`
	FullName    string `protobuf:"bytes,2,opt,name=full_name,json=fullName,proto3" json:"full_name,omitempty"`
	Description string `protobuf:"bytes,3,opt,name=description,proto3" json:"description,omitempty"`
}

func (x *Method) Reset() {
	*x = Method{}
	if protoimpl.UnsafeEnabled {
		mi := &file_pkg_pr12er_messages_proto_msgTypes[4]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *Method) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*Method) ProtoMessage() {}

func (x *Method) ProtoReflect() protoreflect.Message {
	mi := &file_pkg_pr12er_messages_proto_msgTypes[4]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use Method.ProtoReflect.Descriptor instead.
func (*Method) Descriptor() ([]byte, []int) {
	return file_pkg_pr12er_messages_proto_rawDescGZIP(), []int{4}
}

func (x *Method) GetName() string {
	if x != nil {
		return x.Name
	}
	return ""
}

func (x *Method) GetFullName() string {
	if x != nil {
		return x.FullName
	}
	return ""
}

func (x *Method) GetDescription() string {
	if x != nil {
		return x.Description
	}
	return ""
}

var File_pkg_pr12er_messages_proto protoreflect.FileDescriptor

var file_pkg_pr12er_messages_proto_rawDesc = []byte{
	0x0a, 0x19, 0x70, 0x6b, 0x67, 0x2f, 0x70, 0x72, 0x31, 0x32, 0x65, 0x72, 0x2f, 0x6d, 0x65, 0x73,
	0x73, 0x61, 0x67, 0x65, 0x73, 0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x12, 0x0a, 0x70, 0x6b, 0x67,
	0x2e, 0x70, 0x72, 0x31, 0x32, 0x65, 0x72, 0x1a, 0x1f, 0x67, 0x6f, 0x6f, 0x67, 0x6c, 0x65, 0x2f,
	0x70, 0x72, 0x6f, 0x74, 0x6f, 0x62, 0x75, 0x66, 0x2f, 0x74, 0x69, 0x6d, 0x65, 0x73, 0x74, 0x61,
	0x6d, 0x70, 0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x22, 0xc3, 0x02, 0x0a, 0x05, 0x56, 0x69, 0x64,
	0x65, 0x6f, 0x12, 0x13, 0x0a, 0x05, 0x70, 0x72, 0x5f, 0x69, 0x64, 0x18, 0x01, 0x20, 0x01, 0x28,
	0x05, 0x52, 0x04, 0x70, 0x72, 0x49, 0x64, 0x12, 0x14, 0x0a, 0x05, 0x74, 0x69, 0x74, 0x6c, 0x65,
	0x18, 0x02, 0x20, 0x01, 0x28, 0x09, 0x52, 0x05, 0x74, 0x69, 0x74, 0x6c, 0x65, 0x12, 0x12, 0x0a,
	0x04, 0x6c, 0x69, 0x6e, 0x6b, 0x18, 0x03, 0x20, 0x01, 0x28, 0x09, 0x52, 0x04, 0x6c, 0x69, 0x6e,
	0x6b, 0x12, 0x1c, 0x0a, 0x09, 0x70, 0x72, 0x65, 0x73, 0x65, 0x6e, 0x74, 0x65, 0x72, 0x18, 0x04,
	0x20, 0x01, 0x28, 0x09, 0x52, 0x09, 0x70, 0x72, 0x65, 0x73, 0x65, 0x6e, 0x74, 0x65, 0x72, 0x12,
	0x30, 0x0a, 0x08, 0x63, 0x61, 0x74, 0x65, 0x67, 0x6f, 0x72, 0x79, 0x18, 0x05, 0x20, 0x01, 0x28,
	0x0e, 0x32, 0x14, 0x2e, 0x70, 0x6b, 0x67, 0x2e, 0x70, 0x72, 0x31, 0x32, 0x65, 0x72, 0x2e, 0x43,
	0x61, 0x74, 0x65, 0x67, 0x6f, 0x72, 0x79, 0x52, 0x08, 0x63, 0x61, 0x74, 0x65, 0x67, 0x6f, 0x72,
	0x79, 0x12, 0x24, 0x0a, 0x0e, 0x6e, 0x75, 0x6d, 0x62, 0x65, 0x72, 0x5f, 0x6f, 0x66, 0x5f, 0x6c,
	0x69, 0x6b, 0x65, 0x18, 0x06, 0x20, 0x01, 0x28, 0x03, 0x52, 0x0c, 0x6e, 0x75, 0x6d, 0x62, 0x65,
	0x72, 0x4f, 0x66, 0x4c, 0x69, 0x6b, 0x65, 0x12, 0x1a, 0x0a, 0x08, 0x6b, 0x65, 0x79, 0x77, 0x6f,
	0x72, 0x64, 0x73, 0x18, 0x07, 0x20, 0x03, 0x28, 0x09, 0x52, 0x08, 0x6b, 0x65, 0x79, 0x77, 0x6f,
	0x72, 0x64, 0x73, 0x12, 0x26, 0x0a, 0x0f, 0x6e, 0x75, 0x6d, 0x62, 0x65, 0x72, 0x5f, 0x6f, 0x66,
	0x5f, 0x76, 0x69, 0x65, 0x77, 0x73, 0x18, 0x08, 0x20, 0x01, 0x28, 0x03, 0x52, 0x0d, 0x6e, 0x75,
	0x6d, 0x62, 0x65, 0x72, 0x4f, 0x66, 0x56, 0x69, 0x65, 0x77, 0x73, 0x12, 0x41, 0x0a, 0x0e, 0x70,
	0x75, 0x62, 0x6c, 0x69, 0x73, 0x68, 0x65, 0x64, 0x5f, 0x64, 0x61, 0x74, 0x65, 0x18, 0x09, 0x20,
	0x01, 0x28, 0x0b, 0x32, 0x1a, 0x2e, 0x67, 0x6f, 0x6f, 0x67, 0x6c, 0x65, 0x2e, 0x70, 0x72, 0x6f,
	0x74, 0x6f, 0x62, 0x75, 0x66, 0x2e, 0x54, 0x69, 0x6d, 0x65, 0x73, 0x74, 0x61, 0x6d, 0x70, 0x52,
	0x0d, 0x70, 0x75, 0x62, 0x6c, 0x69, 0x73, 0x68, 0x65, 0x64, 0x44, 0x61, 0x74, 0x65, 0x22, 0xc3,
	0x01, 0x0a, 0x06, 0x44, 0x65, 0x74, 0x61, 0x69, 0x6c, 0x12, 0x13, 0x0a, 0x05, 0x70, 0x72, 0x5f,
	0x69, 0x64, 0x18, 0x01, 0x20, 0x01, 0x28, 0x05, 0x52, 0x04, 0x70, 0x72, 0x49, 0x64, 0x12, 0x27,
	0x0a, 0x05, 0x70, 0x61, 0x70, 0x65, 0x72, 0x18, 0x02, 0x20, 0x03, 0x28, 0x0b, 0x32, 0x11, 0x2e,
	0x70, 0x6b, 0x67, 0x2e, 0x70, 0x72, 0x31, 0x32, 0x65, 0x72, 0x2e, 0x50, 0x61, 0x70, 0x65, 0x72,
	0x52, 0x05, 0x70, 0x61, 0x70, 0x65, 0x72, 0x12, 0x3a, 0x0a, 0x0f, 0x72, 0x65, 0x6c, 0x65, 0x76,
	0x61, 0x6e, 0x74, 0x5f, 0x70, 0x61, 0x70, 0x65, 0x72, 0x73, 0x18, 0x03, 0x20, 0x03, 0x28, 0x0b,
	0x32, 0x11, 0x2e, 0x70, 0x6b, 0x67, 0x2e, 0x70, 0x72, 0x31, 0x32, 0x65, 0x72, 0x2e, 0x50, 0x61,
	0x70, 0x65, 0x72, 0x52, 0x0e, 0x72, 0x65, 0x6c, 0x65, 0x76, 0x61, 0x6e, 0x74, 0x50, 0x61, 0x70,
	0x65, 0x72, 0x73, 0x12, 0x3f, 0x0a, 0x12, 0x73, 0x61, 0x6d, 0x65, 0x5f, 0x61, 0x75, 0x74, 0x68,
	0x6f, 0x72, 0x5f, 0x70, 0x61, 0x70, 0x65, 0x72, 0x73, 0x18, 0x04, 0x20, 0x03, 0x28, 0x0b, 0x32,
	0x11, 0x2e, 0x70, 0x6b, 0x67, 0x2e, 0x70, 0x72, 0x31, 0x32, 0x65, 0x72, 0x2e, 0x50, 0x61, 0x70,
	0x65, 0x72, 0x52, 0x10, 0x73, 0x61, 0x6d, 0x65, 0x41, 0x75, 0x74, 0x68, 0x6f, 0x72, 0x50, 0x61,
	0x70, 0x65, 0x72, 0x73, 0x22, 0xaa, 0x02, 0x0a, 0x05, 0x50, 0x61, 0x70, 0x65, 0x72, 0x12, 0x19,
	0x0a, 0x08, 0x70, 0x61, 0x70, 0x65, 0x72, 0x5f, 0x69, 0x64, 0x18, 0x01, 0x20, 0x01, 0x28, 0x09,
	0x52, 0x07, 0x70, 0x61, 0x70, 0x65, 0x72, 0x49, 0x64, 0x12, 0x14, 0x0a, 0x05, 0x74, 0x69, 0x74,
	0x6c, 0x65, 0x18, 0x02, 0x20, 0x01, 0x28, 0x09, 0x52, 0x05, 0x74, 0x69, 0x74, 0x6c, 0x65, 0x12,
	0x19, 0x0a, 0x08, 0x61, 0x72, 0x78, 0x69, 0x76, 0x5f, 0x69, 0x64, 0x18, 0x03, 0x20, 0x01, 0x28,
	0x09, 0x52, 0x07, 0x61, 0x72, 0x78, 0x69, 0x76, 0x49, 0x64, 0x12, 0x1a, 0x0a, 0x08, 0x61, 0x62,
	0x73, 0x74, 0x72, 0x61, 0x63, 0x74, 0x18, 0x04, 0x20, 0x01, 0x28, 0x09, 0x52, 0x08, 0x61, 0x62,
	0x73, 0x74, 0x72, 0x61, 0x63, 0x74, 0x12, 0x35, 0x0a, 0x08, 0x70, 0x75, 0x62, 0x5f, 0x64, 0x61,
	0x74, 0x65, 0x18, 0x05, 0x20, 0x01, 0x28, 0x0b, 0x32, 0x1a, 0x2e, 0x67, 0x6f, 0x6f, 0x67, 0x6c,
	0x65, 0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x62, 0x75, 0x66, 0x2e, 0x54, 0x69, 0x6d, 0x65, 0x73,
	0x74, 0x61, 0x6d, 0x70, 0x52, 0x07, 0x70, 0x75, 0x62, 0x44, 0x61, 0x74, 0x65, 0x12, 0x18, 0x0a,
	0x07, 0x61, 0x75, 0x74, 0x68, 0x6f, 0x72, 0x73, 0x18, 0x06, 0x20, 0x03, 0x28, 0x09, 0x52, 0x07,
	0x61, 0x75, 0x74, 0x68, 0x6f, 0x72, 0x73, 0x12, 0x3a, 0x0a, 0x0c, 0x72, 0x65, 0x70, 0x6f, 0x73,
	0x69, 0x74, 0x6f, 0x72, 0x69, 0x65, 0x73, 0x18, 0x07, 0x20, 0x03, 0x28, 0x0b, 0x32, 0x16, 0x2e,
	0x70, 0x6b, 0x67, 0x2e, 0x70, 0x72, 0x31, 0x32, 0x65, 0x72, 0x2e, 0x52, 0x65, 0x70, 0x6f, 0x73,
	0x69, 0x74, 0x6f, 0x72, 0x79, 0x52, 0x0c, 0x72, 0x65, 0x70, 0x6f, 0x73, 0x69, 0x74, 0x6f, 0x72,
	0x69, 0x65, 0x73, 0x12, 0x2c, 0x0a, 0x07, 0x6d, 0x65, 0x74, 0x68, 0x6f, 0x64, 0x73, 0x18, 0x08,
	0x20, 0x03, 0x28, 0x0b, 0x32, 0x12, 0x2e, 0x70, 0x6b, 0x67, 0x2e, 0x70, 0x72, 0x31, 0x32, 0x65,
	0x72, 0x2e, 0x4d, 0x65, 0x74, 0x68, 0x6f, 0x64, 0x52, 0x07, 0x6d, 0x65, 0x74, 0x68, 0x6f, 0x64,
	0x73, 0x22, 0xd4, 0x01, 0x0a, 0x0a, 0x52, 0x65, 0x70, 0x6f, 0x73, 0x69, 0x74, 0x6f, 0x72, 0x79,
	0x12, 0x1f, 0x0a, 0x0b, 0x69, 0x73, 0x5f, 0x6f, 0x66, 0x66, 0x69, 0x63, 0x69, 0x61, 0x6c, 0x18,
	0x01, 0x20, 0x01, 0x28, 0x08, 0x52, 0x0a, 0x69, 0x73, 0x4f, 0x66, 0x66, 0x69, 0x63, 0x69, 0x61,
	0x6c, 0x12, 0x10, 0x0a, 0x03, 0x75, 0x72, 0x6c, 0x18, 0x02, 0x20, 0x01, 0x28, 0x09, 0x52, 0x03,
	0x75, 0x72, 0x6c, 0x12, 0x14, 0x0a, 0x05, 0x6f, 0x77, 0x6e, 0x65, 0x72, 0x18, 0x03, 0x20, 0x01,
	0x28, 0x09, 0x52, 0x05, 0x6f, 0x77, 0x6e, 0x65, 0x72, 0x12, 0x33, 0x0a, 0x09, 0x66, 0x72, 0x61,
	0x6d, 0x65, 0x77, 0x6f, 0x72, 0x6b, 0x18, 0x04, 0x20, 0x01, 0x28, 0x0e, 0x32, 0x15, 0x2e, 0x70,
	0x6b, 0x67, 0x2e, 0x70, 0x72, 0x31, 0x32, 0x65, 0x72, 0x2e, 0x46, 0x72, 0x61, 0x6d, 0x65, 0x77,
	0x6f, 0x72, 0x6b, 0x52, 0x09, 0x66, 0x72, 0x61, 0x6d, 0x65, 0x77, 0x6f, 0x72, 0x6b, 0x12, 0x26,
	0x0a, 0x0f, 0x6e, 0x75, 0x6d, 0x62, 0x65, 0x72, 0x5f, 0x6f, 0x66, 0x5f, 0x73, 0x74, 0x61, 0x72,
	0x73, 0x18, 0x05, 0x20, 0x01, 0x28, 0x03, 0x52, 0x0d, 0x6e, 0x75, 0x6d, 0x62, 0x65, 0x72, 0x4f,
	0x66, 0x53, 0x74, 0x61, 0x72, 0x73, 0x12, 0x20, 0x0a, 0x0b, 0x64, 0x65, 0x73, 0x63, 0x72, 0x69,
	0x70, 0x74, 0x69, 0x6f, 0x6e, 0x18, 0x06, 0x20, 0x01, 0x28, 0x09, 0x52, 0x0b, 0x64, 0x65, 0x73,
	0x63, 0x72, 0x69, 0x70, 0x74, 0x69, 0x6f, 0x6e, 0x22, 0x5b, 0x0a, 0x06, 0x4d, 0x65, 0x74, 0x68,
	0x6f, 0x64, 0x12, 0x12, 0x0a, 0x04, 0x6e, 0x61, 0x6d, 0x65, 0x18, 0x01, 0x20, 0x01, 0x28, 0x09,
	0x52, 0x04, 0x6e, 0x61, 0x6d, 0x65, 0x12, 0x1b, 0x0a, 0x09, 0x66, 0x75, 0x6c, 0x6c, 0x5f, 0x6e,
	0x61, 0x6d, 0x65, 0x18, 0x02, 0x20, 0x01, 0x28, 0x09, 0x52, 0x08, 0x66, 0x75, 0x6c, 0x6c, 0x4e,
	0x61, 0x6d, 0x65, 0x12, 0x20, 0x0a, 0x0b, 0x64, 0x65, 0x73, 0x63, 0x72, 0x69, 0x70, 0x74, 0x69,
	0x6f, 0x6e, 0x18, 0x03, 0x20, 0x01, 0x28, 0x09, 0x52, 0x0b, 0x64, 0x65, 0x73, 0x63, 0x72, 0x69,
	0x70, 0x74, 0x69, 0x6f, 0x6e, 0x2a, 0x82, 0x01, 0x0a, 0x08, 0x43, 0x61, 0x74, 0x65, 0x67, 0x6f,
	0x72, 0x79, 0x12, 0x18, 0x0a, 0x14, 0x43, 0x41, 0x54, 0x45, 0x47, 0x4f, 0x52, 0x59, 0x5f, 0x55,
	0x4e, 0x53, 0x50, 0x45, 0x43, 0x49, 0x46, 0x49, 0x45, 0x44, 0x10, 0x00, 0x12, 0x13, 0x0a, 0x0f,
	0x43, 0x41, 0x54, 0x45, 0x47, 0x4f, 0x52, 0x59, 0x5f, 0x56, 0x49, 0x53, 0x49, 0x4f, 0x4e, 0x10,
	0x01, 0x12, 0x10, 0x0a, 0x0c, 0x43, 0x41, 0x54, 0x45, 0x47, 0x4f, 0x52, 0x59, 0x5f, 0x4e, 0x4c,
	0x50, 0x10, 0x02, 0x12, 0x10, 0x0a, 0x0c, 0x43, 0x41, 0x54, 0x45, 0x47, 0x4f, 0x52, 0x59, 0x5f,
	0x4f, 0x43, 0x52, 0x10, 0x03, 0x12, 0x12, 0x0a, 0x0e, 0x43, 0x41, 0x54, 0x45, 0x47, 0x4f, 0x52,
	0x59, 0x5f, 0x41, 0x55, 0x44, 0x49, 0x4f, 0x10, 0x04, 0x12, 0x0f, 0x0a, 0x0b, 0x43, 0x41, 0x54,
	0x45, 0x47, 0x4f, 0x52, 0x59, 0x5f, 0x52, 0x53, 0x10, 0x05, 0x2a, 0x6d, 0x0a, 0x09, 0x46, 0x72,
	0x61, 0x6d, 0x65, 0x77, 0x6f, 0x72, 0x6b, 0x12, 0x19, 0x0a, 0x15, 0x46, 0x52, 0x41, 0x4d, 0x45,
	0x57, 0x4f, 0x52, 0x4b, 0x5f, 0x55, 0x4e, 0x53, 0x50, 0x45, 0x43, 0x49, 0x46, 0x49, 0x45, 0x44,
	0x10, 0x00, 0x12, 0x18, 0x0a, 0x14, 0x46, 0x52, 0x41, 0x4d, 0x45, 0x57, 0x4f, 0x52, 0x4b, 0x5f,
	0x54, 0x45, 0x4e, 0x53, 0x4f, 0x52, 0x46, 0x4c, 0x4f, 0x57, 0x10, 0x01, 0x12, 0x15, 0x0a, 0x11,
	0x46, 0x52, 0x41, 0x4d, 0x45, 0x57, 0x4f, 0x52, 0x4b, 0x5f, 0x50, 0x59, 0x54, 0x4f, 0x52, 0x43,
	0x48, 0x10, 0x02, 0x12, 0x14, 0x0a, 0x10, 0x46, 0x52, 0x41, 0x4d, 0x45, 0x57, 0x4f, 0x52, 0x4b,
	0x5f, 0x4f, 0x54, 0x48, 0x45, 0x52, 0x53, 0x10, 0x03, 0x42, 0x28, 0x5a, 0x26, 0x67, 0x69, 0x74,
	0x68, 0x75, 0x62, 0x2e, 0x63, 0x6f, 0x6d, 0x2f, 0x63, 0x6f, 0x64, 0x69, 0x6e, 0x67, 0x70, 0x6f,
	0x74, 0x2f, 0x73, 0x65, 0x72, 0x76, 0x65, 0x72, 0x2f, 0x70, 0x6b, 0x67, 0x2f, 0x70, 0x72, 0x31,
	0x32, 0x65, 0x72, 0x62, 0x06, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x33,
}

var (
	file_pkg_pr12er_messages_proto_rawDescOnce sync.Once
	file_pkg_pr12er_messages_proto_rawDescData = file_pkg_pr12er_messages_proto_rawDesc
)

func file_pkg_pr12er_messages_proto_rawDescGZIP() []byte {
	file_pkg_pr12er_messages_proto_rawDescOnce.Do(func() {
		file_pkg_pr12er_messages_proto_rawDescData = protoimpl.X.CompressGZIP(file_pkg_pr12er_messages_proto_rawDescData)
	})
	return file_pkg_pr12er_messages_proto_rawDescData
}

var file_pkg_pr12er_messages_proto_enumTypes = make([]protoimpl.EnumInfo, 2)
var file_pkg_pr12er_messages_proto_msgTypes = make([]protoimpl.MessageInfo, 5)
var file_pkg_pr12er_messages_proto_goTypes = []interface{}{
	(Category)(0),                 // 0: pkg.pr12er.Category
	(Framework)(0),                // 1: pkg.pr12er.Framework
	(*Video)(nil),                 // 2: pkg.pr12er.Video
	(*Detail)(nil),                // 3: pkg.pr12er.Detail
	(*Paper)(nil),                 // 4: pkg.pr12er.Paper
	(*Repository)(nil),            // 5: pkg.pr12er.Repository
	(*Method)(nil),                // 6: pkg.pr12er.Method
	(*timestamppb.Timestamp)(nil), // 7: google.protobuf.Timestamp
}
var file_pkg_pr12er_messages_proto_depIdxs = []int32{
	0, // 0: pkg.pr12er.Video.category:type_name -> pkg.pr12er.Category
	7, // 1: pkg.pr12er.Video.published_date:type_name -> google.protobuf.Timestamp
	4, // 2: pkg.pr12er.Detail.paper:type_name -> pkg.pr12er.Paper
	4, // 3: pkg.pr12er.Detail.relevant_papers:type_name -> pkg.pr12er.Paper
	4, // 4: pkg.pr12er.Detail.same_author_papers:type_name -> pkg.pr12er.Paper
	7, // 5: pkg.pr12er.Paper.pub_date:type_name -> google.protobuf.Timestamp
	5, // 6: pkg.pr12er.Paper.repositories:type_name -> pkg.pr12er.Repository
	6, // 7: pkg.pr12er.Paper.methods:type_name -> pkg.pr12er.Method
	1, // 8: pkg.pr12er.Repository.framework:type_name -> pkg.pr12er.Framework
	9, // [9:9] is the sub-list for method output_type
	9, // [9:9] is the sub-list for method input_type
	9, // [9:9] is the sub-list for extension type_name
	9, // [9:9] is the sub-list for extension extendee
	0, // [0:9] is the sub-list for field type_name
}

func init() { file_pkg_pr12er_messages_proto_init() }
func file_pkg_pr12er_messages_proto_init() {
	if File_pkg_pr12er_messages_proto != nil {
		return
	}
	if !protoimpl.UnsafeEnabled {
		file_pkg_pr12er_messages_proto_msgTypes[0].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*Video); i {
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
		file_pkg_pr12er_messages_proto_msgTypes[1].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*Detail); i {
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
		file_pkg_pr12er_messages_proto_msgTypes[2].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*Paper); i {
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
		file_pkg_pr12er_messages_proto_msgTypes[3].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*Repository); i {
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
		file_pkg_pr12er_messages_proto_msgTypes[4].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*Method); i {
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
			RawDescriptor: file_pkg_pr12er_messages_proto_rawDesc,
			NumEnums:      2,
			NumMessages:   5,
			NumExtensions: 0,
			NumServices:   0,
		},
		GoTypes:           file_pkg_pr12er_messages_proto_goTypes,
		DependencyIndexes: file_pkg_pr12er_messages_proto_depIdxs,
		EnumInfos:         file_pkg_pr12er_messages_proto_enumTypes,
		MessageInfos:      file_pkg_pr12er_messages_proto_msgTypes,
	}.Build()
	File_pkg_pr12er_messages_proto = out.File
	file_pkg_pr12er_messages_proto_rawDesc = nil
	file_pkg_pr12er_messages_proto_goTypes = nil
	file_pkg_pr12er_messages_proto_depIdxs = nil
}

///
//  Generated code. Do not modify.
//  source: pkg/pr12er/messages.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use categoryDescriptor instead')
const Category$json = const {
  '1': 'Category',
  '2': const [
    const {'1': 'CATEGORY_UNSPECIFIED', '2': 0},
    const {'1': 'CATEGORY_VISION', '2': 1},
    const {'1': 'CATEGORY_NLP', '2': 2},
    const {'1': 'CATEGORY_OCR', '2': 3},
    const {'1': 'CATEGORY_AUDIO', '2': 4},
    const {'1': 'CATEGORY_RS', '2': 5},
  ],
};

/// Descriptor for `Category`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List categoryDescriptor = $convert.base64Decode('CghDYXRlZ29yeRIYChRDQVRFR09SWV9VTlNQRUNJRklFRBAAEhMKD0NBVEVHT1JZX1ZJU0lPThABEhAKDENBVEVHT1JZX05MUBACEhAKDENBVEVHT1JZX09DUhADEhIKDkNBVEVHT1JZX0FVRElPEAQSDwoLQ0FURUdPUllfUlMQBQ==');
@$core.Deprecated('Use frameworkDescriptor instead')
const Framework$json = const {
  '1': 'Framework',
  '2': const [
    const {'1': 'FRAMEWORK_UNSPECIFIED', '2': 0},
    const {'1': 'FRAMEWORK_TENSORFLOW', '2': 1},
    const {'1': 'FRAMEWORK_PYTORCH', '2': 2},
    const {'1': 'FRAMEWORK_OTHERS', '2': 3},
  ],
};

/// Descriptor for `Framework`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List frameworkDescriptor = $convert.base64Decode('CglGcmFtZXdvcmsSGQoVRlJBTUVXT1JLX1VOU1BFQ0lGSUVEEAASGAoURlJBTUVXT1JLX1RFTlNPUkZMT1cQARIVChFGUkFNRVdPUktfUFlUT1JDSBACEhQKEEZSQU1FV09SS19PVEhFUlMQAw==');
@$core.Deprecated('Use videoDescriptor instead')
const Video$json = const {
  '1': 'Video',
  '2': const [
    const {'1': 'pr_id', '3': 1, '4': 1, '5': 5, '10': 'prId'},
    const {'1': 'title', '3': 2, '4': 1, '5': 9, '10': 'title'},
    const {'1': 'link', '3': 3, '4': 1, '5': 9, '10': 'link'},
    const {'1': 'presenter', '3': 4, '4': 1, '5': 9, '10': 'presenter'},
    const {'1': 'category', '3': 5, '4': 1, '5': 14, '6': '.pkg.pr12er.Category', '10': 'category'},
    const {'1': 'number_of_like', '3': 6, '4': 1, '5': 3, '10': 'numberOfLike'},
    const {'1': 'keywords', '3': 7, '4': 3, '5': 9, '10': 'keywords'},
    const {'1': 'number_of_views', '3': 8, '4': 1, '5': 3, '10': 'numberOfViews'},
    const {'1': 'published_date', '3': 9, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'publishedDate'},
  ],
};

/// Descriptor for `Video`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List videoDescriptor = $convert.base64Decode('CgVWaWRlbxITCgVwcl9pZBgBIAEoBVIEcHJJZBIUCgV0aXRsZRgCIAEoCVIFdGl0bGUSEgoEbGluaxgDIAEoCVIEbGluaxIcCglwcmVzZW50ZXIYBCABKAlSCXByZXNlbnRlchIwCghjYXRlZ29yeRgFIAEoDjIULnBrZy5wcjEyZXIuQ2F0ZWdvcnlSCGNhdGVnb3J5EiQKDm51bWJlcl9vZl9saWtlGAYgASgDUgxudW1iZXJPZkxpa2USGgoIa2V5d29yZHMYByADKAlSCGtleXdvcmRzEiYKD251bWJlcl9vZl92aWV3cxgIIAEoA1INbnVtYmVyT2ZWaWV3cxJBCg5wdWJsaXNoZWRfZGF0ZRgJIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSDXB1Ymxpc2hlZERhdGU=');
@$core.Deprecated('Use detailDescriptor instead')
const Detail$json = const {
  '1': 'Detail',
  '2': const [
    const {'1': 'pr_id', '3': 1, '4': 1, '5': 5, '10': 'prId'},
    const {'1': 'paper', '3': 2, '4': 3, '5': 11, '6': '.pkg.pr12er.Paper', '10': 'paper'},
    const {'1': 'relevant_papers', '3': 3, '4': 3, '5': 11, '6': '.pkg.pr12er.Paper', '10': 'relevantPapers'},
    const {'1': 'same_author_papers', '3': 4, '4': 3, '5': 11, '6': '.pkg.pr12er.Paper', '10': 'sameAuthorPapers'},
  ],
};

/// Descriptor for `Detail`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List detailDescriptor = $convert.base64Decode('CgZEZXRhaWwSEwoFcHJfaWQYASABKAVSBHBySWQSJwoFcGFwZXIYAiADKAsyES5wa2cucHIxMmVyLlBhcGVyUgVwYXBlchI6Cg9yZWxldmFudF9wYXBlcnMYAyADKAsyES5wa2cucHIxMmVyLlBhcGVyUg5yZWxldmFudFBhcGVycxI/ChJzYW1lX2F1dGhvcl9wYXBlcnMYBCADKAsyES5wa2cucHIxMmVyLlBhcGVyUhBzYW1lQXV0aG9yUGFwZXJz');
@$core.Deprecated('Use paperDescriptor instead')
const Paper$json = const {
  '1': 'Paper',
  '2': const [
    const {'1': 'paper_id', '3': 1, '4': 1, '5': 9, '10': 'paperId'},
    const {'1': 'title', '3': 2, '4': 1, '5': 9, '10': 'title'},
    const {'1': 'arxiv_id', '3': 3, '4': 1, '5': 9, '10': 'arxivId'},
    const {'1': 'abstract', '3': 4, '4': 1, '5': 9, '10': 'abstract'},
    const {'1': 'pub_date', '3': 5, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'pubDate'},
    const {'1': 'authors', '3': 6, '4': 3, '5': 9, '10': 'authors'},
    const {'1': 'repositories', '3': 7, '4': 3, '5': 11, '6': '.pkg.pr12er.Repository', '10': 'repositories'},
    const {'1': 'methods', '3': 8, '4': 3, '5': 11, '6': '.pkg.pr12er.Method', '10': 'methods'},
  ],
};

/// Descriptor for `Paper`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List paperDescriptor = $convert.base64Decode('CgVQYXBlchIZCghwYXBlcl9pZBgBIAEoCVIHcGFwZXJJZBIUCgV0aXRsZRgCIAEoCVIFdGl0bGUSGQoIYXJ4aXZfaWQYAyABKAlSB2FyeGl2SWQSGgoIYWJzdHJhY3QYBCABKAlSCGFic3RyYWN0EjUKCHB1Yl9kYXRlGAUgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIHcHViRGF0ZRIYCgdhdXRob3JzGAYgAygJUgdhdXRob3JzEjoKDHJlcG9zaXRvcmllcxgHIAMoCzIWLnBrZy5wcjEyZXIuUmVwb3NpdG9yeVIMcmVwb3NpdG9yaWVzEiwKB21ldGhvZHMYCCADKAsyEi5wa2cucHIxMmVyLk1ldGhvZFIHbWV0aG9kcw==');
@$core.Deprecated('Use repositoryDescriptor instead')
const Repository$json = const {
  '1': 'Repository',
  '2': const [
    const {'1': 'is_official', '3': 1, '4': 1, '5': 8, '10': 'isOfficial'},
    const {'1': 'url', '3': 2, '4': 1, '5': 9, '10': 'url'},
    const {'1': 'owner', '3': 3, '4': 1, '5': 9, '10': 'owner'},
    const {'1': 'framework', '3': 4, '4': 1, '5': 14, '6': '.pkg.pr12er.Framework', '10': 'framework'},
    const {'1': 'number_of_stars', '3': 5, '4': 1, '5': 3, '10': 'numberOfStars'},
    const {'1': 'description', '3': 6, '4': 1, '5': 9, '10': 'description'},
  ],
};

/// Descriptor for `Repository`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List repositoryDescriptor = $convert.base64Decode('CgpSZXBvc2l0b3J5Eh8KC2lzX29mZmljaWFsGAEgASgIUgppc09mZmljaWFsEhAKA3VybBgCIAEoCVIDdXJsEhQKBW93bmVyGAMgASgJUgVvd25lchIzCglmcmFtZXdvcmsYBCABKA4yFS5wa2cucHIxMmVyLkZyYW1ld29ya1IJZnJhbWV3b3JrEiYKD251bWJlcl9vZl9zdGFycxgFIAEoA1INbnVtYmVyT2ZTdGFycxIgCgtkZXNjcmlwdGlvbhgGIAEoCVILZGVzY3JpcHRpb24=');
@$core.Deprecated('Use methodDescriptor instead')
const Method$json = const {
  '1': 'Method',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'full_name', '3': 2, '4': 1, '5': 9, '10': 'fullName'},
    const {'1': 'description', '3': 3, '4': 1, '5': 9, '10': 'description'},
  ],
};

/// Descriptor for `Method`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List methodDescriptor = $convert.base64Decode('CgZNZXRob2QSEgoEbmFtZRgBIAEoCVIEbmFtZRIbCglmdWxsX25hbWUYAiABKAlSCGZ1bGxOYW1lEiAKC2Rlc2NyaXB0aW9uGAMgASgJUgtkZXNjcmlwdGlvbg==');

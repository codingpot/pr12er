///
//  Generated code. Do not modify.
//  source: video/video.proto
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
    const {'1': 'UNKOWN', '2': 0},
    const {'1': 'VISION', '2': 1},
    const {'1': 'NLP', '2': 2},
    const {'1': 'OCR', '2': 3},
    const {'1': 'AUDIO', '2': 4},
    const {'1': 'RS', '2': 5},
  ],
};

/// Descriptor for `Category`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List categoryDescriptor = $convert.base64Decode('CghDYXRlZ29yeRIKCgZVTktPV04QABIKCgZWSVNJT04QARIHCgNOTFAQAhIHCgNPQ1IQAxIJCgVBVURJTxAEEgYKAlJTEAU=');
@$core.Deprecated('Use videoDescriptor instead')
const Video$json = const {
  '1': 'Video',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 13, '10': 'id'},
    const {'1': 'title', '3': 2, '4': 1, '5': 9, '10': 'title'},
    const {'1': 'link', '3': 3, '4': 1, '5': 9, '10': 'link'},
    const {'1': 'presenter', '3': 4, '4': 1, '5': 9, '10': 'presenter'},
    const {'1': 'category', '3': 5, '4': 1, '5': 14, '6': '.pr12er.protos.Category', '10': 'category'},
    const {'1': 'number_of_like', '3': 6, '4': 1, '5': 13, '10': 'numberOfLike'},
  ],
};

/// Descriptor for `Video`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List videoDescriptor = $convert.base64Decode('CgVWaWRlbxIOCgJpZBgBIAEoDVICaWQSFAoFdGl0bGUYAiABKAlSBXRpdGxlEhIKBGxpbmsYAyABKAlSBGxpbmsSHAoJcHJlc2VudGVyGAQgASgJUglwcmVzZW50ZXISMwoIY2F0ZWdvcnkYBSABKA4yFy5wcjEyZXIucHJvdG9zLkNhdGVnb3J5UghjYXRlZ29yeRIkCg5udW1iZXJfb2ZfbGlrZRgGIAEoDVIMbnVtYmVyT2ZMaWtl');
@$core.Deprecated('Use videosResponseDescriptor instead')
const VideosResponse$json = const {
  '1': 'VideosResponse',
  '2': const [
    const {'1': 'videos', '3': 1, '4': 3, '5': 11, '6': '.pr12er.protos.Video', '10': 'videos'},
  ],
};

/// Descriptor for `VideosResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List videosResponseDescriptor = $convert.base64Decode('Cg5WaWRlb3NSZXNwb25zZRIsCgZ2aWRlb3MYASADKAsyFC5wcjEyZXIucHJvdG9zLlZpZGVvUgZ2aWRlb3M=');
@$core.Deprecated('Use videosRequestDescriptor instead')
const VideosRequest$json = const {
  '1': 'VideosRequest',
};

/// Descriptor for `VideosRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List videosRequestDescriptor = $convert.base64Decode('Cg1WaWRlb3NSZXF1ZXN0');

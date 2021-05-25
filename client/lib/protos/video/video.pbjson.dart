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
@$core.Deprecated('Use videoDescriptor instead')
const Video$json = const {
  '1': 'Video',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
    const {'1': 'title', '3': 2, '4': 1, '5': 9, '10': 'title'},
    const {'1': 'link', '3': 3, '4': 1, '5': 9, '10': 'link'},
    const {'1': 'presenter', '3': 4, '4': 1, '5': 9, '10': 'presenter'},
    const {'1': 'category', '3': 5, '4': 1, '5': 14, '6': '.pr12er.protos.Category', '10': 'category'},
    const {'1': 'number_of_like', '3': 6, '4': 1, '5': 5, '10': 'numberOfLike'},
  ],
};

/// Descriptor for `Video`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List videoDescriptor = $convert.base64Decode('CgVWaWRlbxIOCgJpZBgBIAEoBVICaWQSFAoFdGl0bGUYAiABKAlSBXRpdGxlEhIKBGxpbmsYAyABKAlSBGxpbmsSHAoJcHJlc2VudGVyGAQgASgJUglwcmVzZW50ZXISMwoIY2F0ZWdvcnkYBSABKA4yFy5wcjEyZXIucHJvdG9zLkNhdGVnb3J5UghjYXRlZ29yeRIkCg5udW1iZXJfb2ZfbGlrZRgGIAEoBVIMbnVtYmVyT2ZMaWtl');

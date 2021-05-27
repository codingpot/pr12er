///
//  Generated code. Do not modify.
//  source: pkg/pr12er/metadata.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use metadataDumpDescriptor instead')
const MetadataDump$json = const {
  '1': 'MetadataDump',
  '2': const [
    const {'1': 'metadata', '3': 1, '4': 3, '5': 11, '6': '.pkg.pr12er.Metadata', '10': 'metadata'},
  ],
};

/// Descriptor for `MetadataDump`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List metadataDumpDescriptor = $convert.base64Decode('CgxNZXRhZGF0YUR1bXASMAoIbWV0YWRhdGEYASADKAsyFC5wa2cucHIxMmVyLk1ldGFkYXRhUghtZXRhZGF0YQ==');
@$core.Deprecated('Use metadataDescriptor instead')
const Metadata$json = const {
  '1': 'Metadata',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
    const {'1': 'title', '3': 2, '4': 1, '5': 9, '10': 'title'},
    const {'1': 'paper_metadata', '3': 3, '4': 3, '5': 11, '6': '.pkg.pr12er.PaperMetadata', '10': 'paperMetadata'},
    const {'1': 'video_metadata', '3': 4, '4': 3, '5': 11, '6': '.pkg.pr12er.VideoMetadata', '10': 'videoMetadata'},
    const {'1': 'keywords', '3': 5, '4': 3, '5': 9, '10': 'keywords'},
    const {'1': 'presenter', '3': 6, '4': 1, '5': 9, '10': 'presenter'},
  ],
};

/// Descriptor for `Metadata`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List metadataDescriptor = $convert.base64Decode('CghNZXRhZGF0YRIOCgJpZBgBIAEoBVICaWQSFAoFdGl0bGUYAiABKAlSBXRpdGxlEkAKDnBhcGVyX21ldGFkYXRhGAMgAygLMhkucGtnLnByMTJlci5QYXBlck1ldGFkYXRhUg1wYXBlck1ldGFkYXRhEkAKDnZpZGVvX21ldGFkYXRhGAQgAygLMhkucGtnLnByMTJlci5WaWRlb01ldGFkYXRhUg12aWRlb01ldGFkYXRhEhoKCGtleXdvcmRzGAUgAygJUghrZXl3b3JkcxIcCglwcmVzZW50ZXIYBiABKAlSCXByZXNlbnRlcg==');
@$core.Deprecated('Use paperMetadataDescriptor instead')
const PaperMetadata$json = const {
  '1': 'PaperMetadata',
  '2': const [
    const {'1': 'url', '3': 1, '4': 1, '5': 9, '10': 'url'},
    const {'1': 'authors', '3': 2, '4': 3, '5': 9, '10': 'authors'},
  ],
};

/// Descriptor for `PaperMetadata`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List paperMetadataDescriptor = $convert.base64Decode('Cg1QYXBlck1ldGFkYXRhEhAKA3VybBgBIAEoCVIDdXJsEhgKB2F1dGhvcnMYAiADKAlSB2F1dGhvcnM=');
@$core.Deprecated('Use videoMetadataDescriptor instead')
const VideoMetadata$json = const {
  '1': 'VideoMetadata',
  '2': const [
    const {'1': 'url', '3': 1, '4': 1, '5': 9, '10': 'url'},
  ],
};

/// Descriptor for `VideoMetadata`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List videoMetadataDescriptor = $convert.base64Decode('Cg1WaWRlb01ldGFkYXRhEhAKA3VybBgBIAEoCVIDdXJs');

///
//  Generated code. Do not modify.
//  source: pkg/pr12er/database.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use mappingTableDescriptor instead')
const MappingTable$json = const {
  '1': 'MappingTable',
  '2': const [
    const {'1': 'rows', '3': 1, '4': 3, '5': 11, '6': '.pkg.pr12er.MappingTableRow', '10': 'rows'},
  ],
};

/// Descriptor for `MappingTable`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List mappingTableDescriptor = $convert.base64Decode('CgxNYXBwaW5nVGFibGUSLwoEcm93cxgBIAMoCzIbLnBrZy5wcjEyZXIuTWFwcGluZ1RhYmxlUm93UgRyb3dz');
@$core.Deprecated('Use mappingTableRowDescriptor instead')
const MappingTableRow$json = const {
  '1': 'MappingTableRow',
  '2': const [
    const {'1': 'pr_id', '3': 1, '4': 1, '5': 5, '10': 'prId'},
    const {'1': 'paper_arxiv_id', '3': 2, '4': 3, '5': 9, '10': 'paperArxivId'},
    const {'1': 'youtube_video_id', '3': 3, '4': 1, '5': 9, '10': 'youtubeVideoId'},
  ],
};

/// Descriptor for `MappingTableRow`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List mappingTableRowDescriptor = $convert.base64Decode('Cg9NYXBwaW5nVGFibGVSb3cSEwoFcHJfaWQYASABKAVSBHBySWQSJAoOcGFwZXJfYXJ4aXZfaWQYAiADKAlSDHBhcGVyQXJ4aXZJZBIoChB5b3V0dWJlX3ZpZGVvX2lkGAMgASgJUg55b3V0dWJlVmlkZW9JZA==');
@$core.Deprecated('Use databaseDescriptor instead')
const Database$json = const {
  '1': 'Database',
  '2': const [
    const {'1': 'pr_id_to_video', '3': 1, '4': 3, '5': 11, '6': '.pkg.pr12er.Database.PrIdToVideoEntry', '10': 'prIdToVideo'},
  ],
  '3': const [Database_PrIdToVideoEntry$json],
};

@$core.Deprecated('Use databaseDescriptor instead')
const Database_PrIdToVideoEntry$json = const {
  '1': 'PrIdToVideoEntry',
  '2': const [
    const {'1': 'key', '3': 1, '4': 1, '5': 5, '10': 'key'},
    const {'1': 'value', '3': 2, '4': 1, '5': 11, '6': '.pkg.pr12er.PrVideo', '10': 'value'},
  ],
  '7': const {'7': true},
};

/// Descriptor for `Database`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List databaseDescriptor = $convert.base64Decode('CghEYXRhYmFzZRJKCg5wcl9pZF90b192aWRlbxgBIAMoCzIlLnBrZy5wcjEyZXIuRGF0YWJhc2UuUHJJZFRvVmlkZW9FbnRyeVILcHJJZFRvVmlkZW8aUwoQUHJJZFRvVmlkZW9FbnRyeRIQCgNrZXkYASABKAVSA2tleRIpCgV2YWx1ZRgCIAEoCzITLnBrZy5wcjEyZXIuUHJWaWRlb1IFdmFsdWU6AjgB');
@$core.Deprecated('Use prVideoDescriptor instead')
const PrVideo$json = const {
  '1': 'PrVideo',
  '2': const [
    const {'1': 'pr_id', '3': 1, '4': 1, '5': 5, '10': 'prId'},
    const {'1': 'papers', '3': 2, '4': 3, '5': 11, '6': '.pkg.pr12er.Paper', '10': 'papers'},
    const {'1': 'video', '3': 3, '4': 1, '5': 11, '6': '.pkg.pr12er.YouTubeVideo', '10': 'video'},
  ],
};

/// Descriptor for `PrVideo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List prVideoDescriptor = $convert.base64Decode('CgdQclZpZGVvEhMKBXByX2lkGAEgASgFUgRwcklkEikKBnBhcGVycxgCIAMoCzIRLnBrZy5wcjEyZXIuUGFwZXJSBnBhcGVycxIuCgV2aWRlbxgDIAEoCzIYLnBrZy5wcjEyZXIuWW91VHViZVZpZGVvUgV2aWRlbw==');
@$core.Deprecated('Use youTubeVideoDescriptor instead')
const YouTubeVideo$json = const {
  '1': 'YouTubeVideo',
  '2': const [
    const {'1': 'video_id', '3': 1, '4': 1, '5': 9, '10': 'videoId'},
    const {'1': 'video_title', '3': 2, '4': 1, '5': 9, '10': 'videoTitle'},
    const {'1': 'number_of_likes', '3': 3, '4': 1, '5': 3, '10': 'numberOfLikes'},
    const {'1': 'number_of_views', '3': 4, '4': 1, '5': 3, '10': 'numberOfViews'},
    const {'1': 'published_date', '3': 5, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'publishedDate'},
    const {'1': 'uploader', '3': 6, '4': 1, '5': 9, '10': 'uploader'},
  ],
};

/// Descriptor for `YouTubeVideo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List youTubeVideoDescriptor = $convert.base64Decode('CgxZb3VUdWJlVmlkZW8SGQoIdmlkZW9faWQYASABKAlSB3ZpZGVvSWQSHwoLdmlkZW9fdGl0bGUYAiABKAlSCnZpZGVvVGl0bGUSJgoPbnVtYmVyX29mX2xpa2VzGAMgASgDUg1udW1iZXJPZkxpa2VzEiYKD251bWJlcl9vZl92aWV3cxgEIAEoA1INbnVtYmVyT2ZWaWV3cxJBCg5wdWJsaXNoZWRfZGF0ZRgFIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSDXB1Ymxpc2hlZERhdGUSGgoIdXBsb2FkZXIYBiABKAlSCHVwbG9hZGVy');

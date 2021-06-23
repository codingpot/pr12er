///
//  Generated code. Do not modify.
//  source: pkg/pr12er/service.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use helloRequestDescriptor instead')
const HelloRequest$json = const {
  '1': 'HelloRequest',
  '2': const [
    const {'1': 'body', '3': 1, '4': 1, '5': 9, '10': 'body'},
  ],
};

/// Descriptor for `HelloRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List helloRequestDescriptor = $convert.base64Decode('CgxIZWxsb1JlcXVlc3QSEgoEYm9keRgBIAEoCVIEYm9keQ==');
@$core.Deprecated('Use helloResponseDescriptor instead')
const HelloResponse$json = const {
  '1': 'HelloResponse',
  '2': const [
    const {'1': 'body', '3': 1, '4': 1, '5': 9, '10': 'body'},
  ],
};

/// Descriptor for `HelloResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List helloResponseDescriptor = $convert.base64Decode('Cg1IZWxsb1Jlc3BvbnNlEhIKBGJvZHkYASABKAlSBGJvZHk=');
@$core.Deprecated('Use getVideosResponseDescriptor instead')
const GetVideosResponse$json = const {
  '1': 'GetVideosResponse',
  '2': const [
    const {'1': 'videos', '3': 1, '4': 3, '5': 11, '6': '.pkg.pr12er.Video', '10': 'videos'},
  ],
};

/// Descriptor for `GetVideosResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getVideosResponseDescriptor = $convert.base64Decode('ChFHZXRWaWRlb3NSZXNwb25zZRIpCgZ2aWRlb3MYASADKAsyES5wa2cucHIxMmVyLlZpZGVvUgZ2aWRlb3M=');
@$core.Deprecated('Use getVideosRequestDescriptor instead')
const GetVideosRequest$json = const {
  '1': 'GetVideosRequest',
};

/// Descriptor for `GetVideosRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getVideosRequestDescriptor = $convert.base64Decode('ChBHZXRWaWRlb3NSZXF1ZXN0');
@$core.Deprecated('Use getDetailResponseDescriptor instead')
const GetDetailResponse$json = const {
  '1': 'GetDetailResponse',
  '2': const [
    const {'1': 'detail', '3': 1, '4': 1, '5': 11, '6': '.pkg.pr12er.Detail', '10': 'detail'},
  ],
};

/// Descriptor for `GetDetailResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getDetailResponseDescriptor = $convert.base64Decode('ChFHZXREZXRhaWxSZXNwb25zZRIqCgZkZXRhaWwYASABKAsyEi5wa2cucHIxMmVyLkRldGFpbFIGZGV0YWls');
@$core.Deprecated('Use getDetailRequestDescriptor instead')
const GetDetailRequest$json = const {
  '1': 'GetDetailRequest',
  '2': const [
    const {'1': 'pr_id', '3': 1, '4': 1, '5': 5, '10': 'prId'},
  ],
};

/// Descriptor for `GetDetailRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getDetailRequestDescriptor = $convert.base64Decode('ChBHZXREZXRhaWxSZXF1ZXN0EhMKBXByX2lkGAEgASgFUgRwcklk');

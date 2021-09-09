///
//  Generated code. Do not modify.
//  source: pkg/pr12er/service.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'messages.pb.dart' as $2;

import 'service.pbenum.dart';

export 'service.pbenum.dart';

class HelloRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'HelloRequest',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pkg.pr12er'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'body')
    ..hasRequiredFields = false;

  HelloRequest._() : super();
  factory HelloRequest({
    $core.String? body,
  }) {
    final _result = create();
    if (body != null) {
      _result.body = body;
    }
    return _result;
  }
  factory HelloRequest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory HelloRequest.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  HelloRequest clone() => HelloRequest()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  HelloRequest copyWith(void Function(HelloRequest) updates) =>
      super.copyWith((message) => updates(message as HelloRequest))
          as HelloRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static HelloRequest create() => HelloRequest._();
  HelloRequest createEmptyInstance() => create();
  static $pb.PbList<HelloRequest> createRepeated() =>
      $pb.PbList<HelloRequest>();
  @$core.pragma('dart2js:noInline')
  static HelloRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HelloRequest>(create);
  static HelloRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get body => $_getSZ(0);
  @$pb.TagNumber(1)
  set body($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasBody() => $_has(0);
  @$pb.TagNumber(1)
  void clearBody() => clearField(1);
}

class HelloResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'HelloResponse',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pkg.pr12er'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'body')
    ..hasRequiredFields = false;

  HelloResponse._() : super();
  factory HelloResponse({
    $core.String? body,
  }) {
    final _result = create();
    if (body != null) {
      _result.body = body;
    }
    return _result;
  }
  factory HelloResponse.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory HelloResponse.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  HelloResponse clone() => HelloResponse()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  HelloResponse copyWith(void Function(HelloResponse) updates) =>
      super.copyWith((message) => updates(message as HelloResponse))
          as HelloResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static HelloResponse create() => HelloResponse._();
  HelloResponse createEmptyInstance() => create();
  static $pb.PbList<HelloResponse> createRepeated() =>
      $pb.PbList<HelloResponse>();
  @$core.pragma('dart2js:noInline')
  static HelloResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HelloResponse>(create);
  static HelloResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get body => $_getSZ(0);
  @$pb.TagNumber(1)
  set body($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasBody() => $_has(0);
  @$pb.TagNumber(1)
  void clearBody() => clearField(1);
}

class GetVideosResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GetVideosResponse',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pkg.pr12er'),
      createEmptyInstance: create)
    ..pc<$2.Video>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'videos',
        $pb.PbFieldType.PM,
        subBuilder: $2.Video.create)
    ..hasRequiredFields = false;

  GetVideosResponse._() : super();
  factory GetVideosResponse({
    $core.Iterable<$2.Video>? videos,
  }) {
    final _result = create();
    if (videos != null) {
      _result.videos.addAll(videos);
    }
    return _result;
  }
  factory GetVideosResponse.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GetVideosResponse.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GetVideosResponse clone() => GetVideosResponse()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GetVideosResponse copyWith(void Function(GetVideosResponse) updates) =>
      super.copyWith((message) => updates(message as GetVideosResponse))
          as GetVideosResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetVideosResponse create() => GetVideosResponse._();
  GetVideosResponse createEmptyInstance() => create();
  static $pb.PbList<GetVideosResponse> createRepeated() =>
      $pb.PbList<GetVideosResponse>();
  @$core.pragma('dart2js:noInline')
  static GetVideosResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetVideosResponse>(create);
  static GetVideosResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$2.Video> get videos => $_getList(0);
}

class GetVideosRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GetVideosRequest',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pkg.pr12er'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  GetVideosRequest._() : super();
  factory GetVideosRequest() => create();
  factory GetVideosRequest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GetVideosRequest.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GetVideosRequest clone() => GetVideosRequest()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GetVideosRequest copyWith(void Function(GetVideosRequest) updates) =>
      super.copyWith((message) => updates(message as GetVideosRequest))
          as GetVideosRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetVideosRequest create() => GetVideosRequest._();
  GetVideosRequest createEmptyInstance() => create();
  static $pb.PbList<GetVideosRequest> createRepeated() =>
      $pb.PbList<GetVideosRequest>();
  @$core.pragma('dart2js:noInline')
  static GetVideosRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetVideosRequest>(create);
  static GetVideosRequest? _defaultInstance;
}

class GetDetailResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GetDetailResponse',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pkg.pr12er'),
      createEmptyInstance: create)
    ..aOM<$2.Detail>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'detail',
        subBuilder: $2.Detail.create)
    ..hasRequiredFields = false;

  GetDetailResponse._() : super();
  factory GetDetailResponse({
    $2.Detail? detail,
  }) {
    final _result = create();
    if (detail != null) {
      _result.detail = detail;
    }
    return _result;
  }
  factory GetDetailResponse.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GetDetailResponse.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GetDetailResponse clone() => GetDetailResponse()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GetDetailResponse copyWith(void Function(GetDetailResponse) updates) =>
      super.copyWith((message) => updates(message as GetDetailResponse))
          as GetDetailResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetDetailResponse create() => GetDetailResponse._();
  GetDetailResponse createEmptyInstance() => create();
  static $pb.PbList<GetDetailResponse> createRepeated() =>
      $pb.PbList<GetDetailResponse>();
  @$core.pragma('dart2js:noInline')
  static GetDetailResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetDetailResponse>(create);
  static GetDetailResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $2.Detail get detail => $_getN(0);
  @$pb.TagNumber(1)
  set detail($2.Detail v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasDetail() => $_has(0);
  @$pb.TagNumber(1)
  void clearDetail() => clearField(1);
  @$pb.TagNumber(1)
  $2.Detail ensureDetail() => $_ensure(0);
}

class GetDetailRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GetDetailRequest',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pkg.pr12er'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'prId',
        $pb.PbFieldType.O3)
    ..hasRequiredFields = false;

  GetDetailRequest._() : super();
  factory GetDetailRequest({
    $core.int? prId,
  }) {
    final _result = create();
    if (prId != null) {
      _result.prId = prId;
    }
    return _result;
  }
  factory GetDetailRequest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GetDetailRequest.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GetDetailRequest clone() => GetDetailRequest()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GetDetailRequest copyWith(void Function(GetDetailRequest) updates) =>
      super.copyWith((message) => updates(message as GetDetailRequest))
          as GetDetailRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetDetailRequest create() => GetDetailRequest._();
  GetDetailRequest createEmptyInstance() => create();
  static $pb.PbList<GetDetailRequest> createRepeated() =>
      $pb.PbList<GetDetailRequest>();
  @$core.pragma('dart2js:noInline')
  static GetDetailRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetDetailRequest>(create);
  static GetDetailRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get prId => $_getIZ(0);
  @$pb.TagNumber(1)
  set prId($core.int v) {
    $_setSignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasPrId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPrId() => clearField(1);
}

class ReportRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ReportRequest',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pkg.pr12er'),
      createEmptyInstance: create)
    ..e<ReportRequest_ReportType>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'type',
        $pb.PbFieldType.OE,
        defaultOrMaker: ReportRequest_ReportType.REPORT_TYPE_UNSPECIFIED,
        valueOf: ReportRequest_ReportType.valueOf,
        enumValues: ReportRequest_ReportType.values)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'body')
    ..hasRequiredFields = false;

  ReportRequest._() : super();
  factory ReportRequest({
    ReportRequest_ReportType? type,
    $core.String? body,
  }) {
    final _result = create();
    if (type != null) {
      _result.type = type;
    }
    if (body != null) {
      _result.body = body;
    }
    return _result;
  }
  factory ReportRequest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ReportRequest.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ReportRequest clone() => ReportRequest()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ReportRequest copyWith(void Function(ReportRequest) updates) =>
      super.copyWith((message) => updates(message as ReportRequest))
          as ReportRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ReportRequest create() => ReportRequest._();
  ReportRequest createEmptyInstance() => create();
  static $pb.PbList<ReportRequest> createRepeated() =>
      $pb.PbList<ReportRequest>();
  @$core.pragma('dart2js:noInline')
  static ReportRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ReportRequest>(create);
  static ReportRequest? _defaultInstance;

  @$pb.TagNumber(1)
  ReportRequest_ReportType get type => $_getN(0);
  @$pb.TagNumber(1)
  set type(ReportRequest_ReportType v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasType() => $_has(0);
  @$pb.TagNumber(1)
  void clearType() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get body => $_getSZ(1);
  @$pb.TagNumber(2)
  set body($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasBody() => $_has(1);
  @$pb.TagNumber(2)
  void clearBody() => clearField(2);
}

class ReportResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ReportResponse',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pkg.pr12er'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'issueUrl')
    ..hasRequiredFields = false;

  ReportResponse._() : super();
  factory ReportResponse({
    $core.String? issueUrl,
  }) {
    final _result = create();
    if (issueUrl != null) {
      _result.issueUrl = issueUrl;
    }
    return _result;
  }
  factory ReportResponse.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ReportResponse.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ReportResponse clone() => ReportResponse()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ReportResponse copyWith(void Function(ReportResponse) updates) =>
      super.copyWith((message) => updates(message as ReportResponse))
          as ReportResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ReportResponse create() => ReportResponse._();
  ReportResponse createEmptyInstance() => create();
  static $pb.PbList<ReportResponse> createRepeated() =>
      $pb.PbList<ReportResponse>();
  @$core.pragma('dart2js:noInline')
  static ReportResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ReportResponse>(create);
  static ReportResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get issueUrl => $_getSZ(0);
  @$pb.TagNumber(1)
  set issueUrl($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasIssueUrl() => $_has(0);
  @$pb.TagNumber(1)
  void clearIssueUrl() => clearField(1);
}

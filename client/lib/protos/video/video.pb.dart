///
//  Generated code. Do not modify.
//  source: video/video.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'video.pbenum.dart';

export 'video.pbenum.dart';

class Video extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Video', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'pr12er.protos'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id', $pb.PbFieldType.OU3)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'title')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'link')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'presenter')
    ..e<Category>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'category', $pb.PbFieldType.OE, defaultOrMaker: Category.UNKOWN, valueOf: Category.valueOf, enumValues: Category.values)
    ..a<$core.int>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'numberOfLike', $pb.PbFieldType.OU3)
    ..hasRequiredFields = false
  ;

  Video._() : super();
  factory Video({
    $core.int? id,
    $core.String? title,
    $core.String? link,
    $core.String? presenter,
    Category? category,
    $core.int? numberOfLike,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (title != null) {
      _result.title = title;
    }
    if (link != null) {
      _result.link = link;
    }
    if (presenter != null) {
      _result.presenter = presenter;
    }
    if (category != null) {
      _result.category = category;
    }
    if (numberOfLike != null) {
      _result.numberOfLike = numberOfLike;
    }
    return _result;
  }
  factory Video.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Video.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Video clone() => Video()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Video copyWith(void Function(Video) updates) => super.copyWith((message) => updates(message as Video)) as Video; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Video create() => Video._();
  Video createEmptyInstance() => create();
  static $pb.PbList<Video> createRepeated() => $pb.PbList<Video>();
  @$core.pragma('dart2js:noInline')
  static Video getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Video>(create);
  static Video? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get title => $_getSZ(1);
  @$pb.TagNumber(2)
  set title($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTitle() => $_has(1);
  @$pb.TagNumber(2)
  void clearTitle() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get link => $_getSZ(2);
  @$pb.TagNumber(3)
  set link($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasLink() => $_has(2);
  @$pb.TagNumber(3)
  void clearLink() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get presenter => $_getSZ(3);
  @$pb.TagNumber(4)
  set presenter($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasPresenter() => $_has(3);
  @$pb.TagNumber(4)
  void clearPresenter() => clearField(4);

  @$pb.TagNumber(5)
  Category get category => $_getN(4);
  @$pb.TagNumber(5)
  set category(Category v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasCategory() => $_has(4);
  @$pb.TagNumber(5)
  void clearCategory() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get numberOfLike => $_getIZ(5);
  @$pb.TagNumber(6)
  set numberOfLike($core.int v) { $_setUnsignedInt32(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasNumberOfLike() => $_has(5);
  @$pb.TagNumber(6)
  void clearNumberOfLike() => clearField(6);
}

class VideosResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'VideosResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'pr12er.protos'), createEmptyInstance: create)
    ..pc<Video>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'videos', $pb.PbFieldType.PM, subBuilder: Video.create)
    ..hasRequiredFields = false
  ;

  VideosResponse._() : super();
  factory VideosResponse({
    $core.Iterable<Video>? videos,
  }) {
    final _result = create();
    if (videos != null) {
      _result.videos.addAll(videos);
    }
    return _result;
  }
  factory VideosResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory VideosResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  VideosResponse clone() => VideosResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  VideosResponse copyWith(void Function(VideosResponse) updates) => super.copyWith((message) => updates(message as VideosResponse)) as VideosResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static VideosResponse create() => VideosResponse._();
  VideosResponse createEmptyInstance() => create();
  static $pb.PbList<VideosResponse> createRepeated() => $pb.PbList<VideosResponse>();
  @$core.pragma('dart2js:noInline')
  static VideosResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<VideosResponse>(create);
  static VideosResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<Video> get videos => $_getList(0);
}

class VideosRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'VideosRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'pr12er.protos'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  VideosRequest._() : super();
  factory VideosRequest() => create();
  factory VideosRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory VideosRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  VideosRequest clone() => VideosRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  VideosRequest copyWith(void Function(VideosRequest) updates) => super.copyWith((message) => updates(message as VideosRequest)) as VideosRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static VideosRequest create() => VideosRequest._();
  VideosRequest createEmptyInstance() => create();
  static $pb.PbList<VideosRequest> createRepeated() => $pb.PbList<VideosRequest>();
  @$core.pragma('dart2js:noInline')
  static VideosRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<VideosRequest>(create);
  static VideosRequest? _defaultInstance;
}


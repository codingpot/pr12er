///
//  Generated code. Do not modify.
//  source: pkg/pr12er/metadata.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class MetadataDump extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MetadataDump', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'pkg.pr12er'), createEmptyInstance: create)
    ..pc<Metadata>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'metadata', $pb.PbFieldType.PM, subBuilder: Metadata.create)
    ..hasRequiredFields = false
  ;

  MetadataDump._() : super();
  factory MetadataDump({
    $core.Iterable<Metadata>? metadata,
  }) {
    final _result = create();
    if (metadata != null) {
      _result.metadata.addAll(metadata);
    }
    return _result;
  }
  factory MetadataDump.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MetadataDump.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MetadataDump clone() => MetadataDump()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MetadataDump copyWith(void Function(MetadataDump) updates) => super.copyWith((message) => updates(message as MetadataDump)) as MetadataDump; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MetadataDump create() => MetadataDump._();
  MetadataDump createEmptyInstance() => create();
  static $pb.PbList<MetadataDump> createRepeated() => $pb.PbList<MetadataDump>();
  @$core.pragma('dart2js:noInline')
  static MetadataDump getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MetadataDump>(create);
  static MetadataDump? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<Metadata> get metadata => $_getList(0);
}

class Metadata extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Metadata', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'pkg.pr12er'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id', $pb.PbFieldType.O3)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'title')
    ..pc<PaperMetadata>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'paperMetadata', $pb.PbFieldType.PM, subBuilder: PaperMetadata.create)
    ..pc<VideoMetadata>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'videoMetadata', $pb.PbFieldType.PM, subBuilder: VideoMetadata.create)
    ..pPS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'keywords')
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'presenter')
    ..hasRequiredFields = false
  ;

  Metadata._() : super();
  factory Metadata({
    $core.int? id,
    $core.String? title,
    $core.Iterable<PaperMetadata>? paperMetadata,
    $core.Iterable<VideoMetadata>? videoMetadata,
    $core.Iterable<$core.String>? keywords,
    $core.String? presenter,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (title != null) {
      _result.title = title;
    }
    if (paperMetadata != null) {
      _result.paperMetadata.addAll(paperMetadata);
    }
    if (videoMetadata != null) {
      _result.videoMetadata.addAll(videoMetadata);
    }
    if (keywords != null) {
      _result.keywords.addAll(keywords);
    }
    if (presenter != null) {
      _result.presenter = presenter;
    }
    return _result;
  }
  factory Metadata.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Metadata.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Metadata clone() => Metadata()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Metadata copyWith(void Function(Metadata) updates) => super.copyWith((message) => updates(message as Metadata)) as Metadata; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Metadata create() => Metadata._();
  Metadata createEmptyInstance() => create();
  static $pb.PbList<Metadata> createRepeated() => $pb.PbList<Metadata>();
  @$core.pragma('dart2js:noInline')
  static Metadata getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Metadata>(create);
  static Metadata? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int v) { $_setSignedInt32(0, v); }
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
  $core.List<PaperMetadata> get paperMetadata => $_getList(2);

  @$pb.TagNumber(4)
  $core.List<VideoMetadata> get videoMetadata => $_getList(3);

  @$pb.TagNumber(5)
  $core.List<$core.String> get keywords => $_getList(4);

  @$pb.TagNumber(6)
  $core.String get presenter => $_getSZ(5);
  @$pb.TagNumber(6)
  set presenter($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasPresenter() => $_has(5);
  @$pb.TagNumber(6)
  void clearPresenter() => clearField(6);
}

class PaperMetadata extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'PaperMetadata', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'pkg.pr12er'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'url')
    ..pPS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'authors')
    ..hasRequiredFields = false
  ;

  PaperMetadata._() : super();
  factory PaperMetadata({
    $core.String? url,
    $core.Iterable<$core.String>? authors,
  }) {
    final _result = create();
    if (url != null) {
      _result.url = url;
    }
    if (authors != null) {
      _result.authors.addAll(authors);
    }
    return _result;
  }
  factory PaperMetadata.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PaperMetadata.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PaperMetadata clone() => PaperMetadata()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PaperMetadata copyWith(void Function(PaperMetadata) updates) => super.copyWith((message) => updates(message as PaperMetadata)) as PaperMetadata; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PaperMetadata create() => PaperMetadata._();
  PaperMetadata createEmptyInstance() => create();
  static $pb.PbList<PaperMetadata> createRepeated() => $pb.PbList<PaperMetadata>();
  @$core.pragma('dart2js:noInline')
  static PaperMetadata getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PaperMetadata>(create);
  static PaperMetadata? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get url => $_getSZ(0);
  @$pb.TagNumber(1)
  set url($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUrl() => $_has(0);
  @$pb.TagNumber(1)
  void clearUrl() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.String> get authors => $_getList(1);
}

class VideoMetadata extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'VideoMetadata', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'pkg.pr12er'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'url')
    ..hasRequiredFields = false
  ;

  VideoMetadata._() : super();
  factory VideoMetadata({
    $core.String? url,
  }) {
    final _result = create();
    if (url != null) {
      _result.url = url;
    }
    return _result;
  }
  factory VideoMetadata.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory VideoMetadata.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  VideoMetadata clone() => VideoMetadata()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  VideoMetadata copyWith(void Function(VideoMetadata) updates) => super.copyWith((message) => updates(message as VideoMetadata)) as VideoMetadata; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static VideoMetadata create() => VideoMetadata._();
  VideoMetadata createEmptyInstance() => create();
  static $pb.PbList<VideoMetadata> createRepeated() => $pb.PbList<VideoMetadata>();
  @$core.pragma('dart2js:noInline')
  static VideoMetadata getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<VideoMetadata>(create);
  static VideoMetadata? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get url => $_getSZ(0);
  @$pb.TagNumber(1)
  set url($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUrl() => $_has(0);
  @$pb.TagNumber(1)
  void clearUrl() => clearField(1);
}


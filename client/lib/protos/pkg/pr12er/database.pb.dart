///
//  Generated code. Do not modify.
//  source: pkg/pr12er/database.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'messages.pb.dart' as $2;
import '../../google/protobuf/timestamp.pb.dart' as $1;

class MappingTable extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MappingTable', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'pkg.pr12er'), createEmptyInstance: create)
    ..pc<MappingTableRow>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'rows', $pb.PbFieldType.PM, subBuilder: MappingTableRow.create)
    ..hasRequiredFields = false
  ;

  MappingTable._() : super();
  factory MappingTable({
    $core.Iterable<MappingTableRow>? rows,
  }) {
    final _result = create();
    if (rows != null) {
      _result.rows.addAll(rows);
    }
    return _result;
  }
  factory MappingTable.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MappingTable.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MappingTable clone() => MappingTable()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MappingTable copyWith(void Function(MappingTable) updates) => super.copyWith((message) => updates(message as MappingTable)) as MappingTable; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MappingTable create() => MappingTable._();
  MappingTable createEmptyInstance() => create();
  static $pb.PbList<MappingTable> createRepeated() => $pb.PbList<MappingTable>();
  @$core.pragma('dart2js:noInline')
  static MappingTable getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MappingTable>(create);
  static MappingTable? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<MappingTableRow> get rows => $_getList(0);
}

class MappingTableRow extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MappingTableRow', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'pkg.pr12er'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'prId', $pb.PbFieldType.O3)
    ..pPS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'paperArxivId')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'youtubeVideoId')
    ..hasRequiredFields = false
  ;

  MappingTableRow._() : super();
  factory MappingTableRow({
    $core.int? prId,
    $core.Iterable<$core.String>? paperArxivId,
    $core.String? youtubeVideoId,
  }) {
    final _result = create();
    if (prId != null) {
      _result.prId = prId;
    }
    if (paperArxivId != null) {
      _result.paperArxivId.addAll(paperArxivId);
    }
    if (youtubeVideoId != null) {
      _result.youtubeVideoId = youtubeVideoId;
    }
    return _result;
  }
  factory MappingTableRow.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MappingTableRow.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MappingTableRow clone() => MappingTableRow()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MappingTableRow copyWith(void Function(MappingTableRow) updates) => super.copyWith((message) => updates(message as MappingTableRow)) as MappingTableRow; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MappingTableRow create() => MappingTableRow._();
  MappingTableRow createEmptyInstance() => create();
  static $pb.PbList<MappingTableRow> createRepeated() => $pb.PbList<MappingTableRow>();
  @$core.pragma('dart2js:noInline')
  static MappingTableRow getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MappingTableRow>(create);
  static MappingTableRow? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get prId => $_getIZ(0);
  @$pb.TagNumber(1)
  set prId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPrId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPrId() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.String> get paperArxivId => $_getList(1);

  @$pb.TagNumber(3)
  $core.String get youtubeVideoId => $_getSZ(2);
  @$pb.TagNumber(3)
  set youtubeVideoId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasYoutubeVideoId() => $_has(2);
  @$pb.TagNumber(3)
  void clearYoutubeVideoId() => clearField(3);
}

class Database extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Database', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'pkg.pr12er'), createEmptyInstance: create)
    ..m<$core.int, PrVideo>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'prIdToVideo', entryClassName: 'Database.PrIdToVideoEntry', keyFieldType: $pb.PbFieldType.O3, valueFieldType: $pb.PbFieldType.OM, valueCreator: PrVideo.create, packageName: const $pb.PackageName('pkg.pr12er'))
    ..hasRequiredFields = false
  ;

  Database._() : super();
  factory Database({
    $core.Map<$core.int, PrVideo>? prIdToVideo,
  }) {
    final _result = create();
    if (prIdToVideo != null) {
      _result.prIdToVideo.addAll(prIdToVideo);
    }
    return _result;
  }
  factory Database.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Database.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Database clone() => Database()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Database copyWith(void Function(Database) updates) => super.copyWith((message) => updates(message as Database)) as Database; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Database create() => Database._();
  Database createEmptyInstance() => create();
  static $pb.PbList<Database> createRepeated() => $pb.PbList<Database>();
  @$core.pragma('dart2js:noInline')
  static Database getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Database>(create);
  static Database? _defaultInstance;

  @$pb.TagNumber(1)
  $core.Map<$core.int, PrVideo> get prIdToVideo => $_getMap(0);
}

class PrVideo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'PrVideo', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'pkg.pr12er'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'prId', $pb.PbFieldType.O3)
    ..pc<$2.Paper>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'papers', $pb.PbFieldType.PM, subBuilder: $2.Paper.create)
    ..aOM<YouTubeVideo>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'video', subBuilder: YouTubeVideo.create)
    ..hasRequiredFields = false
  ;

  PrVideo._() : super();
  factory PrVideo({
    $core.int? prId,
    $core.Iterable<$2.Paper>? papers,
    YouTubeVideo? video,
  }) {
    final _result = create();
    if (prId != null) {
      _result.prId = prId;
    }
    if (papers != null) {
      _result.papers.addAll(papers);
    }
    if (video != null) {
      _result.video = video;
    }
    return _result;
  }
  factory PrVideo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PrVideo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PrVideo clone() => PrVideo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PrVideo copyWith(void Function(PrVideo) updates) => super.copyWith((message) => updates(message as PrVideo)) as PrVideo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PrVideo create() => PrVideo._();
  PrVideo createEmptyInstance() => create();
  static $pb.PbList<PrVideo> createRepeated() => $pb.PbList<PrVideo>();
  @$core.pragma('dart2js:noInline')
  static PrVideo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PrVideo>(create);
  static PrVideo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get prId => $_getIZ(0);
  @$pb.TagNumber(1)
  set prId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPrId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPrId() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$2.Paper> get papers => $_getList(1);

  @$pb.TagNumber(3)
  YouTubeVideo get video => $_getN(2);
  @$pb.TagNumber(3)
  set video(YouTubeVideo v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasVideo() => $_has(2);
  @$pb.TagNumber(3)
  void clearVideo() => clearField(3);
  @$pb.TagNumber(3)
  YouTubeVideo ensureVideo() => $_ensure(2);
}

class YouTubeVideo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'YouTubeVideo', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'pkg.pr12er'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'videoId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'videoTitle')
    ..aInt64(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'numberOfLikes')
    ..aInt64(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'numberOfViews')
    ..aOM<$1.Timestamp>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'publishedDate', subBuilder: $1.Timestamp.create)
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'uploader')
    ..hasRequiredFields = false
  ;

  YouTubeVideo._() : super();
  factory YouTubeVideo({
    $core.String? videoId,
    $core.String? videoTitle,
    $fixnum.Int64? numberOfLikes,
    $fixnum.Int64? numberOfViews,
    $1.Timestamp? publishedDate,
    $core.String? uploader,
  }) {
    final _result = create();
    if (videoId != null) {
      _result.videoId = videoId;
    }
    if (videoTitle != null) {
      _result.videoTitle = videoTitle;
    }
    if (numberOfLikes != null) {
      _result.numberOfLikes = numberOfLikes;
    }
    if (numberOfViews != null) {
      _result.numberOfViews = numberOfViews;
    }
    if (publishedDate != null) {
      _result.publishedDate = publishedDate;
    }
    if (uploader != null) {
      _result.uploader = uploader;
    }
    return _result;
  }
  factory YouTubeVideo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory YouTubeVideo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  YouTubeVideo clone() => YouTubeVideo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  YouTubeVideo copyWith(void Function(YouTubeVideo) updates) => super.copyWith((message) => updates(message as YouTubeVideo)) as YouTubeVideo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static YouTubeVideo create() => YouTubeVideo._();
  YouTubeVideo createEmptyInstance() => create();
  static $pb.PbList<YouTubeVideo> createRepeated() => $pb.PbList<YouTubeVideo>();
  @$core.pragma('dart2js:noInline')
  static YouTubeVideo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<YouTubeVideo>(create);
  static YouTubeVideo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get videoId => $_getSZ(0);
  @$pb.TagNumber(1)
  set videoId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasVideoId() => $_has(0);
  @$pb.TagNumber(1)
  void clearVideoId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get videoTitle => $_getSZ(1);
  @$pb.TagNumber(2)
  set videoTitle($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasVideoTitle() => $_has(1);
  @$pb.TagNumber(2)
  void clearVideoTitle() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get numberOfLikes => $_getI64(2);
  @$pb.TagNumber(3)
  set numberOfLikes($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasNumberOfLikes() => $_has(2);
  @$pb.TagNumber(3)
  void clearNumberOfLikes() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get numberOfViews => $_getI64(3);
  @$pb.TagNumber(4)
  set numberOfViews($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasNumberOfViews() => $_has(3);
  @$pb.TagNumber(4)
  void clearNumberOfViews() => clearField(4);

  @$pb.TagNumber(5)
  $1.Timestamp get publishedDate => $_getN(4);
  @$pb.TagNumber(5)
  set publishedDate($1.Timestamp v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasPublishedDate() => $_has(4);
  @$pb.TagNumber(5)
  void clearPublishedDate() => clearField(5);
  @$pb.TagNumber(5)
  $1.Timestamp ensurePublishedDate() => $_ensure(4);

  @$pb.TagNumber(6)
  $core.String get uploader => $_getSZ(5);
  @$pb.TagNumber(6)
  set uploader($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasUploader() => $_has(5);
  @$pb.TagNumber(6)
  void clearUploader() => clearField(6);
}


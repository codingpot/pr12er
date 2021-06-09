///
//  Generated code. Do not modify.
//  source: pkg/pr12er/messages.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import '../../google/protobuf/timestamp.pb.dart' as $1;

import 'messages.pbenum.dart';

export 'messages.pbenum.dart';

class Video extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Video', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'pkg.pr12er'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id', $pb.PbFieldType.O3)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'title')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'link')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'presenter')
    ..e<Category>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'category', $pb.PbFieldType.OE, defaultOrMaker: Category.CATEGORY_UNSPECIFIED, valueOf: Category.valueOf, enumValues: Category.values)
    ..aInt64(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'numberOfLike')
    ..pPS(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'keywords')
    ..aInt64(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'numberOfViews')
    ..aOM<$1.Timestamp>(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'publishedDate', subBuilder: $1.Timestamp.create)
    ..hasRequiredFields = false
  ;

  Video._() : super();
  factory Video({
    $core.int? id,
    $core.String? title,
    $core.String? link,
    $core.String? presenter,
    Category? category,
    $fixnum.Int64? numberOfLike,
    $core.Iterable<$core.String>? keywords,
    $fixnum.Int64? numberOfViews,
    $1.Timestamp? publishedDate,
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
    if (keywords != null) {
      _result.keywords.addAll(keywords);
    }
    if (numberOfViews != null) {
      _result.numberOfViews = numberOfViews;
    }
    if (publishedDate != null) {
      _result.publishedDate = publishedDate;
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
  $fixnum.Int64 get numberOfLike => $_getI64(5);
  @$pb.TagNumber(6)
  set numberOfLike($fixnum.Int64 v) { $_setInt64(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasNumberOfLike() => $_has(5);
  @$pb.TagNumber(6)
  void clearNumberOfLike() => clearField(6);

  @$pb.TagNumber(7)
  $core.List<$core.String> get keywords => $_getList(6);

  @$pb.TagNumber(8)
  $fixnum.Int64 get numberOfViews => $_getI64(7);
  @$pb.TagNumber(8)
  set numberOfViews($fixnum.Int64 v) { $_setInt64(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasNumberOfViews() => $_has(7);
  @$pb.TagNumber(8)
  void clearNumberOfViews() => clearField(8);

  @$pb.TagNumber(9)
  $1.Timestamp get publishedDate => $_getN(8);
  @$pb.TagNumber(9)
  set publishedDate($1.Timestamp v) { setField(9, v); }
  @$pb.TagNumber(9)
  $core.bool hasPublishedDate() => $_has(8);
  @$pb.TagNumber(9)
  void clearPublishedDate() => clearField(9);
  @$pb.TagNumber(9)
  $1.Timestamp ensurePublishedDate() => $_ensure(8);
}

class Detail extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Detail', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'pkg.pr12er'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'prId', $pb.PbFieldType.O3)
    ..pc<Paper>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'paper', $pb.PbFieldType.PM, subBuilder: Paper.create)
    ..pc<Paper>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'relevantPapers', $pb.PbFieldType.PM, subBuilder: Paper.create)
    ..pc<Paper>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sameAuthorPapers', $pb.PbFieldType.PM, subBuilder: Paper.create)
    ..hasRequiredFields = false
  ;

  Detail._() : super();
  factory Detail({
    $core.int? prId,
    $core.Iterable<Paper>? paper,
    $core.Iterable<Paper>? relevantPapers,
    $core.Iterable<Paper>? sameAuthorPapers,
  }) {
    final _result = create();
    if (prId != null) {
      _result.prId = prId;
    }
    if (paper != null) {
      _result.paper.addAll(paper);
    }
    if (relevantPapers != null) {
      _result.relevantPapers.addAll(relevantPapers);
    }
    if (sameAuthorPapers != null) {
      _result.sameAuthorPapers.addAll(sameAuthorPapers);
    }
    return _result;
  }
  factory Detail.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Detail.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Detail clone() => Detail()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Detail copyWith(void Function(Detail) updates) => super.copyWith((message) => updates(message as Detail)) as Detail; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Detail create() => Detail._();
  Detail createEmptyInstance() => create();
  static $pb.PbList<Detail> createRepeated() => $pb.PbList<Detail>();
  @$core.pragma('dart2js:noInline')
  static Detail getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Detail>(create);
  static Detail? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get prId => $_getIZ(0);
  @$pb.TagNumber(1)
  set prId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPrId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPrId() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<Paper> get paper => $_getList(1);

  @$pb.TagNumber(3)
  $core.List<Paper> get relevantPapers => $_getList(2);

  @$pb.TagNumber(4)
  $core.List<Paper> get sameAuthorPapers => $_getList(3);
}

class Paper extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Paper', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'pkg.pr12er'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'paperId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'title')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'arxivId')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'absract')
    ..aOM<$1.Timestamp>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'pubDate', subBuilder: $1.Timestamp.create)
    ..pPS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'authors')
    ..pc<Repository>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'repositories', $pb.PbFieldType.PM, subBuilder: Repository.create)
    ..pc<Method>(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'methods', $pb.PbFieldType.PM, subBuilder: Method.create)
    ..hasRequiredFields = false
  ;

  Paper._() : super();
  factory Paper({
    $core.String? paperId,
    $core.String? title,
    $core.String? arxivId,
    $core.String? absract,
    $1.Timestamp? pubDate,
    $core.Iterable<$core.String>? authors,
    $core.Iterable<Repository>? repositories,
    $core.Iterable<Method>? methods,
  }) {
    final _result = create();
    if (paperId != null) {
      _result.paperId = paperId;
    }
    if (title != null) {
      _result.title = title;
    }
    if (arxivId != null) {
      _result.arxivId = arxivId;
    }
    if (absract != null) {
      _result.absract = absract;
    }
    if (pubDate != null) {
      _result.pubDate = pubDate;
    }
    if (authors != null) {
      _result.authors.addAll(authors);
    }
    if (repositories != null) {
      _result.repositories.addAll(repositories);
    }
    if (methods != null) {
      _result.methods.addAll(methods);
    }
    return _result;
  }
  factory Paper.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Paper.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Paper clone() => Paper()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Paper copyWith(void Function(Paper) updates) => super.copyWith((message) => updates(message as Paper)) as Paper; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Paper create() => Paper._();
  Paper createEmptyInstance() => create();
  static $pb.PbList<Paper> createRepeated() => $pb.PbList<Paper>();
  @$core.pragma('dart2js:noInline')
  static Paper getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Paper>(create);
  static Paper? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get paperId => $_getSZ(0);
  @$pb.TagNumber(1)
  set paperId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPaperId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPaperId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get title => $_getSZ(1);
  @$pb.TagNumber(2)
  set title($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTitle() => $_has(1);
  @$pb.TagNumber(2)
  void clearTitle() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get arxivId => $_getSZ(2);
  @$pb.TagNumber(3)
  set arxivId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasArxivId() => $_has(2);
  @$pb.TagNumber(3)
  void clearArxivId() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get absract => $_getSZ(3);
  @$pb.TagNumber(4)
  set absract($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasAbsract() => $_has(3);
  @$pb.TagNumber(4)
  void clearAbsract() => clearField(4);

  @$pb.TagNumber(5)
  $1.Timestamp get pubDate => $_getN(4);
  @$pb.TagNumber(5)
  set pubDate($1.Timestamp v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasPubDate() => $_has(4);
  @$pb.TagNumber(5)
  void clearPubDate() => clearField(5);
  @$pb.TagNumber(5)
  $1.Timestamp ensurePubDate() => $_ensure(4);

  @$pb.TagNumber(6)
  $core.List<$core.String> get authors => $_getList(5);

  @$pb.TagNumber(7)
  $core.List<Repository> get repositories => $_getList(6);

  @$pb.TagNumber(8)
  $core.List<Method> get methods => $_getList(7);
}

class Repository extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Repository', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'pkg.pr12er'), createEmptyInstance: create)
    ..aOB(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'isOfficial')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'url')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'owner')
    ..e<Framework>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'framework', $pb.PbFieldType.OE, defaultOrMaker: Framework.FRAMEWORK_UNSPECIFIED, valueOf: Framework.valueOf, enumValues: Framework.values)
    ..aInt64(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'numberOfStars')
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'description')
    ..hasRequiredFields = false
  ;

  Repository._() : super();
  factory Repository({
    $core.bool? isOfficial,
    $core.String? url,
    $core.String? owner,
    Framework? framework,
    $fixnum.Int64? numberOfStars,
    $core.String? description,
  }) {
    final _result = create();
    if (isOfficial != null) {
      _result.isOfficial = isOfficial;
    }
    if (url != null) {
      _result.url = url;
    }
    if (owner != null) {
      _result.owner = owner;
    }
    if (framework != null) {
      _result.framework = framework;
    }
    if (numberOfStars != null) {
      _result.numberOfStars = numberOfStars;
    }
    if (description != null) {
      _result.description = description;
    }
    return _result;
  }
  factory Repository.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Repository.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Repository clone() => Repository()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Repository copyWith(void Function(Repository) updates) => super.copyWith((message) => updates(message as Repository)) as Repository; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Repository create() => Repository._();
  Repository createEmptyInstance() => create();
  static $pb.PbList<Repository> createRepeated() => $pb.PbList<Repository>();
  @$core.pragma('dart2js:noInline')
  static Repository getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Repository>(create);
  static Repository? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get isOfficial => $_getBF(0);
  @$pb.TagNumber(1)
  set isOfficial($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasIsOfficial() => $_has(0);
  @$pb.TagNumber(1)
  void clearIsOfficial() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get url => $_getSZ(1);
  @$pb.TagNumber(2)
  set url($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUrl() => $_has(1);
  @$pb.TagNumber(2)
  void clearUrl() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get owner => $_getSZ(2);
  @$pb.TagNumber(3)
  set owner($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasOwner() => $_has(2);
  @$pb.TagNumber(3)
  void clearOwner() => clearField(3);

  @$pb.TagNumber(4)
  Framework get framework => $_getN(3);
  @$pb.TagNumber(4)
  set framework(Framework v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasFramework() => $_has(3);
  @$pb.TagNumber(4)
  void clearFramework() => clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get numberOfStars => $_getI64(4);
  @$pb.TagNumber(5)
  set numberOfStars($fixnum.Int64 v) { $_setInt64(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasNumberOfStars() => $_has(4);
  @$pb.TagNumber(5)
  void clearNumberOfStars() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get description => $_getSZ(5);
  @$pb.TagNumber(6)
  set description($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasDescription() => $_has(5);
  @$pb.TagNumber(6)
  void clearDescription() => clearField(6);
}

class Method extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Method', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'pkg.pr12er'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'fullName')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'description')
    ..hasRequiredFields = false
  ;

  Method._() : super();
  factory Method({
    $core.String? name,
    $core.String? fullName,
    $core.String? description,
  }) {
    final _result = create();
    if (name != null) {
      _result.name = name;
    }
    if (fullName != null) {
      _result.fullName = fullName;
    }
    if (description != null) {
      _result.description = description;
    }
    return _result;
  }
  factory Method.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Method.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Method clone() => Method()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Method copyWith(void Function(Method) updates) => super.copyWith((message) => updates(message as Method)) as Method; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Method create() => Method._();
  Method createEmptyInstance() => create();
  static $pb.PbList<Method> createRepeated() => $pb.PbList<Method>();
  @$core.pragma('dart2js:noInline')
  static Method getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Method>(create);
  static Method? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get fullName => $_getSZ(1);
  @$pb.TagNumber(2)
  set fullName($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasFullName() => $_has(1);
  @$pb.TagNumber(2)
  void clearFullName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get description => $_getSZ(2);
  @$pb.TagNumber(3)
  set description($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasDescription() => $_has(2);
  @$pb.TagNumber(3)
  void clearDescription() => clearField(3);
}


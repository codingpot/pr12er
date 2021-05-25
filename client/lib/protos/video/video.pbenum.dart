///
//  Generated code. Do not modify.
//  source: video/video.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class Category extends $pb.ProtobufEnum {
  static const Category UNKOWN = Category._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'UNKOWN');
  static const Category VISION = Category._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'VISION');
  static const Category NLP = Category._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'NLP');
  static const Category OCR = Category._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'OCR');
  static const Category AUDIO = Category._(4, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'AUDIO');
  static const Category RS = Category._(5, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'RS');

  static const $core.List<Category> values = <Category> [
    UNKOWN,
    VISION,
    NLP,
    OCR,
    AUDIO,
    RS,
  ];

  static final $core.Map<$core.int, Category> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Category? valueOf($core.int value) => _byValue[value];

  const Category._($core.int v, $core.String n) : super(v, n);
}


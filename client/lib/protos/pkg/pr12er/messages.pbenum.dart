///
//  Generated code. Do not modify.
//  source: pkg/pr12er/messages.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class Category extends $pb.ProtobufEnum {
  static const Category CATEGORY_UNSPECIFIED = Category._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'CATEGORY_UNSPECIFIED');
  static const Category CATEGORY_VISION = Category._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'CATEGORY_VISION');
  static const Category CATEGORY_NLP = Category._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'CATEGORY_NLP');
  static const Category CATEGORY_OCR = Category._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'CATEGORY_OCR');
  static const Category CATEGORY_AUDIO = Category._(4, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'CATEGORY_AUDIO');
  static const Category CATEGORY_RS = Category._(5, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'CATEGORY_RS');

  static const $core.List<Category> values = <Category> [
    CATEGORY_UNSPECIFIED,
    CATEGORY_VISION,
    CATEGORY_NLP,
    CATEGORY_OCR,
    CATEGORY_AUDIO,
    CATEGORY_RS,
  ];

  static final $core.Map<$core.int, Category> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Category? valueOf($core.int value) => _byValue[value];

  const Category._($core.int v, $core.String n) : super(v, n);
}

class Framework extends $pb.ProtobufEnum {
  static const Framework FRAMEWORK_TENSORFLOW = Framework._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'FRAMEWORK_TENSORFLOW');
  static const Framework FRAMEWORK_PYTORCH = Framework._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'FRAMEWORK_PYTORCH');
  static const Framework OTHERS = Framework._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'OTHERS');

  static const $core.List<Framework> values = <Framework> [
    FRAMEWORK_TENSORFLOW,
    FRAMEWORK_PYTORCH,
    OTHERS,
  ];

  static final $core.Map<$core.int, Framework> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Framework? valueOf($core.int value) => _byValue[value];

  const Framework._($core.int v, $core.String n) : super(v, n);
}


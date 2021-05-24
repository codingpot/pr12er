///
//  Generated code. Do not modify.
//  source: pr12er.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:async' as $async;

import 'package:protobuf/protobuf.dart' as $pb;

import 'dart:core' as $core;
import 'pr12er.pb.dart' as $0;
import 'pr12er.pbjson.dart';

export 'pr12er.pb.dart';

abstract class Pr12erServiceBase extends $pb.GeneratedService {
  $async.Future<$0.HelloResponse> getHello($pb.ServerContext ctx, $0.HelloRequest request);

  $pb.GeneratedMessage createRequest($core.String method) {
    switch (method) {
      case 'GetHello': return $0.HelloRequest();
      default: throw $core.ArgumentError('Unknown method: $method');
    }
  }

  $async.Future<$pb.GeneratedMessage> handleCall($pb.ServerContext ctx, $core.String method, $pb.GeneratedMessage request) {
    switch (method) {
      case 'GetHello': return this.getHello(ctx, request as $0.HelloRequest);
      default: throw $core.ArgumentError('Unknown method: $method');
    }
  }

  $core.Map<$core.String, $core.dynamic> get $json => Pr12erServiceBase$json;
  $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>> get $messageJson => Pr12erServiceBase$messageJson;
}


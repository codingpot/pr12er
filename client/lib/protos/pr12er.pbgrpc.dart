///
//  Generated code. Do not modify.
//  source: pr12er.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

// ignore: import_of_legacy_library_into_null_safe
import 'package:grpc/service_api.dart' as $grpc;
import 'pr12er.pb.dart' as $0;
export 'pr12er.pb.dart';

class Pr12erServiceClient extends $grpc.Client {
  static final _$getHello =
      $grpc.ClientMethod<$0.HelloRequest, $0.HelloResponse>(
          '/pr12er.protos.Pr12erService/GetHello',
          ($0.HelloRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.HelloResponse.fromBuffer(value));

  Pr12erServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.HelloResponse> getHello($0.HelloRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getHello, request, options: options);
  }
}

abstract class Pr12erServiceBase extends $grpc.Service {
  $core.String get $name => 'pr12er.protos.Pr12erService';

  Pr12erServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.HelloRequest, $0.HelloResponse>(
        'GetHello',
        getHello_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.HelloRequest.fromBuffer(value),
        ($0.HelloResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.HelloResponse> getHello_Pre(
      $grpc.ServiceCall call, $async.Future<$0.HelloRequest> request) async {
    return getHello(call, await request);
  }

  $async.Future<$0.HelloResponse> getHello(
      $grpc.ServiceCall call, $0.HelloRequest request);
}

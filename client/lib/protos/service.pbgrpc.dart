///
//  Generated code. Do not modify.
//  source: service.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'service.pb.dart' as $0;
export 'service.pb.dart';

class Pr12erServiceClient extends $grpc.Client {
  static final _$getHello =
      $grpc.ClientMethod<$0.HelloRequest, $0.HelloResponse>(
          '/pr12er.protos.Pr12erService/GetHello',
          ($0.HelloRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.HelloResponse.fromBuffer(value));
  static final _$getVideos =
      $grpc.ClientMethod<$0.GetVideosRequest, $0.GetVideosResponse>(
          '/pr12er.protos.Pr12erService/GetVideos',
          ($0.GetVideosRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.GetVideosResponse.fromBuffer(value));

  Pr12erServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.HelloResponse> getHello($0.HelloRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getHello, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetVideosResponse> getVideos(
      $0.GetVideosRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getVideos, request, options: options);
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
    $addMethod($grpc.ServiceMethod<$0.GetVideosRequest, $0.GetVideosResponse>(
        'GetVideos',
        getVideos_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetVideosRequest.fromBuffer(value),
        ($0.GetVideosResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.HelloResponse> getHello_Pre(
      $grpc.ServiceCall call, $async.Future<$0.HelloRequest> request) async {
    return getHello(call, await request);
  }

  $async.Future<$0.GetVideosResponse> getVideos_Pre($grpc.ServiceCall call,
      $async.Future<$0.GetVideosRequest> request) async {
    return getVideos(call, await request);
  }

  $async.Future<$0.HelloResponse> getHello(
      $grpc.ServiceCall call, $0.HelloRequest request);
  $async.Future<$0.GetVideosResponse> getVideos(
      $grpc.ServiceCall call, $0.GetVideosRequest request);
}

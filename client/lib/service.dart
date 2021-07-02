import 'package:grpc/grpc.dart';
import 'package:pr12er/grpc_channel_native.dart'
    if (dart.library.js) 'package:pr12er/grpc_channel_web.dart';
import 'package:pr12er/protos/pkg/pr12er/messages.pb.dart';

import 'protos/pkg/pr12er/service.pbgrpc.dart';

class GrpcClient {
  // Use _getLocalhostChannel(port: 9000) to use the localhost version.
  // NOTE: localhost only works in iOS.
  final Pr12erServiceClient _client =
      Pr12erServiceClient(getKkweonOktetoChannel());

  List<Video>? _videoCache;

  Future<String> sendMessage(String message) async {
    final request = HelloRequest()..body = message;
    final response = await _client.getHello(request);

    return response.body;
  }

  Future<List<Video>> getVideos() async {
    if (_videoCache != null) return _videoCache!;

    final request = GetVideosRequest();
    final response = await _client.getVideos(request);

    _videoCache = response.videos;

    return _videoCache!;
  }

  Future<Detail> getDetail(int videoId) async {
    final request = GetDetailRequest(prId: videoId);
    final response = await _client.getDetail(request);

    return response.detail;
  }

  Future<ReportResponse> report(ReportRequest_ReportType type, String body) {
    return _client.report(ReportRequest()
      ..type = type
      ..body = body);
  }
}

// ignore: unused_element
ClientChannel _getLocalhostChannel({required int port}) {
  return ClientChannel(
    'localhost',
    port: port,
    options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
  );
}

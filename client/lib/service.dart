import 'package:grpc/grpc.dart';
import 'package:pr12er/protos/pkg/pr12er/messages.pb.dart';

import 'protos/pkg/pr12er/service.pbgrpc.dart';

class GrpcClient {
  // Use _getLocalhostChannel(port: 9000) to use the localhost version.
  // NOTE: localhost only works in iOS.
  final Pr12erServiceClient _client =
      Pr12erServiceClient(_getKkweonOktetoChannel());

  Future<String> sendMessage(String message) async {
    final request = HelloRequest()..body = message;
    final response = await _client.getHello(request);

    return response.body;
  }

  Future<List<Video>> getVideos() async {
    final request = GetVideosRequest();
    final response = await _client.getVideos(request);

    return response.videos;
  }

  Future<Detail> getDetails(int videoId) async {
    final request = GetDetailsRequest(prId: videoId);
    final response = await _client.getDetails(request);

    return response.detail;
  }
}

ClientChannel _getKkweonOktetoChannel() {
  return ClientChannel('ingress-kkweon.cloud.okteto.net');
}

// ignore: unused_element
ClientChannel _getLocalhostChannel({required int port}) {
  return ClientChannel(
    'localhost',
    port: port,
    options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
  );
}

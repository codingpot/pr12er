import 'package:grpc/grpc.dart';
import 'package:pr12er/protos/pkg/pr12er/messages.pb.dart';

import 'protos/pkg/pr12er/service.pbgrpc.dart';

class GrpcMsgSender {
  // Use _getLocalhostChannel(port: 9000) to use the localhost version.
  // NOTE: localhost only works in iOS.
  ClientChannel channel = _getKkweonOktetoChannel();

  static final GrpcMsgSender _singleton = new GrpcMsgSender._internal();

  factory GrpcMsgSender() => _singleton;

  GrpcMsgSender._internal();

  Future<String> sendMessage(String message) async {
    final stub = Pr12erServiceClient(channel);

    var request = HelloRequest()..body = message;
    var response = await stub.getHello(request);

    return response.body;
  }

  Future<List<Video>> getVideos() async {
    final stub = Pr12erServiceClient(channel);

    var request = GetVideosRequest();
    var response = await stub.getVideos(request);

    return response.videos;
  }
}

ClientChannel _getKkweonOktetoChannel() {
  return ClientChannel(
    'ingress-kkweon.cloud.okteto.net',
    port: 443,
  );
}

ClientChannel _getLocalhostChannel({required int port}) {
  return ClientChannel(
    'localhost',
    port: port,
    options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
  );
}
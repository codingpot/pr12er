import 'package:grpc/grpc.dart';
import 'package:pr12er/protos/pkg/pr12er/messages.pb.dart';

import 'protos/pkg/pr12er/service.pbgrpc.dart';

class GrpcMsgSender {
  // ClientChannel channel = ClientChannel(
  //   'raspberry.kkweon.dev',
  //   port: 443,
  // );

  // for test-server connection
  ClientChannel channel = ClientChannel(
    'localhost',
    port: 9000,
    options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
  );

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

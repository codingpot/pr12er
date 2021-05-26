import 'package:grpc/grpc.dart';

import 'protos/pkg/pr12er/service.pbgrpc.dart';

class GrpcMsgSender {
  ClientChannel channel = ClientChannel(
    'localhost', // Use your IP address where the server is running
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
}

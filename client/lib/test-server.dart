import 'package:grpc/grpc.dart';

import 'protos/service.pb.dart';
import 'protos/service.pbgrpc.dart';

class GreeterService extends Pr12erServiceBase {
  @override
  Future<HelloResponse> getHello(ServiceCall call, HelloRequest request) async {
    return HelloResponse()..body = 'Hello, ${request.body}';
  }

  @override
  Future<GetVideosResponse> getVideos(ServiceCall call,GetVideosRequest request) async {
    return GetVideosResponse();
  }
}

Future<void> main(List<String> args) async {
  final server = Server(
    [GreeterService()],
    const <Interceptor>[],
    CodecRegistry(codecs: const [GzipCodec(), IdentityCodec()]),
  );
  await server.serve(port: 9000);
  print('Server listening on port ${server.port}...');
}

import 'package:grpc/grpc_web.dart';

GrpcWebClientChannel getKkweonOktetoChannel() {
  // return GrpcWebClientChannel.xhr(Uri.parse("https://envoy-kkweon.cloud.okteto.net"));
  return GrpcWebClientChannel.xhr(Uri.parse("https://envoy-kkweon.cloud.okteto.net/"));
}
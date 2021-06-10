import 'package:grpc/grpc.dart';

ClientChannel getKkweonOktetoChannel() {
  return ClientChannel('ingress-kkweon.cloud.okteto.net');
}

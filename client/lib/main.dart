import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:grpc/grpc.dart';
import 'package:pr12er/protos/pr12er.pb.dart';
import 'package:pr12er/protos/pr12er.pbgrpc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
          appBar: AppBar(
            title: Text('Welcome to Flutter'),
          ),
          body: Client()),
    );
  }
}

class Client extends StatefulWidget {
  @override
  _ClientState createState() => _ClientState();
}

class _ClientState extends State<Client> {
  String result = "";
  final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(15),
        child: Center(
          child: Column(
            children: [
              TextField(
                controller: myController,
              ),
              Row(
                children: [
                  Expanded(
                      child: OutlinedButton(
                          onPressed: () {
                            // print(myController.text);
                            _call_grpc();
                          },
                          child: const Text('Click Me')))
                ],
              )
            ],
          ),
        ));
  }

  // ignore: non_constant_identifier_names
  Future<void> _call_grpc() async {
    final channel = ClientChannel(
      'localhost', // Use your IP address where the server is running
      port: 9000,
      options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
    );
    final stub = Pr12erServiceClient(channel);

    var request = HelloRequest();
    var response = await stub.getHello(request);
    result = response.body;
    print(result);
    await channel.shutdown();
  }
}

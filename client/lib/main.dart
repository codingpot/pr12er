import 'package:flutter/material.dart';
import 'package:grpc/grpc.dart';

import 'protos/hello/hello.pb.dart';
import 'protos/hello/hello.pbgrpc.dart';

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
                            _callGrpc(myController.text);
                          },
                          child: const Text('Click Me')))
                ],
              )
            ],
          ),
        ));
  }

  Future<void> _callGrpc(String message) async {
    final channel = ClientChannel(
      'localhost', // Use your IP address where the server is running
      port: 9000,
      options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
    );
    final stub = Pr12erServiceClient(channel);

    var request = HelloRequest()..body = message;
    var response = await stub.getHello(request);
    result = response.body;
    print(result);
    await channel.shutdown();
  }
}

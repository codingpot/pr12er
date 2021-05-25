import 'package:flutter/material.dart';
import 'service.dart';

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
  String _result = "";
  final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(15),
        child: Center(
          child: Column(
            children: [
              Text(_result),
              TextField(
                key: ValueKey("input-box"),
                controller: myController,
              ),
              Row(
                children: [
                  Expanded(
                      child: OutlinedButton(
                          onPressed: () async {
                            // print(myController.text);
                            final body = await GrpcMsgSender()
                                .sendMessage(myController.text);
                            setState(() => _result = body);
                          },
                          child: const Text('Click Me')))
                ],
              )
            ],
          ),
        ));
  }
}

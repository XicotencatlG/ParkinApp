/*import 'package:flutter/material.dart';
import 'package:parkingapp/UI/Ayuda/HomeAyuda.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';
class AyudaStream extends StatefulWidget {
  @override
  _AyudaStreamState createState() => _AyudaStreamState();
}

class _AyudaStreamState extends State<AyudaStream> {
  Client _client;
  @override
  void initState(){
    _client = Client(
      'sbcuk94mdcs8',
      logLevel: Level.INFO,
      );
  }
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      builder: (context, child){
        return StreamChat( child: child, client: _client,);
      },
      home: HomeChat()
    );
  }
}*/
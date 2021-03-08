/*import 'package:flutter/material.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

class ChatsPagues extends StatefulWidget {
  @override
  _ChatsPaguesState createState() => _ChatsPaguesState();
}
final _keyChannels = GlobalKey<ChannelsBlocState>();

class _ChatsPaguesState extends State<ChatsPagues> {
  Future<void> _oncCreatedChannel() async{
    final result = await showDialog(context: context, 
    builder: (context){
      final channelControler = TextEditingController();
      return AlertDialog(
        
        title: Text('Crear Canal'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            
            TextField(
              controller: channelControler,
              decoration: InputDecoration(
                hintText: 'Nombre del canal', ),
            ),
            ElevatedButton(onPressed: ()=> Navigator.of(context).pop(channelControler.text), child: Text('ir')),
          ],
        ),
        
        
        
      );
    });

    if (result !=null){
      final client = StreamChat.of(context).client;
      final channel = client.channel('messaging', id: result);
      await channel.create();
      _keyChannels.currentState.queryChannels();
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(onPressed: _oncCreatedChannel, label: Text('Crear canal')),
      //appBar: AppBar(title: Text('Ayuda'),),
      body: ChannelsBloc(
        key: _keyChannels,
        child: ChannelListView(
          channelWidget: ChannelPagues(),
        ),
      ),
    );
  }
}

class ChannelPagues extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ChannelHeader(),
      body: Column(
        children: [
          Expanded(
            child: MessageListView(),
            ),
            MessageInput(),
        ],
      ),
    );
  }
}*/
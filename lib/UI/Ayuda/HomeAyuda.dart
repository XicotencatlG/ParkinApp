/*import 'package:flutter/material.dart';
import 'package:parkingapp/UI/Ayuda/ChatsPague.dart';
import 'package:parkingapp/UI/Ayuda/utils.dart';

import 'package:stream_chat_flutter/stream_chat_flutter.dart';
class HomeChat extends StatefulWidget {
  @override
  _HomeChatState createState() => _HomeChatState();
}

class _HomeChatState extends State<HomeChat> {
  final _usernameController = TextEditingController();
  
  String _usernameError;
  bool _loading = false;
  Future<void> _onGoPressed() async{
    
    final username = _usernameController.text;
    if (username.isEmpty){
      final client = StreamChat.of(context).client;
      setState(() {
              _loading = true;
            });
      await client.setUser(User(
        id: username,
        extraData: {
          'image':DataUtils.getUser(username)
        }
        
      
      ), client.devToken(username));
      setState(() {
              _loading = false;
            });
            Navigator.of(context).push(MaterialPageRoute(builder: (_)=> ChatsPagues(),));
    }else{
            setState(() {
              _usernameError = 'Usuario no valido';
            });
    }
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

  body: Center(
    child: _loading ? CircularProgressIndicator(): Card(
      elevation: 11,
      margin: const EdgeInsets.all(15),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Ingresa nombre de Usuario'),
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(hintText: 'Usuario', errorText: _usernameError,),
            ),
            ElevatedButton(onPressed: _onGoPressed, child: Text('ir')),
          ],
        ),
      ),
    ),
  ),

    );
  }
}
*/

import 'package:flutter/material.dart';
import 'package:parkingapp/UI/Home/Home_pagues.dart';
import 'package:parkingapp/util/sing_in.dart';
class LoginPagues extends StatefulWidget {
  @override
  _LoginPaguesState createState() => _LoginPaguesState();
}

class _LoginPaguesState extends State<LoginPagues> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
                    image: DecorationImage(
            image: AssetImage('assets/upvt7.jpg'),
            fit: BoxFit.fitHeight,
            colorFilter: ColorFilter.mode(Colors.black.withOpacity(.5),BlendMode.dstATop)
          ),
          gradient: LinearGradient(
            colors: [Colors.yellow[200], Colors.red],
            
            begin: FractionalOffset.topCenter,
            end: FractionalOffset.bottomRight,
            
          ),

        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images.png',),
             

              SizedBox(height:30),
              Text('Bienvenidos a ParkinApp', style: TextStyle(
                fontSize: 18,
               // fontWeight: FontWeight.bold,
                color: Colors.white
              ),),
              SizedBox(height: 200,),
              _signInButton(),
            ],
          ),
          ),
      ),
    );
  }

  Widget _signInButton() {
    return OutlineButton(
      //splashColor: Colors.red,
      onPressed: () {
        signInWithGoogle().then((result) {
          if (result != null) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return HomePagues();
                },
              ),
            );
          }
        });
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      highlightElevation: 0,
      borderSide: BorderSide(color: Colors.white),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(image: AssetImage("assets/google_logo.png"), height: 35.0),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'Iniciar con Google',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

}

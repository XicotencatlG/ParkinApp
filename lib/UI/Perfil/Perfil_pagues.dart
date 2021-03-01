import 'package:flutter/material.dart';
import 'package:parkingapp/util/sing_in.dart';
class PerfilPagues extends StatefulWidget {
  @override
  _PerfilPaguesState createState() => _PerfilPaguesState();
}

class _PerfilPaguesState extends State<PerfilPagues> {
  @override
  Widget build(BuildContext context) {
    return Stack(
     children: [
       ClipPath(clipper: Myclipper(),
       child: Container(
         height: 250,
         decoration: BoxDecoration(color: Colors.red),
       ),
        
       ),
        SafeArea(
          child: SingleChildScrollView(
            child: 
            Center(child: 
            ConstrainedBox(constraints: BoxConstraints(maxWidth: 380),
            child: Column(crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 50,),
              CircleAvatar(radius: 85,
              backgroundColor: Colors.white,
              child: ClipOval(
                child:Image.network(imageUrl, scale: .6,)
              ),
              ),
              SizedBox(height: 20,),
              Row(children: [
                SizedBox(width: 30,),
                  Center(child: Text('Nombre:', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)),
                SizedBox(width: 30,),
                Text(name, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
              SizedBox(height: 10,),

              ],),
              SizedBox(height: 20,),
             Row(children: [
                SizedBox(width: 30,),
                  Center(child: Text('Carrera:', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)),
                SizedBox(width: 30,),
                Text('Informatica', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
              SizedBox(height: 10,),

              ],),

                            SizedBox(height: 20,),
            /* Row(children: [
                SizedBox(width: 30,),
                  Center(child: Text(':', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)),
                SizedBox(width: 30,),
                Text('Informatica', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
              SizedBox(height: 10,),

              ],),*/

              SizedBox(height: 20,),
             Row(children: [
                SizedBox(width: 30,),
                  Center(child: Text('Matricula:', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)),
                SizedBox(width: 30,),
                Text('1520INI001', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
              SizedBox(height: 10,),

              ],),
              
              Row(
                children: [
                  SizedBox(height: 80, width: 90,),
                  RaisedButton(
                  color: Colors.red,
            child: Text('Modificar datos', style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    onPressed: (){},),
                ],
              )
            ],
            ),
            )
            ),
            ),
        ),
       
     ],
  );
  }

  
}


class Myclipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0 , size.height -80);
    var controllPoint= Offset(50 , size.height);
    var endPoint= Offset(size.width/2, size.height);
    path.quadraticBezierTo(controllPoint.dx, controllPoint.dy, endPoint.dx, endPoint.dy);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}
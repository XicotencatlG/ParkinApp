import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:parkingapp/UI/Perfil/UpdatePerfil.dart';
import 'package:parkingapp/util/sing_in.dart';
class PerfilPagues extends StatefulWidget {
  @override
  _PerfilPaguesState createState() => _PerfilPaguesState();
}


class _PerfilPaguesState extends State<PerfilPagues> {
   SpeedDial buildSpeedDial() { 
    return SpeedDial( 
      animatedIcon: AnimatedIcons.menu_close, 
      animatedIconTheme: IconThemeData(size: 28.0), 
      backgroundColor: Colors.red, 
      visible: true, 
      curve: Curves.bounceInOut, 
      children: [ 
        SpeedDialChild( 
          child: Icon(Icons.upgrade, color: Colors.white), 
          backgroundColor: Colors.yellow, 
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => UpdatePerfil()));
          }, 
          label: 'Agregar', 
          labelStyle: 
              TextStyle(fontWeight: FontWeight.w500, color: Colors.white), 
          labelBackgroundColor: Colors.yellow, 
        ), 
                SpeedDialChild( 
          child: Icon(Icons.upgrade, color: Colors.white), 
          backgroundColor: Colors.green, 
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => UpdatePerfil()));
          }, 
          label: 'Actualizar', 
          labelStyle: 
              TextStyle(fontWeight: FontWeight.w500, color: Colors.white), 
          labelBackgroundColor: Colors.green, 
        ),
      ], 
    ); 
  } 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: Firestore.instance.collection('Perfil$name').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
             if (!snapshot.hasData) return CircularProgressIndicator();
             return ListView.builder(
               itemCount: snapshot.data.documents.length,
            itemBuilder: (BuildContext context, int index){
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
              SizedBox(height: 50,),
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
                Text(snapshot.data.docs.elementAt(index)['Carrera'],style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
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
                Text(snapshot.data.docs.elementAt(index)['MAtricula'],style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
              SizedBox(height: 10,),

              ],),

            
            
            
            ],
            
            ),
            
            )
            
            ),
            
            ),
            
        ),
       
     ],
     
  );

            }
             );
        }
      ),
      floatingActionButton: buildSpeedDial(),
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
 
    return true;
  }
}


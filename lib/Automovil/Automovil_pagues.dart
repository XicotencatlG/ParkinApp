

import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:parkingapp/Automovil/Actualizar_Auto_pagues.dart';
import 'package:parkingapp/util/sing_in.dart';
class AutomovilPague extends StatefulWidget {
  @override
  _AutomovilPagueState createState() => _AutomovilPagueState();
}
class _AutomovilPagueState extends State<AutomovilPague> {
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
            Navigator.push(context, MaterialPageRoute(builder: (context) => ActualizarAuto()));
          }, 
          label: 'Agregar', 
          labelStyle: 
              TextStyle(fontWeight: FontWeight.w500, color: Colors.white), 
          labelBackgroundColor: Colors.yellow, 
        ), 
        /*SpeedDialChild( 
          child: Icon(Icons.create, color: Colors.white), 
          backgroundColor: Colors.blue, 
          onTap: () => print('Pressed Write'), 
          label: 'Agregar', 
          labelStyle: 
              TextStyle(fontWeight: FontWeight.w500, color: Colors.white), 
          labelBackgroundColor: Colors.blue, 
        ), */
        /*SpeedDialChild( 
          child: Icon(Icons.get_app_outlined, color: Colors.white), 
          backgroundColor: Colors.green, 
          onTap: () => print('Pressed Code'), 
          label: 'Eliminar', 
          labelStyle: 
              TextStyle(fontWeight: FontWeight.w500, color: Colors.white), 
          labelBackgroundColor: Colors.purple, 
        ), */
      ], 
    ); 
  } 
  
// ignore: deprecated_member_use


  Widget build(BuildContext context) {

    return Scaffold(
      
      body: StreamBuilder(
        
    
        // ignore: deprecated_member_use
        stream: Firestore.instance.collection(name).snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
          return ListView.builder(
            // ignore: deprecated_member_use
            itemCount: snapshot.data.documents.length,
            itemBuilder: (BuildContext context, int index){
              return Stack(
                
                children: <Widget>[
              /*          ClipPath(
        clipper: Myclipper(),
        child: Container(
          height: 300,
          decoration: BoxDecoration(color: Colors.red),
        )
        ),*/
                  //Divider(height: 20, color: Colors.red,),



      Center(
        child: ConstrainedBox(constraints: BoxConstraints(maxWidth: 900),
        child: Column(crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          
        Card(
          
          child: Container(
            
            child: Center(
              child: Row(
                
                children: [
                  
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                   
          Row(children: [
            SizedBox(width: 250,),
            IconButton(
              icon: Icon(Icons.edit,color: Colors.red,),
              onPressed: (){
                // ignore: deprecated_member_use
                Firestore.instance.collection('name').document().delete().catchError((e){
                  print(e);
                });
              },
            ),
                        IconButton(
              icon: Icon(Icons.delete_forever,color: Colors.red,),
              onPressed: (){},
            ),
          ],),
                              SizedBox(height: 50,),
          Row(children: [
            SizedBox(width: 20,),
            Text('Marca:', style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            SizedBox(height: 40,),
             SizedBox(width: 50,),
            // ignore: deprecated_member_use
            Text(snapshot.data.documents.elementAt(index)['Marca'], style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),

          ],),
           Row(children: [
            SizedBox(width: 50,),
            Text('Tipo:', style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            SizedBox(height: 40,),
             SizedBox(width: 50,),
            // ignore: deprecated_member_use
            Text(snapshot.data.documents.elementAt(index)['Tipo'], style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)
          ],),
          Row(children: [
            SizedBox(width: 50,),
            Text('Color:', style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            SizedBox(height: 40,),
             SizedBox(width: 50,),
            // ignore: deprecated_member_use
            Text(snapshot.data.documents.elementAt(index)['Color'], style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
          ],),
           Row(children: [
            SizedBox(width: 50,),
            Text('Placas:', style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            SizedBox(height: 40,),
             SizedBox(width: 50,),
            // ignore: deprecated_member_use
            Text(snapshot.data.documents.elementAt(index)['Placa'], style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),

          ],),
           Row(children: [
            SizedBox(width: 50,),
            Text('NIV:', style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            SizedBox(height: 40,),
             SizedBox(width: 50,),
            // ignore: deprecated_member_use
            Text(snapshot.data.documents.elementAt(index)['Niv'], style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),

          ],
          ),
            
            SizedBox(height: 10,width: 50,),
          Image.asset('assets/nissan.jpg', height: 100,),

                    ],)
                ],
                )
            ),
          ),
        ),
        ],
        
        
        )
        
        ,)
         ),

                ],
              );
            }
          );
        },
      ),
    
      floatingActionButton: buildSpeedDial(), 
    );
    
  }
  
}

class Myclipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height);
    path.quadraticBezierTo(size.width/4, size.height
 - 40, size.width/2, size.height-20);
    path.quadraticBezierTo(3/4*size.width, size.height,
 size.width, size.height-30);
    path.lineTo(size.width, 0);
    

    return path;
  }
  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }



}



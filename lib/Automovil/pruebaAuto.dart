import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:parkingapp/Automovil/Actualizar_Auto_pagues.dart';
class PruebaAuto extends StatefulWidget {
  @override
  _PruebaAutoState createState() => _PruebaAutoState();
}

class _PruebaAutoState extends State<PruebaAuto> {
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
          label: 'Actualizar', 
          labelStyle: 
              TextStyle(fontWeight: FontWeight.w500, color: Colors.white), 
          labelBackgroundColor: Colors.yellow, 
        ), 
        SpeedDialChild( 
          child: Icon(Icons.create, color: Colors.white), 
          backgroundColor: Colors.blue, 
          onTap: () => print('Pressed Write'), 
          label: 'Agregar', 
          labelStyle: 
              TextStyle(fontWeight: FontWeight.w500, color: Colors.white), 
          labelBackgroundColor: Colors.blue, 
        ), 
        SpeedDialChild( 
          child: Icon(Icons.get_app_outlined, color: Colors.white), 
          backgroundColor: Colors.green, 
          onTap: () => print('Pressed Code'), 
          label: 'Eliminar', 
          labelStyle: 
              TextStyle(fontWeight: FontWeight.w500, color: Colors.white), 
          labelBackgroundColor: Colors.purple, 
        ), 
      ], 
    ); 
  } 
  
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(

        // ignore: deprecated_member_use
        stream: Firestore.instance.collection('DatosAuto').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
          return ListView.builder(
            // ignore: deprecated_member_use
            itemCount: snapshot.data.documents.length,
            itemBuilder: (BuildContext context, int index){
              return Stack(
                
                children: <Widget>[
                        ClipPath(
        clipper: Myclipper(),
        child: Container(
          height: 300,
          decoration: BoxDecoration(color: Colors.red),
        )
        ),
                  //Divider(height: 20, color: Colors.red,),



      SingleChildScrollView(
        child: Center(
          child: ConstrainedBox(constraints: BoxConstraints(maxWidth: 900),
          child: Column(crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            
          SizedBox(height: 50,),
          Row(children: [
            SizedBox(width: 50,),
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
            
            SizedBox(height: 45,),
          Image.asset('assets/nissan.jpg', height: 200, width: 200,),

          ],
          
          
          )
          
          ,)
           ),
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
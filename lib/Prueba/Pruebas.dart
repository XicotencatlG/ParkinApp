import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
class Preubas extends StatefulWidget {
  @override
  _PreubasState createState() => _PreubasState();
}

class _PreubasState extends State<Preubas> {
  SpeedDial buildSpeedDial() { 
    return SpeedDial( 
      animatedIcon: AnimatedIcons.menu_close, 
      animatedIconTheme: IconThemeData(size: 28.0), 
      backgroundColor: Colors.green[900], 
      visible: true, 
      curve: Curves.bounceInOut, 
      children: [ 
        SpeedDialChild( 
          child: Icon(Icons.chrome_reader_mode, color: Colors.white), 
          backgroundColor: Colors.green, 
          onTap: () => print('Pressed Read Later'), 
          label: 'Read', 
          labelStyle: 
              TextStyle(fontWeight: FontWeight.w500, color: Colors.white), 
          labelBackgroundColor: Colors.black, 
        ), 
        SpeedDialChild( 
          child: Icon(Icons.create, color: Colors.white), 
          backgroundColor: Colors.green, 
          onTap: () => print('Pressed Write'), 
          label: 'Write', 
          labelStyle: 
              TextStyle(fontWeight: FontWeight.w500, color: Colors.white), 
          labelBackgroundColor: Colors.black, 
        ), 
        SpeedDialChild( 
          child: Icon(Icons.laptop_chromebook, color: Colors.white), 
          backgroundColor: Colors.green, 
          onTap: () => print('Pressed Code'), 
          label: 'Code', 
          labelStyle: 
              TextStyle(fontWeight: FontWeight.w500, color: Colors.white), 
          labelBackgroundColor: Colors.black, 
        ), 
      ], 
    ); 
  } 
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ClipPath(
            clipper: Myclipper(),
            child: Container(
            height: 280,
            decoration: BoxDecoration(
              color: Colors.purple
            ),
            ),
            
          ),
          ClipPath(
            clipper: Myclipper(),
            child: Container(
            height: 260,
            decoration: BoxDecoration(
              
            ),
            ),
            
          ),
          
        ],  
  
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
  /*@override
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
*/
  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }

}
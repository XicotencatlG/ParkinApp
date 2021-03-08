import 'package:flutter/material.dart';
//List of Cards with size 


class LugaresLibres extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body:  Container(
       child: GridView.count(
         scrollDirection: Axis.vertical,
         mainAxisSpacing: 8,
         childAspectRatio: 1.2,
         crossAxisCount: 4,
         
         children: [

           Card(
            
             color: Colors.blueGrey
           ),
           Card(
             color: Colors.blueGrey
           ),
           Card(
             color: Colors.blueGrey
           ),
           Card(
             color: Colors.blueGrey
           ),
           Card(
             color: Colors.blueGrey
           ),
           Card(
             color: Colors.blueGrey
           ),
           Card(
             color: Colors.blueGrey
           ),
           Card(
             color: Colors.blueGrey
           ),
           Card(
             color: Colors.blueGrey
           ),
           Card(
             color: Colors.blueGrey
           ),
           Card(
             color: Colors.blueGrey
           ),
           Card(
             color: Colors.blueGrey
           ),
           Card(
             color: Colors.blueGrey
           ),
           Card(
             color: Colors.blueGrey
           ),
           Card(
             color: Colors.blueGrey
           ),
           Card(
             color: Colors.blueGrey,
           )
         ],
       ),
       
      ),
    );
  }
}

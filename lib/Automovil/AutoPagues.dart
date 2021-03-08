import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:parkingapp/Automovil/Agregar_Auto.dart';
import 'package:parkingapp/Automovil/Update_Auto.dart';
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
            Navigator.push(context, MaterialPageRoute(builder: (context) => AgregarAuto()));
          }, 
          label: 'Agregar', 
          labelStyle: 
              TextStyle(fontWeight: FontWeight.w500, color: Colors.white), 
          labelBackgroundColor: Colors.yellow, 
        ), 
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
          if (!snapshot.hasData) return CircularProgressIndicator();
          return ListView.builder(
            // ignore: deprecated_member_use
            itemCount: snapshot.data.documents.length,
            itemBuilder: (BuildContext context, int index){
              return Stack(
                
                children: <Widget>[


      Center(
        child: ConstrainedBox(constraints: BoxConstraints(maxWidth: 900),
        child: Column(
        children: [
          
        Card(
          
          child: Container(
            
            child: Row(
              
              children: [
      
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                            //SizedBox(height: ),
          Row(children: [
            SizedBox(width: 25,),
            Text('Marca:', style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            SizedBox(height: 40,),
             SizedBox(width: 50,),
            // ignore: deprecated_member_use
            Text(snapshot.data.documents.elementAt(index)['Marca'], style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),

          ],),
           Row(children: [
            SizedBox(width: 25,),
            Text('Tipo:', style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            SizedBox(height: 40,),
             SizedBox(width: 50,),
            // ignore: deprecated_member_use
            Text(snapshot.data.documents.elementAt(index)['Tipo'], style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)
          ],),
          Row(children: [
            SizedBox(width: 25,),
            Text('Color:', style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            SizedBox(height: 40,),
             SizedBox(width: 50,),
            // ignore: deprecated_member_use
            Text(snapshot.data.documents.elementAt(index)['Color'], style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
          ],),
           Row(children: [
            SizedBox(width: 25,),
            Text('Placas:', style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            SizedBox(height: 40,),
             SizedBox(width: 50,),
            // ignore: deprecated_member_use
            Text(snapshot.data.documents.elementAt(index)['Placa'], style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),

          ],),
           Row(children: [
            SizedBox(width: 25,),
            Text('NIV:', style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            SizedBox(height: 40,),
             SizedBox(width: 50,),
            // ignore: deprecated_member_use
            Text(snapshot.data.documents.elementAt(index)['Niv'], style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),

          ],
          ),
              
                                                       Column(
                                                          crossAxisAlignment: CrossAxisAlignment.end,
                                             children: [
                                                 SizedBox( width: 350,),
                                               Row(
                                                 
                                                 children: [
                                                   
           
            IconButton(
            icon: Icon(Icons.edit,color: Colors.red,),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => UpdateAuto()));

            },
            ),
            SizedBox(width: 20,),
                        IconButton(
            icon: Icon(Icons.delete_forever,color: Colors.red,),
            onPressed: (){
                            // ignore: deprecated_member_use
              Firestore.instance.runTransaction((Transaction myTrans)
              async{
             
                // ignore: await_only_futures
                // ignore: deprecated_member_use
                // ignore: await_only_futures
                await myTrans.delete(snapshot.data.documents[index].reference);
              
              }
              );
            },
            ),
          ],),
                                             ],
                                           ),
                  ],),
                

                      
              

                   
              ],
              
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


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:parkingapp/util/sing_in.dart';


class UpdateAuto extends StatefulWidget {
  @override
  _UpdateAutoState createState() => _UpdateAutoState();
}

class _UpdateAutoState extends State<UpdateAuto> {
  @override
    // ignore: override_on_non_overriding_member
    
   
  // ignore: override_on_non_overriding_member
  final _marcaController = TextEditingController();
  final tipoControlle = TextEditingController();
  final colorController = TextEditingController();
  final placaController = TextEditingController();
final nivController = TextEditingController();
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,

    ),
    body: StreamBuilder(
        stream:  FirebaseFirestore.instance.collection(name).snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
          if (!snapshot.hasData){
            return Center(
            
              child: ConstrainedBox(
                 constraints: BoxConstraints(maxWidth: 290),
                
              ),
            );
          }
          return ListView(
            
           children: snapshot.data.docs.map((document){
             return Column(
               crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                                SizedBox(height: 50,),
                                                                        TextField(
                    controller: _marcaController,
                    decoration: InputDecoration(   
                   hintText: document['Marca'],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                                                      TextField(
                    controller: tipoControlle,
                    decoration: InputDecoration(   
                   hintText: document['Tipo'],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                                                      TextField(
                    controller: colorController,
                    decoration: InputDecoration(   
                   hintText: document['Color'],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                                    TextField(
                    controller: placaController,
                    decoration: InputDecoration(   
                   hintText: document['Placa'],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                TextField(
                  controller: nivController,
                    decoration: InputDecoration( 
                      
                   hintText: document['Niv'],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                      ),
                    ),
                  ),

                                                  Row(
                children: [
                  SizedBox(height: 80, width: 90,),
                  // ignore: deprecated_member_use
                  RaisedButton(
                  color: Colors.red,
            child: Text('Actualizar Auto', style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    onPressed: (){
                    Map<String, dynamic> updateA = Map<String,dynamic>();
                    updateA['Marca'] = _marcaController.text;
                    updateA['Tipo'] = tipoControlle.text;
                    updateA['Color'] = colorController.text;
                    updateA['Placa'] = placaController.text;
                    updateA['Niv'] = nivController.text;
                    // ignore: deprecated_member_use
                    Firestore.instance.collection(name).document(document.documentID).updateData(updateA).whenComplete((){});
                    Navigator.pop(context);
                    },),
                ],
              )

              ],
             );
           }).toList(),


          );
        },

      ),
    );
            }
    
        }
      

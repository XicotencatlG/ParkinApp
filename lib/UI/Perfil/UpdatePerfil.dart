
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:parkingapp/util/sing_in.dart';

class UpdatePerfil extends StatefulWidget {
  @override
  _UpdatePerfilState createState() => _UpdatePerfilState();
}
class _UpdatePerfilState extends State<UpdatePerfil> {

  var menuCarreras=[
'Ingeniería  Energía',
'Ingeniería Mecánica Automotriz',
'Ingeniería en Biotecnología',
'Ingeniería Industrial',
'Ing. en Tecnologías de la Información',
'Ingeniería en Mecatrónica',
'Lic en Negocios Internacionales',
'Maestría en Administración'
];
String _vistaC = 'Selecione una Carrera';
final _matriculaController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //centerTitle: true,
        title: Text('Actualizar Perfil'),
        backgroundColor: Colors.red,
      ),
      body:  Stack(
        
        children: [
          SafeArea(
            child: SingleChildScrollView(
              child: Center(
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 330),
                  child: Column(
                     crossAxisAlignment: CrossAxisAlignment.stretch,

                     
                     children: [
                       SizedBox(height: 80,),
                       Text('Carrea', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, ), textAlign: TextAlign.center,),
                                     ListTile(
           
                trailing: DropdownButton(
                  items: menuCarreras.map((String m){
                    return DropdownMenuItem(
                      value: m,
                      child: Text(m)
                    );
                  }).toList(),
                  onChanged: (_value)=>{
                    setState((){
                      _vistaC = _value;
                    })
                  },
                  hint: Text(_vistaC),
                ),

                      ),

                      SizedBox(height: 50, ),
                                        TextField(
                    controller: _matriculaController,
                    decoration: InputDecoration(   
                   hintText: 'Matrcicula',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                      ),
                    ),
                  ),

                                 Row(
                children: [
                  SizedBox(height: 120, width: 80,),
                  // ignore: deprecated_member_use
                  RaisedButton(
                  color: Colors.red,
            child: Text('Agregar Auto', style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    onPressed: (){
                      addPerfil();
                      Navigator.pop(context);
                    },),
                ],
              )
                     ],
                  ),
                ),
              ),
            )),
        ],
    
            
      )
          );
        }
      final databaseReference = Firestore.instance;

void addPerfil(){
  databaseReference.collection('Perfil$name').add(
    {
      'Carrera' : _vistaC,
      'MAtricula': _matriculaController.text,

    }
  ).then((value){
    // ignore: deprecated_member_use
    print(value.documentID);
  });
}

  }
  


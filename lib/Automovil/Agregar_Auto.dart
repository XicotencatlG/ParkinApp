import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:parkingapp/util/sing_in.dart';

class AgregarAuto extends StatefulWidget {
  @override
  _AgregarAutoState createState() => _AgregarAutoState();
}

class _AgregarAutoState extends State<AgregarAuto> {

  var _menuTipo=['Hatchback ','SUV','Deportivos','Furgoneta','Seda','Van','Pick Up','Camioneta'];
  String _vistaTipo = 'Selecione un modelo';


  var _menuMarca =[
    'Nissan','Ford','Toyota','Kia','Honda','Mazda','BMW','Peugeot','Volvo','SEAT','Chrysler','Audi',];
String _vistaMarca = 'Selecione un marca';
  var _color=['Rojo','Negro','Amarrillo','Blanco','Gris'];
String _vistaColor = 'Selecione color';

final placaController = TextEditingController();
final nivController = TextEditingController();
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Actualizar Auto '),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: Stack(
          children: [
        
        SafeArea(
          
          child: SingleChildScrollView(
            child: 
            Center(
              child: 
              ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 290),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  
                  SizedBox(height: 50,),

                                    ListTile(
                    title: Text('Marca', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                    trailing: DropdownButton(
                      items: _menuMarca.map((String b){
                        return DropdownMenuItem(
                          value:b,
                          child: Text(b),);
                      }).toList(),
                        onChanged: (_value)=>{
                          setState((){
                            _vistaMarca = _value;
                          })
                        },
                        hint: Text(_vistaMarca),
                    ),
                  ),


                  
                  ListTile(
                    title: Text('Tipo', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                    trailing: DropdownButton(
                      items: _menuTipo.map((String a ){
                        return DropdownMenuItem(
                          value: a, 
                          child: Text(a),);
                      }).toList(),
                      onChanged: (_value)=>{
                        setState((){
                          _vistaTipo = _value;
                        })
                      },
                      hint: Text(_vistaTipo),
                      
                    ),
                  ),

                     ListTile(
                    title: Text('Color', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                    trailing: DropdownButton(
                      items: _color.map((String a ){
                        return DropdownMenuItem(
                          value: a, 
                          child: Text(a),);
                      }).toList(),
                      onChanged: (_value)=>{
                        setState((){
                          _vistaColor = _value;
                        })
                      },
                      hint: Text(_vistaColor),
                    ),
                  ),

                  TextField(
                    controller: placaController,
                    decoration: InputDecoration(   
                   hintText: 'Placas del automovil',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                TextField(
                  controller: nivController,
                    decoration: InputDecoration(   
                   hintText: 'NIV',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                      ),
                    ),
                  ),

                                Row(
                children: [
                  SizedBox(height: 80, width: 60,),
                  // ignore: deprecated_member_use
                  RaisedButton(
                  color: Colors.red,
            child: Text('Agregar Auto', style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    onPressed: (){
                      add();
                      Navigator.pop(context);
                    },),
                ],
              )
                  
                ],
                ),
              ),
            ),
          )
           ),
      ],
      ),
    );
  }

// ignore: deprecated_member_use
final databaseReference = Firestore.instance;

void add(){
  databaseReference.collection(name).add(
    {
      'Marca' : _vistaMarca,
      'Tipo': _vistaTipo,
      'Color': _vistaColor,
      'Placa': placaController.text,
      'Niv': nivController.text

    }
  ).then((value){
    // ignore: deprecated_member_use
    print(value.documentID);
  });
}





void getData(){
  // ignore: deprecated_member_use
  databaseReference.collection(name).getDocuments().then((QuerySnapshot snapshot){
    // ignore: deprecated_member_use
    snapshot.documents.forEach((f)=>print('${f.data}'));
  });
}
}

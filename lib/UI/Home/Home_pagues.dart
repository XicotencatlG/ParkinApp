import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:parkingapp/ApartadoLugar/ApartadoLugarPagues.dart';
import 'package:parkingapp/Automovil/Automovil_pagues.dart';
import 'package:parkingapp/Prueba/Pruebas.dart';
import 'package:parkingapp/UI/Ayuda/Ayuda_Pagues.dart';
import 'package:parkingapp/UI/Login/Login_pagues.dart';
import 'package:parkingapp/UI/LugarEstacionamiento/Lugar_Estacionamiento_Pagues.dart';
import 'package:parkingapp/UI/Perfil/Perfil_pagues.dart';
import 'package:parkingapp/util/sing_in.dart';
class HomePagues extends StatefulWidget {
  @override
  _HomePaguesState createState() => _HomePaguesState();
}

class _HomePaguesState extends State<HomePagues> {

  int _select = 6;
  _getDrawerItemWidget(int mostrar) {
    switch (mostrar) {
      case 0: 
        return ;
      case 1: 
        return PerfilPagues();
      case 2:
      return AutomovilPague();
      case 3:
      return LugarEstacionamiento();
      case 4: 
      return AyudaPagues();
      case 5:
      return Preubas();
      case 6:
      return AparadoPagues();
    }
  }
   _onSelect(int mostrar) {
    setState(() {
      Navigator.of(context).pop();
      _select = mostrar;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(


appBar: AppBar(backgroundColor: Colors.red, actions: <Widget>[]),
      drawer: Drawer(
        child: ListView(padding: EdgeInsets.zero, children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text(name, style: TextStyle(fontSize: 25),),
            decoration: BoxDecoration(
               image: DecorationImage(image: AssetImage('assets/upvt_portadm.jpg'), fit: BoxFit.cover),
            ),
            accountEmail: Text( email,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w600),
            ),
            currentAccountPicture: GestureDetector(
                child: CircleAvatar(
              backgroundImage: NetworkImage(imageUrl),
             
            )),
          ),
          
          ListTile(
            leading: Icon(Icons.people, color: Colors.red,),
            selected: (0 == _select),
            title: Text('Perfil',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    color: Colors.red)),
            onTap: () {
              _onSelect(1);
            },
          ),
           ListTile(
            leading: Icon(Icons.directions_car_outlined, color: Colors.red,),
            selected: (0 == _select),
            title: Text('Datos Automovil',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    color: Colors.red)),
            onTap: () {
              _onSelect(2);
            },
          ),
          ListTile(
            leading: Icon(Icons.local_parking_rounded, color: Colors.red,),
            selected: (0 == _select),
            title: Text('Lugares Libres',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    color: Colors.red)),
            onTap: () {
              _onSelect(3);
            },
          ),
          ListTile(
            leading: Icon(Icons.directions_car_rounded, color: Colors.red,),
            selected: (0 == _select),
            title: Text('Apartar Lugar',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    color: Colors.red)),
            onTap: () {
              _onSelect(6);
            },
          ),
          ListTile(
            leading: Icon(Icons.help, color: Colors.red,),
            selected: (0 == _select),
            title: Text('Ayuda',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    color: Colors.red)),
            onTap: () {
              _onSelect(4);
            },
          ),
/*
          ListTile(
            leading: Icon(Icons.help, color: Colors.red,),
            selected: (0 == _select),
            title: Text('Ayuda',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    color: Colors.red)),
            onTap: () {
              _onSelect(5);
            },
          ),
          Divider(color: Colors.red),
          SizedBox(
            height: 20,
          ),*/
          
                   /* ListTile(
            leading: Icon(Icons.exit_to_app, color: Colors.red,),
            selected: (0 == _select),
            title: Text(
              'Administrador',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  color: Colors.red),
            ),
            onTap: () {
              
            },
          ),*/
         
          ListTile(
            leading: Icon(Icons.exit_to_app, color: Colors.red,),
            selected: (0 == _select),
            title: Text(
              'Salir',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  color: Colors.red),
            ),
            onTap: () {
              _singOut();
            },
          ),
          
        ]),
      ),
      body: _getDrawerItemWidget(_select),
    );

  }
  void _singOut(){
  FirebaseAuth.instance.signOut();
  // ignore: deprecated_member_use
  runApp(new MaterialApp(home: LoginPagues()));
}
}
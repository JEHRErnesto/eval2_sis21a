import 'package:eval2_sis21a/pages/AcercaDe.dart';
import 'package:eval2_sis21a/pages/Consulta.dart';
import 'package:eval2_sis21a/pages/Registrar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class home extends StatefulWidget {
  @override
  State<home> createState() => homeState();
}

class homeState extends State<home> {
  int ItemDrawer = 0;

  _getDrawerItem(int position) {
    switch (position) {
      case 0:
        return AcercaDe();
      case 1:
        return Registro();
      case 2:
        return Consulta();
    }
  }

  void _onSelectItemDrawer(int pos) {
    Navigator.pop(context);
    setState(() {
      ItemDrawer = pos;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('EVALUACIÓN 2'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.purple,
              ),
              child: Center(
                child: Text(
                  'MENÚ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
            ),
            Divider(color: Colors.red),
            ListTile(
              leading: Icon(Icons.account_box_outlined),
              title: Text('Acerca de nosotros'),
              onTap: () {
                _onSelectItemDrawer(0);
              },
            ),
            ListTile(
                leading: Icon(Icons.account_circle),
                title: Text('Registrar'),
                onTap: () {
                  _onSelectItemDrawer(1);
                }),
            ListTile(
                leading: Icon(Icons.construction),
                title: Text('Consultar'),
                onTap: () {
                  _onSelectItemDrawer(2);
                }),
            Divider(color: Colors.red),
            ListTile(
                leading: Icon(Icons.close),
                title: Text('Cerrar sesión'),
                onTap: () {
                  FirebaseAuth.instance.signOut();
                  Navigator.pushNamed(context, "/login");
                }),
          ],
        ),
      ),
      body: _getDrawerItem(ItemDrawer),
    );
  }
}

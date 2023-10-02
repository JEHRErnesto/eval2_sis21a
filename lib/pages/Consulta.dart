import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Consulta extends StatefulWidget {
  @override
  State<Consulta> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Consulta> {
  
  void getProductos() async {
    CollectionReference collectionReference =
    FirebaseFirestore.instance.collection("tb_productos");
    QuerySnapshot mensaje = await collectionReference.get();
    if (mensaje.docs.length != 0){
      for (var doc in mensaje.docs){
        print(doc.data());
      }
    }
  }

  Future<List> getMensajes() async {
    List chats = [];
    CollectionReference collectionReference =
    FirebaseFirestore.instance.collection("tb_productos");
    QuerySnapshot mensaje = await collectionReference.get();
    if (mensaje.docs.length != 0){
      for (var doc in mensaje.docs){
        print(doc.data());
        chats.add(doc.data());
      }
    }
    return chats;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Consultar Datos'),
      ),
      body: FutureBuilder(
        future: getMensajes(),
        builder: ((context, snapshot){
          if(snapshot.hasData){
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: ((context, index){
                return Text(snapshot.data?[index]["idproducto"] +"-"+
                snapshot.data?[index]["nombre"] +"-"+ snapshot.data?[index]["precio"] +"-"+
                snapshot.data?[index]["stock"]);
              })
              );
          }else{
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getProductos,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
        ),
    );
    }
    @override
    void initState(){
      super.initState();
      getProductos();
    }
    @override
    void dispose(){
      super.dispose();
    }
}
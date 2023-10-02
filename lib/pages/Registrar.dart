import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Registro extends StatelessWidget{

Future<void> agregarProducto(String idproducto, String nombre, String precio, String stock) async{
  await FirebaseFirestore.instance.collection('tb_productos').add({"idproducto": idproducto, "nombre": nombre, "precio": precio, "stock": stock});
}

TextEditingController IdController = TextEditingController();
TextEditingController NombreController = TextEditingController();
TextEditingController PrecioController = TextEditingController();
TextEditingController StockController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 15),
              const Text('Registro de productos',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold
              ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: IdController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[200],
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset('img/insignia.png',
                    width: 5,
                    height: 5,),
                  ),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  labelText: 'ID',
                  hintText: 'Ingrese el ID del producto'
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: NombreController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[200],
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset('img/productos.png',
                    width: 5,
                    height: 5,),
                  ),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  labelText: 'Nombre',
                  hintText: 'Ingrese el nombre del producto'
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: PrecioController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[200],
                  prefixIcon: const Icon(Icons.attach_money),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  labelText: 'Precio',
                  hintText: 'Ingrese el precio del producto'
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: StockController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[200],
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset('img/stock.png',
                    width: 5,
                    height: 5,),
                  ),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  labelText: 'Stock',
                  hintText: 'Ingrese el stock del producto'
                ),
              ),
              const SizedBox(height: 15),

              ElevatedButton(onPressed: () async{
                await agregarProducto(IdController.text, NombreController.text, PrecioController.text, StockController.text).then((_){
                  Registro();

                IdController.clear();
                NombreController.clear();
                PrecioController.clear();
                StockController.clear();
                });
              },
              child: const Text('Guardar'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
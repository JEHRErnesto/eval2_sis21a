import 'package:flutter/material.dart';

class AcercaDe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Image.asset(
                    'img/keira.jpg',
                    height: 150,
                    width: 150,
                  ),
                  const Text(
                    'KEIRA YARETHZY BELTRAN FLORES',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Colors.purple),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Image.asset(
                    'img/adelayda.jpg',
                    height: 150,
                    width: 150,
                  ),
                  const Text(
                    'ADELAYDA DESIRE',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Color.fromARGB(255, 47, 27, 136)),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

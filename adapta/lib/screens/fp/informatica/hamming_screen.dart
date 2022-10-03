import 'package:flutter/material.dart';

class HammingScreen extends StatelessWidget {
  const HammingScreen({super.key});

  static const String route = 'hamming';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Código Hamming"),
        backgroundColor: Colors.green,
      ),
      body: const Center(
        child: Text('Ejercicio'),
      ),
    );
  }
}

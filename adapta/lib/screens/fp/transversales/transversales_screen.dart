import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

import 'package:adapta/screens/screens.dart';

class TransversalesScreen extends StatelessWidget {
  TransversalesScreen({super.key});

  static const String route = 'transversales';

  final Set<Map<String, dynamic>> ejercicios = {
    {
      "titulo": "Código Hamming",
      "ruta": PrestacionDesempleoScreen.route,
      "img": "assets/img/transversales/desempleo.png",
    },
    {
      "titulo": "Ejercicio Binario",
      "ruta": PrestacionDesempleoScreen.route,
      "img": "",
    },
    {
      "titulo": "Ejercicio Binario 2",
      "ruta": PrestacionDesempleoScreen.route,
      "img": "",
    },
    {
      "titulo": "Ejercicio Binario 3",
      "ruta": PrestacionDesempleoScreen.route,
      "img": "",
    },
  };

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Módulos Transversales"),
        backgroundColor: Colors.green,
      ),
      body: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return tarjetaEjercicio(
            context: context,
            route: ejercicios.elementAt(index)['ruta'],
            titulo: ejercicios.elementAt(index)['titulo'],
            img: ejercicios.elementAt(index)['img'],
          );
        },
        itemCount: ejercicios.length,
        itemWidth: size.width * 0.6,
        itemHeight: size.height * 0.6,
        //pagination: const SwiperPagination(),
        //control: const SwiperControl(),
        layout: SwiperLayout.STACK,
      ),
    );
  }

  GestureDetector tarjetaEjercicio({
    required BuildContext context,
    required String route,
    required String titulo,
    required String img,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          route,
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(15),
          gradient: const LinearGradient(
            colors: [Colors.green, Color.fromARGB(255, 130, 175, 132)],
            stops: [0, 1],
            begin: FractionalOffset.topCenter,
            end: FractionalOffset.bottomCenter,
          ),
          boxShadow: const [
            BoxShadow(
              color: Colors.black,
              offset: Offset(0.0, 20.0),
              blurRadius: 20.0,
            ),
          ],
        ),
        child: img == ''
            ? Center(
                child: Text(
                  titulo,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 55,
                    color: Color.fromARGB(255, 65, 65, 65),
                  ),
                ),
              )
            : ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: FittedBox(
                  fit: BoxFit.fill,
                  child: Image.asset(img.toString()),
                ),
              ),
      ),
    );
  }
}

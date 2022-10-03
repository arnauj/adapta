import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

import 'package:adapta/screens/screens.dart';

class InformaticaScreen extends StatelessWidget {
  const InformaticaScreen({super.key});

  static const String route = 'informatica';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text("Informática y Comunicaciones"),
        backgroundColor: Colors.green,
      ),
      body: Swiper(
        itemBuilder: (BuildContext context, int index) {
          /*
          return FadeInImage(
            image: NetworkImage("https://via.placeholder.com/300x400"),
            placeholder: NetworkImage("https://via.placeholder.com/300x400"),
          );*/

          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context,
                HammingScreen.route,
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
              child: const Center(
                child: Text(
                  "Código Hamming",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 55,
                    color: Color.fromARGB(255, 65, 65, 65),
                  ),
                ),
              ),
            ),
          );
        },
        itemCount: 10,
        itemWidth: size.width * 0.6,
        itemHeight: size.height * 0.6,
        //pagination: const SwiperPagination(),
        //control: const SwiperControl(),
        layout: SwiperLayout.STACK,
      ),
    );
  }
}

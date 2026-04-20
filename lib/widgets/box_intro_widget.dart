import 'package:flutter/material.dart';

import 'package:wave/config.dart';
import 'package:wave/wave.dart';

// ignore: must_be_immutable
class BoxIntroWidget extends StatelessWidget {
  String texto;

  IconData icon;

  Color color;

  Function onTap;

  BoxIntroWidget({
    Key? key,
    required this.texto,
    required this.icon,
    required this.color,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Card(
        elevation: 5,
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(5),
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(4),
                  bottomRight: Radius.circular(4),
                ),
                child: WaveWidget(
                  config: CustomConfig(
                    colors: [
                      Colors.blue[400]!,
                      Colors.blue[300]!,
                      Colors.blue[200]!,
                      Colors.blue[100]!
                    ],
                    durations: [18000, 8000, 5000, 12000],
                    heightPercentages: [0.65, 0.66, 0.68, 0.70],
                  ),
                  size: const Size(double.infinity, double.infinity),
                  waveAmplitude: 0,
                ),
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: FittedBox(
                    fit: BoxFit.cover,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        texto,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: MediaQuery.of(context).size.width * 0.02,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  alignment: Alignment.center,
                  child: Icon(
                    icon,
                    color: Colors.white,
                    size: MediaQuery.of(context).size.width / 14,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

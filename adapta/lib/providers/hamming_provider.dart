import 'package:flutter/material.dart';

class Hamming with ChangeNotifier {
  bool _paridadPar = true;

  int _bitpar1 = 0;
  int _bitpar2 = 0;
  int _bitpar4 = 0;

  int _bit1 = 0;
  int _bit2 = 0;
  int _bit3 = 0;
  int _bit4 = 0;
  int _bit5 = 0;
  int _bit6 = 0;
  int _bit7 = 0;

  int _nulo = 0;

  Color _fondoBit = Colors.white;

  int get bitpar1 {
    return _bitpar1;
  }

  int get bitpar2 {
    return _bitpar2;
  }

  int get bitpar4 {
    return _bitpar4;
  }

  int get bit1 {
    return _bit1;
  }

  int get bit2 {
    return _bit2;
  }

  int get bit3 {
    return _bit3;
  }

  int get bit4 {
    return _bit4;
  }

  int get bit5 {
    return _bit5;
  }

  int get bit6 {
    return _bit6;
  }

  int get bit7 {
    return _bit7;
  }

  int get nulo {
    return _nulo;
  }

  Color get fondoBit {
    return _fondoBit;
  }

  bool get paridadPar {
    return _paridadPar;
  }

  set bitpar1(int bitpar1) {
    _bitpar1 = bitpar1;
    notifyListeners();
  }

  set bitpar2(int bitpar2) {
    _bitpar2 = bitpar2;
    notifyListeners();
  }

  set bitpar4(int bitpar4) {
    _bitpar4 = bitpar4;
    notifyListeners();
  }

  set bit1(int bit1) {
    _bit1 = bit1;
    notifyListeners();
  }

  set bit2(int bit2) {
    _bit2 = bit2;
    notifyListeners();
  }

  set bit3(int bit3) {
    _bit3 = bit3;
    notifyListeners();
  }

  set bit4(int bit4) {
    _bit4 = bit4;
    notifyListeners();
  }

  set bit5(int bit5) {
    _bit5 = bit5;
    notifyListeners();
  }

  set bit6(int bit6) {
    _bit6 = bit6;
    notifyListeners();
  }

  set bit7(int bit7) {
    _bit7 = bit7;
    notifyListeners();
  }

  set nulo(int nulo) {
    _nulo = nulo;
    notifyListeners();
  }

  set fondoBit(Color newColor) {
    _fondoBit = newColor;
    notifyListeners();
  }

  set paridadPar(bool nuevaParidad) {
    _paridadPar = nuevaParidad;
    notifyListeners();
  }

  void cambiarParidad() {
    _paridadPar = !_paridadPar;

    cambiar(50);
    notifyListeners();
  }

  void cambiar(int nuevo_digito) {
    if (nuevo_digito == 1) {
      bit1 = bit1 == 1 ? 0 : 1;
    }
    if (nuevo_digito == 2) {
      bit2 = bit2 == 1 ? 0 : 1;
    }
    if (nuevo_digito == 3) {
      bit3 = bit3 == 1 ? 0 : 1;
    }
    if (nuevo_digito == 4) {
      bit4 = bit4 == 1 ? 0 : 1;
    }
    if (nuevo_digito == 5) {
      bit5 = bit5 == 1 ? 0 : 1;
    }
    if (nuevo_digito == 6) {
      bit6 = bit6 == 1 ? 0 : 1;
    }
    if (nuevo_digito == 7) {
      bit7 = bit7 == 1 ? 0 : 1;
    }

    bitpar1 = obtener(10);

    bitpar2 = obtener(20);

    bitpar4 = obtener(40);

    fondoBit = Colors.green;
    if (bit1 != bitpar1) fondoBit = Colors.red;
    if (bit2 != bitpar2) fondoBit = Colors.red;
    if (bit4 != bitpar4) fondoBit = Colors.red;

    print("Cambio colorrrr a ${fondoBit.toString()}");
    print("bit1 : ${bit1.toString()} - bitpar1 : ${bitpar1.toString()}");
    print("bit2 : ${bit2.toString()} - bitpar2 : ${bitpar2.toString()}");
    print("bit4 : ${bit4.toString()} - bitpar4 : ${bitpar4.toString()}");

    notifyListeners();
  }

  int obtener(int digito) {
    int devolver = 0;

    if (digito == 1) devolver = bit1;
    if (digito == 2) devolver = bit2;
    if (digito == 3) devolver = bit3;
    if (digito == 4) devolver = bit4;
    if (digito == 5) devolver = bit5;
    if (digito == 6) devolver = bit6;
    if (digito == 7) devolver = bit7;

    int bitParidadImpar = _paridadPar ? 1 : 0;

    if (digito == 10) {
      devolver = (bit3 + bit5 + bit7 + bitParidadImpar) % 2 == 0 ? 1 : 0;
    }
    if (digito == 20) {
      devolver = (bit3 + bit6 + bit7 + bitParidadImpar) % 2 == 0 ? 1 : 0;
    }
    if (digito == 40) {
      devolver = (bit5 + bit6 + bit7 + bitParidadImpar) % 2 == 0 ? 1 : 0;
    }

    return devolver;
  }

  String valores() {
    return "bitpar1: ${bitpar1}, bitpar2: ${bitpar2}, bitpar4: ${bitpar4},bit1: ${bit1},bit2: ${bit2}, bit3: ${bit3}, bit4: ${bit4}, bit5: ${bit5}, bit6: ${bit6}, bit7: ${bit7} ";
  }
}

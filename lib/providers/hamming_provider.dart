import 'package:flutter/material.dart';

class Hamming with ChangeNotifier {
  bool _paridadPar = true;
  bool _hamming74 = true;

  int _bitpar1 = 0;
  int _bitpar2 = 0;
  int _bitpar4 = 0;
  int _bitpar8 = 0;

  int _bit1 = 0;
  int _bit2 = 0;
  int _bit3 = 0;
  int _bit4 = 0;
  int _bit5 = 0;
  int _bit6 = 0;
  int _bit7 = 0;
  int _bit8 = 0;
  int _bit9 = 0;
  int _bit10 = 0;
  int _bit11 = 0;
  int _bit12 = 0;
  int _bit13 = 0;
  int _bit14 = 0;
  int _bit15 = 0;

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

  int get bitpar8 {
    return _bitpar8;
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

  int get bit8 {
    return _bit8;
  }

  int get bit9 {
    return _bit9;
  }

  int get bit10 {
    return _bit10;
  }

  int get bit11 {
    return _bit11;
  }

  int get bit12 {
    return _bit12;
  }

  int get bit13 {
    return _bit13;
  }

  int get bit14 {
    return _bit14;
  }

  int get bit15 {
    return _bit15;
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

  bool get hamming74 {
    return _hamming74;
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

  set bitpar8(int bitpar8) {
    _bitpar8 = bitpar8;
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

  set bit8(int bit8) {
    _bit8 = bit8;
    notifyListeners();
  }

  set bit9(int bit9) {
    _bit9 = bit9;
    notifyListeners();
  }

  set bit10(int bit10) {
    _bit10 = bit10;
    notifyListeners();
  }

  set bit11(int bit11) {
    _bit11 = bit11;
    notifyListeners();
  }

  set bit12(int bit12) {
    _bit12 = bit12;
    notifyListeners();
  }

  set bit13(int bit13) {
    _bit13 = bit13;
    notifyListeners();
  }

  set bit14(int bit14) {
    _bit14 = bit14;
    notifyListeners();
  }

  set bit15(int bit15) {
    _bit15 = bit15;
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

  set hamming74(bool nuevo) {
    _hamming74 = nuevo;
    notifyListeners();
  }

  void cambiarParidad() {
    _paridadPar = !_paridadPar;

    notifyListeners();
  }

  void cambiarHamming74() {
    _hamming74 = !_hamming74;

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

    if (nuevo_digito == 8) {
      bit8 = bit8 == 1 ? 0 : 1;
    }
    if (nuevo_digito == 9) {
      bit9 = bit9 == 1 ? 0 : 1;
    }
    if (nuevo_digito == 10) {
      bit10 = bit10 == 1 ? 0 : 1;
    }
    if (nuevo_digito == 11) {
      bit11 = bit11 == 1 ? 0 : 1;
    }
    if (nuevo_digito == 12) {
      bit12 = bit12 == 1 ? 0 : 1;
    }
    if (nuevo_digito == 13) {
      bit13 = bit13 == 1 ? 0 : 1;
    }
    if (nuevo_digito == 14) {
      bit14 = bit14 == 1 ? 0 : 1;
    }
    if (nuevo_digito == 15) {
      bit15 = bit15 == 1 ? 0 : 1;
    }

    bitpar1 = obtener(100);
    bitpar2 = obtener(200);
    bitpar4 = obtener(400);
    bitpar8 = obtener(800);

    fondoBit = Colors.green;
    if (bit1 != bitpar1) fondoBit = Colors.red;
    if (bit2 != bitpar2) fondoBit = Colors.red;
    if (bit4 != bitpar4) fondoBit = Colors.red;
    if (bit8 != bitpar8 && !_hamming74) fondoBit = Colors.red;

    print("Cambio colorrrr a ${fondoBit.toString()}");
    print("bit1 : ${bit1.toString()} - bitpar1 : ${bitpar1.toString()}");
    print("bit2 : ${bit2.toString()} - bitpar2 : ${bitpar2.toString()}");
    print("bit4 : ${bit4.toString()} - bitpar4 : ${bitpar4.toString()}");
    print("bit8 : ${bit8.toString()} - bitpar8 : ${bitpar8.toString()}");

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
    if (digito == 8) devolver = bit8;
    if (digito == 9) devolver = bit9;
    if (digito == 10) devolver = bit10;
    if (digito == 11) devolver = bit11;
    if (digito == 12) devolver = bit12;
    if (digito == 13) devolver = bit13;
    if (digito == 14) devolver = bit14;
    if (digito == 15) devolver = bit15;

    int bitParidadImpar = _paridadPar ? 1 : 0;

    if (_hamming74) {
      if (digito == 100) {
        devolver = (bit3 + bit5 + bit7 + bitParidadImpar) % 2 == 0 ? 1 : 0;
      }
      if (digito == 200) {
        devolver = (bit3 + bit6 + bit7 + bitParidadImpar) % 2 == 0 ? 1 : 0;
      }
      if (digito == 400) {
        devolver = (bit5 + bit6 + bit7 + bitParidadImpar) % 2 == 0 ? 1 : 0;
      }
    } else {
      if (digito == 100) {
        devolver = (bit3 +
                        bit5 +
                        bit7 +
                        bit9 +
                        bit10 +
                        bit11 +
                        bit12 +
                        bit13 +
                        bit14 +
                        bit15 +
                        bitParidadImpar) %
                    2 ==
                0
            ? 1
            : 0;
      }
      if (digito == 200) {
        devolver = (bit3 +
                        bit6 +
                        bit7 +
                        bit9 +
                        bit10 +
                        bit11 +
                        bit12 +
                        bit13 +
                        bit14 +
                        bit15 +
                        bitParidadImpar) %
                    2 ==
                0
            ? 1
            : 0;
      }
      if (digito == 400) {
        devolver = (bit5 +
                        bit6 +
                        bit7 +
                        bit9 +
                        bit10 +
                        bit11 +
                        bit12 +
                        bit13 +
                        bit14 +
                        bit15 +
                        bitParidadImpar) %
                    2 ==
                0
            ? 1
            : 0;
      }
      if (digito == 800) {
        devolver = (bit5 +
                        bit6 +
                        bit7 +
                        bit9 +
                        bit10 +
                        bit11 +
                        bit12 +
                        bit13 +
                        bit14 +
                        bit15 +
                        bitParidadImpar) %
                    2 ==
                0
            ? 1
            : 0;
      }
    }

    return devolver;
  }

  String valores() {
    return "bitpar1: ${bitpar1}, bitpar2: ${bitpar2}, bitpar4: ${bitpar4},bit1: ${bit1},bit2: ${bit2}, bit3: ${bit3}, bit4: ${bit4}, bit5: ${bit5}, bit6: ${bit6}, bit7: ${bit7} ";
  }
}

import 'package:flutter/material.dart';

class PainterProvider with ChangeNotifier {
  bool _isEditorActive = false;

  bool get isEditorActive {
    return _isEditorActive;
  }

  set isEditorActive(bool isEditorActive) {
    _isEditorActive = isEditorActive;
    notifyListeners();
  }

  bool activarPainter() {
    _isEditorActive = true;
    notifyListeners();

    return _isEditorActive;
  }

  bool desactivarPainter() {
    _isEditorActive = false;
    notifyListeners();

    return _isEditorActive;
  }
}

// ignore_for_file: depend_on_referenced_packages

import 'dart:math';
import 'dart:typed_data';

import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

import 'package:provider/provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:scribble/scribble.dart';

import 'package:adapta/models/models.dart';
import 'package:adapta/providers/providers.dart';
import 'package:adapta/theme/app_theme.dart';

// ignore: must_be_immutable

class PainterWidget extends StatefulWidget {
  final ScreenshotController screenshotController;

  const PainterWidget({
    Key? key,
    required this.screenshotController,
  }) : super(key: key);

  @override
  State<PainterWidget> createState() => _PainterWidgetState();
}

class _PainterWidgetState extends State<PainterWidget> {
  late AnimationController menuAnimation;

  ScribbleNotifier notifier = ScribbleNotifier();
  bool openEditor = true;

  late double iconWidth = 0.0;

  IconData lastTapped = Icons.notifications;

  @override
  Widget build(BuildContext context) {
    bool isEditorActive = context.watch<PainterProvider>().isEditorActive;
    ScrollController scrollController = ScrollController();

    iconWidth = MenuOption.widthFloatinActionButton(context);

    final List<Function> menuElements = <Function>[
      _buildClosePainter,
      _buildUndoButton,
      _buildRedoButton,
      _buildClearButton,
      _buildPointerModeSwitcher,
      _buildSaveImage,
      _buildEraserButton,
      _buildColorButton,
      _buildColorButton,
      _buildColorButton,
      _buildColorButton,
      _buildColorButton,
      _buildColorPicker,
      _buildStrokeButton,
      _buildCollapseMenu,
    ];

    final Map<int, Map<String, dynamic>> argsMenu = {
      0: {"context": context},
      1: {},
      2: {},
      3: {},
      4: {},
      5: {"context": context},
      6: {},
      7: {"color": Colors.black},
      8: {"color": Colors.red},
      9: {"color": Colors.green},
      10: {"color": Colors.blue},
      11: {"color": Colors.yellow},
      12: {"iconWidth": iconWidth},
      13: {"iconWidth": iconWidth},
      14: {"scrollController": scrollController}
    };

    return Visibility(
      visible: isEditorActive,
      child: Stack(
        children: [
          Scribble(
            notifier: notifier,
            drawPen: true,
          ),
          StateNotifierBuilder<ScribbleState>(
            stateNotifier: notifier,
            builder: (context, state, _) => SingleChildScrollView(
              controller: scrollController,
              child: Padding(
                padding: const EdgeInsets.only(left: 5, top: 5),
                child: SizedBox(
                  height: (iconWidth + 12) * argsMenu.length,
                  width: iconWidth + 2,
                  child: Stack(
                    // ignore: avoid_function_literals_in_foreach_calls
                    children: argsMenu.entries
                        .map(
                          (e) => _elementFlow(
                            e.key.toDouble(),
                            menuElements[e.key](
                              state: state,
                              args: e.value,
                            ),
                            argsMenu.length,
                          ),
                        )
                        .toList(),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _elementFlow(double index, Widget interno, int totalElements) {
    return AnimatedPositioned(
      top: openEditor ? (iconWidth + 5) * index : 0.0,
      duration: const Duration(milliseconds: 500),
      left: 0.0,
      curve: Curves.fastOutSlowIn,
      child: SizedBox(
        width: iconWidth,
        height: iconWidth,
        child: interno,
      ),
    );
  }

  Future<bool> delayedHide() async {
    await Future.delayed(const Duration(seconds: 2));
    return false;
  }

  Future<void> _saveImage(BuildContext context) async {
    widget.screenshotController
        .capture(delay: const Duration(milliseconds: 10))
        .then((capturedImage) async {
      showCapturedWidget(context, capturedImage!);

      _saved(capturedImage);
    }).catchError((onError) {
      // ignore: avoid_print
      print(onError);
    });
  }

  _saved(Uint8List image) async {
    //final result = await ImageGallerySaver.saveImage(image);
  }

  Future<dynamic> showCapturedWidget(
      BuildContext context, Uint8List capturedImage) {
    return showDialog(
      useSafeArea: false,
      context: context,
      builder: (context) => Scaffold(
        appBar: AppBar(
          title: const Text("Imagen guardada en galería"),
        ),
        body: Center(child: Image.memory(capturedImage)),
      ),
    );
  }

  Widget _buildStrokeButton({
    required ScribbleState state,
    required Map<String, dynamic> args,
  }) {
    final double iconWidth = args['iconWidth'];

    //double size = 1;

    return _StrokeButton(
      iconWidth: iconWidth,
      notifier: notifier,
      state: state,
    );
  }

  Widget _buildSaveImage({
    required ScribbleState state,
    required Map<String, dynamic> args,
  }) {
    BuildContext context = args['context'];

    return FloatingActionButton(
      onPressed: () => _saveImage(context),
      tooltip: "Guardar imagen",
      child: const AnimatedSwitcher(
        duration: kThemeAnimationDuration,
        child: Icon(
          Icons.save,
          key: ValueKey(true),
        ),
      ),
    );
  }

  Widget _buildPointerModeSwitcher({
    required ScribbleState state,
    required Map<String, dynamic> args,
  }) {
    bool penOnly = state.allowedPointersMode == ScribblePointerMode.penOnly;
    return FloatingActionButton(
      onPressed: () => notifier.setAllowedPointersMode(
        penOnly ? ScribblePointerMode.all : ScribblePointerMode.penOnly,
      ),
      tooltip:
          "Cambiar modo de escritura a ${penOnly ? "con el dedo" : "con pen"}",
      child: AnimatedSwitcher(
        duration: kThemeAnimationDuration,
        child: !penOnly
            ? const Icon(
                Icons.touch_app,
                key: ValueKey(true),
              )
            : const Icon(
                Icons.do_not_touch,
                key: ValueKey(false),
              ),
      ),
    );
  }

  Widget _buildEraserButton({
    required ScribbleState state,
    required Map<String, dynamic> args,
  }) {
    bool isSelected = state is Erasing;
    return FloatingActionButton(
      tooltip: "Borrar",
      backgroundColor: const Color(0xFFF7FBFF),
      elevation: isSelected ? 10 : 2,
      shape: !isSelected
          ? const CircleBorder()
          : const CircleBorder(
              side: BorderSide(
                width: 5,
                color: Colors.grey,
              ),
            ),
      onPressed: notifier.setEraser,
      child:
          const Icon(Icons.cleaning_services_outlined, color: Colors.blueGrey),
    );
  }

  Widget _buildColorButton({
    required ScribbleState state,
    required Map<String, dynamic> args,
  }) {
    final Color color = args['color'];

    final isSelected = state is Drawing && state.selectedColor == color.value;

    return FloatingActionButton(
      backgroundColor: color,
      elevation: isSelected ? 10 : 2,
      shape: !isSelected
          ? const CircleBorder()
          : const CircleBorder(
              side: BorderSide(
                width: 5,
                color: Colors.grey,
              ),
            ),
      child: Container(),
      onPressed: () => notifier.setColor(color),
    );
  }

  Widget _buildColorPicker({
    required ScribbleState state,
    required Map<String, dynamic> args,
  }) {
    bool isSelected(Color pickerColor) {
      return state is Drawing && state.selectedColor == pickerColor.value;
    }

    return _ColorPicker(
      isSelected: isSelected,
      notifier: notifier,
      iconWidth: args['iconWidth'],
    );
  }

  Widget _buildUndoButton({
    required ScribbleState state,
    required Map<String, dynamic> args,
  }) {
    return FloatingActionButton(
      tooltip: "Deshacer",
      onPressed: notifier.canUndo ? notifier.undo : null,
      disabledElevation: 0,
      backgroundColor: notifier.canUndo ? Colors.blueGrey : Colors.grey,
      child: const Icon(
        Icons.undo_rounded,
        color: Colors.white,
      ),
    );
  }

  Widget _buildRedoButton({
    required ScribbleState state,
    required Map<String, dynamic> args,
  }) {
    return FloatingActionButton(
      tooltip: "Rehacer",
      onPressed: notifier.canRedo ? notifier.redo : null,
      disabledElevation: 0,
      backgroundColor: notifier.canRedo ? Colors.blueGrey : Colors.grey,
      child: const Icon(
        Icons.redo_rounded,
        color: Colors.white,
      ),
    );
  }

  Widget _buildClearButton({
    required ScribbleState state,
    required Map<String, dynamic> args,
  }) {
    return FloatingActionButton(
      tooltip: "Limpiar",
      onPressed: notifier.clear,
      disabledElevation: 0,
      backgroundColor: Colors.blueGrey,
      child: const Icon(Icons.delete),
    );
  }

  Widget _buildCollapseMenu({
    required ScribbleState state,
    required Map<String, dynamic> args,
  }) {
    final ScrollController scrollController = args['scrollController'];

    return FloatingActionButton(
      tooltip: "Abrir menú",
      onPressed: () {
        scrollController.animateTo(
            //go to top of scroll
            0, //scroll offset to go
            duration: const Duration(milliseconds: 500), //duration of scroll
            curve: Curves.fastOutSlowIn //scroll type
            );

        openEditor = openEditor ? false : true;

        //print(openEditor.toString() + '<<<<<<<<<<<');
        setState(() {});
      },
      disabledElevation: 0,
      backgroundColor: AppTheme.primary,
      child: const Icon(
        Icons.menu,
        color: Colors.white,
      ),
    );
  }

  Widget _buildClosePainter({
    required ScribbleState state,
    required Map<String, dynamic> args,
  }) {
    BuildContext context = args['context'];

    return FloatingActionButton(
      tooltip: "Cerrar Painter",
      onPressed: () {
        Provider.of<PainterProvider>(context, listen: false)
            .desactivarPainter();
      },
      disabledElevation: 0,
      backgroundColor: Colors.red,
      child: const Icon(
        Icons.close,
        color: Colors.white,
      ),
    );
  }
}

// ignore: must_be_immutable
class _ColorPicker extends StatefulWidget {
  final ScribbleNotifier notifier;
  Function isSelected;
  double iconWidth;

  _ColorPicker({
    Key? key,
    required this.isSelected,
    required this.notifier,
    required this.iconWidth,
  }) : super(key: key);

  @override
  State<_ColorPicker> createState() => _ColorPickerState();
}

class _ColorPickerState extends State<_ColorPicker> {
  Color pickerColor = const Color(0xff443a49);
  Color currentColor = const Color(0xff443a49);
  int cargados = 0;

  void changeColor(Color newColor) {
    pickerColor = newColor;

    widget.notifier.setColor(newColor);

    cargados++;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    bool isSelected = widget.isSelected(pickerColor);

    return FloatingActionButton(
      backgroundColor: pickerColor,
      elevation: isSelected ? 10 : 2,
      shape: !isSelected
          ? const CircleBorder()
          : const CircleBorder(
              side: BorderSide(
                width: 5,
                color: Colors.grey,
              ),
            ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          gradient: const SweepGradient(
            center: FractionalOffset.center,
            startAngle: 0.0,
            endAngle: pi * 2,
            colors: <Color>[
              Colors.blue, // blue
              Colors.green, // green
              Colors.yellow, // yellow
              Colors.red, // red
              Colors.blue, // blue again to seamlessly transition to the start
            ],
            stops: <double>[0.0, 0.25, 0.5, 0.75, 1.0],
          ),
        ),
        child: SizedBox(
          width: widget.iconWidth - 30,
          height: widget.iconWidth - 30,
        ),
      ),
      onPressed: () {
        showDialog(
          builder: (context) => AlertDialog(
            title: const Text('Selecciona un color'),
            content: SingleChildScrollView(
              child: ColorPicker(
                pickerColor: pickerColor,
                onColorChanged: changeColor,
              ),
              // Use Material color picker:
              //
              // child: MaterialPicker(
              //   pickerColor: pickerColor,
              //   onColorChanged: changeColor,
              //   showLabel: true, // only on portrait mode
              // ),
              //
              // Use Block color picker:
              //
              // child: BlockPicker(
              //   pickerColor: currentColor,
              //   onColorChanged: changeColor,
              // ),
              //
              // child: MultipleChoiceBlockPicker(
              //   pickerColors: currentColors,
              //   onColorsChanged: changeColors,
              // ),
            ),
            actions: <Widget>[
              ElevatedButton(
                child: const Text('Seleccionar'),
                onPressed: () {
                  changeColor(pickerColor);
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
          context: context,
        );

        //changeColor(widget.colorBox);
      },
    );
  }
}

class _StrokeButton extends StatefulWidget {
  const _StrokeButton({
    Key? key,
    required this.iconWidth,
    required this.notifier,
    required this.state,
  }) : super(key: key);

  final double iconWidth;
  final ScribbleNotifier notifier;
  final ScribbleState state;

  @override
  State<_StrokeButton> createState() => _StrokeButtonState();
}

class _StrokeButtonState extends State<_StrokeButton> {
  GlobalKey keyBuildStroke = GlobalKey();

  double size = 14.0;

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (details) {
        RenderBox box =
            keyBuildStroke.currentContext!.findRenderObject() as RenderBox;
        Offset position = box.localToGlobal(Offset.zero);

        double centroX = position.dx + widget.iconWidth / 2;
        double centroY = position.dy + widget.iconWidth / 2;

        double strokeWidth = sqrt(pow(details.position.dx - centroX, 2) +
            pow(details.position.dy - centroY, 2));

        //print("strokeWidth = " + _strokeWidth.toString());
        //print("strokeWidth = " + strokeWidth.toString());

        widget.notifier.setStrokeWidth(strokeWidth / 2);

        size = strokeWidth * 2;

        setState(() {});
      },
      onPointerUp: (details) {},
      child: FloatingActionButton(
        key: keyBuildStroke,
        onPressed: () {
          //notifier.setStrokeWidth(strokeWidth / 2);
        },
        tooltip: "Cambiar grozor puntero",
        backgroundColor: Colors.black.withOpacity(0.1),
        elevation: 0,
        child: AnimatedSwitcher(
          duration: kThemeAnimationDuration,
          child: Container(
            width: size, //Size,
            height: size, //Size,
            decoration: BoxDecoration(
              color: widget.state.map(
                drawing: (s) => Color(s.selectedColor),
                erasing: (_) => Colors.transparent,
              ),
              border: widget.state.map(
                drawing: (_) => null,
                erasing: (_) => Border.all(width: 1),
              ),
              shape: BoxShape.circle,
            ),
          ),
        ),
      ),
    );
  }
}

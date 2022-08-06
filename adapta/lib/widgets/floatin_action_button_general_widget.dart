import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:adapta/models/models.dart';
import 'package:adapta/providers/providers.dart';
import 'package:adapta/theme/app_theme.dart';

class FloatinActionButtonGeneralWidget extends StatelessWidget {
  const FloatinActionButtonGeneralWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double iconWidth = MenuOption.widthFloatinActionButton(context);

    return Visibility(
      visible: !context.watch<PainterProvider>().isEditorActive,
      child: SizedBox(
        width: iconWidth,
        height: iconWidth,
        child: FloatingActionButton(
          key: MenuOption.floatinActionButtonkey,
          onPressed: () {
            // Add your onPressed code here!
            Provider.of<PainterProvider>(context, listen: false)
                .activarPainter();
          },
          backgroundColor: AppTheme.primary,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}

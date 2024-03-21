import 'package:flutter/material.dart';
import '../../core/themes/font_theme.dart';
import 'dialog_body.dart';

class InfoDialog extends StatefulWidget {
  const InfoDialog({Key? key}) : super(key: key);

  @override
  State<InfoDialog> createState() => _InfoDialogState();
}

class _InfoDialogState extends State<InfoDialog> {
  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    return AlertDialog(
      backgroundColor: color.secondary.withOpacity(0.92),
      title: Text(
        'Systematic Investment Plan (SIP)',
        style: subTitleFontStyle(context, Colors.white),
      ),
      content: const DialogBody(),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context, true),
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(color.background),
              side:
                  MaterialStateProperty.all(BorderSide(color: color.primary))),
          child: Text('Ok', style: buttonFontStyle(context, color.outline)),
        ),
      ],
    );
  }
}

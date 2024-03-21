import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/themes/font_theme.dart';

class SetValuesFormField extends StatelessWidget {
  final String labelText;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;

  const SetValuesFormField(
      {Key? key, required this.labelText, this.onChanged, this.validator})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    return TextFormField(
      validator: validator,
      style: bodyFontStyle(context, color.outline),
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        labelText: labelText,
        labelStyle: smallFontStyle(context, Colors.black87),
        //  helperText: 'Only numbers and one decimal point',
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(24),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: color.primary, width: 2),
          borderRadius: BorderRadius.circular(24),
        ),
      ),
      onChanged: onChanged,
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')),
      ],
    );
  }
}

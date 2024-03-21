import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/themes/font_theme.dart';
import '../../logic/blocs/slider_bloc/slider_bloc.dart';

class ResultBox extends StatelessWidget {
  const ResultBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double investment = context.read<SliderBloc>().state.investment;
    double rate = context.read<SliderBloc>().state.rate;
    double time = context.read<SliderBloc>().state.time;
    double investedAmount = (investment * 12) * time;
    double i = (rate) / (12 * 100);
    double estimatedReturn =
        (investment * (((pow((1 + i), (time * 12))) - 1) / i) * (1 + i)) -
            investedAmount;
    double totalInvestment = investedAmount + estimatedReturn;

    final width = MediaQuery.of(context).size.width;

    final color = Theme.of(context).colorScheme;

    return BlocBuilder<SliderBloc, SliderState>(
      builder: (context, state) => Container(
        width: width*0.9,
        margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 8),
        decoration: BoxDecoration(
          color: color.primary.withOpacity(0.3),
          borderRadius: BorderRadius.circular(width * 0.05),
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total Invested',
                  style: smallFontStyle(context, color.outline),
                ),
                Text(
                  investedAmount.isNaN
                      ? '\$ 0'
                      : '\$ ${investedAmount.toStringAsFixed(0)}',
                  style: smallFontStyle(context, color.outline),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Est. Returns', style: smallFontStyle(context, color.outline)),
                Text(
                  estimatedReturn.isNaN
                      ? '\$ 0'
                      : '\$ ${estimatedReturn.toStringAsFixed(0)}',
                  style: smallFontStyle(context, color.outline),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total Value',
                  style: smallFontStyle(context, color.outline),
                ),
                Text(
                    totalInvestment.isNaN
                        ? '\$ 0'
                        : '\$ ${totalInvestment.toStringAsFixed(0)}',
                    style: smallFontStyle(context, color.outline)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

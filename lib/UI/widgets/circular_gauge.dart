import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import '../../logic/blocs/slider_bloc/slider_bloc.dart';

class CircularGauge extends StatelessWidget {
  const CircularGauge({super.key});

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

    final color = Theme.of(context).colorScheme;

    return BlocBuilder<SliderBloc, SliderState>(
      builder: (context, state) => SfRadialGauge(
        enableLoadingAnimation: true,
        axes: <RadialAxis>[
          RadialAxis(
            minimum: 0,
            maximum: 360,
            useRangeColorForAxis: true,
            startAngle: 0,
            endAngle: 360,
            showLabels: false,
            showTicks: false,
            axisLineStyle: const AxisLineStyle(
                thicknessUnit: GaugeSizeUnit.factor,
                thickness: 0.35,
                color: Color(0xFF98a4ff)),
            ranges: <GaugeRange>[
              GaugeRange(
                  startValue: 0,
                  endValue: (investedAmount * 360) /
                      (estimatedReturn + investedAmount),
                  color: color.secondary,
                  sizeUnit: GaugeSizeUnit.factor,
                  startWidth: 0.35,
                  endWidth: 0.35),
              GaugeRange(
                  startValue: (investedAmount * 360) /
                      (estimatedReturn + investedAmount),
                  endValue: 360,
                  sizeUnit: GaugeSizeUnit.factor,
                  color: color.primary.withBlue(150),
                  startWidth: 0.35,
                  endWidth: 0.35),
            ],
          ),
        ],
      ),
    );
  }
}

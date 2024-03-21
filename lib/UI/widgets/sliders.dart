import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:investment_calculator_app/UI/widgets/quantities_box.dart';
import '../../logic/blocs/slider_bloc/slider_bloc.dart';

class Sliders extends StatelessWidget {
  const Sliders({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        QuantitiesBox(
          label: 'Monthly Investment',
          quantity:
              '\$ ${context.read<SliderBloc>().state.investment.toStringAsFixed(0)}',
          maxValue: 10000,
          value: context.read<SliderBloc>().state.investment <= 10000
              ? context.read<SliderBloc>().state.investment
              : 10000,
          onChanged: (double firstValue) {
            return context
                .read<SliderBloc>()
                .add(UpdateFirstSliderValueEvent(value: firstValue));
          },
        ),
        const SizedBox(height: 15),
        QuantitiesBox(
          label: 'Expected return rate (%)',
          quantity:
              '${context.read<SliderBloc>().state.rate.toStringAsFixed(1)} %',
          maxValue: 50,
          value: context.read<SliderBloc>().state.rate <= 50
              ? context.read<SliderBloc>().state.rate
              : 50,
          onChanged: (double secondValue) {
            return context
                .read<SliderBloc>()
                .add(UpdateSecondSliderValueEvent(value: secondValue));
          },
        ),
        const SizedBox(height: 15),
        QuantitiesBox(
          label: 'Time period (years)',
          quantity: context.read<SliderBloc>().state.time.toStringAsFixed(1),
          maxValue: 45,
          value: context.read<SliderBloc>().state.time <= 45
              ? context.read<SliderBloc>().state.time
              : 45,
          onChanged: (double thirdValue) {
            return context
                .read<SliderBloc>()
                .add(UpdateThirdSliderValueEvent(value: thirdValue));
          },
        ),
      ],
    );
  }
}

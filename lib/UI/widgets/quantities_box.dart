import 'package:investment_calculator_app/UI/widgets/widgets_barrel.dart';

class QuantitiesBox extends StatelessWidget {
  final double maxValue;
  final Function(double) onChanged;
  final double value;
  final String quantity;
  final String label;

  const QuantitiesBox({
    super.key,
    required this.maxValue,
    required this.onChanged,
    required this.value,
    required this.quantity,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final color = Theme.of(context).colorScheme;

    return Container(
      decoration: BoxDecoration(
        color: color.primary.withOpacity(0.3),
        borderRadius: BorderRadius.circular(width * 0.05),
      ),
      width: width * 0.9,
      child: Column(
        children: [
          addVerticalSpace(context, 0.01),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                label,
                style: bodyFontStyle(context, color.outline),
              ),
              BlocBuilder<SliderBloc, SliderState>(
                builder: (context, state) => Text(
                  quantity,
                  style: bodyFontStyle(context, color.outline),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          BlocBuilder<SliderBloc, SliderState>(
            builder: (context, state) => _MySliderTheme(
              maxValue: maxValue,
              onChanged: onChanged,
              value: value,
            ),
          )
        ],
      ),
    );
  }
}

class _MySliderTheme extends StatelessWidget {
  final double maxValue;
  final Function(double) onChanged;
  final double value;

  const _MySliderTheme({
    Key? key,
    required this.maxValue,
    required this.onChanged,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return SliderTheme(
          data: SliderThemeData(
            thumbColor: color.primary,
            thumbShape: RoundSliderThumbShape(enabledThumbRadius: 10),
            activeTrackColor: color.secondary,
            inactiveTrackColor: Colors.black12,
          ),
          child: Slider(
            min: 0,
            max: maxValue,
            value: value,
            onChanged: onChanged,
          ),
        );
      },
    );
  }
}

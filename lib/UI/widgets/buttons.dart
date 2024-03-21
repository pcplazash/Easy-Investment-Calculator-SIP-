
import 'package:investment_calculator_app/UI/widgets/widgets_barrel.dart';

class Buttons extends StatelessWidget {
  const Buttons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;

    return BlocBuilder<SliderBloc, SliderState>(
      builder: (context, state) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ElevatedButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                backgroundColor: MaterialStateProperty.all(
                  color.secondary,
                ),
              ),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => SetValuesDialog(),
                );
              },
              child: Text(
                'Set your values',
                style: buttonFontStyle(context, Colors.white),
              )),
          ElevatedButton(
            style: ButtonStyle(
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              backgroundColor: MaterialStateProperty.all(
                color.secondary,
              ),
            ),
            onPressed: () {
              context
                  .read<SliderBloc>()
                  .add(UpdateFirstSliderValueEvent(value: 0));
              context
                  .read<SliderBloc>()
                  .add(UpdateSecondSliderValueEvent(value: 0));
              context
                  .read<SliderBloc>()
                  .add(UpdateThirdSliderValueEvent(value: 0));
              HydratedBloc.storage.clear();
            },
            child: Text(
              'Reset',
              style: buttonFontStyle(context, Colors.white),
            ),
          )
        ],
      ),
    );
  }
}

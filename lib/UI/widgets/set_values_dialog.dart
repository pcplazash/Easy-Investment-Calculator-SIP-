import 'package:investment_calculator_app/UI/widgets/set_values_form_field.dart';

import 'widgets_barrel.dart';

class SetValuesDialog extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  SetValuesDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final color = Theme.of(context).colorScheme;

    return BlocBuilder<SliderBloc, SliderState>(
      builder: (context, state) => Dialog(
        child: Container(
          height: size.height * 0.54,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            color: color.secondary.withOpacity(0.92),
          ),
          child: Padding(
            padding: EdgeInsets.all(size.width * 0.05),
            child: Column(
              children: [
                Text('Set your values',
                    style: titleFontStyle(context, Colors.white60)),
                SizedBox(height: size.height * 0.03),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      SetValuesFormField(
                        labelText: 'Monthly Investment',
                        onChanged: (value) => context.read<SliderBloc>().add(
                            UpdateFirstSliderValueEvent(
                                value: double.parse(value))),
                      ),
                      SizedBox(height: size.height * 0.03),
                      SetValuesFormField(
                        labelText: 'Expected return rate',
                        validator: (value) {
                          if (state is ValidationState && !state.isValid) {
                            return 'Please enter a valid number';
                          }
                          return null;
                        },
                        onChanged: (value) => context.read<SliderBloc>().add(
                            UpdateSecondSliderValueEvent(
                                value: double.parse(value))),
                      ),
                      SizedBox(height: size.height * 0.03),
                      SetValuesFormField(
                        labelText: 'Time in years',
                        onChanged: (value) => context.read<SliderBloc>().add(
                            UpdateThirdSliderValueEvent(
                                value: double.parse(value))),
                      ),
                      SizedBox(
                        height: size.height * 0.05,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.white),
                            fixedSize: MaterialStateProperty.all(
                                Size(size.height * 0.15, size.height * 0.015))),
                        child: Text('Set',
                            style: smallFontStyle(context, Colors.black87)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

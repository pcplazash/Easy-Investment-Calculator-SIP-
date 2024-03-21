import 'widgets/widgets_barrel.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    final color = Theme.of(context).colorScheme;

    return SafeArea(
        child: BlocBuilder<SliderBloc, SliderState>(
      builder: (context, state) => Scaffold(
        appBar: AppBar(
          actions: [
            ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(
                    const CircleBorder(),
                  ),
                  backgroundColor: MaterialStateProperty.all(
                    color.secondary,
                  ),
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => const InfoDialog(),
                  );
                },
                child: const Icon(Icons.info_outlined))
          ],
          backgroundColor: color.primary,
          title: Text(
            'PCP-Dev SIP Calculator',
            style: titleFontStyle(context, Colors.black87),
            textAlign: TextAlign.center,
          ),
        ),
        backgroundColor: color.background,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: height * 0.017,
              horizontal: width * 0.06,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ResultBox(),
                addVerticalSpace(context, 0.0007),
                Gauge(),
                addVerticalSpace(context, 0.01),
                const Buttons(),
                addVerticalSpace(context, 0.02),
                Sliders(),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}

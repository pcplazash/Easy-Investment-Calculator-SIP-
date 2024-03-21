import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/themes/font_theme.dart';

class DialogBody extends StatefulWidget {
  const DialogBody({Key? key}) : super(key: key);

  @override
  State<DialogBody> createState() => _DialogBodyState();
}

class _DialogBodyState extends State<DialogBody> {

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text:
                'This system allows you to invest a consistent sum of money regularly, usually monthly or quarterly and earning benefits by taking advantage of dollar cost averaging. It helps in spreading the investment risk over a longer period and enables investors to participate in the financial markets in a systematic and disciplined manner. \n',
            style: bodyFontStyle(context, Colors.white),
          ),
          TextSpan(
            text:
                '\nThis app automatically calculates the amount of money you can earn regarding your investment amount, return rates and time.\n',
            style: bodyFontStyle(context, Colors.white),
          ),
          TextSpan(
            text: '\nInsert values and plan your investment\n',
            style: bodyFontStyle(context, Colors.white),
          ),
          TextSpan(
            text: '\nRead more',
            style: smallFontStyle(context, Colors.white)
                .copyWith(decoration: TextDecoration.underline),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                setState(() {
                   _launchURL(Uri.parse(
                      'https://www.investopedia.com/terms/s/systematicinvestmentplan.asp'));
                });
              },
          ),
        ],
      ),
    );
  }

  Future<void> _launchURL(Uri url) async {
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }
}

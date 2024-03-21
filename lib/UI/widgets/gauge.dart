import 'package:flutter/material.dart';
import '../../core/themes/font_theme.dart';
import 'circular_gauge.dart';

class Gauge extends StatelessWidget {
  const Gauge({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final color = Theme.of(context).colorScheme;

    return Container(
      width: width * 0.9,
      height: width * 0.45,
      margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color.primary.withOpacity(0.2),
        borderRadius: BorderRadius.circular(width * 0.05),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: height * 0.01,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: width * 0.04,
                    height: height * 0.04,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: color.secondary,
                    ),
                  ),
                  Text(
                    '  Total Invested',
                    style: bodyFontStyle(context, color.outline),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: width * 0.04,
                    height: height * 0.04,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color:
                          color.primary.withBlue(150), // Set the circle's color
                    ),
                  ),
                  Text(
                    '  Est. Returns',
                    style: bodyFontStyle(context, color.outline),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            width: width * 0.01,
          ),
          SizedBox(width: width * 0.35, child: CircularGauge()),
        ],
      ),
    );
  }
}

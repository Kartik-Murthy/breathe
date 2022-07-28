import 'package:battery_indicator/battery_indicator.dart';
import 'package:flutter/material.dart';

class BatteryInfo extends StatefulWidget {
  const BatteryInfo({Key? key}) : super(key: key);

  @override
  State<BatteryInfo> createState() => _BatteryInfoState();
}

class _BatteryInfoState extends State<BatteryInfo> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BatteryIndicator(
          colorful: false,
          style: BatteryIndicatorStyle.skeumorphism,
          mainColor: Colors.white70,
          size: 12,
        ),
      ],
    );
  }
}

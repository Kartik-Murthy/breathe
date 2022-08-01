// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:battery_indicator/battery_indicator.dart';
import 'package:flutter/material.dart';

class BatteryInfo extends StatefulWidget {
  final String appAlignment;
  const BatteryInfo({
    Key? key,
    required this.appAlignment,
  }) : super(key: key);

  @override
  State<BatteryInfo> createState() => _BatteryInfoState();
}

class _BatteryInfoState extends State<BatteryInfo> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 28,
      child: Row(
        mainAxisAlignment: widget.appAlignment == 'Left'
            ? MainAxisAlignment.start
            : widget.appAlignment == 'Center'
                ? MainAxisAlignment.center
                : MainAxisAlignment.end,
        children: [
          BatteryIndicator(
            style: BatteryIndicatorStyle.skeumorphism,
            mainColor: Colors.white,
            size: 12,
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class GestureSettingsWidget extends StatefulWidget {
  final String gestureName;
  final Map<Object, Object> setting;
  final String settingKey;
  const GestureSettingsWidget({
    Key? key,
    required this.gestureName,
    required this.setting,
    required this.settingKey,
  }) : super(key: key);

  @override
  State<GestureSettingsWidget> createState() => _GestureSettingsWidgetState();
}

class _GestureSettingsWidgetState extends State<GestureSettingsWidget> {
  var gestureValue = [];
  @override
  void initState() {
    gestureValue = widget.setting[widget.settingKey] as List;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.gestureName,
            style: const TextStyle(
                color: Colors.white, fontSize: 19, fontWeight: FontWeight.w300),
          ),
          GestureDetector(
            onTap: () async {
              final data = await Navigator.pushNamed(context, '/appsList',
                  arguments: true);

              setState(() {
                if (data != null) {
                  gestureValue = data as List;

                  widget.setting[widget.settingKey] = [
                    gestureValue[0],
                    gestureValue[1]
                  ];
                }
              });
            },
            child: Text(
              gestureValue[0].toString(),
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 19,
                  fontWeight: FontWeight.w300),
            ),
          ),
        ],
      ),
    );
  }
}

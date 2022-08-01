import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:status_bar_control/status_bar_control.dart';

class AppearanceSettingsWidget extends StatefulWidget {
  final String settingName;
  final int valueRange;
  final String settingKey;
  final Map<Object, Object> setting;
  bool tappedOutside;

  AppearanceSettingsWidget(
      {Key? key,
      required this.settingName,
      required this.valueRange,
      required this.setting,
      required this.settingKey,
      required this.tappedOutside})
      : super(key: key);

  @override
  State<AppearanceSettingsWidget> createState() =>
      _AppearanceSettingsWidgetState();
}

class _AppearanceSettingsWidgetState extends State<AppearanceSettingsWidget> {
  bool isTapped = false;

  late double rangeWidth;
  var settingsChoice = {};
  @override
  void initState() {
    initializeOptions(widget.valueRange);
    statusBar(widget.setting['showStatus'].toString());
    super.initState();
  }

  void statusBar(String showStatus) async {
    bool hidden = false;
    if (showStatus == 'Off') {
      setState(() {
        hidden = true;
      });
    }
    await StatusBarControl.setHidden(hidden,
        animation: StatusBarAnimation.NONE);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      systemNavigationBarColor: Colors.transparent,
      statusBarColor: Colors.transparent,
    ));
  }

  void initializeOptions(int range) {
    if (range == 2) {
      settingsChoice[0] = 'On';
      settingsChoice[1] = 'Off';
      rangeWidth = 0.4;
    } else if (range == 3) {
      settingsChoice[0] = 'Left';
      settingsChoice[1] = 'Center';
      settingsChoice[2] = 'Right';
      rangeWidth = 0.28;
    } else {
      for (int i = 0; i < range; i++) {
        settingsChoice[i] = i;
      }
      rangeWidth = .095;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 50,
        child: isTapped && !widget.tappedOutside
            ? ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: widget.valueRange,
                itemBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    width: MediaQuery.of(context).size.width * rangeWidth,
                    child: (ListTile(
                      title: Text(
                        settingsChoice[index].toString(),
                        softWrap: true,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 19,
                            fontWeight: FontWeight.w300),
                      ),
                      onTap: () {
                        setState(() {
                          isTapped = false;
                          settingsChoice[index].toString();

                          widget.setting.update(widget.settingKey,
                              (value) => settingsChoice[index],
                              ifAbsent: (() => settingsChoice[index]));
                        });
                        statusBar(widget.setting['showStatus'].toString());
                      },
                    )),
                  );
                },
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.settingName,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 19,
                        fontWeight: FontWeight.w300),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isTapped = true;
                        if (isTapped) {
                          widget.tappedOutside = false;
                        }
                        if (widget.tappedOutside) {
                          isTapped = false;
                        }
                      });
                    },
                    child: Container(
                      height: 40,
                      width: 56,
                      color: Colors.transparent,
                      child: Center(
                        child: Text(
                          widget.setting[widget.settingKey].toString(),
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 19,
                              fontWeight: FontWeight.w300),
                        ),
                      ),
                    ),
                  ),
                ],
              ));
  }
}

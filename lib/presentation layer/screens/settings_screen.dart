// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:breathe/Widgets/appearance_settings.dart';
import 'package:breathe/Widgets/gesture_settings.dart';
import 'package:flutter/material.dart';
import 'package:installed_apps/installed_apps.dart';

class SettingsScreen extends StatefulWidget {
  Object? argument;
  SettingsScreen({Key? key, this.argument}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  Map<Object, Object> settings = {};
  bool tappedOutside = false;
  @override
  void initState() {
    settings = widget.argument as Map<Object, Object>;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context, settings);
        return Future.value(true);
      },
      child: GestureDetector(
        onTap: () {
          setState(() {
            tappedOutside = true;
          });
        },
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: Column(
                children: [
                  Center(
                    child: Container(
                        width: MediaQuery.of(context).size.width * .9,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(12)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Breathe',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 30,
                                        fontWeight: FontWeight.w300),
                                  ),
                                  IconButton(
                                      splashRadius: 0.1,
                                      onPressed: () async {
                                        await InstalledApps.openSettings(
                                            'com.example.breathe');
                                      },
                                      icon: const Icon(
                                        Icons.info_outline_rounded,
                                        color: Colors.white,
                                      ))
                                ],
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              GestureDetector(
                                onTap: () {
                                  //Set Default Launcher;
                                },
                                child: const Text(
                                  'Set as default Launcher',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 19,
                                      fontWeight: FontWeight.w300),
                                ),
                              ),
                            ],
                          ),
                        )),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Center(
                    child: Container(
                        width: MediaQuery.of(context).size.width * .9,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(12)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Appearance',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 30,
                                      fontWeight: FontWeight.w300),
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                AppearanceSettingsWidget(
                                  settingName: 'Apps on home screen',
                                  valueRange: 9,
                                  setting: settings,
                                  settingKey: 'appCount',
                                  tappedOutside: tappedOutside,
                                ),
                                AppearanceSettingsWidget(
                                  settingName: 'Auto show keyboard',
                                  valueRange: 2,
                                  setting: settings,
                                  settingKey: 'autoShowKeyboard',
                                  tappedOutside: tappedOutside,
                                ),
                                AppearanceSettingsWidget(
                                  settingName: 'App Alignment',
                                  valueRange: 3,
                                  setting: settings,
                                  settingKey: 'appAlignment',
                                  tappedOutside: tappedOutside,
                                ),
                                AppearanceSettingsWidget(
                                  settingName: 'Show Status Bar',
                                  valueRange: 2,
                                  setting: settings,
                                  settingKey: 'showStatus',
                                  tappedOutside: tappedOutside,
                                ),
                                AppearanceSettingsWidget(
                                  settingName: 'Show date time',
                                  valueRange: 2,
                                  setting: settings,
                                  settingKey: 'showDateTime',
                                  tappedOutside: tappedOutside,
                                ),
                                AppearanceSettingsWidget(
                                  settingName: 'Show Battery',
                                  valueRange: 2,
                                  setting: settings,
                                  settingKey: 'showBattery',
                                  tappedOutside: tappedOutside,
                                ),
                              ]),
                        )),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Center(
                    child: Container(
                        width: MediaQuery.of(context).size.width * .9,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(12)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Gestures',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 30,
                                      fontWeight: FontWeight.w300),
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                GestureSettingsWidget(
                                  gestureName: 'Swipe Left',
                                  setting: settings,
                                  settingKey: 'leftGestureValue',
                                ),
                                GestureSettingsWidget(
                                  gestureName: 'Swipe Right',
                                  setting: settings,
                                  settingKey: 'rightGestureValue',
                                )
                              ]),
                        )),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

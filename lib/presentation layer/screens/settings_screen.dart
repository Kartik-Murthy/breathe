import 'package:flutter/material.dart';
import 'package:installed_apps/installed_apps.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context, 5);
        return Future.value(true);
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Appearance',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 30),
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
                            const SizedBox(
                              height: 35,
                              child: Text(
                                'Apps on home screen',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 19),
                              ),
                            ),
                            const SizedBox(
                              height: 35,
                              child: Text(
                                'Appearance',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 25),
                              ),
                            ),
                            const SizedBox(
                              height: 35,
                              child: Text(
                                'Appearance',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 25),
                              ),
                            )
                          ],
                        ),
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

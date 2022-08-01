import 'package:flutter/material.dart';
import 'package:installed_apps/installed_apps.dart';

class HomeScreenApps extends StatefulWidget {
  const HomeScreenApps({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreenApps> createState() => _HomeScreenAppsState();
}

class _HomeScreenAppsState extends State<HomeScreenApps> {
  String? appName;
  String? packageName;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () async {
        final data =
            await Navigator.pushNamed(context, '/appsList', arguments: true);
        setState(() {
          if (data != null) {
            var appSelected = data as List<Object>;
            appName = appSelected[0].toString();
            packageName = appSelected[1].toString();
          }
        });
      },
      onTap: () async {
        if (appName == null) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: const Center(
                child: Text(
              'Long press to select app',
              style: TextStyle(fontSize: 12),
            )),
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            margin: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height / 2 - 25,
                horizontal: MediaQuery.of(context).size.width / 2 - 90),
          ));
        } else if (appName != null) {
          InstalledApps.startApp(packageName.toString());
        }
      },
      child: Column(
        children: [
          SizedBox(
            width: 80,
            height: 60,
            child: Text(appName ?? 'App',
                style: const TextStyle(
                    fontSize: 32,
                    color: Colors.white,
                    fontWeight: FontWeight.w300)),
          ),
        ],
      ),
    );
  }
}

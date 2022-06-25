import 'package:flutter/material.dart';

class HomeScreenApps extends StatefulWidget {
  final String? appName;
  final bool isEditable;
  const HomeScreenApps({Key? key, this.appName, required this.isEditable})
      : super(key: key);

  @override
  State<HomeScreenApps> createState() => _HomeScreenAppsState();
}

class _HomeScreenAppsState extends State<HomeScreenApps> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        if (widget.isEditable) {}
      },
      onTap: () async {
        if (widget.appName == null) {
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
        } else if (widget.appName != null) {}
      },
      child: Text(widget.appName ?? 'App',
          style: const TextStyle(fontSize: 32, color: Colors.white)),
    );
  }
}

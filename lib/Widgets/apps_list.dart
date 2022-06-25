// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:azlistview/azlistview.dart';
import 'package:breathe/main.dart';
import 'package:flutter/material.dart';
import 'package:installed_apps/installed_apps.dart';

class AZList extends ISuspensionBean {
  final String title;
  final String tag;
  final String abc;
  AZList({required this.title, required this.tag, required this.abc});

  @override
  String getSuspensionTag() {
    return tag;
  }
}

class AppsList extends StatefulWidget {
  const AppsList({Key? key}) : super(key: key);

  @override
  State<AppsList> createState() => _AppsListState();
}

class _AppsListState extends State<AppsList> {
  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Center(child: CircularProgressIndicator())
        : Column(
            children: [
              Expanded(
                child: AzListView(
                    padding: const EdgeInsets.all(14.0),
                    data: items,
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      final item = items[index];
                      return _buildList(item);
                    },
                    indexHintBuilder: (context, text) {
                      return Container(
                        height: 60,
                        child: Center(
                          child: Text(
                            text,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 32,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        decoration: const BoxDecoration(
                          color: Colors.transparent,
                        ),
                      );
                    },
                    indexBarMargin: const EdgeInsets.all(8),
                    indexBarOptions: const IndexBarOptions(
                        textStyle: TextStyle(color: Colors.white, fontSize: 15),
                        needRebuild: true,
                        indexHintWidth: 40,
                        indexHintAlignment: Alignment.centerRight,
                        selectItemDecoration: BoxDecoration(
                            color: Colors.white, shape: BoxShape.circle))),
              ),
            ],
          );
  }
}

Widget _buildList(
  AZList item,
) {
  final tag = item.getSuspensionTag();
  final offStage = !item.isShowSuspension;
  return Column(
    children: [
      Offstage(offstage: offStage, child: buildHeader(tag)),
      Container(
        margin: const EdgeInsets.only(right: 16),
        child: ListTile(
          textColor: Colors.white,
          title: Text(
            item.title,
            style: const TextStyle(fontSize: 25),
          ),
          onTap: () {
            InstalledApps.startApp(item.abc);
          },
        ),
      ),
    ],
  );
}

Widget buildHeader(String tag) {
  return Container(
    height: 40,
    alignment: Alignment.centerLeft,
    child: Text(
      tag,
      softWrap: false,
      style: const TextStyle(
          fontSize: 35, fontWeight: FontWeight.bold, color: Colors.white),
    ),
  );
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:azlistview/azlistview.dart';
import 'package:breathe/Widgets/search_bar.dart';
import 'package:breathe/main.dart';
import 'package:flutter/material.dart';
import 'package:installed_apps/installed_apps.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class AZList extends ISuspensionBean {
  final String title;
  final String tag;
  final String package;
  AZList({required this.title, required this.tag, required this.package});

  @override
  String getSuspensionTag() {
    return tag;
  }
}

class AppsList extends StatefulWidget {
  final Object? homeAppSelection;
  const AppsList({Key? key, this.homeAppSelection}) : super(key: key);

  @override
  State<AppsList> createState() => _AppsListState();
}

class _AppsListState extends State<AppsList> {
  String query = '';
  var itemlist = items;

  ItemPositionsListener lis = ItemPositionsListener.create();

  @override
  void initState() {
    lis.itemPositions.addListener(heh);
    print(widget.homeAppSelection);
    super.initState();
  }

  void heh() {
    print(lis.itemPositions.value.first.index);
  }

  void searchItem(String query) {
    final itemlist = items.where((element) {
      final titleLower = element.title.toLowerCase();
      final searchLower = query.toLowerCase();

      return titleLower.contains(searchLower);
    }).toList();

    setState(() {
      this.query = query;
      this.itemlist = itemlist;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Center(child: CircularProgressIndicator())
        : Scaffold(
            backgroundColor: Colors.transparent,
            body: Column(
              children: [
                SearchWidget(
                    text: query,
                    onChanged: searchItem,
                    hintText: 'Type To Search'),
                Expanded(
                  child: AzListView(
                      itemPositionsListener: lis,
                      padding: const EdgeInsets.all(14.0),
                      data: itemlist,
                      itemCount: itemlist.length,
                      itemBuilder: (context, index) {
                        final item = itemlist[index];

                        return _buildList(
                            context, item, query, widget.homeAppSelection);
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
                          textStyle:
                              TextStyle(color: Colors.white, fontSize: 15),
                          needRebuild: true,
                          indexHintWidth: 40,
                          indexHintAlignment: Alignment.centerRight,
                          selectItemDecoration: BoxDecoration(
                              color: Colors.white, shape: BoxShape.circle))),
                ),
              ],
            ),
          );
  }
}

Widget _buildList(
  BuildContext context,
  AZList item,
  String query,
  Object? selectHomeApp,
) {
  final tag = item.getSuspensionTag();
  final offStage = !item.isShowSuspension;
  return Column(
    children: [
      if (query.isEmpty) Offstage(offstage: offStage, child: buildHeader(tag)),
      Container(
        margin: const EdgeInsets.only(right: 16),
        child: ListTile(
          textColor: Colors.white,
          title: Text(
            item.title,
            style: const TextStyle(fontSize: 25),
          ),
          onTap: () {
            if (selectHomeApp == true) {
              Navigator.pop(context, item.title + ',' + item.package);
            } else {
              InstalledApps.startApp(item.package);
            }
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

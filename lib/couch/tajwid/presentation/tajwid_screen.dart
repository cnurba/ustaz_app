import 'package:flutter/material.dart';
import 'package:muslim_app/couch/tajwid/domain/models/tajwid/tajwid.dart';
import 'package:muslim_app/couch/tajwid/infrastructure/repo/tajwid_repository.dart';
import 'package:muslim_app/couch/tajwid/presentation/widgets/tajwid_circled_button.dart';

class TajwidScreen extends StatefulWidget {
  const TajwidScreen({Key? key}) : super(key: key);

  @override
  State<TajwidScreen> createState() => _TajwidScreenState();
}

class _TajwidScreenState extends State<TajwidScreen> {
  Tajwid tajwid = Tajwid.empty();

  @override
  void initState() {
    getData();
    super.initState();
  }

  void getData() async {
    tajwid = await TajwidRepository().getDataFromAssets();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const SizedBox(height: kBottomNavigationBarHeight),
          Card(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(tajwid.name),
                    Text(tajwid.nameAr),
                  ],
                ),
                Text(tajwid.desc),
              ],
            ),
          ),
          ListTile(
            horizontalTitleGap: 0,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("${tajwid.nun.id}"),
                Text(tajwid.nun.title),
                Text(tajwid.nun.titleAr),
              ],
            ),
            subtitle: Text(tajwid.nun.desc),
          ),
          ListTile(
            horizontalTitleGap: 0,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("${tajwid.nun.types[0].id}"),
                Text(tajwid.nun.types[0].title),
                const Spacer(),
                Text(tajwid.nun.types[0].titleAr),
              ],
            ),
            subtitle: Text(tajwid.nun.desc),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: tajwid.nun.types[0].examples.length,
            itemBuilder: (context, index) {
              return Text(
                tajwid.nun.types[0].examples[index],
              );
            },
          ),
          ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: tajwid.nun.types[0].letters.length,
            itemBuilder: (context, index) {
              return SizedBox(
                width: 20,
                child: Container(
                  color: Colors.blue,
                  constraints: BoxConstraints(maxHeight: 20, maxWidth: 20),
                  margin: EdgeInsets.all(8),
                  child: SizedBox(
                    width: 20,
                    child: Text(
                      tajwid.nun.types[0].letters[index],
                    ),
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:muslim_app/couch/tajwid/domain/models/tajwid/tajwid.dart';
import 'package:muslim_app/couch/tajwid/infrastructure/repo/tajwid_repository.dart';
import 'package:muslim_app/couch/tajwid/presentation/nun_screen.dart';
import 'package:muslim_app/couch/tajwid/presentation/widgets/tajwid_circled_button.dart';
import 'package:muslim_app/couch/tajwid/presentation/widgets/tajwid_header_card.dart';
import 'package:muslim_app/couch/tajwid/presentation/widgets/tajwid_sub_header_card.dart';

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
      backgroundColor: Colors.grey.shade200,
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const SizedBox(height: kBottomNavigationBarHeight),
          /// Display tajwid card
          TajwidHeaderCard(
            title: tajwid.name,
            titleAr: tajwid.nameAr,
            desc: tajwid.desc,
          ),
          const SizedBox(height: 12),

          TajwidSubHeaderCard(
            title: tajwid.nun.title,
            titleAr: tajwid.nun.titleAr,
            desc: tajwid.nun.desc,
            num: 1,
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return NunScreen(nun: tajwid.nun);
                  },
                ),
              );
            },
          ),
          TajwidSubHeaderCard(
            title: tajwid.mim.title,
            titleAr: tajwid.mim.titleAr,
            desc: '',
            num: 2,
            onPressed: () {},
          ),

          TajwidSubHeaderCard(
            title: tajwid.kalkala.title,
            titleAr: tajwid.kalkala.title,
            desc: tajwid.kalkala.desc,
            num: 3,
            onPressed: () {},
          ),

          // ListTile(
          //   horizontalTitleGap: 0,
          //   title: Row(
          //     mainAxisAlignment: MainAxisAlignment.start,
          //     children: [
          //       Text("${tajwid.nun.id}"),
          //       Text(
          //         tajwid.nun.title,
          //         style: const TextStyle(
          //           fontSize: 18,
          //           fontWeight: FontWeight.w500,
          //         ),
          //       ),
          //       const Spacer(),
          //       Text(
          //         tajwid.nun.titleAr,
          //         style: const TextStyle(
          //           fontSize: 18,
          //           fontWeight: FontWeight.w500,
          //         ),
          //       ),
          //     ],
          //   ),
          //   subtitle: Text(
          //     tajwid.nun.desc,
          //     style: const TextStyle(
          //       fontSize: 14,
          //       fontWeight: FontWeight.w500,
          //     ),
          //   ),
          // ),
          // ListTile(
          //   horizontalTitleGap: 0,
          //   title: Row(
          //     mainAxisAlignment: MainAxisAlignment.start,
          //     children: [
          //       Text("${tajwid.nun.types[0].id}"),
          //       Text(
          //         tajwid.nun.types[0].title,
          //         style: const TextStyle(
          //           fontSize: 18,
          //           fontWeight: FontWeight.w500,
          //         ),
          //       ),
          //       const Spacer(),
          //       Text(
          //         tajwid.nun.types[0].titleAr,
          //         style: const TextStyle(
          //           fontSize: 18,
          //           fontWeight: FontWeight.w600,
          //         ),
          //       ),
          //     ],
          //   ),
          //   subtitle: Text(
          //     tajwid.nun.desc,
          //     style: const TextStyle(
          //       fontSize: 14,
          //       fontWeight: FontWeight.w500,
          //     ),
          //   ),
          // ),
          // ListView.builder(
          //   shrinkWrap: true,
          //   itemCount: tajwid.nun.types[0].examples.length,
          //   itemBuilder: (context, index) {
          //     return Text(
          //       tajwid.nun.types[0].examples[index],
          //       style:
          //           const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          //     );
          //   },
          // ),
          // ListView.builder(
          //   shrinkWrap: true,
          //   scrollDirection: Axis.vertical,
          //   itemCount: tajwid.nun.types[0].letters.length,
          //   itemBuilder: (context, index) {
          //     return Text(
          //       tajwid.nun.types[0].letters[index],
          //       style:
          //           const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          //     );
          //   },
          // )
        ],
      ),
    );
  }
}

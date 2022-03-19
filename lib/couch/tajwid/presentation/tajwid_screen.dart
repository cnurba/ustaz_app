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
    super.initState();
    getData();
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
          const Text(
            'АРАЕКЕТ, СУКУН, СУКУНДУУ НУН ЖАНА ТАНВИН.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 18),
          const Text(
            'Сукун бул аракетсиз тамгалардын устуно койулуучу белги',
            textAlign: TextAlign.left,
            style: TextStyle(
                color: Colors.grey, fontSize: 15, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 10),
          const Text(
            'Аракет деген бул замма, фатха, кассра.',
            style: TextStyle(
                color: Colors.grey, fontSize: 15, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 10),
          const Text(
            'Танвин деген бул эки замма, эки фатха, эки кассра.',
            style: TextStyle(
                color: Colors.grey, fontSize: 15, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 20),
          const Center(
            child: Text(
              'Сукундуу нун, танвин',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
          ),
          const SizedBox(height: 25),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: 60,
                    width: 120,
                    decoration: BoxDecoration(
                        color: Colors.cyan[700],
                        borderRadius: BorderRadius.circular(20)),
                    child: const Center(
                      child: Text(
                        'Изхар',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: 60,
                    width: 120,
                    decoration: BoxDecoration(
                        color: Colors.cyan[700],
                        borderRadius: BorderRadius.circular(20)),
                    child: const Center(
                      child: Text(
                        'Иклаб',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ),
              ]),
              const SizedBox(height: 20),
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: 60,
                    width: 120,
                    decoration: BoxDecoration(
                        color: Colors.cyan[700],
                        borderRadius: BorderRadius.circular(20)),
                    child: const Center(
                      child: Text(
                        'Идхам',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.cyan[700],
                        borderRadius: BorderRadius.circular(24)),
                    child: Container(
                      margin: const EdgeInsets.all(3),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(22)),
                      child: Container(
                        height: 60,
                        width: 120,
                        margin: const EdgeInsets.all(3),
                        decoration: BoxDecoration(
                            color: Colors.cyan[700],
                            borderRadius: BorderRadius.circular(20)),
                        child: const Center(
                          child: Text(
                            'Ихфа',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ]),
            ],
          ),
          const SizedBox(height: 20),
          const Center(
            child: Text('Сукундуу нун',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                )),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TajwidCircledButton(
                title: 'Изхар',
                titleAr: 'الإظهار',
                onTap: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:muslim_app/couch/core/infrastructure/couch_repository.dart';
import 'package:muslim_app/couch/zikr/domain/zikr.dart';

class ZikrScreen extends StatefulWidget {
  const ZikrScreen({Key? key}) : super(key: key);

  @override
  State<ZikrScreen> createState() => _ZikrScreenState();
}

class _ZikrScreenState extends State<ZikrScreen> {
  Offset pozition = const Offset(0, 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder<List<Zikr>>(
          future: CouchRepository().getZikras(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.separated(
                padding: EdgeInsets.zero,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  final zikr = snapshot.data![index];
                  return ListTile(
                    title: Text(
                      zikr.nameAr,
                      textAlign: TextAlign.right,
                      textDirection: TextDirection.rtl,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          zikr.name,
                          textAlign: TextAlign.left,
                          textDirection: TextDirection.ltr,
                        ),

                        Text(
                          zikr.nameKg,
                          textAlign: TextAlign.left,
                          textDirection: TextDirection.ltr,
                           style: const TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                      ),
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) => const Divider(),
                itemCount: snapshot.data!.length,
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text(
                  snapshot.error.toString(),
                ),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}

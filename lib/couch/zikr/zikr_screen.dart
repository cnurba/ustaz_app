import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:muslim_app/couch/core/domain/models/zikr/zikr.dart';

import 'package:muslim_app/couch/core/infrastructure/repo/couch_repository.dart';

import 'package:muslim_app/couch/zikr/widgets/zikr_tile.dart';

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
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Зикр'),
        centerTitle: true,
      ),
      body: FutureBuilder<List<Zikr>>(
          future: CouchRepository().getZikras(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.separated(
                padding: EdgeInsets.zero,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  final zikr = snapshot.data![index];
                  return ZikrTile(
                    onTap: () {
                      HapticFeedback.vibrate();
                    },
                    zikr: zikr,
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

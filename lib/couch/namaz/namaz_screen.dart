import 'package:flutter/material.dart';
import 'package:muslim_app/core/custom_page_route.dart';
import 'package:muslim_app/couch/core/domain/models/namaz/namaz.dart';
import 'package:muslim_app/couch/core/infrastructure/repo/couch_repository.dart';
import 'package:muslim_app/couch/namaz/namaz_detail_screen.dart';

class NamazScreen extends StatelessWidget {
  const NamazScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Намаз'),
        centerTitle: true,
      ),
      body: FutureBuilder<List<Namaz>>(
        future: CouchRepository().getNamazes(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final data = snapshot.data!;
            return ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: data.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      CustomPageRoute(
                        child: NamazDetailScreen(
                          namaz: data[index],
                        ),
                      ),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.greenAccent,
                    ),
                    child: Text(data[index].name),
                  ),
                );
              },
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

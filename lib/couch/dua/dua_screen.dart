import 'package:flutter/material.dart';
import 'package:muslim_app/couch/core/domain/models/dua/dua.dart';
import 'package:muslim_app/couch/core/infrastructure/repo/couch_repository.dart';
import 'package:muslim_app/couch/core/presentation/couch_back_button.dart';

class DuaScreen extends StatelessWidget {
  const DuaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text('Дуа',style: TextStyle(color: Colors.green),),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.green,
            )),
      ),
      body: FutureBuilder<List<Dua>>(
        future: CouchRepository().getDuas(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final duas = snapshot.data!;
            return ListView.separated(
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    duas[index].name,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  subtitle: Column(
                    children: [
                      Text(
                        duas[index].originalText,
                        textAlign: TextAlign.right,
                        textDirection: TextDirection.rtl,
                        style: const TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        duas[index].transcriptionText,
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          duas[index].translatedText,
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.green,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) => const Divider(),
              itemCount: duas.length,
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

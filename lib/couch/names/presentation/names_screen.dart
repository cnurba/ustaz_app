import 'package:flutter/material.dart';
import 'package:muslim_app/couch/core/domain/models/name/names.dart';
import 'package:muslim_app/couch/core/infrastructure/repo/couch_repository.dart';


class NamesScreen extends StatelessWidget {
  const NamesScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Аллахтын 99 аты'),
        backgroundColor: Colors.green,
      ),
      body: FutureBuilder<List<Names>>(
          future: CouchRepository().getNames(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final names = snapshot.data!;
              return ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: names.length,
                itemBuilder: (context, index) {
                  final name = names[index];
                  return ListTile(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          flex: 4,
                          child: Text(
                            '${index + 1}. ${name.nameRu}',
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 2,
                          child: Text(
                            name.nameAr,
                            textDirection: TextDirection.rtl,
                            style: const TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    subtitle: Text(
                      name.description,
                      style: TextStyle(
                        color: Colors.grey[500],
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  );
                },
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}

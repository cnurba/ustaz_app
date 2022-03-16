import 'package:flutter/material.dart';
import 'package:muslim_app/couch/names/domain/names.dart';
import 'package:muslim_app/couch/names/infrastructure/repos/names_repository.dart';

class NamesScreen extends StatefulWidget {
  const NamesScreen({Key? key}) : super(key: key);

  @override
  State<NamesScreen> createState() => _NamesScreenState();
}

class _NamesScreenState extends State<NamesScreen> {
  List<Names> names = [];

  @override
  void initState() {
    initData();
    super.initState();
    
  }

  Future<void> initData() async {
    final rep = NamesRepository();
    final eski = await rep.getDataFromAssets();
    names.addAll(eski);
    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Аллахтын 99 аты'),
      ),
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: names.length,
        itemBuilder: (context, index) {
          final name = names[index];
          return ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${index + 1}. ${name.nameRu}',
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  name.nameAr,
                  style: const TextStyle(
                      fontSize: 25, fontWeight: FontWeight.bold),
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
      ),
    );
  }
}

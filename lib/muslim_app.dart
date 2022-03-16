import 'package:flutter/material.dart';
import 'package:muslim_app/couch/couch_screen.dart';


class MuslimApp extends StatelessWidget {
  const MuslimApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CouchScreen(),
    );
  }
}

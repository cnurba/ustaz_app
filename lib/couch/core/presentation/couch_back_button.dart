import 'package:flutter/material.dart';

class CouchBackButton extends StatelessWidget {
  const CouchBackButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
      },
      child: const CircleAvatar(
        child: Icon(Icons.arrow_back_ios_new),
        backgroundColor: Colors.green,
      ),
    );
  }
}

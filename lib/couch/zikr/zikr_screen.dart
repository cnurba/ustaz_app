import 'package:flutter/material.dart';
import 'package:muslim_app/couch/language/presentation/widgets/language_step_button.dart';
import 'package:muslim_app/couch/zikr/rotation.dart';

class ZikrScreen extends StatefulWidget {
  const ZikrScreen({Key? key}) : super(key: key);

  @override
  State<ZikrScreen> createState() => _ZikrScreenState();
}

class _ZikrScreenState extends State<ZikrScreen> {
  Offset pozition = Offset(0, 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(), body: ListView(
      children: [
        RotAnim(child: LanguageStepButton(title: 'Кнопка',onTap: (){},))
      ],
    ));
  }
}

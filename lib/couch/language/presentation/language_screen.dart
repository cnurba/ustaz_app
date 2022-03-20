import 'package:flutter/material.dart';
import 'package:muslim_app/couch/core/presentation/couch_back_button.dart';
import 'package:muslim_app/couch/language/presentation/widgets/language_step_button.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ListView(
            padding:
                const EdgeInsets.all(16).add(const EdgeInsets.only(top: 30)),
            children: const [
              Text(
                'Араб тили I',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              LanguageStepButton(title: 'Бул\nэмне?'),

              LanguageStepButton(title: 'Тааны\nшуу?'),
              LanguageStepButton(title: 'Агай?'),

              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceAround,
              //   children: const [
              //     LanguageStepButton(title: 'Тааны\nшуу?'),
              //     LanguageStepButton(title: 'Агай?'),
              //   ],
              // ),
            ],
          ),
          const Positioned(
            top: 30,
            left: 10,
            child:  CouchBackButton(),
          )
        ],
      ),
    );
  }
}

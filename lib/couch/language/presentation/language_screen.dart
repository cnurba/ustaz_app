import 'package:flutter/material.dart';
import 'package:muslim_app/couch/language/presentation/widgets/language_step_button.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 3,
        backgroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const LanguageStepButton(title: 'Бул\nэмне?'),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              LanguageStepButton(title: 'Тааны\nшуу?'),
              LanguageStepButton(title: 'Агай?'),
            ],
          ),
        ],
      ),
    );
  }
}

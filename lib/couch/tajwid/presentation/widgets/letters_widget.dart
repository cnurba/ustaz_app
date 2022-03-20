import 'package:flutter/material.dart';

class LettersWidget extends StatelessWidget {
  const LettersWidget({
    Key? key,
    required this.letters,
  }) : super(key: key);

  final List<String> letters;

  @override
  Widget build(BuildContext context) {
    return letters.isNotEmpty?  Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Тамгалар:',
          style: TextStyle(fontSize: 16),
        ),
        GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: letters.length,
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 100,
            childAspectRatio: 3 / 2,
          ),
          itemBuilder: (context, index) {
            return Card(
              color: const Color.fromARGB(255, 192, 119, 118),
              child: Center(
                child: Text(
                  letters[index],
                  style: const TextStyle(fontSize: 18),
                ),
              ),
            );
          },
        ),
      ],
    ):Container();
  }
}

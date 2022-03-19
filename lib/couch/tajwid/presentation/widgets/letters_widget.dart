import 'package:flutter/material.dart';

class LettersWidget extends StatelessWidget {
  const LettersWidget({
    Key? key,
    required this.letters,
  }) : super(key: key);

  final List<String> letters;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: SizedBox(
        height: 50,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: letters.length,
          itemBuilder: (context, index) {
            return Container(
              width: 50,
              height: 50,
              margin: const EdgeInsets.all(4),
              decoration: const BoxDecoration(color: Colors.white),
              child: Center(
                  child: Text(
                letters[index],
                style: const TextStyle(color: Colors.black, fontSize: 22),
              )),
            );
          },
        ),
      ),
    );
  }
}

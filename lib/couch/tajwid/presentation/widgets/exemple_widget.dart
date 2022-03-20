import 'package:flutter/material.dart';

class ExampleWidget extends StatelessWidget {
  const ExampleWidget({Key? key, required this.examples}) : super(key: key);

  final List<String> examples;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Мисалдар:',
          style: TextStyle(fontSize: 18),
        ),
        GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: examples.length,
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 100,
            childAspectRatio: 3 / 2,
          ),
          itemBuilder: (context, index) {
            return Card(
              color: Colors.greenAccent,
              child: Center(
                child: Text(
                  examples[index],
                  style: const TextStyle(fontSize: 22),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}

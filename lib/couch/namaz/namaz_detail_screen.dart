import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:muslim_app/couch/core/domain/models/namaz/namaz.dart';

class NamazDetailScreen extends StatelessWidget {
  const NamazDetailScreen({
    Key? key,
    required this.namaz,
  }) : super(key: key);

  final Namaz namaz;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(namaz.name),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: namaz.steps.length,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          final namazStep = namaz.steps[index];
          return Column(
            children: [
              Stack(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        flex: 1,
                        child: SvgPicture.asset(
                          namazStep.imageUrl,
                          height: MediaQuery.of(context).size.height / 5,
                        ),
                      ),
                      Flexible(
                        flex: 2,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(namazStep.title),
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    right: 16,
                    top: 0,
                    child: CircleAvatar(
                      backgroundColor: Colors.green,
                      child: Text("${namazStep.step}"),
                    ),
                  ),
                ],
              ),
              ListView.builder(
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(vertical: 8),
                itemCount: namazStep.prays.length,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final pray = namazStep.prays[index];
                  return Card(
                    elevation: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Align(
                            alignment: Alignment.topRight,
                            child: Text(
                              pray.prayAr,
                              textDirection: TextDirection.rtl,
                              style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.green,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            "Оклушу:",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(pray.prayTranscription),
                          const SizedBox(height: 8),
                          const Text(
                            "Мааниси:",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(pray.prayKg),
                          pray.title.isNotEmpty
                              ? Align(
                                  alignment: Alignment.bottomRight,
                                  child: Text(pray.title),
                                )
                              : Container(),
                        ],
                      ),
                    ),
                  );
                },
              )
            ],
          );
        },
      ),
    );
  }
}

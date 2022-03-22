import 'package:flutter/material.dart';
import 'package:muslim_app/couch/core/domain/models/zikr/zikr.dart';

class ZikirDetailScrren extends StatelessWidget {
  const ZikirDetailScrren({
    Key? key,
    required this.zikr,
  }) : super(key: key);

  final Zikr zikr;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Зикир чалуу'),
        backgroundColor: Colors.green,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          AspectRatio(
            aspectRatio: 0.9,
            child: ListTile(
              title: Text(
                zikr.nameAr,
                textDirection: TextDirection.rtl,
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8),
                  const Text(
                    "Окулушу:",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    zikr.name,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Мааниси:",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    zikr.nameKg,
                    style: const TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.green,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 47,
                      child: Text(
                        '0/0',
                        style: TextStyle(fontSize: 22, color: Colors.green),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  InkWell(
                    onTap: () {},
                    child: CircleAvatar(
                      radius: MediaQuery.of(context).size.width / 10,
                      child: const Icon(
                        Icons.update,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              InkWell(
                onTap: () {},
                child: CircleAvatar(
                  backgroundColor: Colors.green,
                  radius: MediaQuery.of(context).size.width / 4,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

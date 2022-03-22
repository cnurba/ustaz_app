import 'package:flutter/material.dart';

class ShahadaScreen extends StatelessWidget {
  const ShahadaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.green),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height / 5),
            Image(
                image: Image.asset(
              'assets/data/shahada/shahada.jpeg',
              scale: 2.2,
            ).image),
            const SizedBox(height: 20),
            const Text(
              ' لا اله الا الله محمد رسول الله',
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            const Text(
              'Бир Алладан башка сыйынууга татыктуу зат жок, Мухаммад (с.а.в) Алланын элчиси.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

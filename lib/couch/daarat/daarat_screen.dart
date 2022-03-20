import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:muslim_app/couch/core/domain/models/daarat/daarat.dart';
import 'package:muslim_app/couch/core/infrastructure/repo/couch_repository.dart';
import 'package:muslim_app/couch/core/presentation/couch_back_button.dart';

class DaaratScreen extends StatefulWidget {
  const DaaratScreen({Key? key}) : super(key: key);

  @override
  State<DaaratScreen> createState() => _DaaratScreenState();
}

class _DaaratScreenState extends State<DaaratScreen> {
  PageController controller = PageController();

  double? countPage = 0;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (controller.page == countPage) {
            controller.jumpTo(1);
          } else {
            controller.nextPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.ease);
          }
        },
        child: const Icon(
          Icons.arrow_right,
        ),
        backgroundColor: Colors.green,
      ),
      body: FutureBuilder<List<Daarat>>(
        future: CouchRepository().getDaarats(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            countPage = double.tryParse((snapshot.data!.length - 1).toString());
            return PageView.builder(
              controller: controller,
              physics: const BouncingScrollPhysics(),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final daarat = snapshot.data![index];
                return Stack(
                  children: [
                    Card(
                      margin: const EdgeInsets.all(16)
                          .add(const EdgeInsets.only(top: 40)),
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.green,
                              child: Text(
                                "${index + 1}",
                                style: const TextStyle(
                                  fontSize: 22,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            Center(
                              child: SvgPicture.asset(
                                daarat.imageUrl,
                                width: MediaQuery.of(context).size.width - 300,
                                height: MediaQuery.of(context).size.height / 3,
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Divider(color: Colors.green, thickness: 3),
                            ),
                            Text(
                              daarat.description,
                              style: const TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(height: 30),
                            Visibility(
                              visible: index == 0,
                              child: const Text(
                                'Бисмилляхи Рохмаанир Рохиим',
                                style: TextStyle(
                                  fontSize: 22,
                                  fontStyle: FontStyle.italic,
                                  color: Colors.green,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: kBottomNavigationBarHeight,
                      left: 10,
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back_ios_new),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                  ],
                );
              },
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

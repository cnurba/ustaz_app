import 'package:flutter/material.dart';

/// Couch button to display in couch screens.
class CouchButton extends StatelessWidget {
  const CouchButton({
    Key? key,
    required this.title,
    required this.url,
    this.onTap,
  }) : super(key: key);

  /// Title of the button.
  final String title;
  /// Url address of image assets.
  final String url;
  /// Action 
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      focusColor: Colors.grey,
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.shade100,
                  offset: const Offset(-5, -5),
                  blurRadius: 1,
                  spreadRadius: 1),
              const BoxShadow(
                  color: Colors.grey,
                  offset: Offset(5, 5),
                  blurRadius: 1,
                  spreadRadius: 1),
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image(image: Image.asset(url).image),
            Text(
              title,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class DetailsCard extends StatelessWidget {
  const DetailsCard({Key? key, required this.title, required this.data})
      : super(key: key);

  final String title;
  final String data;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(5),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
            ),
            Text(data),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class LeafletContainer extends StatelessWidget {
  @override
  const LeafletContainer(
      {super.key,
      required this.content,
      required this.image,
      required this.head});

  final String head;
  final String content;
  final Image image;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width - 20,
        maxHeight: double.infinity,
      ),
      child: Column(
        children: [
          Text(
            head,
            textScaleFactor: 1.6,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          image,
          const SizedBox(height: 5),
          Text(
            content,
            textScaleFactor: 1.3,
          ),
          const SizedBox(height: 15),
        ],
      ),
    );
  }
}

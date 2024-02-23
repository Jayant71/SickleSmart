import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sicklesmart/providers/_provider.dart';

class DisplayProfie extends ConsumerWidget {
  const DisplayProfie({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final db = ref.watch(databaseInstanceProvider);
    return Card(
      child: ListView(
        children: [],
      ),
    );
  }

  Widget buildInfoCard(IconData icon, String text) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        leading: Icon(icon, color: Colors.blue),
        title: Text(text),
      ),
    );
  }
}

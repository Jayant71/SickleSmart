import "package:flutter/material.dart";
import "package:sicklesmart/layouts/mobilelayout.dart";
import "package:sicklesmart/layouts/tablayout.dart";

class Layout extends StatefulWidget {
  const Layout({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LayoutState createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      switch (constraints) {
        case BoxConstraints(minWidth: 800):
          return const TabLayout();

        default:
          return const MobileLayout();
      }
    });
  }
}

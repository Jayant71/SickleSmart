import 'package:flutter/material.dart';
import 'package:sicklesmart/contents/strings.dart';
import 'package:sicklesmart/widgets/leafletcontainer.dart';
import 'package:transparent_image/transparent_image.dart';

class LeafletScreen extends StatefulWidget {
  const LeafletScreen({super.key});

  @override
  State<LeafletScreen> createState() => _LeafletScreenState();
}

class _LeafletScreenState extends State<LeafletScreen> {
  final _pageController = PageController(initialPage: 0);

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final leaflet = Leaflet();
    final containerContent = [
      [leaflet.subhead1, "assets/leaflet/Leaflet_img1.png", leaflet.p1],
      [leaflet.subhead2, "assets/leaflet/Leaflet_img2.png", leaflet.p2],
      [leaflet.subhead3, "assets/leaflet/Leaflet_img3.png", leaflet.p3],
      [leaflet.subhead4, "assets/leaflet/Leaflet_img4.png", leaflet.p4],
      [leaflet.subhead5, "assets/leaflet/Leaflet_img5.png", leaflet.p5],
      [leaflet.subhead6, "assets/leaflet/Leaflet_img6.png", leaflet.p6],
      [leaflet.subhead7, "", leaflet.p7],
    ];

    return Scaffold(
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        title: const Text("Leaflet"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Text(
              leaflet.heading,
              textScaleFactor: 1.6,
              textAlign: TextAlign.justify,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              leaflet.intro,
              textScaleFactor: 1.3,
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 20),
            // Container(
            //   constraints: BoxConstraints(
            //       maxHeight: MediaQuery.of(context).size.height / 1.3,
            //       maxWidth: MediaQuery.of(context).size.width - 8.0),
            //   child: PageView.builder(
            //       pageSnapping: true,
            //       padEnds: true,
            //       dragStartBehavior: DragStartBehavior.start,
            //       controller: _pageController,
            //       itemCount: 7,
            //       itemBuilder: (BuildContext context, int index) {
            //         return LeafletContainer(
            //           content: containerContent[index][2],
            //           image: Image.asset(containerContent[index][1]),
            //           head: containerContent[index][0],
            //         );
            //       }),
            // ),
            Column(
              children: [
                for (var i = 0; i < containerContent.length; i++)
                  LeafletContainer(
                    content: containerContent[i][2],
                    image: i != 6
                        ? Image.asset(containerContent[i][1])
                        : Image.memory(kTransparentImage),
                    head: containerContent[i][0],
                  ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

import 'package:sicklesmart/widgets/points.dart';
import 'package:flutter/material.dart';

class SJScreen1 extends StatelessWidget {
  const SJScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: MediaQuery.of(context).size.height * 0.35,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset(
                  'assets/images/checkup.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SliverList(
                delegate: SliverChildBuilderDelegate(
              (context, index) => Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.2,
                          height: MediaQuery.of(context).size.height * 0.09,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/icons/poster_img1.jpg"),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.2,
                          height: MediaQuery.of(context).size.height * 0.09,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/icons/poster_img3.jpg"),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Center(
                      child: Container(
                        padding: const EdgeInsets.all(7),
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: 95,
                        decoration: ShapeDecoration(
                          gradient: const LinearGradient(
                            begin: Alignment(0.00, -1.00),
                            end: Alignment(0, 1),
                            colors: [Color(0x1C72D4FF), Color(0xFF90CFEB)],
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(22),
                          ),
                        ),
                        child: const Text(
                          "सिकल सेल एनिमिया की जाँच किनको कराना चाहिए",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 26,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    const Points(
                      bullet: "\u25A0",
                      text: "सभी नवजात",
                    ),
                    const SizedBox(height: 10),
                    const Points(
                      bullet: "\u25A0",
                      text:
                          "अगर बच्चे में विकार है तो माता-पिता, एवं विपरीत भी",
                    ),
                    const SizedBox(height: 10),
                    const Points(
                      bullet: "\u25A0",
                      text:
                          "कोई वयस्क जिसमें तीव्र रक्‍्ताल्पता, कमजोरी, मंद शारीरिक विकास के लक्षण हो",
                    ),
                    const SizedBox(height: 10),
                    const Points(
                      bullet: "\u25A0",
                      text:
                          "नव विवाहित दंपत्ति, गर्भवती माताएं, सिकल वाहक या सिकल रोगी के परिवार व  रिश्तेदार",
                    ),
                    const SizedBox(height: 10),
                    const Points(
                      bullet: "\u25A0",
                      text: "जीवन साथी के चयन के समय (रक्त मिलान के दृष्टि से)",
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
              childCount: 1,
            ))
          ],
        ));
  }
}

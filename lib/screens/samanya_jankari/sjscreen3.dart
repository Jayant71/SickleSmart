import 'package:flutter/material.dart';

class SJScreen3 extends StatelessWidget {
  const SJScreen3({super.key});

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
                  'assets/images/SJ3.jpeg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SliverList(
                delegate: SliverChildBuilderDelegate(
              childCount: 1,
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
                          "सिकल के प्रकार",
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
                    Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      decoration: ShapeDecoration(
                        gradient: const LinearGradient(
                          begin: Alignment(0.00, -1.00),
                          end: Alignment(0, 1),
                          colors: [
                            Color(0xD3FEABA3),
                            Color(0xDDFE6F6B),
                            Color(0xE2FE514E),
                            Color(0xEDFE1313)
                          ],
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                      ),
                      child: const Center(
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text.rich(
                            textAlign: TextAlign.justify,
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: '1. सिकल वाहक या सिकल ट्रेट (AS)\n',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                TextSpan(
                                    text:
                                        'जब बच्चे को माता व पिता दोनों से सिकल के जीन मिले हो तो बच्चा सिकल सेल एनिमिया बीमारी से पीड़ित हो जाता है। उन्हें सिकल की बीमारी के लक्षण कभी भी हो सकते है। इन्हें जीवन भर चिकित्सा की जरूरत होती है।',
                                    style: TextStyle(fontSize: 18)),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Center(
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        decoration: ShapeDecoration(
                          gradient: const LinearGradient(
                            begin: Alignment(0.00, -1.00),
                            end: Alignment(0, 1),
                            colors: [
                              Color(0xD3F3F9FF),
                              Color(0xDD87C7FF),
                              Color(0xED0074C9)
                            ],
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                        ),
                        child: const Center(
                          child: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text.rich(
                              textAlign: TextAlign.justify,
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: '2. सिकल धारक या सिकल सेल रोग (SS)\n',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  TextSpan(
                                      text:
                                          'सिकल वाहक सिकल का एक जीन रखते है, इन्हें कोई तकलीफ नहीं होती ये सामान्य जीवन जीते है। इन्हें किसी भी तरह की चिकित्सा की जरूरत नहीं होती।',
                                      style: TextStyle(fontSize: 18)),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Center(
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: MediaQuery.of(context).size.width * 0.9,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/icons/poster_img8.png'),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ))
          ],
        ));
  }
}

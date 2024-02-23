import 'package:flutter/material.dart';

class SJScreen4 extends StatelessWidget {
  const SJScreen4({super.key});

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
                  (context, index) => Padding(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.2,
                                  height:
                                      MediaQuery.of(context).size.height * 0.09,
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                          "assets/icons/poster_img1.jpg"),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.2,
                                  height:
                                      MediaQuery.of(context).size.height * 0.09,
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                          "assets/icons/poster_img3.jpg"),
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
                                    colors: [
                                      Color(0x1C72D4FF),
                                      Color(0xFF90CFEB)
                                    ],
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(22),
                                  ),
                                ),
                                child: const Text(
                                  "सिकल सेल एनिमिया के लक्षण",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 26,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 15),
                            GridView(
                              physics: const NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 30,
                                crossAxisSpacing: 20,
                              ),
                              shrinkWrap: true,
                              children: [
                                Column(
                                  children: [
                                    Expanded(
                                      child: Image.asset(
                                        'assets/icons/poster_img9.png',
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    const Text(
                                      '1.भूख न लगना',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Expanded(
                                      child: Image.asset(
                                        'assets/icons/poster_img10.png',
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    const Text(
                                      '2.त्वचा एवं आंखों में पीलापन (पीलिया)',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Expanded(
                                      child: Image.asset(
                                        'assets/icons/poster_img11.png',
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    const Text(
                                      '3.थकावट',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Expanded(
                                      child: Image.asset(
                                        'assets/icons/poster_img12.png',
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    const Text(
                                      '4.बुखार',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Expanded(
                                      child: Image.asset(
                                        'assets/icons/poster_img13.png',
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    const Text(
                                      '5.खून की कमी से उत्पन्न एनिमिया',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Expanded(
                                      child: Image.asset(
                                        'assets/icons/poster_img14.png',
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    const Text(
                                      '6.वजन और ऊँचाई सामान्य से कम',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Expanded(
                                      child: Image.asset(
                                        'assets/icons/poster_img15.png',
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    const Text(
                                      '7.बार बार पेशाब जाना मूत्र में गाढ़ापन',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Expanded(
                                      child: Image.asset(
                                        'assets/icons/poster_img16.png',
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    const Text(
                                      '8.सांस लेने में तकलीफ संक्रमण की संभावना',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Expanded(
                                      child: Image.asset(
                                        'assets/icons/poster_img17.png',
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    const Text(
                                      '9.हाथों और पैरों में सूजन ',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Expanded(
                                      child: Image.asset(
                                        'assets/icons/poster_img18.png',
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    const Text(
                                      '10. चिड़चिड़ापन और व्यवहार में बदलाव',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Expanded(
                                      child: Image.asset(
                                        'assets/icons/poster_img19.png',
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    const Text(
                                      '11.पैरों में घाव',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Expanded(
                                      child: Image.asset(
                                        'assets/icons/poster_img20.png',
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    const Text(
                                      '12.हड्डियों और पसलियों में दर्द',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 30),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.9,
                              decoration: ShapeDecoration(
                                gradient: const LinearGradient(
                                  begin: Alignment(0.00, -1.00),
                                  end: Alignment(0, 1),
                                  colors: [
                                    Color(0xD3ADFFB5),
                                    Color(0xDDE7FF87),
                                    Color(0xED14FF00)
                                  ],
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18),
                                ),
                              ),
                              child: const Center(
                                child: Padding(
                                  padding: EdgeInsets.all(12.0),
                                  child: Text(
                                    'उपरोक्त लक्षण होने पर निकटतम अस्पताल / स्वास्थ्य कार्यकता से संपर्क करें। सभी स्वास्थ्य केन्द्रों में सिकल सेल की जाँच एवं उपचार की निःशुल्क सुविधा उपलब्ध है।',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 30),
                          ],
                        ),
                      ),
                  childCount: 1),
            )
          ],
        ));
  }
}

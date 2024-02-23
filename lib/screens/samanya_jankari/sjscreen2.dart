import 'package:sicklesmart/widgets/points.dart';
import 'package:flutter/material.dart';

class SJScreen2 extends StatelessWidget {
  const SJScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: MediaQuery.of(context).size.height * 0.35,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset(
                  'assets/images/samanya_jankari.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              pinned: true,
            ),
            SliverList(
                delegate: SliverChildBuilderDelegate(
                    (context, index) => SizedBox(
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.2,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.09,
                                      decoration: const BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                              "assets/icons/poster_img1.jpg"),
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.2,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.09,
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
                                    width: 310,
                                    height: 95,
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
                                      "सिकल सेल एनिमिया : सामान्य जानकारी",
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
                                  bullet: '1',
                                  text: "सिकल एक अनुवांशिक बीमारी हैं।",
                                ),
                                const SizedBox(height: 15),
                                const Points(
                                  bullet: '2',
                                  text:
                                      "जिसमें रोगी के लाल रक्त कण (RBC) ऑक्सीजन की कमी से हँसिये या सिकल के आकार में बदल जाते है।",
                                ),
                                const SizedBox(height: 15),
                                const Points(
                                  bullet: '3',
                                  text:
                                      "इन कणिकाओं की आयु सामान्य की अपेक्षा कम होती है।",
                                ),
                                const SizedBox(height: 15),
                                const Points(
                                  bullet: '4',
                                  text:
                                      "ये कणिकाएं तिल्‍्ली में जल्दी नष्ट हो जाती है, जिससे खून की कमी अर्थात एनिमिया हो जाता है।",
                                ),
                                const SizedBox(height: 15),
                                const Points(
                                  bullet: '5',
                                  text:
                                      "सिकल रूपी असामान्य कणिकाएं शरीर की विभिन्‍न अंगों की रक्त वाहिनियों में फंसकर उन अंगों मे रक्‍त संचरण में बाघा पहुंचाती है।",
                                ),
                                const SizedBox(height: 15),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        children: [
                                          FittedBox(
                                            child: Image.asset(
                                              "assets/icons/poster_img5.png",
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                          const Text(
                                            'सामान्य लाल_रक्‍त_ कोशिका औसत जीवनकाल 120 दिन',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15,
                                              fontFamily:
                                                  'Tiro Devanagari Hindi',
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        children: [
                                          FittedBox(
                                            child: Image.asset(
                                              "assets/icons/poster_img6.png",
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                          const Text(
                                            'सिकल ग्रस्त लाल रक्‍त कोशिका औसत जीवनकाल 10 से 12 दिन',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15,
                                              fontFamily:
                                                  'Tiro Devanagari Hindi',
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 15),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.8,
                                  height:
                                      MediaQuery.of(context).size.height * 0.06,
                                  decoration: const BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment(0.00, -1.00),
                                      end: Alignment(0, 1),
                                      colors: [
                                        Color(0xD3EB95A1),
                                        Color(0xEDDF3737)
                                      ],
                                    ),
                                  ),
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          "सामान्य एवं सिकल सेल रक्त प्रवाह",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 24,
                                              fontWeight: FontWeight.w400),
                                        )),
                                  ),
                                ),
                                const SizedBox(height: 30),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        children: [
                                          FittedBox(
                                            child: Image.asset(
                                              "assets/icons/poster_img6_5.png",
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                          const Text(
                                            'सामान्य रक्त प्रवाह',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15,
                                              fontFamily:
                                                  'Tiro Devanagari Hindi',
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        children: [
                                          FittedBox(
                                            child: Image.asset(
                                              "assets/icons/poster_img7.png",
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                          const Text(
                                            'अवरूद्ध रक्त प्रवाह',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15,
                                              fontFamily:
                                                  'Tiro Devanagari Hindi',
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 30),
                              ],
                            ),
                          ),
                        ),
                    childCount: 1))
          ],
        ));
  }
}

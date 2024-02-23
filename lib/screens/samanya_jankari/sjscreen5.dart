import 'package:sicklesmart/widgets/points.dart';
import 'package:flutter/material.dart';

class SJScreen5 extends StatelessWidget {
  const SJScreen5({super.key});

  @override
  Widget build(BuildContext context) {
    var yes = 0;
    return Scaffold(
        extendBodyBehindAppBar: true,
        body: yes == 0
            ? CustomScrollView(
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
                                width: MediaQuery.of(context).size.width * 0.2,
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
                                "सिकल सेल रोगी हेतु सुझाव",
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
                            text:
                                "रोग ग्रसित बच्चे को पेनिसिलिन एवं फोलिक एसिड की गोली देंवें।",
                          ),
                          const SizedBox(height: 10),
                          const Points(
                            bullet: "\u25A0",
                            text: "हिमोग्लोबिन की जॉच हर माह करावें।",
                          ),
                          const SizedBox(height: 10),
                          const Points(
                            bullet: "\u25A0",
                            text: "खून अधिकृत रक्‍्तकोष से ही प्राप्त करें।",
                          ),
                          const SizedBox(height: 10),
                          const Points(
                            bullet: "\u25A0",
                            text:
                                "आयरन की गोली या टॉनिक चिकित्सक की सलाह से ही देवें।",
                          ),
                          const SizedBox(height: 10),
                          const Points(
                            bullet: "\u25A0",
                            text: "सुपाच्य भोजन देवें।",
                          ),
                          const SizedBox(height: 10),
                          const Points(
                            bullet: "\u25A0",
                            text:
                                "सिकल सेल रोग अनुवांशिक है तथा किसी भी पद्धति में इसे ठीक करने का उपचार उपलब्ध नहीं है, अत: इस रोग के उपचार हेतु जड़ीबूटी इलाज, नीम-हकीम, झाड़-फूँक, गुनिया-बैगा, आदि प्रपंच में पड़ने से बचें।",
                          ),
                          const SizedBox(height: 15),
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
                  ))
                ],
              )
            : ListView(
                padding: EdgeInsets.zero,
                children: [
                  Stack(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.45,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/SJ3.jpeg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 340),
                        child: Container(
                          width: double.infinity,
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 210),
                            child: Padding(
                              padding: const EdgeInsets.all(30.0),
                              child: Column(
                                children: [
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.9,
                                    height: MediaQuery.of(context).size.height *
                                        0.6,
                                    decoration: ShapeDecoration(
                                      gradient: const LinearGradient(
                                        begin: Alignment(0.00, -1.00),
                                        end: Alignment(0, 1),
                                        colors: [
                                          Color(0x9EF06565),
                                          Color(0xEAFE5D5D),
                                          Color(0xFFFF4242),
                                          Color(0x5BF13131)
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
                                        '1.रोग ग्रसित बच्चे को पेनिसिलिन एवं फोलिक एसिड की गोली देंवें।\n\n 2.हिमोग्लोबिन की जॉच हर माह करावें।\n\n 3.खून अधिकृत रक्‍्तकोष से ही प्राप्त करें।\n\n 4.आयरन की गोली या टॉनिक चिकित्सक की सलाह से ही देवें।\n\n 5.सुपाच्य भोजन देवें।\n\n 6.सिकल सेल रोग अनुवांशिक है तथा किसी भी पद्धति में इसे ठीक करने का उपचार उपलब्ध नहीं है, अत: इस रोग के उपचार हेतु जड़ीबूटी इलाज, नीम-हकीम, झाड़-फूँक, गुनिया-बैगा, आदि प्रपंच में पड़ने से बचें।',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    )),
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.03,
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.9,
                                    height: MediaQuery.of(context).size.height *
                                        0.15,
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
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),

                      //upper part
                      Padding(
                        padding: const EdgeInsets.only(top: 370),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.2,
                              height: MediaQuery.of(context).size.height * 0.09,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                      "assets/icons/poster_img1.jpg"),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.2,
                              height: MediaQuery.of(context).size.height * 0.09,
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
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 350),
                        child: Center(
                          child: SizedBox(
                            height: 4,
                            width: 140,
                            child: Container(
                              color: Colors.blueGrey,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 445),
                        child: Center(
                          child: Container(
                            padding: const EdgeInsets.all(7),
                            width: 310,
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
                            child: const Center(
                              child: Text(
                                "सिकल सेल रोगी हेतु सुझाव",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 26,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ));
  }
}

import 'package:fluttertoast/fluttertoast.dart';
import 'package:sicklesmart/screens/medicalreport.dart';
import 'package:sicklesmart/screens/registration/profilepage.dart';
import 'package:sicklesmart/screens/samanya_jankari/samanyasankarimenu.dart';
import 'package:sicklesmart/screens/about.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sicklesmart/contents/strings.dart';
import 'package:sicklesmart/screens/leaflet.dart';
import 'package:sicklesmart/screens/registration/welcomeauth.dart';
import 'package:sicklesmart/utils/mapscreen.dart';
import 'package:sicklesmart/widgets/carousalcards.dart';

import '../providers/_provider.dart';
import 'booklet/book.dart';
import 'marriagecounselor.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final content = Introduction();
    final auth = ref.read(authenticationProvider);
    late ImageProvider profileImage;
    if (auth.currentUser != null) {
      profileImage = NetworkImage(auth.currentUser.photoURL);
    } else {
      profileImage = const AssetImage("assets/icons/img_1.png");
    }
    // debugPrint(auth.currentUser{'displayName'});
    return Scaffold(
      drawer: Drawer(
        width: 260,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 2,
        child: Column(
          children: [
            DrawerHeader(
              margin: const EdgeInsets.all(5),
              child: Center(
                child: Column(
                  children: [
                    Expanded(
                      child: CircleAvatar(
                          radius: 35, backgroundImage: profileImage),
                    ),
                    const SizedBox(height: 10),
                    Expanded(
                      child: Text(
                        auth.currentUser != null
                            ? auth.currentUser.displayName
                            : "Sickle Smart",
                        style: const TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.5),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text(
                "Profile",
                style: TextStyle(),
              ),
              onTap: () async {
                Navigator.of(context).pop();

                if (auth.currentUser == null) {
                  ScaffoldMessenger.of(context).clearSnackBars();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("No users currently signed in "),
                    ),
                  );
                  return;
                }
                final data = await ref
                    .watch(databaseInstanceProvider)
                    .collection('users')
                    .doc(auth.currentUser.uid)
                    .get();
                WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (ctx) => ProfilePage(
                            userData: data.data(),
                          )));
                });
              },
            ),
            const Divider(height: 0, thickness: 0),
            ListTile(
              leading: const Icon(Icons.medical_services),
              title: const Text(
                "Marriage Counsellor",
                style: TextStyle(),
              ),
              onTap: () {
                Navigator.of(context).pop();
                WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (ctx) => const MarriageCounselorScreen()));
                });
              },
            ),
            const Divider(
              height: 0,
              thickness: 0,
            ),
            ListTile(
              leading: const Icon(Icons.medical_services),
              title: const Text(
                "Test Centers",
                style: TextStyle(),
              ),
              onTap: () {
                Navigator.of(context).pop();
                WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (ctx) => const MapScreen()));
                });
              },
            ),
            const Divider(height: 0, thickness: 0),
            ListTile(
              leading: const Icon(Icons.medical_services),
              title: const Text(
                "Tests and Medications",
                style: TextStyle(),
              ),
              onTap: () {
                if (currentUser == null) {
                  Navigator.of(context).pop();
                  ScaffoldMessenger.of(context).clearSnackBars();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Please sign in to view this page"),
                    ),
                  );
                  return;
                }
                Navigator.of(context).pop();
                WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (ctx) => const MedicalReport()));
                });
              },
            ),
            const Divider(height: 0, thickness: 0),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text(
                "About Us",
                style: TextStyle(),
              ),
              onTap: () {
                Navigator.of(context).pop();
                WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (ctx) => const AboutUsPage()));
                });
              },
            ),
            const Divider(height: 0, thickness: 0),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text("Logout", style: TextStyle()),
              onTap: () async {
                if (auth.isUserLoggedIn == false) {
                  Navigator.of(context).pop();
                  ScaffoldMessenger.of(context).clearSnackBars();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("No users currently signed in"),
                    ),
                  );
                  return;
                }
                try {
                  showDialog(
                    context: context,
                    builder: (ctx) => const Center(
                      child: CircularProgressIndicator(),
                    ),
                    barrierDismissible: false,
                  );
                  await auth.signOut().whenComplete(
                    () {
                      Navigator.of(context).pop();
                      Fluttertoast.showToast(
                          msg: "Logged out", toastLength: Toast.LENGTH_SHORT);
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: ((context) => const WelcomeAuthScreen())));
                      Future.delayed(const Duration(milliseconds: 1000), () {});
                    },
                  );
                } on FirebaseAuthException catch (e) {
                  debugPrint('Failed with error code: ${e.code}');
                  debugPrint(e.message);
                }
              },
            ),
            const Divider(height: 0, thickness: 0),
          ],
        ),
      ),
      appBar: AppBar(
        elevation: 2,
        title: const Text(
          "Sickle Smart",
          style: TextStyle(letterSpacing: 1.5, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(8.0, 15, 8.0, 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // CarouselSlider(
            //   items: const [
            //     CarouselCard(
            //         imgURL:
            //             "https://i.pinimg.com/564x/11/cf/f6/11cff68d627137bf01e3fe0d37afea7e.jpg"),
            //     CarouselCard(
            //         imgURL:
            //             "https://st2.depositphotos.com/29714596/48271/v/450/depositphotos_482712580-stock-illustration-sickle-cell-disease-awareness-month.jpg"),
            //     CarouselCard(
            //         imgURL:
            //             "https://media.istockphoto.com/id/529560031/vector/anemia.jpg?s=612x612&w=0&k=20&c=44to9aVwILIxHq1Obl9cV8awOwHWyjYeEStUfTnk1qU="),
            //     CarouselCard(
            //         imgURL:
            //             "https://medlineplus.gov/images/PX0002N8_PRESENTATION.jpeg"),
            //   ],
            //   options: CarouselOptions(
            //     enlargeCenterPage: true,
            //     autoPlay: true,
            //     autoPlayCurve: Curves.easeIn,
            //   ),
            // ),
            // const SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: const Text(
                    "उद्देश्य",
                    textScaleFactor: 2,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  )
                      .animate()
                      .fadeIn(duration: const Duration(milliseconds: 1000)),
                ),
                Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                      side: const BorderSide(color: Colors.black, width: 2),
                      borderRadius: BorderRadius.circular(16)),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      content.intro,
                      textScaleFactor: 1.3,
                      style: const TextStyle(),
                      textAlign: TextAlign.justify,
                    ).animate().fadeIn(
                          duration: const Duration(milliseconds: 1000),
                        ),
                  ),
                )
                    .animate()
                    .fadeIn(duration: const Duration(milliseconds: 1000)),
                const SizedBox(height: 15),
                InkWell(
                  borderRadius: BorderRadius.circular(10),
                  onTap: () {
                    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (ctx) => const SamanyaJankariMenu()));
                    });
                  },
                  child: Ink(
                    height: MediaQuery.of(context).size.height / 6,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.centerRight,
                            end: Alignment.centerLeft,
                            colors: [
                              Colors.red.withOpacity(.99),
                              Colors.red.withOpacity(.85),
                              Colors.red.withOpacity(.52),
                            ]),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                        color: Colors.red.shade400),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          flex: 0,
                          child: Image(
                            fit: BoxFit.scaleDown,
                            image: AssetImage("assets/icons/samanya_gyan.png"),
                          ),
                        ),
                        Expanded(
                          flex: 0,
                          child: FittedBox(
                            fit: BoxFit.contain,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "सामान्य जानकारी",
                                  textScaleFactor: 2,
                                  style: TextStyle(
                                    // fontSize: 35,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                                Text(
                                  "प्रकार, लक्षण, सुझाव एवं अन्य \n सामान्य जानकारियां।",
                                  textScaleFactor: 1.1,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      // fontSize: 20,
                                      fontStyle: FontStyle.italic),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                InkWell(
                  borderRadius: BorderRadius.circular(10),
                  onTap: () {
                    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (ctx) => Booklet()));
                    });
                  },
                  child: Ink(
                    height: MediaQuery.of(context).size.height / 6,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.centerRight,
                            end: Alignment.centerLeft,
                            colors: [
                              Colors.red.withOpacity(.99),
                              Colors.red.withOpacity(.85),
                              Colors.red.withOpacity(.52),
                            ]),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                        color: Colors.red.shade400),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          flex: 0,
                          child: Image(
                            fit: BoxFit.scaleDown,
                            image: AssetImage("assets/icons/booklet.png"),
                          ),
                        ),
                        Expanded(
                          flex: 0,
                          child: FittedBox(
                            fit: BoxFit.contain,
                            child: Column(
                              children: [
                                Text(
                                  "पुस्तिका",
                                  textScaleFactor: 2,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                                Text(
                                  "इलाज, तथ्य, सिकल प्रसार, \nजांच, एवं अन्य चीजों के बारे में।",
                                  textScaleFactor: 1.1,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontStyle: FontStyle.italic),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                InkWell(
                  borderRadius: BorderRadius.circular(10),
                  onTap: () {
                    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (ctx) => const LeafletScreen()));
                    });
                  },
                  child: Ink(
                    height: MediaQuery.of(context).size.height / 6,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.centerRight,
                            end: Alignment.centerLeft,
                            colors: [
                              Colors.red.withOpacity(.99),
                              Colors.red.withOpacity(.85),
                              Colors.red.withOpacity(.52),
                            ]),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                        color: Colors.red.shade400),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          flex: 0,
                          child: Image(
                            fit: BoxFit.scaleDown,
                            image: AssetImage("assets/icons/leaflet.png"),
                          ),
                        ),
                        Expanded(
                          flex: 0,
                          child: FittedBox(
                            fit: BoxFit.contain,
                            child: Column(
                              children: [
                                Text(
                                  "लीफलेट",
                                  textScaleFactor: 2,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                                Text(
                                  "अभिभावकों, शिक्षकों, एवं \nसहपाठिको के लिए।",
                                  textScaleFactor: 1.1,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontStyle: FontStyle.italic),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

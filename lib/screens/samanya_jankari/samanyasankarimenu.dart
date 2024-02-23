import 'package:sicklesmart/screens/samanya_jankari/sjscreen1.dart';
import 'package:sicklesmart/screens/samanya_jankari/sjscreen2.dart';
import 'package:sicklesmart/screens/samanya_jankari/sjscreen3.dart';
import 'package:sicklesmart/screens/samanya_jankari/sjscreen4.dart';
import 'package:sicklesmart/screens/samanya_jankari/sjscreen5.dart';
import 'package:sicklesmart/widgets/menucard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SamanyaJankariMenu extends StatelessWidget {
  const SamanyaJankariMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "सामान्य जानकारी",
          style: TextStyle(
              color: Colors.white, fontSize: 36, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(248, 40, 40, 275),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [const Color(0xFFFF2929), Colors.black.withOpacity(1)],
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(30, 15, 30, 30),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SizedBox(height: 10),
                InkWell(
                    onTap: () {
                      Navigator.of(context).push(CupertinoPageRoute(
                          builder: (context) => const SJScreen1()));
                    },
                    child: const SizedBox(
                      width: double.infinity,
                      child: Card(
                        color: Colors.white,
                        elevation: 10,
                        child: Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Text(
                            "जाँच किनको करनी चाहिए",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 24,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    )),
                const SizedBox(height: 30),
                InkWell(
                    onTap: () {
                      Navigator.of(context).push(CupertinoPageRoute(
                          builder: (context) => const SJScreen2()));
                    },
                    child: const Card(
                      color: Colors.white,
                      elevation: 10,
                      child: SizedBox(
                        width: double.infinity,
                        child: Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Text(
                            "सामान्य जानकारी",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 24,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    )),
                const SizedBox(height: 30),
                InkWell(
                    onTap: () {
                      Navigator.of(context).push(CupertinoPageRoute(
                          builder: (context) => const SJScreen3()));
                    },
                    child: const SizedBox(
                      width: double.infinity,
                      child: Card(
                        color: Colors.white,
                        elevation: 10,
                        child: Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Text(
                            "सिकल सेल के प्रकार",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 24,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    )),
                const SizedBox(height: 30),
                InkWell(
                    onTap: () {
                      Navigator.of(context).push(CupertinoPageRoute(
                          builder: (context) => const SJScreen4()));
                    },
                    child: const SizedBox(
                      width: double.infinity,
                      child: Card(
                        color: Colors.white,
                        elevation: 10,
                        child: Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Text(
                            "सिकल सेल एनीमिया के लक्षण",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 24,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    )),
                const SizedBox(height: 30),
                InkWell(
                    onTap: () {
                      Navigator.of(context).push(CupertinoPageRoute(
                          builder: (context) => const SJScreen5()));
                    },
                    child: const SizedBox(
                      width: double.infinity,
                      child: Card(
                        color: Colors.white,
                        elevation: 10,
                        child: Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Text(
                            "सिकल सेल रोगी हेतु सुझाव",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 24,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    )),
                const SizedBox(height: 30),
                // const MenuCard(alignment: Alignment.centerRight),
                // const SizedBox(height: 30),
                // const MenuCard(alignment: Alignment.centerLeft),
                // const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

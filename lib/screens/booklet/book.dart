// ignore_for_file: sized_box_for_whitespace

import 'package:sicklesmart/widgets/buttonpoint.dart';
import 'package:sicklesmart/widgets/points.dart';
import 'package:flutter/material.dart';

import '../../contents/strings.dart';

class Booklet extends StatelessWidget {
  Booklet({super.key});
  final book = BookletContent();
  final PageController _controller = PageController();

  void jumpToPage(int page) {
    _controller.jumpToPage(page);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        extendBodyBehindAppBar: true,
        body: PageView(
          physics: const BouncingScrollPhysics(),
          controller: _controller,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                'assets/images/bookletfront.png',
                fit: BoxFit.fill,
              ),
            ),
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8.0, 50, 20, 20),
                    child: Center(
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          gradient: const LinearGradient(
                            colors: [
                              Color.fromARGB(255, 254, 63, 89),
                              Color.fromARGB(255, 252, 182, 159),
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                        child: const Text(
                          "Contents",
                          textScaleFactor: 2,
                        ),
                      ),
                    ),
                  ),
                  ButtonPoint(
                    bullet: "\u25A0  ${book.page1Heading}",
                    onPressed: () {
                      jumpToPage(2);
                    },
                  ),
                  ButtonPoint(
                    bullet: "\u25A0  ${book.page2Heading}",
                    onPressed: () {
                      jumpToPage(3);
                    },
                  ),
                  ButtonPoint(
                    bullet: "\u25A0  ${book.page3Heading}",
                    onPressed: () {
                      jumpToPage(4);
                    },
                  ),
                  ButtonPoint(
                    bullet: "\u25A0  ${book.page4Heading}",
                    onPressed: () {
                      jumpToPage(5);
                    },
                  ),
                  ButtonPoint(
                    bullet: "\u25A0  ${book.page5Heading}",
                    onPressed: () {
                      jumpToPage(6);
                    },
                  ),
                  ButtonPoint(
                    bullet: "\u25A0  ${book.page6Heading}",
                    onPressed: () {
                      jumpToPage(7);
                    },
                  ),
                  ButtonPoint(
                    bullet: "\u25A0  ${book.page7Heading}",
                    onPressed: () {
                      jumpToPage(8);
                    },
                  ),
                  ButtonPoint(
                    bullet: "\u25A0  ${book.page8Heading}",
                    onPressed: () {
                      jumpToPage(9);
                    },
                  ),
                  ButtonPoint(
                    bullet: "\u25A0  ${book.page9Heading}",
                    onPressed: () {
                      jumpToPage(10);
                    },
                  ),
                  ButtonPoint(
                    bullet: "\u25A0  ${book.page10Heading1}",
                    onPressed: () {
                      jumpToPage(11);
                    },
                  ),
                  ButtonPoint(
                    bullet: "\u25A0  ${book.page10Heading2}",
                    onPressed: () {
                      jumpToPage(12);
                    },
                  ),
                  ButtonPoint(
                    bullet: "\u25A0  ${book.page11Heading}",
                    onPressed: () {
                      jumpToPage(13);
                    },
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Column(
                children: [
                  const SizedBox(height: 50),
                  Container(
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: const LinearGradient(
                        colors: [
                          Color.fromARGB(255, 254, 63, 89),
                          Color.fromARGB(255, 252, 182, 159),
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                    child: Text(book.page1Heading,
                        textScaleFactor: 2,
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    book.page1Para1,
                    textScaleFactor: 1.3,
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(height: 15),
                  Points(
                    text: book.page1Para2,
                    bullet: "\u25A0",
                  ),
                  const SizedBox(height: 15),
                  Points(
                    text: book.page1Para3,
                    bullet: "\u25A0",
                  ),
                  const SizedBox(height: 15),
                  Points(
                    text: book.page1Para4,
                    bullet: "\u25A0",
                  ),
                  const SizedBox(height: 15),
                  Points(
                    text: book.page1Para5,
                    bullet: "\u25A0",
                  ),
                  const SizedBox(height: 15),
                  Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: const LinearGradient(
                        colors: [
                          Color.fromARGB(255, 254, 63, 89),
                          Color.fromARGB(255, 252, 182, 159),
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: '${book.page1Para6.substring(0, 33)}\n',
                            style: const TextStyle(
                              fontSize: 17,
                              decoration: TextDecoration.underline,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: '${book.page1Para6.substring(34, 51)}\n',
                            style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: book.page1Para6.substring(53),
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),
                ],
              ),
            ),
            SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Column(
                children: [
                  const SizedBox(height: 50),
                  Container(
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: const LinearGradient(
                        colors: [
                          Color.fromARGB(255, 254, 63, 89),
                          Color.fromARGB(255, 252, 182, 159),
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                    child: Text(book.page2Heading,
                        textScaleFactor: 2,
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    book.page2Para1,
                    textScaleFactor: 1.3,
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(height: 15),
                  Points(
                    text: book.page2Para2,
                    bullet: "\u25A0",
                  ),
                  const SizedBox(height: 15),
                  Points(
                    text: book.page2Para3,
                    bullet: "\u25A0",
                  ),
                  const SizedBox(height: 15),
                  Points(
                    text: book.page2Para4,
                    bullet: "\u25A0",
                  ),
                  const SizedBox(height: 15),
                  Points(
                    text: book.page2Para5,
                    bullet: "\u25A0",
                  ),
                  const SizedBox(height: 25),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          color: Colors.grey[300],
                          width: MediaQuery.of(context).size.width,
                          height: 125,
                          child: Image.asset(
                            'assets/Booklet/Booklet_img2.png',
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Expanded(
                        child: Container(
                          color: Colors.grey[300],
                          width: MediaQuery.of(context).size.width,
                          height: 125,
                          child: Image.asset(
                            'assets/Booklet/Booklet_img3.png',
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 25),
                  Points(
                    text: book.page2Para6,
                    bullet: "\u25A0",
                  ),
                  const SizedBox(height: 15),
                  Points(
                    text: book.page2Para7,
                    bullet: "\u25A0",
                  ),
                  const SizedBox(height: 15),
                  Points(
                    text: book.page2Para8,
                    bullet: "\u25A0",
                  ),
                  const SizedBox(height: 50),
                ],
              ),
            ),
            SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Column(
                children: [
                  const SizedBox(height: 50),
                  Container(
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: const LinearGradient(
                        colors: [
                          Color.fromARGB(255, 254, 63, 89),
                          Color.fromARGB(255, 252, 182, 159),
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                    child: Text(book.page3Heading,
                        textScaleFactor: 2,
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  const SizedBox(height: 15),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      book.page3Line1,
                      textScaleFactor: 1.3,
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 7),
                          child: Container(
                            height: 70,
                            width: 70,
                            color: Colors.grey[300],
                            child: const Center(
                              child: Text("image"),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Points(
                                text: book.page3Para1,
                                bullet: "1.",
                              ),
                              Points(
                                text: book.page3Para1_2,
                                bullet: "2.",
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 7),
                          child: Container(
                            height: 70,
                            width: 70,
                            color: Colors.grey[300],
                            child: const Center(
                              child: Text("image"),
                            ),
                          ),
                        ),
                      ]),
                  const SizedBox(height: 15),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      padding: const EdgeInsets.only(left: 5),
                      width: MediaQuery.of(context).size.width,
                      color: Colors.yellow[300],
                      child: Text(
                        book.page3SubHeading1,
                        textScaleFactor: 1.3,
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    book.page3Para2,
                    textScaleFactor: 1.3,
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(height: 15),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      padding: const EdgeInsets.only(left: 5),
                      width: MediaQuery.of(context).size.width,
                      color: Colors.yellow[300],
                      child: Text(
                        book.page3SubHeading2,
                        textScaleFactor: 1.3,
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 150,
                          width: 125,
                          color: Colors.grey[300],
                          child: Center(
                            child: Image.asset(
                              'assets/Booklet/Booklet_img4.png',
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 150,
                          width: 125,
                          child: Image.asset(
                            'assets/Booklet/Booklet_img5.png',
                            fit: BoxFit.fill,
                          ),
                        ),
                      ]),
                  const SizedBox(height: 15),
                  Text(
                    book.page3Para3,
                    textScaleFactor: 1.3,
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(height: 50),
                ],
              ),
            ),
            SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Column(
                children: [
                  const SizedBox(height: 50),
                  Container(
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: const LinearGradient(
                        colors: [
                          Color.fromARGB(255, 254, 63, 89),
                          Color.fromARGB(255, 252, 182, 159),
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                    child: Text(book.page4Heading,
                        textScaleFactor: 2,
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      Expanded(
                        child: Image.asset(
                          'assets/Booklet/Booklet_img8.png',
                          fit: BoxFit.fill,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Expanded(
                        child: Image.asset(
                          'assets/Booklet/Booklet_img9.png',
                          fit: BoxFit.fill,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 15),
                  Text(
                    book.page4Para1,
                    textScaleFactor: 1.3,
                    style: const TextStyle(
                        color: Color.fromARGB(255, 210, 99, 20)),
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(height: 15),
                  Text(
                    book.page4Para2,
                    textScaleFactor: 1.3,
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(height: 15),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      padding: const EdgeInsets.only(left: 5),
                      width: MediaQuery.of(context).size.width,
                      color: Colors.yellow[300],
                      child: Text(
                        book.page4SubHeading1,
                        textScaleFactor: 1.3,
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    book.page4Para3,
                    textScaleFactor: 1.3,
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(height: 15),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: Text("\u25A0"),
                      ),
                      Expanded(
                        child: Text(
                          book.page4Para4,
                          textScaleFactor: 1.3,
                          textAlign: TextAlign.justify,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: Text("\u25A0"),
                      ),
                      Expanded(
                        child: Text(
                          book.page4Para5,
                          textScaleFactor: 1.3,
                          textAlign: TextAlign.justify,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: Text("\u25A0"),
                      ),
                      Expanded(
                        child: Text(
                          book.page4Para6,
                          textScaleFactor: 1.3,
                          textAlign: TextAlign.justify,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Points(text: book.page4Para7, bullet: "\u25A0"),
                  const SizedBox(height: 50),
                ],
              ),
            ),
            SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 50),
                  Container(
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: const LinearGradient(
                        colors: [
                          Color.fromARGB(255, 254, 63, 89),
                          Color.fromARGB(255, 252, 182, 159),
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                    child: Text(book.page5Heading,
                        textScaleFactor: 2,
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      Expanded(
                        child: Image.asset(
                          'assets/Booklet/Booklet_img6.png',
                          fit: BoxFit.fill,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Expanded(
                        child: Image.asset(
                          'assets/Booklet/Booklet_img7.png',
                          fit: BoxFit.fill,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 15),
                  Points(
                    text: book.page5Para1,
                    bullet: "1.",
                  ),
                  const SizedBox(height: 15),
                  Points(
                    text: book.page5Para2,
                    bullet: "2.",
                  ),
                  const SizedBox(height: 15),
                  Points(
                    text: book.page5Para3,
                    bullet: "3.",
                  ),
                  const SizedBox(height: 15),
                  Points(
                    text: book.page5Para4,
                    bullet: "4.",
                  ),
                  const SizedBox(height: 15),
                  Points(
                    text: book.page5Para5,
                    bullet: "5.",
                  ),
                  const SizedBox(height: 15),
                  Points(
                    text: book.page5Para6,
                    bullet: "6.",
                  ),
                  const SizedBox(height: 15),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      padding: const EdgeInsets.only(left: 5),
                      width: MediaQuery.of(context).size.width,
                      color: Colors.yellow[300],
                      child: Text(
                        book.page5SubHeading1,
                        textScaleFactor: 1.3,
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    book.page5Para7,
                    textScaleFactor: 1.3,
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(height: 15),
                  Points(
                    text: book.page5Para8,
                    bullet: "1.",
                  ),
                  const SizedBox(height: 15),
                  Points(
                    text: book.page5Para9,
                    bullet: "2.",
                  ),
                  const SizedBox(height: 15),
                  Points(
                    text: book.page5Para10,
                    bullet: "3.",
                  ),
                  const SizedBox(height: 15),
                  Points(
                    text: book.page5Para11,
                    bullet: "4.",
                  ),
                  const SizedBox(height: 15),
                  Center(
                    child: Container(
                      height: 200,
                      width: 200,
                      color: Colors.grey[300],
                      child: const Center(
                        child: Text("image"),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Points(
                    text: book.page5Para12,
                    bullet: "5.",
                  ),
                  const SizedBox(height: 15),
                  Points(
                    text: book.page5Para13,
                    bullet: "6.",
                  ),
                  const SizedBox(height: 15),
                  Points(
                    text: book.page5Para14,
                    bullet: "7.",
                  ),
                  const SizedBox(height: 15),
                  Points(
                    text: book.page5Para15,
                    bullet: "8.",
                  ),
                  const SizedBox(height: 15),
                  Points(
                    text: book.page5Para16,
                    bullet: "9.",
                  ),
                  const SizedBox(height: 50),
                ],
              ),
            ),
            SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Column(
                children: [
                  const SizedBox(height: 50),
                  Container(
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: const LinearGradient(
                        colors: [
                          Color.fromARGB(255, 254, 63, 89),
                          Color.fromARGB(255, 252, 182, 159),
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                    child: Text(book.page6Heading,
                        textScaleFactor: 2,
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(right: 7.0),
                        child: Text(
                          "\u25A0",
                        ),
                      ),
                      Expanded(
                        child: Text(
                          book.page6Para1,
                          textScaleFactor: 1.3,
                          textAlign: TextAlign.justify,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(right: 7.0),
                        child: Text(
                          "\u25A0",
                        ),
                      ),
                      Expanded(
                        child: Text(
                          book.page6Para2,
                          textScaleFactor: 1.3,
                          textAlign: TextAlign.justify,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(right: 7.0),
                        child: Text(
                          "\u25A0",
                        ),
                      ),
                      Expanded(
                        child: Text(
                          book.page6Para3,
                          textScaleFactor: 1.3,
                          textAlign: TextAlign.justify,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(right: 7.0),
                        child: Text(
                          "\u25A0",
                        ),
                      ),
                      Expanded(
                        child: Text(
                          book.page6Para4,
                          textScaleFactor: 1.3,
                          textAlign: TextAlign.justify,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(right: 7.0),
                        child: Text(
                          "\u25A0",
                        ),
                      ),
                      Expanded(
                        child: Text(
                          book.page6Para5,
                          textScaleFactor: 1.3,
                          textAlign: TextAlign.justify,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(right: 7.0),
                        child: Text(
                          "\u25A0",
                        ),
                      ),
                      Expanded(
                        child: Text(
                          book.page6Para6,
                          textScaleFactor: 1.3,
                          textAlign: TextAlign.justify,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(right: 7.0),
                        child: Text(
                          "\u25A0",
                        ),
                      ),
                      Expanded(
                        child: Text(
                          book.page6Para7,
                          textScaleFactor: 1.3,
                          textAlign: TextAlign.justify,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(right: 7.0),
                        child: Text(
                          "\u25A0",
                        ),
                      ),
                      Expanded(
                        child: Text(
                          book.page6Para8,
                          textScaleFactor: 1.3,
                          textAlign: TextAlign.justify,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(right: 7.0),
                        child: Text(
                          "\u25A0",
                        ),
                      ),
                      Expanded(
                        child: Text(
                          book.page6Para9,
                          textScaleFactor: 1.3,
                          textAlign: TextAlign.justify,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 50),
                ],
              ),
            ),
            SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
              child: Column(
                children: [
                  const SizedBox(height: 50),
                  Container(
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: const LinearGradient(
                        colors: [
                          Color.fromARGB(255, 254, 63, 89),
                          Color.fromARGB(255, 252, 182, 159),
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                    child: Text(book.page7Heading,
                        textScaleFactor: 1.3,
                        textAlign: TextAlign.justify,
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  const SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 30),
                    child: Table(
                      defaultVerticalAlignment:
                          TableCellVerticalAlignment.middle,
                      columnWidths: const {
                        0: FlexColumnWidth(2),
                        1: FlexColumnWidth(3),
                      },
                      border: TableBorder.all(),
                      children: [
                        TableRow(children: [
                          TableCell(
                            verticalAlignment:
                                TableCellVerticalAlignment.middle,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 150,
                                width: 125,
                                color: Colors.grey[300],
                                child: const Center(child: Text("Image")),
                              ),
                            ),
                          ),
                          TableCell(
                            verticalAlignment:
                                TableCellVerticalAlignment.middle,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 8.0, right: 8.0),
                              child: Text(
                                book.page7Para1,
                                textScaleFactor: 1.3,
                                textAlign: TextAlign.justify,
                              ),
                            ),
                          ),
                        ]),
                        TableRow(children: [
                          TableCell(
                            verticalAlignment:
                                TableCellVerticalAlignment.middle,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 150,
                                width: 125,
                                color: Colors.grey[300],
                                child: const Center(child: Text("Image")),
                              ),
                            ),
                          ),
                          TableCell(
                            verticalAlignment:
                                TableCellVerticalAlignment.middle,
                            child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: Text(
                                book.page7Para2,
                                textScaleFactor: 1.3,
                                textAlign: TextAlign.justify,
                              ),
                            ),
                          ),
                        ]),
                        TableRow(children: [
                          TableCell(
                            verticalAlignment:
                                TableCellVerticalAlignment.middle,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 150,
                                width: 125,
                                color: Colors.grey[300],
                                child: const Center(child: Text("Image")),
                              ),
                            ),
                          ),
                          TableCell(
                            verticalAlignment:
                                TableCellVerticalAlignment.middle,
                            child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: Text(
                                book.page7Para3,
                                textScaleFactor: 1.3,
                                textAlign: TextAlign.justify,
                              ),
                            ),
                          ),
                        ]),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
              child: Column(
                children: [
                  const SizedBox(height: 50),
                  Container(
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: const LinearGradient(
                        colors: [
                          Color.fromARGB(255, 254, 63, 89),
                          Color.fromARGB(255, 252, 182, 159),
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                    child: Text(book.page8Heading,
                        textScaleFactor: 2,
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  const SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 30),
                    child: Table(
                      border: TableBorder.all(),
                      children: [
                        TableRow(children: [
                          TableCell(
                            verticalAlignment:
                                TableCellVerticalAlignment.middle,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 150,
                                width: 125,
                                child: Center(
                                    child: Image.asset(
                                  "assets/Booklet/Booklet_img10.png",
                                  fit: BoxFit.fill,
                                )),
                              ),
                            ),
                          ),
                          TableCell(
                            verticalAlignment:
                                TableCellVerticalAlignment.middle,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 8.0, right: 8.0),
                              child: Text(
                                book.page8Para1,
                                textScaleFactor: 1.3,
                                textAlign: TextAlign.justify,
                              ),
                            ),
                          ),
                        ]),
                        TableRow(children: [
                          TableCell(
                            verticalAlignment:
                                TableCellVerticalAlignment.middle,
                            child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: Text(
                                book.page8Para2,
                                textScaleFactor: 1.3,
                                textAlign: TextAlign.justify,
                              ),
                            ),
                          ),
                          TableCell(
                            verticalAlignment:
                                TableCellVerticalAlignment.middle,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 150,
                                width: 125,
                                child: Center(
                                    child: Image.asset(
                                  "assets/Booklet/Booklet_img11.png",
                                  fit: BoxFit.fill,
                                )),
                              ),
                            ),
                          ),
                        ]),
                        TableRow(children: [
                          TableCell(
                            verticalAlignment:
                                TableCellVerticalAlignment.middle,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 150,
                                width: 125,
                                child: Center(
                                    child: Image.asset(
                                  "assets/Booklet/Booklet_img12.png",
                                  fit: BoxFit.fill,
                                )),
                              ),
                            ),
                          ),
                          TableCell(
                            verticalAlignment:
                                TableCellVerticalAlignment.middle,
                            child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: Text(
                                book.page8Para3,
                                textScaleFactor: 1.3,
                                textAlign: TextAlign.justify,
                              ),
                            ),
                          ),
                        ]),
                        TableRow(children: [
                          TableCell(
                            verticalAlignment:
                                TableCellVerticalAlignment.middle,
                            child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: Text(
                                book.page8Para4,
                                textScaleFactor: 1.3,
                                textAlign: TextAlign.justify,
                              ),
                            ),
                          ),
                          TableCell(
                            verticalAlignment:
                                TableCellVerticalAlignment.middle,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 150,
                                width: 125,
                                child: Center(
                                    child: Image.asset(
                                  "assets/Booklet/Booklet_img13.png",
                                  fit: BoxFit.fill,
                                )),
                              ),
                            ),
                          ),
                        ]),
                        TableRow(children: [
                          TableCell(
                            verticalAlignment:
                                TableCellVerticalAlignment.middle,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 150,
                                width: 125,
                                child: Center(
                                    child: Image.asset(
                                  "assets/Booklet/Booklet_img14.png",
                                  fit: BoxFit.fill,
                                )),
                              ),
                            ),
                          ),
                          TableCell(
                            verticalAlignment:
                                TableCellVerticalAlignment.middle,
                            child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: Text(
                                book.page8Para5,
                                textScaleFactor: 1.3,
                                textAlign: TextAlign.justify,
                              ),
                            ),
                          ),
                        ]),
                        TableRow(children: [
                          TableCell(
                            verticalAlignment:
                                TableCellVerticalAlignment.middle,
                            child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: Text(
                                book.page8Para6,
                                textScaleFactor: 1.3,
                                textAlign: TextAlign.justify,
                              ),
                            ),
                          ),
                          TableCell(
                            verticalAlignment:
                                TableCellVerticalAlignment.middle,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 150,
                                width: 125,
                                child: Center(
                                    child: Image.asset(
                                  "assets/Booklet/Booklet_img15.png",
                                  fit: BoxFit.fill,
                                )),
                              ),
                            ),
                          ),
                        ]),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 50),
                    Center(
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: const LinearGradient(
                            colors: [
                              Color.fromARGB(255, 254, 63, 89),
                              Color.fromARGB(255, 252, 182, 159),
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                        child: Text(book.page9Heading,
                            textScaleFactor: 2,
                            textAlign: TextAlign.center,
                            style:
                                const TextStyle(fontWeight: FontWeight.bold)),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      book.page9Para1,
                      textScaleFactor: 1.3,
                      textAlign: TextAlign.justify,
                    ),
                    const SizedBox(height: 15),
                    Points(
                      text: book.page9Para2,
                      bullet: "1.",
                    ),
                    const SizedBox(height: 15),
                    Points(
                      text: book.page9Para3,
                      bullet: "2.",
                    ),
                    const SizedBox(height: 15),
                    Points(
                      text: book.page9Para4,
                      bullet: "3.",
                    ),
                    const SizedBox(height: 15),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        padding: const EdgeInsets.only(left: 5),
                        width: MediaQuery.of(context).size.width,
                        color: Colors.yellow[300],
                        child: Text(
                          book.page9Para5,
                          textScaleFactor: 1.3,
                          textAlign: TextAlign.justify,
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 30),
                      child: Table(
                        defaultVerticalAlignment:
                            TableCellVerticalAlignment.middle,
                        columnWidths: const {
                          0: FlexColumnWidth(1),
                          1: FlexColumnWidth(1),
                          2: FlexColumnWidth(3),
                        },
                        border: TableBorder.all(),
                        children: [
                          TableRow(children: [
                            TableCell(
                                verticalAlignment:
                                    TableCellVerticalAlignment.middle,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: 60,
                                    width: 60,
                                    color: Colors.grey,
                                    child: const Center(child: Text("Image")),
                                  ),
                                )),
                            TableCell(
                                verticalAlignment:
                                    TableCellVerticalAlignment.middle,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: 60,
                                    width: 60,
                                    color: Colors.grey,
                                    child: const Center(child: Text("Image")),
                                  ),
                                )),
                            TableCell(
                              verticalAlignment:
                                  TableCellVerticalAlignment.middle,
                              child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: Text(
                                  book.page9Para6,
                                  textScaleFactor: 1.3,
                                  textAlign: TextAlign.justify,
                                ),
                              ),
                            )
                          ]),
                          TableRow(children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 60,
                                width: 60,
                                color: Colors.grey,
                                child: const Center(child: Text("Image")),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 60,
                                width: 60,
                                color: Colors.grey,
                                child: const Center(child: Text("Image")),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8),
                              child: Text(
                                book.page9Para7,
                                textScaleFactor: 1.3,
                                textAlign: TextAlign.justify,
                              ),
                            )
                          ]),
                          TableRow(children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 60,
                                width: 60,
                                color: Colors.grey,
                                child: const Center(child: Text("Image")),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 60,
                                width: 60,
                                color: Colors.grey,
                                child: const Center(child: Text("Image")),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8),
                              child: Text(
                                book.page9Para8,
                                textScaleFactor: 1.3,
                                textAlign: TextAlign.justify,
                              ),
                            )
                          ]),
                          TableRow(children: [
                            const Center(
                              child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    "पुरूष",
                                    textScaleFactor: 1.3,
                                  )),
                            ),
                            const Center(
                              child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    "स्त्री",
                                    textScaleFactor: 1.3,
                                  )),
                            ),
                            Padding(
                                padding: const EdgeInsets.all(8),
                                child: Column(
                                  children: [
                                    Points(
                                      text: book.page9Para9.substring(0, 37),
                                      bullet: "1.",
                                    ),
                                    Points(
                                      text: book.page9Para9.substring(40),
                                      bullet: "2.",
                                    )
                                  ],
                                ))
                          ]),
                        ],
                      ),
                    ),
                  ],
                )),
            SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Column(
                children: [
                  const SizedBox(height: 50),
                  Container(
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: const LinearGradient(
                        colors: [
                          Color.fromARGB(255, 254, 63, 89),
                          Color.fromARGB(255, 252, 182, 159),
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                    child: Text(book.page10Heading1,
                        textScaleFactor: 2,
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      Expanded(
                          child: Container(
                        height: 600,
                        child: Image.asset("assets/Booklet/Booklet_img17.png",
                            fit: BoxFit.fill),
                      ))
                    ],
                  ),
                  const SizedBox(height: 15),
                  Text(
                    book.page10Para1,
                    textScaleFactor: 1.3,
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(height: 15),
                  Text(
                    book.page10Para2,
                    textScaleFactor: 1.3,
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(height: 15),
                  Container(
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: const LinearGradient(
                        colors: [
                          Color.fromARGB(255, 254, 63, 89),
                          Color.fromARGB(255, 252, 182, 159),
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                    child: Text(book.page10Heading2,
                        textScaleFactor: 2,
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    book.page10Para3,
                    textScaleFactor: 1.3,
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(height: 15),
                  Text(
                    book.page10Para4,
                    textScaleFactor: 1.3,
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(height: 15),
                  Text(
                    book.page10Para5,
                    textScaleFactor: 1.3,
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(height: 15),
                  const Center(
                    child: Text("सिकल कुंडली",
                        textScaleFactor: 1.3,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.deepOrange)),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: Container(
                          height: 120,
                          width: 80,
                          child: Image.asset(
                            'assets/Booklet/Booklet_img18.png',
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 120,
                          width: 80,
                          child: Image.asset(
                            'assets/Booklet/Booklet_img19.png',
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 120,
                          width: 80,
                          child: Image.asset(
                            'assets/Booklet/Booklet_img20.png',
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Text(
                    book.page10Para6,
                    textScaleFactor: 1.3,
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(height: 50),
                ],
              ),
            ),
            SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Column(
                children: [
                  const SizedBox(height: 50),
                  Container(
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: const LinearGradient(
                        colors: [
                          Color.fromARGB(255, 254, 63, 89),
                          Color.fromARGB(255, 252, 182, 159),
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                    child: Text(book.page11Heading,
                        textScaleFactor: 2,
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    book.page11Para1,
                    textScaleFactor: 1.3,
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(height: 15),
                  Points(
                    text: book.page11Para2,
                    bullet: "1.",
                  ),
                  const SizedBox(height: 15),
                  Points(
                    text: book.page11Para3,
                    bullet: "2.",
                  ),
                  const SizedBox(height: 15),
                  Points(
                    text: book.page11Para4,
                    bullet: "3.",
                  ),
                  const SizedBox(height: 15),
                  Points(
                    text: book.page11Para5,
                    bullet: "4.",
                  ),
                  const SizedBox(height: 15),
                  Points(
                    text: book.page11Para6,
                    bullet: "5.",
                  ),
                  const SizedBox(height: 50),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

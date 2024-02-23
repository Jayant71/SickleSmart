import "package:flutter/material.dart";

class ViewTest extends StatelessWidget {
  const ViewTest({super.key, required this.test});

  final test;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:
              const Text("Test Report", style: TextStyle(color: Colors.white)),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(15, 15, 15, 25),
          child: Card(
            elevation: 2,
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, bottom: 20),
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                const Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(25, 8, 25, 15),
                        child: Text(
                          "Test Details",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Table(
                  border: TableBorder.all(),
                  columnWidths: const {
                    0: FlexColumnWidth(1),
                    1: FlexColumnWidth(2),
                  },
                  children: [
                    TableRow(children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Test Name",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          test['name'] ?? "",
                          style: const TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ]),
                    TableRow(children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Test Result",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          test['result'] ?? "",
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ]),
                    TableRow(children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Patient Name",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          test['patientName'] ?? "",
                          style: const TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ]),
                    TableRow(children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Date of Sampling",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          test['dateOfSampling'] ?? "",
                          style: const TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ]),
                    TableRow(children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Date of result",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          test['dateOfResult'] ?? "",
                          style: const TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ]),
                    TableRow(children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Test Center",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          test['testCenter'] ?? "",
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ]),
                  ],
                )
              ]),
            ),
          ),
        ));
  }
}

import "package:flutter/material.dart";

class ViewMedication extends StatelessWidget {
  const ViewMedication({super.key, required this.medication});

  final medication;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:
              const Text("Medication", style: TextStyle(color: Colors.white)),
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
                          "Medication Details",
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
                          "Medication Name",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          medication['name'] ?? "",
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
                          "Dosage",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          medication['dosage'] ?? "",
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
                          "Time of Day",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          medication['timeOfDay'] ?? "",
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
                          "Start Date",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          medication['startDate'] ?? "",
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
                          "Durations",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          medication['duration'] ?? "",
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

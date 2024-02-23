import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sicklesmart/providers/_provider.dart';
import 'package:sicklesmart/widgets/medicationform.dart';
import 'package:sicklesmart/widgets/viewmedication.dart';
import 'package:sicklesmart/widgets/viewtest.dart';

class MedicalReport extends ConsumerStatefulWidget {
  const MedicalReport({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MedicalReportState();
}

class _MedicalReportState extends ConsumerState<MedicalReport> {
  var index = 0;

  TextEditingController nameController = TextEditingController();
  TextEditingController dosageController = TextEditingController();
  TextEditingController startDateController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  @override
  void initState() {
    super.initState();
    ref.read(medicationProvider.notifier).getMedications();
    ref.read(testProvider.notifier).getTests();
  }

  @override
  void dispose() {
    nameController.dispose();
    dosageController.dispose();
    startDateController.dispose();
    timeController.dispose();
    descriptionController.dispose();
    dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: index == 0
            ? const Text(
                "Medications",
                style: TextStyle(color: Colors.white),
              )
            : const Text(
                "Test Reports",
                style: TextStyle(color: Colors.white),
              ),
        actions: [
          IconButton(
              onPressed: () {
                if (index == 0) {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const AddMedication()));
                } else {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const AddTest()));
                }
              },
              icon: const Icon(Icons.add))
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        elevation: 5,
        onTap: (value) {
          setState(() {
            index = value;
          });
        },
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Medications",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: "Tests",
          ),
        ],
      ),
      body: IndexedStack(
        index: index,
        sizing: StackFit.expand,
        children: [
          Consumer(
            builder: (context, ref, child) {
              final medicationsL = ref.watch<List>(medicationProvider);
              return ListView.builder(
                      itemCount: medicationsL.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          child: ListTile(
                            // isThreeLine: true,
                            title: Text(
                              medicationsL[index]['Medication Information']
                                  ["name"],
                              style: const TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              medicationsL[index]['Medication Information']
                                  ["dosage"],
                              style: const TextStyle(fontSize: 15),
                            ),
                            onTap: () => Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) => ViewMedication(
                                        medication: medicationsL[index]
                                            ['Medication Information']))),
                            trailing: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Start Date: ${medicationsL[index]['Medication Information']["startDate"]}",
                                  style: const TextStyle(fontSize: 15),
                                ),
                                Text(
                                  "Time: ${medicationsL[index]['Medication Information']["timeOfDay"]}",
                                  style: const TextStyle(fontSize: 15),
                                ),
                              ],
                            ),
                          ),
                        );
                      })
                  .animate()
                  .fadeIn(duration: const Duration(milliseconds: 500));
            },
          ),
          Consumer(
            builder: (context, ref, child) {
              final testsL = ref.watch<List>(testProvider);
              return ListView.builder(
                  itemCount: testsL.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: ListTile(
                        title: Text(testsL[index]['Test Information']["name"],
                            style: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold)),
                        subtitle: Text(
                          'Result: ${testsL[index]['Test Information']["result"]}',
                          style: const TextStyle(fontSize: 15),
                        ),
                        onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => ViewTest(
                                    test: testsL[index]['Test Information']))),
                        trailing: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Sampling Date: ${testsL[index]['Test Information']["dateOfSampling"]}",
                              style: const TextStyle(fontSize: 15),
                            ),
                            Text(
                              "Result Date: ${testsL[index]['Test Information']["dateOfResult"]}",
                              style: const TextStyle(fontSize: 15),
                            ),
                          ],
                        ),
                      ),
                    );
                  });
            },
          ),
        ],
      ),
    );
  }
}

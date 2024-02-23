import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:sicklesmart/providers/_provider.dart';

class AddMedication extends ConsumerStatefulWidget {
  const AddMedication({Key? key}) : super(key: key);

  @override
  _AddMedicationState createState() => _AddMedicationState();
}

class _AddMedicationState extends ConsumerState<AddMedication> {
  // final _formKey = GlobalKey<FormState>();
  final _medicationNameController = TextEditingController();
  final _medicationDoseController = TextEditingController();
  final _medicationFrequencyController = TextEditingController();
  final _medicationDurationController = TextEditingController();
  final _medicationTimeController = TextEditingController();
  final _medicationStartDateController = TextEditingController();
  final _medicationEndDateController = TextEditingController();
  final _medicationReasonController = TextEditingController();
  final _medicationSideEffectController = TextEditingController();
  final _medicationNotesController = TextEditingController();

  @override
  void dispose() {
    _medicationNameController.dispose();
    _medicationDoseController.dispose();
    _medicationFrequencyController.dispose();
    _medicationDurationController.dispose();
    _medicationStartDateController.dispose();
    _medicationEndDateController.dispose();
    _medicationReasonController.dispose();
    _medicationSideEffectController.dispose();
    _medicationNotesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Medication"),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
        child: Form(
          child: ListView(
            shrinkWrap: true,
            children: [
              TextFormField(
                controller: _medicationNameController,
                decoration: const InputDecoration(
                    labelText: "Medication Name",
                    hintText: "Enter Medication Name"),
              ),
              TextFormField(
                controller: _medicationDoseController,
                decoration: const InputDecoration(
                    labelText: "Dosage", hintText: "Enter Dosage"),
              ),
              TextFormField(
                controller: _medicationStartDateController,
                decoration: const InputDecoration(
                    labelText: "Start Date", hintText: "Enter Start Date"),
                onTap: () async {
                  DateTime? date = DateTime(1900);
                  FocusScope.of(context).requestFocus(FocusNode());

                  date = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime.now());

                  setState(() {
                    _medicationStartDateController.text =
                        date.toString().substring(0, 10);
                    _medicationStartDateController.text =
                        DateFormat('dd-MM-yyyy').format(DateTime.parse(
                            _medicationStartDateController.text));
                  });
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your date of birth';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _medicationTimeController,
                decoration: const InputDecoration(
                    labelText: "Time", hintText: "Enter Time"),
              ),
              TextFormField(
                controller: _medicationDurationController,
                decoration: const InputDecoration(
                    labelText: "Duration", hintText: "Enter Duration"),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text("Cancel")),
                  ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (BuildContext context) {
                          return const AlertDialog(
                            content: Row(
                              children: [
                                CircularProgressIndicator(),
                                SizedBox(width: 20),
                                Text("Loading..."),
                              ],
                            ),
                          );
                        },
                      );

                      final fnc = ref.read(medicationProvider.notifier);
                      fnc.addMedication({
                        'Medication Information': {
                          "name": _medicationNameController.text,
                          "dosage": _medicationDoseController.text,
                          "startDate": _medicationStartDateController.text,
                          "timeOfDay": _medicationTimeController.text,
                          "duration": _medicationDurationController.text,
                        }
                      });

                      Navigator.of(context).pop();
                      Navigator.of(context).pop();
                    },
                    child: const Text("Add"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AddTest extends ConsumerStatefulWidget {
  const AddTest({super.key});

  @override
  _AddTestState createState() => _AddTestState();
}

class _AddTestState extends ConsumerState<AddTest> {
  final _testNameController = TextEditingController();
  final _testCenterController = TextEditingController();
  final _testResultController = TextEditingController();
  final _testSamplingDateController = TextEditingController();
  final _testResultDateController = TextEditingController();
  final _testTimeController = TextEditingController();

  @override
  void dispose() {
    _testNameController.dispose();
    _testCenterController.dispose();
    _testResultDateController.dispose();
    _testResultController.dispose();
    _testTimeController.dispose();
    _testSamplingDateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add Test")),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
        child: Form(
          child: ListView(
            shrinkWrap: true,
            children: [
              TextFormField(
                controller: _testNameController,
                decoration: const InputDecoration(
                    labelText: "Test Name", hintText: "Enter Test Name"),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter test name';
                  }
                },
              ),
              TextFormField(
                controller: _testResultController,
                decoration: const InputDecoration(
                    labelText: "Test Result", hintText: "Enter test result"),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter test result';
                  }
                },
              ),
              TextFormField(
                controller: _testResultDateController,
                readOnly: true,
                decoration: const InputDecoration(
                    labelText: "ResultDate", hintText: "Enter Date"),
                onTap: () async {
                  DateTime? date = DateTime(1900);
                  FocusScope.of(context).requestFocus(FocusNode());

                  date = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime.now());

                  setState(() {
                    _testResultDateController.text =
                        date.toString().substring(0, 10);
                    _testResultDateController.text = DateFormat('dd-MM-yyyy')
                        .format(DateTime.parse(_testResultDateController.text));
                  });
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your test date';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _testTimeController,
                decoration: const InputDecoration(
                    labelText: "Time", hintText: "Enter Time"),
              ),
              TextFormField(
                decoration: const InputDecoration(
                    labelText: "Sampling Date",
                    hintText: "Enter Sampling Date"),
                controller: _testSamplingDateController,
                readOnly: true,
                onTap: () async {
                  DateTime? date = DateTime(1900);
                  FocusScope.of(context).requestFocus(FocusNode());

                  date = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime.now());

                  setState(() {
                    _testSamplingDateController.text =
                        date.toString().substring(0, 10);
                    _testSamplingDateController.text = DateFormat('dd-MM-yyyy')
                        .format(
                            DateTime.parse(_testSamplingDateController.text));
                  });
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your test date';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _testCenterController,
                decoration: const InputDecoration(
                    labelText: "Test Center", hintText: "Enter Test Center"),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter test center';
                  }
                },
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text("Cancel")),
                  ElevatedButton(
                      onPressed: () async {
                        final fnc = ref.read(testProvider.notifier);
                        var name;
                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (BuildContext context) {
                            return const AlertDialog(
                              content: Row(
                                children: [
                                  CircularProgressIndicator(),
                                  SizedBox(width: 20),
                                  Text("Loading..."),
                                ],
                              ),
                            );
                          },
                        );
                        await FirebaseFirestore.instance
                            .collection('users')
                            .doc(ref.read(currentUserProvider)?.uid)
                            .get()
                            .then((value) {
                          name = value.data()?['name'];
                        });

                        fnc.addTest({
                          'Test Information': {
                            "name": _testNameController.text,
                            "result": _testResultController.text,
                            "patientName": name,
                            "dateOfResult": _testResultDateController.text,
                            "dateOfSampling": _testSamplingDateController.text,
                            "time": _testTimeController.text,
                            "testCenter": _testCenterController.text,
                          }
                        });
                        if (context.mounted) {
                          Navigator.of(context).pop();
                          Navigator.of(context).pop();
                        }
                      },
                      child: const Text("Add"))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

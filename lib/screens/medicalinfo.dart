import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sicklesmart/providers/_provider.dart';
import 'package:sicklesmart/screens/homepage.dart';

class MedicalInfo extends ConsumerStatefulWidget {
  const MedicalInfo({super.key, required this.userData});

  final Map<String, dynamic> userData;

  @override
  ConsumerState<MedicalInfo> createState() => _MedicalInfoState();
}

class _MedicalInfoState extends ConsumerState<MedicalInfo> {
  final diseaseTypes = [
    'AA',
    'AS',
    'SS',
    'SC',
    'CC',
  ];

  var selectedBloodGroup = 'A+';
  final bloodGroup = ['A+', 'B+', 'AB+', 'O+', 'A-', 'B-', 'AB-', 'O-'];
  var selectedTest = [];
  var selectedDiseaseType = '';
  var tested = '';

  @override
  Widget build(BuildContext context) {
    var tests = ref.read(testListProvider);
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text(
            'Medical Information',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Blood Group',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          Wrap(
            spacing: 8.0,
            children: <Widget>[
              ...bloodGroup.map((type) => ChoiceChip(
                    label: Text(type),
                    selected: selectedBloodGroup == type,
                    onSelected: (bool selected) {
                      setState(() {
                        selectedBloodGroup = selected ? type : "";
                      });
                    },
                  )),
            ],
          ),
          const SizedBox(height: 20),
          const Text(
            "Sickle Cell Disease Type:",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 10),
          Wrap(
            spacing: 8.0,
            children: <Widget>[
              ...diseaseTypes.map((type) => ChoiceChip(
                    label: Text(type),
                    selected: selectedDiseaseType == type,
                    onSelected: (bool selected) {
                      setState(() {
                        selectedDiseaseType = selected ? type : "";
                      });
                    },
                  )),
            ],
          ),
          const SizedBox(height: 20),
          const Text(
            'Have you had a sickle cell test?',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 10),
          SegmentedButton(
            multiSelectionEnabled: false,
            emptySelectionAllowed: false,
            segments: const [
              ButtonSegment(
                value: 'Yes',
                label: Text('Yes'),
              ),
              ButtonSegment(
                value: 'No',
                label: Text('No'),
              ),
            ],
            selected: {tested},
            onSelectionChanged: (p0) {
              setState(() {
                tested = p0.first;
              });
            },
          ),
          const SizedBox(height: 20),
          if (tested == 'Yes') ...[
            const Text(
              'Sickle Cell Test Type:',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 10),
            // check boxes for each tests in tests
            Wrap(
              spacing: 50.0,
              children: <Widget>[
                ...tests.map((test) => ChoiceChip(
                      label: Text(test),
                      selected: selectedTest.contains(test),
                      onSelected: (bool selected) {
                        setState(() {
                          selected
                              ? selectedTest.add(test)
                              : selectedTest.remove(test);
                        });
                        debugPrint("$selectedTest");
                      },
                    )),
              ],
            ),
          ],
          const SizedBox(height: 20),
          ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll<Color>(
                    Theme.of(context).colorScheme.primary,
                  ),
                  foregroundColor: MaterialStatePropertyAll<Color>(
                    Theme.of(context).colorScheme.secondary,
                  )),
              onPressed: () {
                widget.userData['bloodGroup'] = selectedBloodGroup;
                widget.userData['tested'] = tested;
                widget.userData['diseaseType'] = selectedDiseaseType;

                if (tested == 'Yes') {
                  widget.userData['tests'] = selectedTest;
                }
                var currentUser = ref.watch(currentUserProvider);
                currentUser != null
                    ? {
                        showDialog(
                            context: context,
                            builder: (context) =>
                                const CircularProgressIndicator(),
                            barrierDismissible: false),
                        ref
                            .read(databaseProvider)
                            .addDataWithId(
                                widget.userData, 'users', currentUser.uid)
                            .then((value) {
                          Navigator.of(context).pop();
                          if (context.mounted) {
                            Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                builder: (context) => const HomePage(),
                              ),
                              (route) => false,
                            );
                          }
                        }).catchError((e) {
                          Navigator.of(context).pop();
                          Fluttertoast.showToast(msg: e.toString());
                          debugPrint(e.toString());
                        })
                      }
                    : {
                        showDialog(
                            context: context,
                            builder: (ctx) {
                              // return loading dialog
                              return const Center(
                                child: SizedBox(
                                    height: 60,
                                    width: 60,
                                    child: CircularProgressIndicator()),
                              );
                            },
                            barrierDismissible: false),
                        ref
                            .read(authenticationProvider)
                            .signUpWithEmailAndPassword(
                                widget.userData['email'],
                                widget.userData['password'],
                                context)
                            .then(
                          (value) {
                            currentUser = ref.watch(currentUserProvider);

                            ref
                                .read(databaseProvider)
                                .addDataWithId(
                                    widget.userData, 'users', currentUser!.uid)
                                .then(
                              (value) {
                                Navigator.of(context).pop();
                                if (context.mounted) {
                                  Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(
                                      builder: (context) => const HomePage(),
                                    ),
                                    (route) => false,
                                  );
                                }
                              },
                            ).catchError(
                              (e) {
                                Navigator.of(context).pop();
                                Fluttertoast.showToast(msg: e.toString());
                                debugPrint(e.toString());
                              },
                            );
                          },
                        ).catchError(
                          (e) {
                            Fluttertoast.showToast(msg: e.toString());
                            debugPrint(e.toString());
                          },
                        )
                      };
              },
              child: const Text('Submit',
                  style: TextStyle(
                    fontSize: 17,
                  ))),
        ],
      ),
    );
  }
}

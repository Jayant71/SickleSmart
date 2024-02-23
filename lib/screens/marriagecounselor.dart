import 'package:flutter/material.dart';

class MarriageCounselorScreen extends StatefulWidget {
  const MarriageCounselorScreen({super.key});

  @override
  MarriageCounselorScreenState createState() => MarriageCounselorScreenState();
}

class MarriageCounselorScreenState extends State<MarriageCounselorScreen> {
  TextEditingController partner1Controller = TextEditingController();
  TextEditingController partner2Controller = TextEditingController();
  String result = "";

  List<String> diseaseTypes = ["AA", "AS", "SS", "SC", "CC"];
  List<String> diseaseTypesPrint = [
    "AA(Normal)",
    "AS(Carrier)",
    "SS(Sickler)",
    "SC",
    "CC"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Marriage Counselor'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              // 'स्कील सेल रोग प्रकार: ',
              "Sickle Cell Disease Types: ",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const SizedBox(height: 20),
            Wrap(
              spacing: 8.0,
              children: <Widget>[
                ...diseaseTypesPrint.map((type) => Text(
                      type,
                      style: const TextStyle(fontSize: 20),
                    )),
              ],
            ),
            const SizedBox(height: 20),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const Text(
                      // 'आपके रोग प्रकार का चयन करें',
                      "Select your disease type",
                      style: TextStyle(fontSize: 20),
                    ),
                    const SizedBox(height: 5),
                    DropdownButtonFormField(
                      value: diseaseTypes[0],
                      onChanged: (value) {
                        setState(() {
                          partner1Controller.text = value!;
                        });
                      },
                      items: diseaseTypes.map((type) {
                        return DropdownMenuItem(
                          value: type,
                          child: Text(type),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    const Text(
                      // 'आपके साथी का रोग प्रकार का चयन करें',
                      "Select your partner's disease type",
                      style: TextStyle(fontSize: 20),
                    ),
                    const SizedBox(height: 10),
                    DropdownButtonFormField(
                      value: diseaseTypes[0],
                      onChanged: (value) {
                        setState(() {
                          partner2Controller.text = value!;
                        });
                      },
                      items: diseaseTypes.map((type) {
                        return DropdownMenuItem(
                          value: type,
                          child: Text(type),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  calculateResult();
                },
                child: const Text(
                    // 'परिणाम देखें',
                    "See Result"),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Result:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const SizedBox(height: 10),
            Text(
              result,
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }

  void calculateResult() {
    String partner1 = partner1Controller.text.toUpperCase();
    String partner2 = partner2Controller.text.toUpperCase();

    String resultText = canMarry(partner1, partner2);
    setState(() {
      result = resultText;
    });
  }

  String canMarry(String partner1, String partner2) {
    String key = '$partner1,$partner2';
    switch (key) {
      case 'AS,AS':
      case 'SS,SS':
      case 'AS,SC':
      case 'SC,AS':
      case 'AS,CC':
      case 'CC,AS':
        // return 'नहीं, आप विवाह नहीं कर सकते हैं!';
        return 'No, you cannot marry!';

      default:
        // return 'हाँ, आप विवाह कर सकते हैं!';
        return 'Yes, you can marry!';
    }
  }

  @override
  void dispose() {
    partner1Controller.dispose();
    partner2Controller.dispose();
    super.dispose();
  }
}

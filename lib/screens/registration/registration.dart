import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:sicklesmart/screens/medicalinfo.dart';

class Registration extends ConsumerStatefulWidget {
  const Registration({super.key, required this.cUsr});

  final cUsr;

  @override
  RegistrationState createState() => RegistrationState();
}

class RegistrationState extends ConsumerState<Registration> {
  final _formKey = GlobalKey<FormState>();
  final _fullnameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _mobileNumberController = TextEditingController();
  final _addressController = TextEditingController();
  final _dobController = TextEditingController();
  final _guardianFullnameController = TextEditingController();
  final _guardianEmailController = TextEditingController();
  final _guardianMobileNumberController = TextEditingController();
  final _relationshipController = TextEditingController();

  var selectedGender = 'Male';
  final gender = ['Male', 'Female', 'Other'];

  @override
  void dispose() {
    _fullnameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _mobileNumberController.dispose();
    _addressController.dispose();
    _dobController.dispose();
    _guardianFullnameController.dispose();
    _guardianEmailController.dispose();
    _guardianMobileNumberController.dispose();
    _relationshipController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentUser = widget.cUsr;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Registration',
        ),
        actions: [
          // TextButton.icon(
          //     onPressed: () {
          //       Navigator.of(context).pushReplacement(MaterialPageRoute(
          //           builder: (context) => const WelcomeAuthScreen()));
          //     },
          //     icon: const Icon(Icons.login),
          //     label: const Text("Login")),
          // TextButton(
          //     onPressed: () {
          //       Navigator.of(context).pushReplacement(
          //           MaterialPageRoute(builder: (context) => const HomePage()));
          //     },
          //     child: const Text("Skip"))
        ],
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            // padding: const EdgeInsets.all(20),
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Please fill in the form below',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Patient\'s Details',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Fullname',
                style: TextStyle(
                    // fontSize: 20,
                    ),
              ),
              TextFormField(
                controller: _fullnameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                  hintText: "Fullname",
                ),
                keyboardType: TextInputType.name,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your fullname';
                  } else if (value.length < 3) {
                    return 'Please enter a valid fullname';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              const Text(
                'Email Address',
                style: TextStyle(),
              ),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email),
                  hintText: "Email Address",
                ),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your email address';
                  } else if (!value.contains('@')) {
                    return 'Please enter a valid email address';
                  }
                  // Add email validation logic here if needed
                  return null;
                },
              ),
              const SizedBox(height: 10),
              if (currentUser == null) ...[
                const Text(
                  'Password',
                  style: TextStyle(),
                ),
                TextFormField(
                  controller: _passwordController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.lock),
                    hintText: "Password",
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a password';
                    }

                    return null;
                  },
                ),
                const SizedBox(height: 10),
                const Text(
                  'Confirm Password',
                  style: TextStyle(),
                ),
                TextFormField(
                  controller: _confirmPasswordController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.lock),
                    hintText: "Confirm Password",
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please confirm your password';
                    }
                    if (value != _passwordController.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
              ],
              const Text(
                'Mobile Number',
                style: TextStyle(),
              ),
              TextFormField(
                controller: _mobileNumberController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.phone),
                  prefixText: "+91 ",
                  hintText: "Mobile Number",
                ),
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your mobile number';
                  } else if (value.length != 10) {
                    return 'Please enter a valid mobile number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              const Text(
                'Complete Address',
                style: TextStyle(),
              ),
              TextFormField(
                controller: _addressController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.home),
                  hintText: "Address",
                ),
                keyboardType: TextInputType.streetAddress,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your address';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              const Text(
                'Date of Birth',
                style: TextStyle(),
              ),

              TextFormField(
                readOnly: true,
                controller: _dobController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.calendar_today),
                    hintText: "Date of Birth"),
                onTap: () async {
                  DateTime? date = DateTime(1900);
                  FocusScope.of(context).requestFocus(FocusNode());

                  date = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime.now());

                  setState(() {
                    _dobController.text = date.toString().substring(0, 10);
                    _dobController.text = DateFormat('dd-MM-yyyy')
                        .format(DateTime.parse(_dobController.text));
                  });
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your date of birth';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Text(
                    'Gender:',
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: SegmentedButton(
                      emptySelectionAllowed: false,
                      segments: [
                        for (final gender_ in gender)
                          ButtonSegment(
                              label: Text(
                                gender_,
                                style: const TextStyle(fontSize: 11),
                              ),
                              value: gender_)
                      ],
                      selected: {selectedGender},
                      onSelectionChanged: (p0) {
                        setState(() {
                          selectedGender = p0.first;
                        });
                      },
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),
              const Text(
                "Guardian's Details",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                ),
              ),
              const Text(
                'Guardian\'s Fullname',
                style: TextStyle(),
              ),
              TextFormField(
                controller: _guardianFullnameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                  hintText: "Guardian Fullname",
                ),
                keyboardType: TextInputType.name,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter guardian\'s fullname';
                  } else if (value.length < 3) {
                    return 'Please enter a valid fullname';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              const Text(
                'Guardian\'s Email Address',
                style: TextStyle(),
              ),
              TextFormField(
                controller: _guardianEmailController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.email),
                    hintText: "Guardian Email Address"),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter guardian\'s email address';
                  } else if (!value.contains('@')) {
                    return 'Please enter a valid email address';
                  }
                  // Add guardian's email validation logic here if needed
                  return null;
                },
              ),
              const SizedBox(height: 10),
              const Text(
                'Guardian\'s Mobile Number',
                style: TextStyle(),
              ),
              TextFormField(
                controller: _guardianMobileNumberController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.phone),
                  hintText: "Mobile Number",
                  prefixText: "+91 ",
                ),
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter guardian\'s mobile number';
                  } else if (value.length != 10) {
                    return 'Please enter a valid mobile number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              // relationship with patient
              const Text(
                'Guardian\'s Relationship with Patient',
                style: TextStyle(),
              ),
              TextFormField(
                controller: _relationshipController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'e.g. Father, Mother, etc.',
                ),
                keyboardType: TextInputType.name,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter guardian\'s relationship with patient';
                  } else if (value.length < 3) {
                    return 'Please enter a valid relationship';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Theme.of(context).colorScheme.primary),
                  foregroundColor: MaterialStateProperty.all<Color>(
                      Theme.of(context).colorScheme.secondary),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Map<String, dynamic> user = {
                      'fullname': _fullnameController.text,
                      if (currentUser == null)
                        'password': _passwordController.text,
                      'email': _emailController.text,
                      'mobileNumber': _mobileNumberController.text,
                      'address': _addressController.text,
                      'date-of-birth': _dobController.text,
                      'gender': selectedGender,
                      'guardianFullname': _guardianFullnameController.text,
                      'guardianEmail': _guardianEmailController.text,
                      'guardianMobileNumber':
                          _guardianMobileNumberController.text,
                      'guardian-relationship': _relationshipController.text,
                    };

                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => MedicalInfo(
                              userData: user,
                            )));
                  }
                },
                child: const Text('Register', style: TextStyle(fontSize: 17)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

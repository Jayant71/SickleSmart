import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sicklesmart/models/firestoremodel.dart';
import 'package:sicklesmart/screens/homepage.dart';
import 'package:sicklesmart/screens/registration/registration.dart';

import '../../providers/_provider.dart';

class WelcomeAuthScreen extends ConsumerStatefulWidget {
  const WelcomeAuthScreen({super.key});

  @override
  WelcomeAuthScreenState createState() => WelcomeAuthScreenState();
}

class WelcomeAuthScreenState extends ConsumerState<WelcomeAuthScreen> {
  final GlobalKey<FormState> _signInFormKey = GlobalKey<FormState>();
  final containerKey = GlobalKey();

  var isPatient = false;

  late ColorScheme colorscheme;
  late TextTheme textTheme;
  User? currentUser;
  bool isSignIn = true;
  bool isLoading = false;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final fireStore = FireStore();

  Future<void> navigate() async {
    currentUser = FirebaseAuth.instance.currentUser;

    if (currentUser == null) {
      return;
    }
    bool isNotNew = await fireStore.db
        .collection("users")
        .doc(currentUser?.uid)
        .get()
        .then((value) => value.exists);

    if (currentUser != null && isNotNew && context.mounted) {
      Fluttertoast.showToast(
        msg: "Signed in",
        toastLength: Toast.LENGTH_SHORT,
      );
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (ctx) => const HomePage()));
    } else if (currentUser != null && !isNotNew && context.mounted) {
      Fluttertoast.showToast(
        msg: "Please complete your registration",
        toastLength: Toast.LENGTH_SHORT,
      );
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: ((context) => Registration(
                cUsr: currentUser,
              ))));
    }
  }

  @override
  void initState() {
    super.initState();

    navigate();
  }

  @override
  Widget build(BuildContext context) {
    colorscheme = Theme.of(context).colorScheme;
    textTheme = Theme.of(context).textTheme;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      bottomSheet: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: !isPatient
              ? ListView(
                  shrinkWrap: true,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                    Text("Are you a Patient or a Guardian?",
                        textAlign: TextAlign.center,
                        style: textTheme.titleLarge!.copyWith(
                          color: colorscheme.onPrimaryContainer,
                        )),
                    const SizedBox(height: 10),
                    ElevatedButton(
                        style: ButtonStyle(
                          overlayColor:
                              MaterialStatePropertyAll(Colors.red.shade100),
                          foregroundColor:
                              const MaterialStatePropertyAll(Colors.black),
                          backgroundColor:
                              const MaterialStatePropertyAll(Colors.white),
                        ),
                        onPressed: () {
                          setState(() {
                            isPatient = true;
                          });
                        },
                        child: const Center(
                          child: Text(
                            "I am a Patient",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                        style: ButtonStyle(
                            overlayColor:
                                MaterialStatePropertyAll(Colors.red.shade100),
                            foregroundColor:
                                const MaterialStatePropertyAll(Colors.black),
                            backgroundColor:
                                const MaterialStatePropertyAll(Colors.white)),
                        onPressed: () async {
                          isPatient = false;
                          showDialog(
                              context: context,
                              builder: (ctx) {
                                // return loading dialog
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              },
                              barrierDismissible: false);
                          var res = await ref
                              .read(authenticationProvider)
                              .signInWithGoogle(context, isPatient);
                          if (res == "success" && context.mounted) {
                            Navigator.of(context).pop();
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (ctx) => const HomePage()));
                          } else if (res == "not found" && context.mounted) {
                            Navigator.of(context).pop();
                            showDialog(
                                context: context,
                                builder: (ctx) {
                                  return AlertDialog(
                                    title: const Text(
                                        "No patient account found with this email"),
                                    content: const Text(
                                        "Please try again with a different email"),
                                    actions: [
                                      TextButton(
                                          onPressed: () {
                                            Navigator.of(ctx).pop();
                                          },
                                          child: const Text("OK"))
                                    ],
                                  );
                                });
                          } else {
                            if (context.mounted) {
                              Navigator.of(context).pop();
                            }
                          }
                        },
                        child: const Center(
                          child: Text(
                            "I am a Guardian",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        )),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                  ],
                )
              : ListView(
                  shrinkWrap: true,
                  children: [
                    const SizedBox(height: 10),
                    Text("Sign In",
                        textAlign: TextAlign.center,
                        style: textTheme.titleLarge!.copyWith(
                            color: colorscheme.onPrimaryContainer,
                            fontWeight: FontWeight.bold)),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(35, 0, 35, 0),
                      child: Form(
                        key: _signInFormKey,
                        child: Column(
                          children: [
                            const SizedBox(height: 25),
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: TextFormField(
                                controller: emailController,
                                keyboardType: TextInputType.emailAddress,
                                decoration: const InputDecoration(
                                  labelText: "Email address",
                                  contentPadding:
                                      EdgeInsets.fromLTRB(20, 10, 0, 10),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                    ),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(30),
                                    ),
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your email';
                                  } else if (!value.contains('.') &&
                                      !value.contains('@')) {
                                    return 'Please enter a valid email';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            const SizedBox(height: 20),
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: TextFormField(
                                controller: passwordController,
                                decoration: const InputDecoration(
                                  contentPadding:
                                      EdgeInsets.fromLTRB(20, 10, 0, 10),
                                  labelText: "Password",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(20),
                                    ),
                                    gapPadding: 2,
                                  ),
                                ),
                                obscureText: true,
                                obscuringCharacter: '*',
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your password';
                                  } else if (value.length < 6) {
                                    return 'Password must be atleast 6 characters long';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            const SizedBox(height: 20),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () async {
                                  if (_signInFormKey.currentState!.validate()) {
                                    showDialog(
                                        context: context,
                                        builder: (ctx) {
                                          return const Center(
                                            child: CircularProgressIndicator(),
                                          );
                                        });

                                    await ref
                                        .read(authenticationProvider)
                                        .signInWithEmailAndPassword(
                                          emailController.text,
                                          passwordController.text,
                                          context,
                                        )
                                        .whenComplete(
                                            () => Navigator.of(context).pop());
                                  }
                                },
                                style: ButtonStyle(
                                    overlayColor:
                                        const MaterialStatePropertyAll(
                                            Colors.white24),
                                    foregroundColor: MaterialStatePropertyAll(
                                        colorscheme.secondary),
                                    backgroundColor: MaterialStatePropertyAll(
                                        colorscheme.primary)),
                                child: Text(
                                  "Sign In",
                                  style: textTheme.bodyLarge!
                                      .copyWith(color: colorscheme.onPrimary),
                                ),
                              ),
                            ),
                            const SizedBox(height: 5),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context)
                                      .pushReplacement(MaterialPageRoute(
                                          builder: (ctx) => Registration(
                                                cUsr: currentUser,
                                              )));
                                },
                                style: ButtonStyle(
                                    overlayColor:
                                        const MaterialStatePropertyAll(
                                            Colors.white24),
                                    foregroundColor: MaterialStatePropertyAll(
                                        colorscheme.secondary),
                                    backgroundColor: MaterialStatePropertyAll(
                                        colorscheme.primary)),
                                child: Text(
                                  "Sign Up",
                                  style: textTheme.bodyLarge!
                                      .copyWith(color: colorscheme.onPrimary),
                                ),
                              ),
                            ),
                            const SizedBox(height: 5),
                            ElevatedButton(
                              style: const ButtonStyle(
                                  overlayColor:
                                      MaterialStatePropertyAll(Colors.black12),
                                  foregroundColor:
                                      MaterialStatePropertyAll(Colors.black),
                                  backgroundColor:
                                      MaterialStatePropertyAll(Colors.white)),
                              onPressed: () async {
                                showDialog(
                                    context: context,
                                    builder: (ctx) {
                                      // return loading dialog
                                      return const Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    },
                                    barrierDismissible: false);
                                await ref
                                    .read(authenticationProvider)
                                    .signInWithGoogle(context, isPatient)
                                    .catchError(
                                  (e) {
                                    debugPrint(e.toString());
                                  },
                                ).whenComplete(
                                  () async {
                                    // close loading dialog
                                    Navigator.of(context).pop();
                                    Fluttertoast.showToast(
                                      msg: "Signed in",
                                      toastLength: Toast.LENGTH_SHORT,
                                    );

                                    navigate();
                                  },
                                );
                              },
                              child: SizedBox(
                                width: double.infinity,
                                height: 40,
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image.asset(
                                        "assets/icons/google-icon.png",
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                    const Text(
                                      "Sign in with Google",
                                    )
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 30),
                            TextButton(
                              style: const ButtonStyle(
                                  foregroundColor:
                                      MaterialStatePropertyAll(Colors.black),
                                  backgroundColor:
                                      MaterialStatePropertyAll(Colors.white)),
                              onPressed: () {
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (ctx) => const HomePage()));
                              },
                              child: const Text("Continue as Guest"),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/welcome.jpg"), fit: BoxFit.fill),
        ),
      ),
    );
  }
}

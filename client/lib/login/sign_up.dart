import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_totarial/homepage/og.dart';
import 'package:login_totarial/login/login.dart';
import 'package:login_totarial/login/resource.dart';
import 'package:login_totarial/login/resource.dart';
import 'package:login_totarial/routs/routs.dart';
import 'package:http/http.dart' as http;
import 'package:toastification/toastification.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'dart:io';

//Login Page
class SignUpCard extends StatefulWidget {
  const SignUpCard({super.key});

  @override
  State<SignUpCard> createState() => _SignUpCardState();
}

class _SignUpCardState extends State<SignUpCard> {
  bool remember_me = false;
  bool password_show = true;
  IconData password_icon = Icons.visibility;
  final SignUpCardName = TextEditingController();
  final SignUpCardUsername = TextEditingController();
  final SignUpCardEmail = TextEditingController();
  final SignUpCardPassword = TextEditingController();
  final _SignUpCardcardKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Center(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            const SizedBox(height: 20),
            Heading('Sign up'),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Form(
                key: _SignUpCardcardKey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      controller: SignUpCardName,
                      validator: (value) {
                        RegExp name = RegExp(
                            r'(^[A-Za-z]{3,16})([ ]{0,1})([A-Za-z]{3,16})?([ ]{0,1})?([A-Za-z]{3,16})?([ ]{0,1})?([A-Za-z]{3,16})');
                        if (value == null || value.isEmpty) {
                          return 'Please Enter Your Name';
                        } else if (!name.hasMatch(value)) {
                          return 'Your Name is not valid';
                        }
                        return null;
                      },
                      decoration: Input('Full Name', 'Enter Your Name'),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: SignUpCardUsername,
                      validator: (value) {
                        RegExp username = RegExp(r'^[a-zA-Z0-9_-]{3,20}$');
                        if (value == null || value.isEmpty) {
                          return 'Please Enter Your Username';
                        } else if (!username.hasMatch(value)) {
                          return 'Your Username is not valid';
                        }
                        return null;
                      },
                      decoration: Input('Username', 'Enter Your Username'),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: SignUpCardEmail,
                      validator: (value) {
                        RegExp emailRegex =
                            RegExp(r'^[a-zA-Z0-9._%+-]+@gmail\.com$');
                        if (value == null || value.isEmpty) {
                          return 'Please Enter Your Email';
                        } else if (!emailRegex.hasMatch(value)) {
                          return 'Your Email is wrong';
                        }
                        return null;
                      },
                      decoration: Input('Email', 'Enter Your Email'),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: SignUpCardPassword,
                      validator: (value) {
                        // ignore: non_constant_identifier_names
                        RegExp Password2Regex =
                            RegExp(r'^(?=.*[a-zA-Z])(?=.*\d)(?=.*\w).{8,}$');
                        if (value == null || value.isEmpty) {
                          return 'Please Enter Your Password';
                        } else if (!Password2Regex.hasMatch(value)) {
                          return "Your Password Is Wrong";
                        }
                        return null;
                      },
                      obscureText: password_show,
                      decoration: InputDecoration(
                        label: const Text('Password'),
                        hintText: 'Enter Your Password',
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.black,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.red,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Colors.red,
                            width: 1,
                          ),
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              if (password_show == true) {
                                password_show = false;
                                password_icon = Icons.visibility_off;
                              } else {
                                password_show = true;
                                password_icon = Icons.visibility;
                              }
                            });
                          },
                          icon: Icon(password_icon),
                        ),
                      ),
                    ),
                    const SizedBox(height: 0),
                    Row(
                      children: [
                        Transform.scale(
                          scale: 1.4,
                          child: Checkbox(
                            value: remember_me,
                            onChanged: (bool? value) {
                              setState(() {
                                remember_me = value!;
                              });
                            },
                            checkColor: Colors.black,
                            activeColor: const Color(0xFFF5C418),
                          ),
                        ),
                        Remamberme2(
                            'I agree to the platforms Terms of Service and Privacy Policy')
                      ],
                    ),
                    const SizedBox(height: 10),
                    Container(
                      height: 43,
                      width: double.infinity,
                      decoration: ShadowBtn(),
                      child: ElevatedButton(
                        onPressed: () async {
                          if (_SignUpCardcardKey.currentState!.validate()) {
                            http
                                .post(
                                  Uri.parse(
                                      'http://192.168.43.154/api/register'),
                                  headers: {
                                    HttpHeaders.contentTypeHeader:
                                        'application/json; charset=UTF-8',
                                  },
                                  body: jsonEncode({
                                    'name': SignUpCardName.text,
                                    'email': SignUpCardUsername.text,
                                    'phone': SignUpCardEmail.text,
                                    'password': SignUpCardPassword.text,
                                  }),
                                )
                                .then((value) => {
                                      if (value.statusCode == 200)
                                        {
                                          //email and password is ok
                                          toastification.show(
                                              backgroundColor: Colors.green,
                                              context: context,
                                              title: const Text(
                                                  "Signed up successfully"),
                                              autoCloseDuration:
                                                  const Duration(seconds: 3)),
                                          Get.to(const Login())
                                        }
                                      else if (value.statusCode == 409)
                                        {
                                          //email and password is not ok
                                          toastification.show(
                                              backgroundColor: Colors.red,
                                              context: context,
                                              title: const Text(
                                                  "Account already exists"),
                                              autoCloseDuration:
                                                  const Duration(seconds: 3))
                                        }
                                      else
                                        {
                                          //email and password is not ok
                                          toastification.show(
                                              backgroundColor: Colors.red,
                                              context: context,
                                              title: const Text(
                                                  "The information is invalid"),
                                              autoCloseDuration:
                                                  const Duration(seconds: 3))
                                        }
                                    })
                                .onError((error, stackTrace) => {});
                          }
                        else
                          {
                            //email and password is not ok
                            toastification.show(
                                backgroundColor: Colors.red,
                                context: context,
                                title: const Text(
                                    "The information is invalid"),
                                autoCloseDuration:
                                    const Duration(seconds: 3));
                          }
                        },
                        style: StyleBtn1(Colors.black, const Color(0xFFF6B100)),
                        child: const Text("Create Account"),
                      ),
                    ),
                    const SizedBox(height: 25),
                    Row(
                      children: <Widget>[
                        Container(
                          width: 160,
                          decoration: ShadowBtn(),
                          child: ElevatedButton(
                            onPressed: () async {
                              //sign in with google+
                            },
                            style: StyleBtn(Colors.white, Colors.black),
                            child: const Text("With Google"),
                          ),
                        ),
                        const SizedBox(width: 16),
                        const Text(
                          'or',
                          style: TextStyle(
                            color: Colors.black,
                            decoration: TextDecoration.none,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Container(
                          width: 160,
                          decoration: ShadowBtn(),
                          child: ElevatedButton(
                            onPressed: () async {
                              //sign in with facebook
                            },
                            style: StyleBtn(Colors.white, Colors.black),
                            child: const Text("With Facebook"),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 25),
                    LineTxt2('Already have an Account?'),
                    const SizedBox(height: 25),
                    Container(
                      width: double.infinity,
                      decoration: ShadowBtn(),
                      child: ElevatedButton(
                        onPressed: () async {
                          // what this btn do
                          Get.to(const Login());
                        },
                        style: StyleBtn(Colors.white, Colors.black),
                        child: const Text("Login"),
                      ),
                    ),
                    const SizedBox(height: 25),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        TxtBtnCU('Conditions of Use'),
                        TxtBtnPN('Privacy Notice'),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}

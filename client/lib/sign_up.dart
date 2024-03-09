import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:login_totarial/login_page.dart';
import 'package:login_totarial/og.dart';
import 'package:toastification/toastification.dart';
import 'package:flutter/gestures.dart';

String register = "register";

// class SignUpCard extends StatefulWidget{
//   const SignUpCard({super.key});

//   @override
//   State<StatefulWidget> createState() {
//     return _SignUpCardState()
//   }
// }

// class _SignUpCardState extends State<SignUpCard>{
//   @override
//   Widget build(BuildContext context) {
//     return 
//   }
// }


class SignUpCard extends StatelessWidget {
  SignUpCard({super.key});

  final signupFullname = TextEditingController();
  final signupEmail = TextEditingController();
  final signupPhone = TextEditingController();
  final signupPassword = TextEditingController();
  final _signupcardKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    // Size size1 = MediaQuery.of(context).size;
    return SingleChildScrollView(
        reverse: true,
        //physics: const NeverScrollableScrollPhysics(),
        child: ConstrainedBox(
            constraints: const BoxConstraints(),
            child: SizedBox(
                // min.width: MediaQuery.of(context).size.height,
                // min.height:  MediaQuery.of(context).size.height,
                child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //SizedBox(height: size1.height * 0.19),
                // const SizedBox(height: 40),
                Image.asset(
                  "assets/imdb.png",
                ),
                // SizedBox(height: size1.height * 0.05),
                const SizedBox(height: 50),
                Container(
                    color: Colors.white,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32, vertical: 10),
                    height: 550,
                    child: Form(
                        key: _signupcardKey,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please Enter Your Full Name';
                                }
                                return null;
                              },
                              controller: signupFullname,
                              decoration: InputDecoration(
                                focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                      color: Colors.red,
                                      width: 1,
                                    )),
                                label: const Text('Full Name'),
                                hintText: 'Enter Your Full Name',
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.grey),
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
                              ),
                            ),
                            const SizedBox(height: 10),
                            TextFormField(
                              validator: (value) {
                               RegExp emailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@gmail\.com$');
                                if (value == null || value.isEmpty) {
                                  return 'Please Enter Your Email';
                                }else if(!emailRegex.hasMatch(value)){
                                  return 'Wrong Email';
                                }
                                return null;
                              },
                              controller: signupEmail,
                              decoration: InputDecoration(
                                focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                      color: Colors.red,
                                      width: 1,
                                    )),
                                label: const Text('Email'),
                                hintText: 'Enter Your Email',
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.grey),
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
                              ),
                            ),
                            const SizedBox(height: 10),
                            TextFormField(
                              validator: (value) {
                                 RegExp PhonenumberRegex = RegExp(r'^09\d{9}$');
                                if (value == null || value.isEmpty) {
                                  return 'Please Enter Your Phone Number';
                                } else if (!PhonenumberRegex.hasMatch(value)){
                                  return "Your Phone number sholud start with 09 and have 11 number";
                                }
                                return null;
                              },
                              controller: signupPhone,
                              decoration: InputDecoration(
                                focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                      color: Colors.red,
                                      width: 1,
                                    )),
                                label: const Text('Phone Number'),
                                hintText: 'Enter Your Phone Number',
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.grey),
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
                              ),
                            ),
                            const SizedBox(height: 10),
                            TextFormField(
                              validator: (value) {
                                RegExp PasswordRegex = RegExp(r'^(?=.*[a-zA-Z])(?=.*\d)(?=.*\w).{8,}$');
                                if (value == null || value.isEmpty) {
                                  return 'Please Enter Your Password';
                                } else if (!PasswordRegex.hasMatch(value)){
                                    return"Your Password must contian character and numbers and words";
                                }
                                return null;
                              },
                              controller: signupPassword,
                              obscureText: true,
                              decoration: InputDecoration(
                                focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                      color: Colors.red,
                                      width: 1,
                                    )),
                                label: const Text('password'),
                                hintText: 'Enter Your Password',
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.grey),
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
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              height: 50,
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {
                                  if (_signupcardKey.currentState!.validate()) {
                                    //Get.to(LoginCard());
                                    toastification.show(
                                        context: context,
                                        title: const Text(
                                            "Registering information"),
                                        autoCloseDuration:
                                            const Duration(seconds: 3));
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                            content: Text("wait for login")));
                                  } else {}
                                  http
                                      .post(
                                        Uri.parse(
                                            'https://jsonplaceholder.typicode.com/api/register'),
                                        headers: {
                                          HttpHeaders.contentTypeHeader:
                                              'application/json; charset=UTF-8',
                                        },
                                        body: jsonEncode({
                                          'fullname': signupFullname.text,
                                          'email': signupEmail.text,
                                          'phone': signupPhone.text,
                                          'password': signupPassword.text,
                                        }),
                                      )
                                      .then((value) => {
                                        
                                            if (value.statusCode != null)
                                              {
                                                //email and password is ok
                                              }
                                            else
                                              {
                                                //email and password is not ok
                                              }
                                          })
                                      .onError((error, stackTrace) => {});
                                },
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    foregroundColor: Colors.black,
                                    backgroundColor: const Color(0xFFFFC107),
                                    textStyle: const TextStyle(
                                      fontSize: 20,
                                    )),
                                child: const Text("Sign Up"),
                              ),
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            Row(
                              children: [
                                const Text(
                                  "Do you have an account ?",
                                  style: TextStyle(
                                    decoration: TextDecoration.none,
                                    color: Colors.black,
                                    fontSize: 14,
                                  ),
                                ),
                                const SizedBox(
                                  width: 55,
                                ),
                                
                                // GestureDetector(
                                //   child: Text('C'),
                                //   onTap: () {
                                //     Get.to(LoginCard());
                                //     //go to destination page
                                //   },
                                // )
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      const TextSpan(
                                        text:
                                            "By  ",
                                      ),
                                     TextSpan(
                                        text: "Login",
                                        style: const TextStyle(
                                          color: Color.fromARGB(255, 0, 0, 0),
                                          fontSize: 22
                                        ),
                                        recognizer:  TapGestureRecognizer()
                                          ..onTap =
                                              () => Get.to(LoginCard()),
                                      ),
                                    //  const TextSpan(text: "and our "),
                                    //   TextSpan(
                                    //     text: "Terms and Conditions ",
                                    //     style: const TextStyle(
                                    //       color: Colors.lightGreen,
                                    //     ),
                                    //     recognizer:  TapGestureRecognizer()
                                    //       ..onTap = () =>
                                    //           print("Terms and Conditions"),
                                    //   ),
                                    //   const TextSpan(text: "and "),
                                    //   TextSpan(
                                    //     text: "Cookie Statement",
                                    //     style: const TextStyle(
                                    //       color: Colors.lightGreen,
                                    //     ),
                                    //     recognizer:  TapGestureRecognizer()
                                    //       ..onTap =
                                    //           () => print("Cookie Statement"),
                                    //   ),
                                    //   const TextSpan(text: "."),
                                    ],
                                  ),
                                ),
                                /*  ElevatedButton(
                                    onPressed: () {
                                      //email and password is ok
                                      /* Fluttertoast.showToast(
                                      msg: "This is a Toast message",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.CENTER,
                                      timeInSecForIosWeb: 1,
                                      textColor: Colors.white,
                                      fontSize: 16.0);*/
                                      Get.to(LoginCard());
                                    },
                                    style: ElevatedButton.styleFrom(),
                                    child: const Text("Login"))*/
                              ],
                            )
                          ],
                        )))
              ],
            ))));
  }
}

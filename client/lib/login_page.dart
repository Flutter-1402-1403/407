import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:login_totarial/og.dart';
import 'package:login_totarial/sign_up.dart';

String register = "register";

class LoginCard extends StatelessWidget {
  LoginCard({super.key});

  final loginUsername = TextEditingController();
  final loginPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
     // physics: const NeverScrollableScrollPhysics(),
        child: ConstrainedBox(
            constraints: const BoxConstraints(),
            child: SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: IntrinsicHeight(
                    //reverse: true,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 60),
                        Image.asset("assets/imdb.png"),
                        const SizedBox(height: 114.8),
                        Container(
                            color: Colors.white,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 32, vertical: 44),
                            height: 500,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                TextFormField(
                                  controller: loginUsername,
                                  decoration: InputDecoration(
                                    label: const Text('Email / Phone Number'),
                                    hintText: 'Enter Your Email / Phone Number',
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
                                  controller: loginPassword,
                                  obscureText: true,
                                  decoration: InputDecoration(
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
                                  height: 22,
                                ),
                                SizedBox(
                                  height: 50,
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    onPressed: () async {
                                      http
                                          .post(
                                            Uri.parse(
                                                'https://jsonplaceholder.typicode.com/api/login'),
                                            headers: {
                                              HttpHeaders.contentTypeHeader:
                                                  'application/json; charset=UTF-8',
                                            },
                                            body: jsonEncode({
                                              'email': loginUsername.text,
                                              'password': loginPassword.text,
                                            }),
                                          )
                                          .then((value) => {
                                                if (value.statusCode != null)
                                                  {Get.to(const OgCard())}
                                                else
                                                  {}
                                              })
                                          .onError((error, stackTrace) => {

                                          });
                                      Get.to(OgCard());
                                    },
                                    style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(12)),
                                        foregroundColor: Colors.black,
                                        backgroundColor:
                                            const Color(0xFFFFC107),
                                        textStyle: const TextStyle(
                                          fontSize: 20,
                                        )),
                                    child: const Text("login"),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                SizedBox(
                                  height: 65,
                                  width: double.infinity,
                                  child: ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12)),
                                          foregroundColor: Colors.black,
                                          backgroundColor: const Color.fromARGB(
                                              255, 255, 255, 255),
                                          textStyle: const TextStyle(
                                            fontSize: 20,
                                          )),
                                      child:
                                          const Text("I forgot my password")),
                                ),
                                const SizedBox(
                                  height: 33,
                                ),
                                Row(
                                  children: [
                                    const Text(
                                      "Don't have an account ?",
                                      style: TextStyle(
                                        decoration: TextDecoration.none,
                                        color: Colors.black,
                                        fontSize: 14,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 35,
                                    ),
                                    ElevatedButton(
                                        onPressed: () {
                                          Get.to(SignUpCard());
                                        },
                                        style: ElevatedButton.styleFrom(),
                                        child: const Text("Sign Up"))
                                  ],
                                )
                              ],
                            ))
                      ],
                    )))));
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_totarial/login/condition_of_use.dart';
import 'package:login_totarial/login/forgot_password.dart';
import 'package:login_totarial/login/privacy_notice.dart';

Heading(String title) {
  return Text(
    title,
    style: const TextStyle(
      color: Color.fromARGB(255, 0, 0, 0),
      decoration: TextDecoration.none,
      fontFamily: 'Roboto',
      fontSize: 19,
      fontWeight: FontWeight.bold,
      shadows: [
        Shadow(
          color: Colors.grey, // Shadow color
          offset: Offset(2, 2), // Position of the shadow
          blurRadius: 3, // Spread radius of the shadow
        ),
      ],
    ),
  );
}

RatingText(String title) {
  return Text(
    title,
    style: const TextStyle(
      color: Color.fromARGB(255, 0, 0, 0),
      decoration: TextDecoration.none,
      fontFamily: 'Roboto',
      fontSize: 19,
      fontWeight: FontWeight.bold,
      shadows: [
        Shadow(
          color: Colors.grey, // Shadow color
          offset: Offset(2, 2), // Position of the shadow
          blurRadius: 3, // Spread radius of the shadow
        ),
      ],
    ),
  );
}

Remamberme(String title) {
  return Text(
    title,
    style: const TextStyle(
      color: Color.fromARGB(255, 0, 0, 0),
      decoration: TextDecoration.none,
      fontFamily: 'Roboto',
      fontSize: 15,
      fontWeight: FontWeight.w400,
    ),
  );
}

Remamberme2(String title) {
  return Text(
    title,
    style: const TextStyle(
      color: Color.fromARGB(255, 0, 0, 0),
      decoration: TextDecoration.none,
      fontFamily: 'Roboto',
      fontSize: 12,
      fontWeight: FontWeight.w400,
    ),
  );
}

Input(String label, String hinttext) {
  return InputDecoration(
    label: Text(label),
    hintText: hinttext,
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
  );
}

TxtBtnFP(String? title) {
  return TextButton(
    onPressed: () {
      Get.to(const ForgotPassword());
    },
    child: Text(
      title!,
      style: const TextStyle(
        color: Colors.grey,
      ),
    ),
  );
}

TxtBtnCU(String? title) {
  return TextButton(
    onPressed: () {
      Get.to(const ConditionOfUse());
    },
    child: Text(
      title!,
      style: const TextStyle(
        color: Colors.grey,
      ),
    ),
  );
}

TxtBtnPN(String? title) {
  return TextButton(
    onPressed: () {
      Get.to(const PrivacyNotice());
    },
    child: Text(
      title!,
      style: const TextStyle(
        color: Colors.grey,
      ),
    ),
  );
}

ShadowBtn() {
  return BoxDecoration(
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.5),
        spreadRadius: 2,
        blurRadius: 5,
        offset: const Offset(0, 3), // changes position of shadow
      ),
    ],
  );
}

StyleBtn(Color foregroundColor, Color backgroundColor) {
  return ElevatedButton.styleFrom(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    foregroundColor: foregroundColor,
    backgroundColor: backgroundColor,
    padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
    textStyle: const TextStyle(
      fontSize: 15,
    ),
  );
}
StyleBtnI(Color foregroundColor, Color backgroundColor) {
  return ElevatedButton.styleFrom(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    foregroundColor: foregroundColor,
    backgroundColor: backgroundColor,
    minimumSize: Size(30, 25),
    padding: const EdgeInsets.symmetric( horizontal: 5),
    textStyle: const TextStyle(
      
      fontSize: 13,
    ),
  );
}
StyleBtnR(Color foregroundColor, Color backgroundColor) {
  return ElevatedButton.styleFrom(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    foregroundColor: foregroundColor,
    backgroundColor: backgroundColor,
    padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
    textStyle: const TextStyle(
      fontSize: 11,
    ),
  );
}

StyleBtn1(Color foregroundColor, Color backgroundColor) {
  return ElevatedButton.styleFrom(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    foregroundColor: foregroundColor,
    backgroundColor: backgroundColor,
    padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 30),
    textStyle: const TextStyle(
      fontSize: 15,
    ),
  );
}

LineTxt(String title) {
  return Row(
    children: <Widget>[
      const SizedBox(width: 7),
      Image.asset('assets/images/line.png'),
      const SizedBox(width: 38),
      Text(
        title,
        style: const TextStyle(
          decoration: TextDecoration.none,
          color: Colors.black,
          fontSize: 15,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w400,
        ),
      ),
      const SizedBox(width: 39),
      Image.asset('assets/images/line.png'),
    ],
  );
}

LineTxt2(String title) {
  return Row(
    children: <Widget>[
      Image.asset('assets/images/line.png'),
      const SizedBox(width: 11),
      Text(
        title,
        style: const TextStyle(
          decoration: TextDecoration.none,
          color: Colors.black,
          fontSize: 14,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w400,
        ),
      ),
      const SizedBox(width: 11),
      Image.asset('assets/images/line.png'),
    ],
  );
}

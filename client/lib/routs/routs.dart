import 'package:get/get.dart';
import 'package:login_totarial/login/login.dart';
import 'package:login_totarial/homepage/og.dart';
import 'package:login_totarial/login/sign_up.dart';
import 'package:login_totarial/login/privacy_notice.dart';
import 'package:login_totarial/login/condition_of_use.dart';
import 'package:login_totarial/login/forgot_password.dart';

appRoutes() => [
      GetPage(
        name: '/Login',
        page: () => Login(),
        transition: Transition.circularReveal,
        transitionDuration: const Duration(milliseconds: 500),
      ),
      GetPage(
        name: '/SignUp',
        page: () => SignUpCard(),
        transition: Transition.fade,
        transitionDuration:const Duration(milliseconds: 500),
      ),
      GetPage(
        name: '/OgCard',
        page: () => OgCard(),
        transition: Transition.leftToRightWithFade,
        transitionDuration:const Duration(milliseconds: 500),
      ),
      GetPage(
        name: '/PrivacyNotice',
        page: () => PrivacyNotice(),
        transition: Transition.fade,
        transitionDuration:const Duration(milliseconds: 500),
      ), GetPage(
        name: '/ConditionOfUse',
        page: () => ConditionOfUse(),
        transition: Transition.fade,
        transitionDuration:const Duration(milliseconds: 500),
      ), GetPage(
        name: '/ForgotPassword',
        page: () => ForgotPassword(),
        transition: Transition.fade,
        transitionDuration:const Duration(milliseconds: 500),
      ),
      

];
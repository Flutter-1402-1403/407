import 'package:get/get.dart';
import 'package:login_totarial/ass/login/login_page.dart';
import 'package:login_totarial/homepage/og.dart';
import 'package:login_totarial/ass/login/sign_up.dart';
import 'package:login_totarial/ass/login/PrivacyNotice.dart';

appRoutes() => [
      GetPage(
        name: '/Login',
        page: () => LoginCard(),
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
      ),

];
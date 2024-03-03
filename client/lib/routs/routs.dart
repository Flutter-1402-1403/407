import 'package:get/get.dart';
import 'package:login_totarial/login_page.dart';
import 'package:login_totarial/sign_up.dart';

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
        transition: Transition.leftToRightWithFade,
        transitionDuration:const Duration(milliseconds: 500),
      ),
];
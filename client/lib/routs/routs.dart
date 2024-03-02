
import 'package:get/get.dart';
import 'package:login_totarial/login_page.dart';
import 'package:login_totarial/sign_up.dart';

appRoutes() => [
      GetPage(
        name: '/Login',
        page: () => const LoginCard(),
        transition: Transition.circularReveal,
        transitionDuration: const Duration(milliseconds: 500),
      ),
      GetPage(
        name: '/SignUp',
        page: () => const SignUpCard(),
        transition: Transition.leftToRightWithFade,
        transitionDuration:const Duration(milliseconds: 500),
      ),
];
class MyMiddelware extends GetMiddleware {
  @override
  GetPage? onPageCalled(GetPage? page) {
    print(page?.name);
    return super.onPageCalled(page);
  }
}
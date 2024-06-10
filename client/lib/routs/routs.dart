import 'package:get/get.dart';
import 'package:login_totarial/login/login.dart';
import 'package:login_totarial/homepage/og.dart';
import 'package:login_totarial/login/sign_up.dart';
import 'package:login_totarial/login/privacy_notice.dart';
import 'package:login_totarial/login/condition_of_use.dart';
import 'package:login_totarial/login/forgot_password.dart';
import 'package:login_totarial/homepage/movie_information.dart';
import 'package:login_totarial/homepage/rating.dart';
import 'package:login_totarial/homepage/profile.dart';


appRoutes() => [
      GetPage(
        name: '/Login',
        page: () => const Login(),
        transition: Transition.circularReveal,
        transitionDuration: const Duration(milliseconds: 500),
      ),
      GetPage(
        name: '/SignUp',
        page: () => const SignUpCard(),
        transition: Transition.fade,
        transitionDuration: const Duration(milliseconds: 500),
      ),
      GetPage(
        name: '/OgCard',
        page: () => const OgCard(),
        transition: Transition.leftToRightWithFade,
        transitionDuration: const Duration(milliseconds: 500),
      ),
      GetPage(
        name: '/PrivacyNotice',
        page: () => const PrivacyNotice(),
        transition: Transition.fade,
        transitionDuration: const Duration(milliseconds: 500),
      ),
      GetPage(
        name: '/ConditionOfUse',
        page: () => const ConditionOfUse(),
        transition: Transition.fade,
        transitionDuration: const Duration(milliseconds: 500),
      ),
      GetPage(
        name: '/ForgotPassword',
        page: () => const ForgotPassword(),
        transition: Transition.fade,
        transitionDuration: const Duration(milliseconds: 500),
      ),
      GetPage(
        name: '/MovieInformation',
        page: () => const MovieInformation(),
        transition: Transition.fade,
        transitionDuration: const Duration(milliseconds: 500),
      ),
      GetPage(
        name: '/RatingAndReviewsPage',
        page: () => RatingAndReviewsPage(),
        transition: Transition.fade,
        transitionDuration: const Duration(milliseconds: 500),
      ),
       GetPage(
        name: '/RatingAndReviewsPage',
        page: () => RatingAndReviewsPage(),
        transition: Transition.fade,
        transitionDuration: const Duration(milliseconds: 500),
      ),GetPage(
        name: '/UserProfilePage',
        page: () => UserProfilePage(),
        transition: Transition.fade,
        transitionDuration: const Duration(milliseconds: 500),
      ),
      

    ];

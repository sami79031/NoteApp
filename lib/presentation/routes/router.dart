

import 'package:auto_route/auto_route_annotations.dart';
import 'package:note_taking_app/presentation/core/sign_in/sign_in.dart';
import 'package:note_taking_app/presentation/splash/splash_page.dart';

@MaterialAutoRouter(routes: <AutoRoute>[
  MaterialRoute(page: SplashPage, initial: true),
  MaterialRoute(page: SignInPage),
])

class $AppRouter {
  SplashPage splashPage;
  SignInPage signInPage;
}
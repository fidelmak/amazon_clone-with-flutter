import 'package:amazon_clone/amazonApp/view/cart/cart_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../amazonApp/view/auth/login.dart';
import '../amazonApp/view/auth/sign_up.dart';
import '../amazonApp/view/home_screen.dart';
import '../amazonApp/view/profile/profile.dart';
import '../amazonApp/widgets/auth_widget.dart';
import '../splash_screen.dart';

final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/splash',
    routes: [
      GoRoute(
        path: '/home',
        builder: (context, state) => HomePage(),
      ),
      GoRoute(
        path: '/search',
        builder: (context, state) => CartPage(),
      ),
      GoRoute(
        path: '/profile',
        builder: (context, state) => const ProfilePage(),
      ),
      GoRoute(
        path: '/splash',
        builder: (context, state) => SplashScreen(),
      ),
      GoRoute(
        path: '/auth',
        builder: (context, state) => AuthWidget(),
      ),
      //SignupPage
      GoRoute(
        path: '/signup',
        builder: (context, state) => SignupPage(),
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => LoginPage(),
      ),
    ],
  );
});

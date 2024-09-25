import 'package:scrubsnepal/features/auth/presentation/view/login_view.dart';
import 'package:scrubsnepal/features/auth/presentation/view/register_view.dart';
import 'package:scrubsnepal/features/cart/presentation/view/add_cart_view.dart';
import 'package:scrubsnepal/features/home/presentation/view/bottom_view/dashboard_view.dart';
import 'package:scrubsnepal/features/other/view/address_view.dart';
import 'package:scrubsnepal/features/other/view/favourite_view.dart';
import 'package:scrubsnepal/features/other/view/forgot_password_screen.dart';
import 'package:scrubsnepal/features/other/view/product_view.dart';
import 'package:scrubsnepal/features/other/view/profile_view.dart';
import 'package:scrubsnepal/features/other/view/setting_view.dart';
import 'package:scrubsnepal/features/splash/presentation/view/splash_view.dart';

import '../../features/home/presentation/view/home_view.dart';

class AppRoute {
  AppRoute._();

  static const String splashRoute = '/splash';
  static const String homeRoute = '/home';
  static const String loginRoute = '/login';
  static const String registerRoute = '/register';
  static const String forgotPasswordRoute = '/profile';

  static const String batchStudentRoute = '/batchStudent';
  static const String dashboardRoute = "/dashboard";
  static const String exploreRoute = "/explore";
  static const String favoriteRoute = "/favorite";
  static const String cartRoute = "/cart";
  static const String productPageRoute = "/productPage";

  static const String profileRoute = "/profile";
  static const String settingRoute = "/setting";
  static const String addressRoute = "/address";

  static getApplicationRoute() {
    return {
      splashRoute: (context) => const SplashView(),
      loginRoute: (context) => const LoginView(),
      homeRoute: (context) => const HomeView(),

      registerRoute: (context) => const RegisterView(),
      dashboardRoute: (context) => const DashboardView(),
      exploreRoute: (context) => const ProductsView(),
      favoriteRoute: (context) => const FavouriteView(),
      cartRoute: (context) => AddCartView(),
      addressRoute: (context) => const AddressPage(),

      profileRoute: (context) => const ProfileView(),
      settingRoute: (context) => const SettingView(),
      forgotPasswordRoute: (context) => const ForgotPasswordScreen(),
      // batchStudentRoute: (context) => const BatchStudentView(null),
      // googleMapRoute: (context) => const GoogleMapView(),
    };
  }
}

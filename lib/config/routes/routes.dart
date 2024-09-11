import 'package:flutter/cupertino.dart';
import 'package:markaz_elamal/features/chat_screen/presentation/pages/chat_screen.dart';
import 'package:markaz_elamal/features/doctor_profile/presentation/pages/doctor_profile_screen.dart';
import 'package:markaz_elamal/features/doctors_category/presentation/pages/doctors_category_screen.dart';
import 'package:markaz_elamal/features/history_screen/presentation/pages/history_screen.dart';
import 'package:markaz_elamal/features/home/presentation/pages/home_screen.dart';
import 'package:markaz_elamal/features/login/presentation/pages/login_screen.dart';
import 'package:markaz_elamal/features/logout_screen/presentation/pages/logout_screen.dart';
import 'package:markaz_elamal/features/on_boarding/presentation/pages/on_boarding_screen.dart';
import 'package:markaz_elamal/features/payment_mathod_screen/presentation/pages/payment_method_screen.dart';
import 'package:markaz_elamal/features/privacy_settings/presentation/pages/privacy_settings_screen.dart';
import 'package:markaz_elamal/features/settings/presentation/pages/settings_screen.dart';
import 'package:markaz_elamal/features/sign_up/presentation/pages/sign_up_screen.dart';
import 'package:markaz_elamal/features/splash_screen/presentation/pages/splash_screen.dart';

import '../../features/chats_screen/presentation/pages/chats_screen.dart';
import '../../features/notification_screen/presentation/pages/notification_screen.dart';
import '../../features/profile_details.dart';

class AppRoutes {
  static const String splash = '/';
  static const String login = '/login';
  static const String register = '/register';
  static const String home = '/home';
  static const String onBoarding = '/onBoarding';
  static const String categoryDoctors = '/categoryDoctors';
  static const String doctorProfile = '/doctorProfile';
  static const String paymentMethod = '/paymentMethod';
  static const String chatScreen = "/chatScreen";
  static const String chatsScreen = "/chatsScreen";
  static const String notficationScreen = "/notificationScreen";
  static const String historyDetails = "/historyDetails";
  static const String profileDetails = "/profileDetails";
  static const String settings = "/settings";
  static const String privacy = "/privacy";
  static const String logout = "/logout";
}

class Routs {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splash:
        return CupertinoPageRoute(builder: (_) => SplashScreen());
      case AppRoutes.onBoarding:
        return CupertinoPageRoute(builder: (_) => OnBoardingScreen());
      case AppRoutes.login:
        return CupertinoPageRoute(builder: (_) => LoginScreen());
      case AppRoutes.register:
        return CupertinoPageRoute(builder: (_) => SignUpScreen());
      case AppRoutes.home:
        return CupertinoPageRoute(builder: (_) => HomeScreen());
      case AppRoutes.categoryDoctors:
        return CupertinoPageRoute(
            builder: (_) => DoctorsCategoryScreen(), settings: settings);
      case AppRoutes.doctorProfile:
        return CupertinoPageRoute(
            builder: (_) => DoctorProfileScreen(), settings: settings);
      case AppRoutes.paymentMethod:
        return CupertinoPageRoute(builder: (_) => PaymentMethodScreen());
      case AppRoutes.chatScreen:
        return CupertinoPageRoute(
            builder: (_) => ChatScreen(), settings: settings);
      case AppRoutes.chatsScreen:
        return CupertinoPageRoute(builder: (_) => ChatsScreen());
      case AppRoutes.notficationScreen:
        return CupertinoPageRoute(builder: (_) => NotificationScreen());
      case AppRoutes.historyDetails:
        return CupertinoPageRoute(builder: (_) => HistoryScreen());
      case AppRoutes.profileDetails:
        return CupertinoPageRoute(
            builder: (_) => ProfileDetails(), settings: settings);
      case AppRoutes.settings:
        return CupertinoPageRoute(builder: (_) => SettingsScreen());
      case AppRoutes.privacy:
        return CupertinoPageRoute(builder: (_) => PrivacySettingsScreen());
      case AppRoutes.logout:
        return CupertinoPageRoute(builder: (_) => LogoutScreen());
      default:
        return CupertinoPageRoute(builder: (_) => Container());
    }
  }
}

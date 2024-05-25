import 'package:get/get.dart';

class LocalizationString extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'welcome': 'Welcome',
          'email': 'Email',
          'password': 'Password',
          'login': "Login",
        },
        'bn_BD': {
          'welcome': 'স্বাগতম',
          'email': 'ইমেইল',
          'password': 'পাসওয়ার্ড',
          'login': 'প্রবেশ করুন',
        }
      };
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_task/Application/util/localization_string.dart';
import 'package:simple_task/Application/util/theme/theme.dart';
import 'package:simple_task/controller/locale_controller.dart';
import 'package:simple_task/view/login_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final LocaleController localeController = Get.put(LocaleController());

    return Obx(() {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        translations: LocalizationString(),
        locale: const Locale('en', 'US'),
        title: 'Simple Test',
        theme: Themes().lightTheme,
        darkTheme: Themes().darkTheme,
        themeMode: localeController.isDarkMode.value
            ? ThemeMode.dark
            : ThemeMode.light,
        home: const LoginScreen(),
      );
    });
  }
}

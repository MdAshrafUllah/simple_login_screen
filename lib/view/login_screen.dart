import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_task/Application/util/app_color.dart';
import 'package:simple_task/Application/util/font_style.dart';
import 'package:simple_task/controller/locale_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isVisible = false;
  final LocaleController localeController = Get.put(LocaleController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.transparentColor,
        actions: [
          IconButton(
            onPressed: () {
              localeController.toggleThemeMode();
            },
            icon: Obx(() {
              return Transform.rotate(
                angle: 345,
                child: Icon(
                  localeController.isDarkMode.value
                      ? Icons.sunny
                      : Icons.nightlight_round_rounded,
                  color: localeController.isDarkMode.value
                      ? AppColor.whiteColor
                      : AppColor.secondaryColor,
                ),
              );
            }),
          ),
          Obx(() {
            return popupMenuButton();
          }),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                color: AppColor.secondaryColor.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(
                  Icons.person,
                  color: AppColor.primaryColor,
                  size: 50,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "welcome".tr,
              style: FontStyle.bigTitle,
            ),
            const SizedBox(
              height: 50,
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: "email".tr,
                suffixIcon: const Icon(
                  Icons.mail_rounded,
                  color: AppColor.primaryColor,
                ),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: "password".tr,
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      isVisible = !isVisible;
                    });
                  },
                  icon: Icon(
                    isVisible ? Icons.visibility : Icons.visibility_off,
                    color: AppColor.primaryColor,
                  ),
                ),
              ),
              obscureText: !isVisible,
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              width: double.maxFinite,
              height: 50,
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  "login".tr,
                  style:
                      FontStyle.buttonText.copyWith(color: AppColor.whiteColor),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  PopupMenuButton<String> popupMenuButton() {
    return PopupMenuButton(
      iconColor: localeController.isDarkMode.value
          ? AppColor.whiteColor
          : AppColor.secondaryColor,
      onSelected: (value) {
        setState(() {
          localeController.updateLocale(value);
        });
      },
      itemBuilder: (BuildContext context) {
        return const [
          PopupMenuItem(
            value: 'US',
            child: Text("English"),
          ),
          PopupMenuItem(
            value: 'BN',
            child: Text("Bangla"),
          ),
        ];
      },
    );
  }
}

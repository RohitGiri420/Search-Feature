import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SecondPage extends StatelessWidget {
  SecondPage({super.key}) {
    getTheme();
  }

  Future<SharedPreferences> preferences = SharedPreferences.getInstance();

  RxBool isLightTheme = true.obs;

  setTheme() async {
    SharedPreferences preffs = await preferences;
    preffs.setBool("theme", isLightTheme.value);
  }

  getTheme() async {
    SharedPreferences preffs = await preferences;
    bool? isLight = preffs.getBool("theme");
    isLightTheme.value = isLight ?? true;
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
          () => GetMaterialApp(
        themeMode: isLightTheme.value ? ThemeMode.light : ThemeMode.dark,
        darkTheme: ThemeData.dark(),
        home: Scaffold(
          appBar: AppBar(
            title: Text("Second Page"),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: Text("Go Back"),
                ),
              ),
              Switch(
                value: isLightTheme.value,
                onChanged: (value) {
                  isLightTheme.value = value;
                  setTheme();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

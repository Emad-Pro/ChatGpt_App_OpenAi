import 'package:chatgpt_app_openai/app/home.dart';
import 'package:chatgpt_app_openai/app/register/presentation/register.dart';
import 'package:chatgpt_app_openai/services/shared_preferences/CacheHelper.dart';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';

class MySetting {
  static ChatUser? user;
  Widget getUserData() {
    if (CacheHelper.getSaveData(key: "firstName") == null &&
        CacheHelper.getSaveData(key: "lastName") == null) {
      return RegisterScreen();
    } else {
      user = ChatUser(
        id: '1',
        firstName: CacheHelper.getSaveData(key: "firstName"),
        lastName: CacheHelper.getSaveData(key: "lastName"),
      );

      return HomePage();
    }
  }
}

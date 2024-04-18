import 'package:chatgpt_app_openai/app/home.dart';
import 'package:chatgpt_app_openai/app/presentation/widget/ChatBubbleWidget.dart';
import 'package:chatgpt_app_openai/app/presentation/widget/ImageVirtualAssistantWidget.dart';
import 'package:chatgpt_app_openai/core/palleteColors.dart';
import 'package:chatgpt_app_openai/services/mysetting.dart';
import 'package:chatgpt_app_openai/services/shared_preferences/CacheHelper.dart';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Sofia Ai",
          style: TextStyle(
              fontFamily: "cera pro",
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Pallete.mainFontColor),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            ImageVirtualAssistantWidget(),
            const ChatBubbleWidget(
              text:
                  "Welcom to Chat-Gpt And Dall-E\n,Enter your name to start working",
            ),
            const SizedBox(
              height: 15,
            ),
            const Icon(
              Icons.keyboard_double_arrow_down_sharp,
              size: 45,
              color: Colors.grey,
            ),
            Center(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: TextFormField(
                      controller: firstNameController,
                      decoration: const InputDecoration(
                        hintText: "First Name",
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(), //<-- SEE HERE
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(25),
                              bottomLeft: Radius.circular(25)),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: TextFormField(
                      controller: lastNameController,
                      decoration: const InputDecoration(
                        hintText: "Last Name",
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(), //<-- SEE HERE
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(25),
                              bottomRight: Radius.circular(25)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
                width: MediaQuery.of(context).size.width * 0.5,
                child: ElevatedButton(
                    onPressed: () async {
                      if (firstNameController.text.isNotEmpty &&
                          lastNameController.text.isNotEmpty) {
                        await CacheHelper.saveData(
                            key: "firstName", value: firstNameController.text);
                        await CacheHelper.saveData(
                            key: "lastName", value: lastNameController.text);
                        MySetting.user = ChatUser(
                          id: '1',
                          firstName: CacheHelper.getSaveData(key: "firstName"),
                          lastName: CacheHelper.getSaveData(key: "lastName"),
                        );
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    const HomePage()),
                            (route) => false);
                      }
                    },
                    child: Text("Regster"))),
            Spacer(),
            Card(
                child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(8.0),
              child: Center(child: Text("This app Created By Emad Younis")),
            ))
          ],
        ),
      ),
    );
  }
}

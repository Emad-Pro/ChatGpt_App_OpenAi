import 'package:chatgpt_app_openai/app/chatGPT/domin/entites/chatMessageModel.dart';
import 'package:chatgpt_app_openai/core/palleteColors.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ChatGptMeBubbleMessage extends StatelessWidget {
  const ChatGptMeBubbleMessage({
    super.key,
    required this.message,
  });

  final ChatMessage? message;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 15.0),
            child: const CircleAvatar(
              child: Icon(Iconsax.ghost),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Emad Younis",
                style: TextStyle(
                    fontSize: 12.0,
                    color: Colors.purple[900],
                    fontWeight: FontWeight.bold),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25)
                      .copyWith(topLeft: const Radius.circular(0)),
                  border: Border.all(color: Pallete.borderColor),
                ),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Text(
                    message!.text!,
                    overflow: TextOverflow.fade,
                    style: TextStyle(
                        color: Pallete.mainFontColor,
                        fontSize: MediaQuery.textScaleFactorOf(context) * 12),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

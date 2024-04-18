import 'package:auto_direction/auto_direction.dart';
import 'package:chatgpt_app_openai/app/chatGPT/domin/entites/chatMessageModel.dart';
import 'package:chatgpt_app_openai/core/palleteColors.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ChatGptAtBubbleMessage extends StatelessWidget {
  const ChatGptAtBubbleMessage({
    super.key,
    required this.message,
  });

  final ChatMessage? message;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "Ai ChatGpt",
                style: TextStyle(
                    fontSize: 12.0,
                    color: Colors.purple[900],
                    fontWeight: FontWeight.bold),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25)
                      .copyWith(topRight: const Radius.circular(0)),
                  border: Border.all(color: Pallete.borderColor),
                ),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: AutoDirection(
                    text: message!.text!,
                    child: Text(
                      message!.text!,
                      overflow: TextOverflow.fade,
                      style: TextStyle(
                          color: Pallete.mainFontColor,
                          fontSize: MediaQuery.textScalerOf(context).scale(14)),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 15.0),
            child: const CircleAvatar(
              child: Icon(Iconsax.device_message),
            ),
          ),
        ],
      ),
    );
  }
}

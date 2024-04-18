// ignore_for_file: file_names

import 'package:chatgpt_app_openai/core/palleteColors.dart';
import 'package:flutter/material.dart';

class BuildFeatureBoxWidget extends StatelessWidget {
  const BuildFeatureBoxWidget(
      {Key? key,
      required this.colorBox,
      required this.headerTitle,
      required this.descriptionText})
      : super(key: key);
  final Color colorBox;
  final String headerTitle;
  final String descriptionText;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 35, vertical: 10),
      padding: const EdgeInsetsDirectional.only(top: 20, bottom: 20, start: 15),
      decoration: BoxDecoration(
          color: colorBox, borderRadius: BorderRadius.circular(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            headerTitle,
            style: TextStyle(
                fontFamily: "Cera Pro",
                color: Pallete.blackColor,
                fontWeight: FontWeight.bold,
                fontSize: MediaQuery.textScaleFactorOf(context) * 18),
          ),
          Text(
            descriptionText,
            style: TextStyle(
                fontFamily: "Cera Pro",
                color: Pallete.mainFontColor,
                fontSize: MediaQuery.textScaleFactorOf(context) * 14),
          )
        ],
      ),
    );
  }
}

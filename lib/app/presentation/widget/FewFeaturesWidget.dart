// ignore_for_file: file_names

import 'package:animate_do/animate_do.dart';
import 'package:chatgpt_app_openai/core/palleteColors.dart';
import 'package:flutter/material.dart';

class FewFeaturesWidget extends StatelessWidget {
  const FewFeaturesWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SlideInLeft(
      child: Container(
        padding: const EdgeInsets.all(10.0),
        margin: const EdgeInsetsDirectional.only(start: 20, top: 10),
        child: Text(
          "Here are a few features",
          style: TextStyle(
              fontFamily: "Cera Pro",
              color: Pallete.mainFontColor,
              fontSize: MediaQuery.textScaleFactorOf(context) * 18),
        ),
      ),
    );
  }
}

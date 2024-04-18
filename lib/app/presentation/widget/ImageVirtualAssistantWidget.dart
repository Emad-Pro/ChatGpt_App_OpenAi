// ignore_for_file: file_names

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class ImageVirtualAssistantWidget extends StatelessWidget {
  const ImageVirtualAssistantWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ZoomIn(
      child: Center(
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.2,
              height: MediaQuery.of(context).size.height * 0.1,
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 69, 142, 173), shape: BoxShape.circle),
              margin: const EdgeInsets.only(top: 10),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.19,
              height: MediaQuery.of(context).size.height * 0.11,
              decoration: const BoxDecoration(
                  image: DecorationImage(image: AssetImage("assets/images/virtualAssistant.png"))),
            )
          ],
        ),
      ),
    );
  }
}

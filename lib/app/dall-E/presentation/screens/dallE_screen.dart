// ignore_for_file: must_be_immutable

import 'package:chatgpt_app_openai/app/dall-E/presentation/controller/dall_e_cubit.dart';
import 'package:chatgpt_app_openai/core/palleteColors.dart';
import 'package:chatgpt_app_openai/services/enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getwidget/getwidget.dart';
import 'package:iconsax/iconsax.dart';

class DallEScreen extends StatelessWidget {
  DallEScreen({super.key});
  TextEditingController? sentTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dall-E Genrator Image"),
        centerTitle: true,
      ),
      body: BlocBuilder<DallECubit, DallEState>(builder: (context, state) {
        switch (state.dallEOpenAiState) {
          case DallRequestState.normalState:
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.55,
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2),
                        itemCount: BlocProvider.of<DallECubit>(context)
                            .imageLanding
                            .length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GFImageOverlay(
                                height: 200,
                                width: 300,
                                image: AssetImage(
                                    BlocProvider.of<DallECubit>(context)
                                        .imageLanding[index]
                                        .toString())),
                          );
                        },
                      ),
                    ),
                    const Text(
                      "Create images fromwords with AI",
                      style:
                          TextStyle(fontSize: 20, color: Pallete.mainFontColor),
                    ),
                    TextFormField(
                      controller: sentTextController,
                      decoration: InputDecoration(
                        hintText: "Describe what you'd like to create",
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              width: 0.5, color: GFColors.ALT), //<-- SEE HERE
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              width: 0.5, color: GFColors.INFO), //<-- SEE HERE
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (sentTextController!.text != "") {
                          BlocProvider.of<DallECubit>(context)
                              .sendMessgeAndGetData(sentTextController!.text);
                        }
                      },
                      child: const Center(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Genrate Image"),
                            Icon(
                              Iconsax.image,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      "Image Creator generates AI images based on your text. Learn more.",
                      style: TextStyle(fontSize: 12),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "You will receive emails about Microsoft Rewards, which include offers about Microsoft and partner products. You will also receive notifications about Bing Image Creator. By continuing, you agree to the Rewards Terms and Image Creator Terms below.",
                      style: TextStyle(fontSize: 9),
                    ),
                  ],
                ),
              ),
            );
          case DallRequestState.loadingState:
            return const GFLoader(type: GFLoaderType.ios);
          case DallRequestState.successState:
            return ListView(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 4.0),
                  padding: const EdgeInsets.all(12.0),
                  child: Image(
                      image: NetworkImage(
                          state.dallEOpenAiModel!.data![0].url!.toString())),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 4.0),
                  padding: const EdgeInsets.all(12.0),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Text(
                    state.dallEOpenAiModel!.data![0].revisedPrompt!,
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: sentTextController,
                          decoration: InputDecoration(
                            hintText: "Describe what you'd like to create",
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 0.5,
                                  color: GFColors.ALT), //<-- SEE HERE
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 0.5,
                                  color: GFColors.INFO), //<-- SEE HERE
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (sentTextController!.text != "") {
                            BlocProvider.of<DallECubit>(context)
                                .sendMessgeAndGetData(sentTextController!.text);
                          }
                        },
                        child: Text("send".toUpperCase()),
                      )
                    ],
                  ),
                )
              ],
            );
          case DallRequestState.erorrState:
            return Padding(
              padding: const EdgeInsets.all(15.0),
              child: Center(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(state.dallEOpenAiMessage),
                  SizedBox(
                    height: 25,
                  ),
                  TextFormField(
                    controller: sentTextController,
                    decoration: InputDecoration(
                      hintText: "Describe what you'd like to create",
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            width: 0.5, color: GFColors.ALT), //<-- SEE HERE
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            width: 0.5, color: GFColors.INFO), //<-- SEE HERE
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Container(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {
                          if (sentTextController!.text != "") {
                            BlocProvider.of<DallECubit>(context)
                                .sendMessgeAndGetData(sentTextController!.text);
                          }
                        },
                        child: Text("Try Again")),
                  )
                ],
              )),
            );
        }
      }),
    );
  }
}

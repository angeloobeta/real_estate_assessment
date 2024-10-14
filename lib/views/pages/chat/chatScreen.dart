import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:real_estate_assessment/resources/resources.dart';
import 'package:real_estate_assessment/views/uiElements/baseUI.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseUi(
        appBar: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          backgroundColor: Colors.transparent,
        ),
        child: Center(
          child: LottieBuilder.asset(
            RealEstateAnimation.chatting,
          ),
        ));
  }
}

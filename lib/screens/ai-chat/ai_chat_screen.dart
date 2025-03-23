import 'package:ai_mental_health/screens/ai-chat/ai_chat_control_button.dart';
import 'package:ai_mental_health/screens/ai-chat/ai_chat_title.dart';
import 'package:ai_mental_health/screens/ai-chat/ai_liquid_ball.dart';
import 'package:ai_mental_health/screens/ai-chat/arrow_back_app_bar.dart';
import 'package:ai_mental_health/screens/ai-chat/description_text.dart';
import 'package:ai_mental_health/screens/home/models/data_model.dart';
import 'package:ai_mental_health/utils/assets.dart';
import 'package:ai_mental_health/utils/colours.dart';
import 'package:ai_mental_health/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class AIChatScreen extends StatefulWidget {
  static const routeName = '/ai-chat';
  final DataModel data;
  const AIChatScreen({super.key, required this.data});

  @override
  State<AIChatScreen> createState() => _AIChatScreenState();
}

class _AIChatScreenState extends State<AIChatScreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(
      Assets.video1,

      videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true),
    );

    _controller.addListener(() {
      setState(() {});
    });
    _controller.setLooping(true);
    _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: Colours.backgroundColor,
      body: SafeArea(
        child: Container(
          width: size.width,
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 30,
            children: [
              ArrowBackAppBar(),
              AIChatTitle(size: size, data: widget.data),
              AiLiquidBall(controller: _controller),
              IntrinsicHeight(child: DescriptionText(size: size)),
              AiChatControlButton(controller: _controller),
            ],
          ),
        ),
      ).gradient(topRight: Colours.blueColor, bottomLeft: Colours.whiteColor),
    );
  }
}

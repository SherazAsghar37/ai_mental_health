import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:video_player/video_player.dart';

class AiLiquidBall extends StatefulWidget {
  final VideoPlayerController controller;
  const AiLiquidBall({super.key, required this.controller});

  @override
  AiLiquidBallState createState() => AiLiquidBallState();
}

class AiLiquidBallState extends State<AiLiquidBall> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Container(
          height: size.height * 0.35,
          width: size.width * 3,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(size.width),
          ),
          child: Stack(
            children: <Widget>[
              Positioned(
                top: -10,
                bottom: -10,
                left: -100,
                right: -100,
                child: SizedBox(child: VideoPlayer(widget.controller)),
              ),
            ],
          ),
        )
        .animate(delay: Duration(milliseconds: 700))
        .fadeIn(
          duration: Duration(milliseconds: 600),
          curve: Curves.fastOutSlowIn,
        )
        .slideY(
          begin: 0.2,
          end: 0,
          duration: Duration(milliseconds: 600),
          curve: Curves.fastOutSlowIn,
        );
  }
}

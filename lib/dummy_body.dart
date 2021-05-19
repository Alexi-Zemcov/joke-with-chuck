import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:jokes_about_chuck/constants.dart';

class DummyBody extends StatefulWidget {
  const DummyBody({
    Key? key,
    required this.bottomShitHeight,
  }) : super(key: key);
  final double bottomShitHeight;

  @override
  _DummyBodyState createState() => _DummyBodyState();
}

class _DummyBodyState extends State<DummyBody> {
  TextStyle buildTextStyle() {
    return const TextStyle(
      fontSize: 35,
      color: Colors.white,
      shadows: [
        Shadow(
          blurRadius: 7.0,
          color: Colors.white,
          offset: Offset(0, 0),
        ),
      ],
    );
  }

  EdgeInsets buildEdgeInsets() {
    return EdgeInsets.only(
      bottom: widget.bottomShitHeight,
      right: 16,
    );
  }

  LinearGradient buildLinearGradient() {
    return LinearGradient(
      end: Alignment.topLeft,
      begin: Alignment.centerRight,
      stops: [0.1, 0.9],
      colors: [
        Colors.black54,
        Colors.transparent,
      ],
    );
  }

  bool _isAnimationCompleted = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: buildLinearGradient(),
      ),
      alignment:
          _isAnimationCompleted ? Alignment.bottomRight : Alignment.center,
      child: Padding(
        padding: buildEdgeInsets(),
        child: _isAnimationCompleted
            ? Text('Let\' joke', style: AppTextStyles.s18)
            : buildAnimatedText(),
      ),
    );
  }

  DefaultTextStyle buildAnimatedText() {
    return DefaultTextStyle(
      textAlign: TextAlign.center,
      style: buildTextStyle(),
      child: AnimatedTextKit(
        onFinished: () => setState(() => _isAnimationCompleted = true),
        pause: Duration(microseconds: 500),
        isRepeatingAnimation: false,
        repeatForever: false,
        animatedTexts: [
          FlickerAnimatedText('LET\'S'),
          FlickerAnimatedText(
            'JOKE',
            textStyle: buildTextStyle().copyWith(fontSize: 45),
          ),
          FlickerAnimatedText(
            "WITH",
            textStyle: buildTextStyle().copyWith(fontSize: 50),
          ),
          FlickerAnimatedText(
            "CHUCK!",
            textStyle: buildTextStyle().copyWith(fontSize: 65),
          ),
        ],
        onTap: () {
          print("Tap Event");
        },
      ),
    );
  }
}

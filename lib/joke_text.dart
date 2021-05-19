import 'package:flutter/material.dart';
import 'package:jokes_about_chuck/constants.dart';

class JokeText extends StatelessWidget {
  const JokeText({
    Key? key,
    required this.joke,
  }) : super(key: key);

  final String? joke;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30, left: 16, right: 16),
      child: SelectableText(
        joke!,
        style: AppTextStyles.s24,
      ),
    );
  }
}

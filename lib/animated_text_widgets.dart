import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RotateTextWidget extends StatelessWidget {
  const RotateTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        const SizedBox(width: 20.0, height: 100.0),
        const Text(
          'Be',
          style: TextStyle(fontSize: 43.0),
        ),
        const SizedBox(width: 20.0, height: 100.0),
        DefaultTextStyle(
          style: TextStyle(
            color: Colors.white,
            fontSize: 40.0,
            fontFamily: GoogleFonts.raleway().fontFamily,
          ),
          child: AnimatedTextKit(
            animatedTexts: [
              RotateAnimatedText('AWESOME'),
              RotateAnimatedText('OPTIMISTIC'),
              RotateAnimatedText('DIFFERENT'),
            ],
            onTap: () {},
          ),
        ),
      ],
    );
  }
}

class FadeTextWidget extends StatelessWidget {
  const FadeTextWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: TextStyle(
        color: Colors.black,
        fontSize: 20.0,
        fontFamily: GoogleFonts.lato().fontFamily,
      ),
      child: AnimatedTextKit(
        animatedTexts: [
          FadeAnimatedText('Hello'),
          FadeAnimatedText('World'),
        ],
        onTap: () {},
      ),
    );
  }
}

class TyperTextWidget extends StatelessWidget {
  const TyperTextWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: TextStyle(
        color: Colors.blue,
        fontSize: 24.0,
        fontFamily: GoogleFonts.lato().fontFamily,
      ),
      child: AnimatedTextKit(
        animatedTexts: [
          TyperAnimatedText('Welcome to my app'),
          TyperAnimatedText('Enjoy your stay'),
        ],
        onTap: () {},
      ),
    );
  }
}

class TypewriterTextWidget extends StatelessWidget {
  const TypewriterTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: TextStyle(
        color: Colors.black,
        fontSize: 24.0,
        fontFamily: GoogleFonts.lato().fontFamily,
      ),
      child: AnimatedTextKit(
        animatedTexts: [
          TypewriterAnimatedText('Hello, World!'),
          TypewriterAnimatedText('Welcome to my app'),
          TypewriterAnimatedText('Enjoy your stay'),
        ],
        onTap: () {},
      ),
    );
  }
}

class ScaleTextWidget extends StatelessWidget {
  const ScaleTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: TextStyle(
        color: Colors.red,
        fontSize: 24.0,
        fontFamily: GoogleFonts.lato().fontFamily,
      ),
      child: AnimatedTextKit(
        animatedTexts: [
          ScaleAnimatedText('Scaling'),
          ScaleAnimatedText('Text'),
          ScaleAnimatedText('Widget'),
        ],
        onTap: () {},
      ),
    );
  }
}

class ColorizeTextWidget extends StatelessWidget {
  ColorizeTextWidget({super.key});
  static const colorizeColors = [
    Colors.purple,
    Colors.blue,
    Colors.yellow,
    Colors.red,
  ];

  final colorizeTextStyle = TextStyle(
    fontSize: 50.0,
    fontFamily: GoogleFonts.lato().fontFamily,
    color: Colors.black,
  );

  @override
  Widget build(BuildContext context) {
    return AnimatedTextKit(
      animatedTexts: [
        ColorizeAnimatedText(
          'docGen',
          textStyle: colorizeTextStyle,
          colors: colorizeColors,
        ),
      ],
      isRepeatingAnimation: true,
      onTap: () {},
    );
  }
}

class FlickerTextWidget extends StatelessWidget {
  const FlickerTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: const TextStyle(
        color: Colors.orange,
        fontSize: 24.0,
        fontFamily: 'Roboto',
      ),
      child: AnimatedTextKit(
        animatedTexts: [
          FlickerAnimatedText('doc'),
        ],
        onTap: () {},
      ),
    );
  }
}

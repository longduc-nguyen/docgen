import 'dart:async';

import 'package:docgen/animated_text_widgets.dart';
import 'package:docgen/animated_title.dart';
import 'package:docgen/form.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.purple,
          brightness: Brightness.dark,
        ),
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black,
        textTheme: TextTheme(
          displayLarge: GoogleFonts.lato(
            fontSize: 72,
            fontWeight: FontWeight.bold,
          ),
          titleLarge: GoogleFonts.oswald(
            fontSize: 30,
            fontStyle: FontStyle.italic,
          ),
          bodyMedium: GoogleFonts.merriweather(),
          displaySmall: GoogleFonts.pacifico(),
        ),
      ),
      home: const Scaffold(
        body: Center(
          child: Column(
            children: [
              SizedBox(height: 30),
              SizedBox(height: 100, child: AnimatedTitle()),
              SizedBox(height: 30),
              MainForm()
            ],
          ),
        ),
      ),
    );
  }
}

class RandomTextDisplay extends StatefulWidget {
  final List<Widget> textWidgetList = [
    const RotateTextWidget(),
    const FadeTextWidget(),
    const TyperTextWidget(),
    const TypewriterTextWidget(),
    const ScaleTextWidget(),
    ColorizeTextWidget(),
    const FlickerTextWidget(),
  ];

  RandomTextDisplay({super.key});

  @override
  State<RandomTextDisplay> createState() => _RandomTextDisplayState();
}

class _RandomTextDisplayState extends State<RandomTextDisplay> {
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _stopTimer();
    super.dispose();
  }

  void _startTimer() {
    Timer.periodic(const Duration(seconds: 5), (timer) {
      setState(() {
        currentIndex = (currentIndex + 1) % widget.textWidgetList.length;
      });
    });
  }

  void _stopTimer() {
    // Stop the timer if needed
  }

  @override
  Widget build(BuildContext context) {
    final randomText = widget.textWidgetList[currentIndex];

    return Center(
      child: randomText,
    );
  }
}

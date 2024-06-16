import 'dart:async';

import 'package:docgen/animated_text_widgets.dart';
import 'package:docgen/animated_title.dart';
import 'package:docgen/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  bool isDark = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.purple,
            brightness: isDark ? Brightness.dark : Brightness.light),
        textTheme: TextTheme(
          displayLarge: GoogleFonts.lato(
            fontSize: 72,
            fontWeight: FontWeight.bold,
          ),
          titleLarge: GoogleFonts.oswald(
            fontSize: 30,
          ),
          bodyMedium: GoogleFonts.merriweather(),
          displaySmall: GoogleFonts.pacifico(),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('docGen'),
          actions: <Widget>[
            Tooltip(
              message: 'Change brightness mode',
              child: IconButton(
                isSelected: isDark,
                onPressed: () {
                  setState(() {
                    isDark = !isDark;
                  });
                },
                icon: const Icon(Icons.wb_sunny_outlined),
                selectedIcon: const Icon(Icons.brightness_2_outlined),
              ),
            )
          ],
        ),
        body: const Center(
          child: Column(
            children: [
              SizedBox(height: 30),
              SizedBox(height: 100, child: AnimatedTitle()),
              SizedBox(height: 30),
              MainSearchBar()
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

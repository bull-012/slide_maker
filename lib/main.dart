import 'package:flutter/material.dart';

import 'presentation_selector.dart';

void main() {
  runApp(const SlideMakerApp());
}

class SlideMakerApp extends StatelessWidget {
  const SlideMakerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'スライド発表資料',
      theme: ThemeData.dark(),
      home: const PresentationSelector(),
      debugShowCheckedModeBanner: false,
    );
  }
}

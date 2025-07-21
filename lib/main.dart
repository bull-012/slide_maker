import 'package:flutter/material.dart';
import 'slide_builder.dart';
import 'figma_ai_presentation_config.dart';

void main() {
  runApp(const PresentationApp());
}

class PresentationApp extends StatelessWidget {
  const PresentationApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Figma AIフレンドリー設計のプレゼンテーション
    return SlideApp.createApp(
      config: FigmaAIPresentationConfig.presentation,
      themeMode: ThemeMode.dark,
    );
  }
}
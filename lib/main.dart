import 'package:flutter/material.dart';
import 'slide_builder.dart';
import 'slide_config.dart';

void main() {
  runApp(const PresentationApp());
}

class PresentationApp extends StatelessWidget {
  const PresentationApp({super.key});

  @override
  Widget build(BuildContext context) {
    // ここで使用する設定を選択できます
    // DefaultSlideConfig.presentation または CustomSlideConfig.techPresentation
    return SlideApp.createApp(
      config: DefaultSlideConfig.presentation,
      themeMode: ThemeMode.dark,
    );
  }
}
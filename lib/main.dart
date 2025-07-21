import 'package:flutter/material.dart';
import 'presentation_selector.dart';

void main() {
  runApp(const SlideApp());
}

class SlideApp extends StatelessWidget {
  const SlideApp({super.key});

  @override
  Widget build(BuildContext context) {
    // 発表資料選択画面を表示
    return const PresentationSelector();
  }
}
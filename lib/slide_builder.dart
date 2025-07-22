import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'slide_config.dart';
import 'slide_templates.dart';

/// スライドビルダークラス - 設定からスライドを自動生成する
class SlideBuilder {
  /// スライド設定からスライドウィジェットのリストを生成
  static List<FlutterDeckSlideWidget> buildSlides(SlideConfig config) {
    final List<FlutterDeckSlideWidget> slides = [];

    for (final slideData in config.slides) {
      final widget = _buildSlideWidget(slideData);
      if (widget != null) {
        slides.add(widget);
      }
    }

    return slides;
  }

  /// 個別のスライドデータからウィジェットを生成
  static FlutterDeckSlideWidget? _buildSlideWidget(SlideData slideData) {
    switch (slideData.type) {
      case SlideType.title:
        return _buildTitleSlide(slideData);
      case SlideType.bullet:
        return _buildBulletSlide(slideData);
      case SlideType.numberedList:
        return _buildNumberedListSlide(slideData);
      case SlideType.content:
        return _buildContentSlide(slideData);
      case SlideType.center:
        return _buildCenterSlide(slideData);
    }
  }

  /// タイトルスライドを生成
  static TitleSlideTemplate _buildTitleSlide(SlideData slideData) {
    return TitleSlideTemplate(
      route: slideData.route,
      title: slideData.content['title'] ?? '',
      subtitle: slideData.content['subtitle'],
      author: slideData.content['author'],
      date: slideData.content['date'],
    );
  }

  /// 箇条書きスライドを生成
  static BulletSlideTemplate _buildBulletSlide(SlideData slideData) {
    return BulletSlideTemplate(
      route: slideData.route,
      slideTitle: slideData.title,
      title: slideData.content['title'] ?? '',
      bullets: List<String>.from(slideData.content['bullets'] ?? []),
      titleFontSize: slideData.content['titleFontSize']?.toDouble(),
      bulletFontSize: slideData.content['bulletFontSize']?.toDouble(),
    );
  }

  /// 番号付きリストスライドを生成
  static NumberedListSlideTemplate _buildNumberedListSlide(SlideData slideData) {
    return NumberedListSlideTemplate(
      route: slideData.route,
      slideTitle: slideData.title,
      title: slideData.content['title'] ?? '',
      items: List<String>.from(slideData.content['items'] ?? []),
      titleFontSize: slideData.content['titleFontSize']?.toDouble(),
      itemFontSize: slideData.content['itemFontSize']?.toDouble(),
    );
  }

  /// コンテンツスライドを生成
  static ContentSlideTemplate _buildContentSlide(SlideData slideData) {
    return ContentSlideTemplate(
      route: slideData.route,
      slideTitle: slideData.title,
      title: slideData.content['title'] ?? '',
      content: slideData.content['content'] ?? '',
      bulletPoints: slideData.content['bulletPoints'] != null
          ? List<String>.from(slideData.content['bulletPoints'])
          : null,
      titleFontSize: slideData.content['titleFontSize']?.toDouble(),
      contentFontSize: slideData.content['contentFontSize']?.toDouble(),
      bulletFontSize: slideData.content['bulletFontSize']?.toDouble(),
    );
  }

  /// センタリング表示スライドを生成
  static CenterSlideTemplate _buildCenterSlide(SlideData slideData) {
    return CenterSlideTemplate(
      route: slideData.route,
      slideTitle: slideData.title,
      title: slideData.content['title'] ?? '',
      subtitle: slideData.content['subtitle'],
      description: slideData.content['description'],
      titleFontSize: slideData.content['titleFontSize']?.toDouble(),
      subtitleFontSize: slideData.content['subtitleFontSize']?.toDouble(),
      descriptionFontSize: slideData.content['descriptionFontSize']?.toDouble(),
    );
  }
}

/// スライドアプリケーション作成のヘルパークラス
class SlideApp {
  /// 設定を元にFlutterDeckAppを作成
  static Widget createApp({
    required SlideConfig config,
    ThemeMode themeMode = ThemeMode.dark,
    FlutterDeckThemeData? darkTheme,
    FlutterDeckThemeData? lightTheme,
    VoidCallback? onBackPressed,
  }) {
    final List<FlutterDeckSlideWidget> slides = SlideBuilder.buildSlides(config);
    
    // 戻るボタン付きのスライドを作成
    if (onBackPressed != null) {
      for (int i = 0; i < slides.length; i++) {
        slides[i] = _wrapSlideWithBackButton(slides[i], onBackPressed);
      }
    }
    
    return FlutterDeckApp(
      themeMode: themeMode,
      darkTheme: darkTheme ?? _getDefaultDarkTheme(),
      lightTheme: lightTheme ?? _getDefaultLightTheme(),
      slides: slides,
      configuration: const FlutterDeckConfiguration(
        background: FlutterDeckBackgroundConfiguration(
          dark: FlutterDeckBackground.solid(Color(0xFF0a0a0a)),
          light: FlutterDeckBackground.solid(Color(0xFF0a0a0a)),
        ),
        controls: FlutterDeckControlsConfiguration(
          presenterToolbarVisible: true,
        ),
        transition: FlutterDeckTransition.fade(),
      ),
    );
  }

  /// スライドに戻るボタンを追加
  static FlutterDeckSlideWidget _wrapSlideWithBackButton(
    FlutterDeckSlideWidget slide,
    VoidCallback onBackPressed,
  ) {
    return _SlideWithBackButton(
      originalSlide: slide,
      onBackPressed: onBackPressed,
    );
  }

  /// デフォルトのダークテーマを取得
  static FlutterDeckThemeData _getDefaultDarkTheme() {
    return FlutterDeckThemeData.dark().copyWith(
      textTheme: const FlutterDeckTextTheme(
        title: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
        subtitle: TextStyle(fontSize: 32),
        bodyLarge: TextStyle(fontSize: 24),
        bodyMedium: TextStyle(fontSize: 20),
      ),
    );
  }

  /// デフォルトのライトテーマを取得
  static FlutterDeckThemeData _getDefaultLightTheme() {
    return FlutterDeckThemeData.light().copyWith(
      textTheme: const FlutterDeckTextTheme(
        title: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
        subtitle: TextStyle(fontSize: 32),
        bodyLarge: TextStyle(fontSize: 24),
        bodyMedium: TextStyle(fontSize: 20),
      ),
    );
  }
}

/// 簡単にスライドを作成するためのヘルパー関数
class SlideHelper {
  /// 簡単なタイトルスライドを作成
  static SlideData createTitleSlide({
    String route = '/title',
    required String title,
    String? subtitle,
    String? author,
    String? date,
  }) {
    return SlideData(
      route: route,
      title: 'タイトル',
      type: SlideType.title,
      content: {
        'title': title,
        if (subtitle != null) 'subtitle': subtitle,
        if (author != null) 'author': author,
        if (date != null) 'date': date,
      },
    );
  }

  /// 簡単な箇条書きスライドを作成
  static SlideData createBulletSlide({
    required String route,
    required String title,
    required List<String> bullets,
  }) {
    return SlideData(
      route: route,
      title: title,
      type: SlideType.bullet,
      content: {
        'title': title,
        'bullets': bullets,
      },
    );
  }

  /// 簡単な番号付きリストスライドを作成
  static SlideData createNumberedSlide({
    required String route,
    required String title,
    required List<String> items,
  }) {
    return SlideData(
      route: route,
      title: title,
      type: SlideType.numberedList,
      content: {
        'title': title,
        'items': items,
      },
    );
  }

  /// 簡単なコンテンツスライドを作成
  static SlideData createContentSlide({
    required String route,
    required String title,
    required String content,
    List<String>? bulletPoints,
  }) {
    return SlideData(
      route: route,
      title: title,
      type: SlideType.content,
      content: {
        'title': title,
        'content': content,
        if (bulletPoints != null) 'bulletPoints': bulletPoints,
      },
    );
  }

  /// 簡単なセンタリングスライドを作成
  static SlideData createCenterSlide({
    required String route,
    required String title,
    String? subtitle,
    String? description,
  }) {
    return SlideData(
      route: route,
      title: title,
      type: SlideType.center,
      content: {
        'title': title,
        if (subtitle != null) 'subtitle': subtitle,
        if (description != null) 'description': description,
      },
    );
  }
}

/// 戻るボタン付きスライドラッパー
class _SlideWithBackButton extends FlutterDeckSlideWidget {
  final FlutterDeckSlideWidget originalSlide;
  final VoidCallback onBackPressed;

  _SlideWithBackButton({
    required this.originalSlide,
    required this.onBackPressed,
  }) : super(
          configuration: originalSlide.configuration,
        );

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // 元のスライド
        originalSlide.build(context),
        
        // 戻るボタン
        Positioned(
          top: 16,
          left: 16,
          child: SafeArea(
            child: IconButton(
              onPressed: onBackPressed,
              icon: const Icon(Icons.home),
              tooltip: '発表資料選択に戻る',
              style: IconButton.styleFrom(
                backgroundColor: Colors.black.withValues(alpha: 0.3),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.all(12),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
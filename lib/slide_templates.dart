import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';

/// スライドの基本テンプレートクラス
abstract class SlideTemplate extends FlutterDeckSlideWidget {
  const SlideTemplate({
    super.key,
    required FlutterDeckSlideConfiguration configuration,
  }) : super(configuration: configuration);
}

/// レスポンシブ対応のヘルパークラス
class ResponsiveHelper {
  static double getScaleFactor(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final shortestSide = size.shortestSide;
    
    if (shortestSide < 600) return 1.0;  // Mobile
    if (shortestSide < 900) return 1.2; // Tablet
    if (shortestSide < 1200) return 1.4; // Desktop Small
    return 1.6; // Desktop Large
  }

  static double getFontSize(BuildContext context, double baseFontSize) {
    return baseFontSize * getScaleFactor(context);
  }

  static double getSpacing(BuildContext context, double baseSpacing) {
    return baseSpacing * getScaleFactor(context);
  }
}

/// SpeakerDeckスタイルのタイトルスライドテンプレート
class TitleSlideTemplate extends SlideTemplate {
  final String title;
  final String? subtitle;
  final String? author;
  final String? date;

  TitleSlideTemplate({
    super.key,
    required String route,
    required this.title,
    this.subtitle,
    this.author,
    this.date,
  }) : super(
          configuration: FlutterDeckSlideConfiguration(
            route: route,
            title: 'タイトル',
          ),
        );

  @override
  Widget build(BuildContext context) {
    return FlutterDeckSlide.custom(
      builder: (context) {
        return Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFF0a0a0a),
                Color(0xFF1a1a1a),
                Color(0xFF0f0f0f),
              ],
            ),
          ),
          child: Stack(
            children: [
              // 背景のアクセント
              Positioned(
                top: -100,
                right: -100,
                child: Container(
                  width: 300,
                  height: 300,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: RadialGradient(
                      colors: [
                        Colors.white.withValues(alpha: 0.03),
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
              ),
              // メインコンテンツ
              Center(
                child: Padding(
                  padding: EdgeInsets.all(ResponsiveHelper.getSpacing(context, 60)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // メインタイトル
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: ResponsiveHelper.getFontSize(context, 64),
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                          height: 1.1,
                          letterSpacing: -1.0,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      
                      // タイトル下線
                      Container(
                        margin: EdgeInsets.only(
                          top: ResponsiveHelper.getSpacing(context, 24),
                        ),
                        height: 4,
                        width: ResponsiveHelper.getSpacing(context, 80),
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Colors.white, Colors.grey],
                          ),
                        ),
                      ),
                      
                      // 副題
                      if (subtitle != null) ...[
                        SizedBox(height: ResponsiveHelper.getSpacing(context, 48)),
                        Text(
                          subtitle!,
                          style: TextStyle(
                            fontSize: ResponsiveHelper.getFontSize(context, 32),
                            fontWeight: FontWeight.w300,
                            color: Colors.grey.shade300,
                            height: 1.3,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                      
                      // 作者と日付
                      if (author != null || date != null) ...[
                        SizedBox(height: ResponsiveHelper.getSpacing(context, 80)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (author != null)
                              Text(
                                author!,
                                style: TextStyle(
                                  fontSize: ResponsiveHelper.getFontSize(context, 22),
                                  color: Colors.grey.shade400,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            if (author != null && date != null)
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: ResponsiveHelper.getSpacing(context, 20),
                                ),
                                child: Container(
                                  width: 2,
                                  height: 20,
                                  color: Colors.grey.shade600,
                                ),
                              ),
                            if (date != null)
                              Text(
                                date!,
                                style: TextStyle(
                                  fontSize: ResponsiveHelper.getFontSize(context, 20),
                                  color: Colors.grey.shade500,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                          ],
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

/// SpeakerDeckスタイルの箇条書きスライドテンプレート
class BulletSlideTemplate extends SlideTemplate {
  final String title;
  final List<String> bullets;
  final double? titleFontSize;
  final double? bulletFontSize;

  BulletSlideTemplate({
    super.key,
    required String route,
    required String slideTitle,
    required this.title,
    required this.bullets,
    this.titleFontSize,
    this.bulletFontSize,
  }) : super(
          configuration: FlutterDeckSlideConfiguration(
            route: route,
            title: slideTitle,
          ),
        );

  @override
  Widget build(BuildContext context) {
    return FlutterDeckSlide.custom(
      builder: (context) {
        return Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFF0a0a0a),
                Color(0xFF1a1a1a),
                Color(0xFF0f0f0f),
              ],
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(ResponsiveHelper.getSpacing(context, 60)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // タイトル
                Text(
                  title,
                  style: TextStyle(
                    fontSize: titleFontSize != null 
                      ? ResponsiveHelper.getFontSize(context, titleFontSize!)
                      : ResponsiveHelper.getFontSize(context, 44),
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    letterSpacing: -0.5,
                  ),
                ),
                
                // タイトル下線
                Container(
                  margin: EdgeInsets.only(
                    top: ResponsiveHelper.getSpacing(context, 16),
                    bottom: ResponsiveHelper.getSpacing(context, 48),
                  ),
                  height: 2,
                  width: ResponsiveHelper.getSpacing(context, 60),
                  color: Colors.white,
                ),
                
                // 箇条書き
                Expanded(
                  child: ListView.builder(
                    itemCount: bullets.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(
                          bottom: ResponsiveHelper.getSpacing(context, 32),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // バレットポイント
                            Container(
                              width: ResponsiveHelper.getSpacing(context, 8),
                              height: ResponsiveHelper.getSpacing(context, 8),
                              margin: EdgeInsets.only(
                                top: ResponsiveHelper.getSpacing(context, 12),
                                right: ResponsiveHelper.getSpacing(context, 24),
                              ),
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                            ),
                            // テキスト
                            Expanded(
                              child: Text(
                                bullets[index].startsWith('•') 
                                  ? bullets[index].substring(1).trim()
                                  : bullets[index],
                                style: TextStyle(
                                  fontSize: bulletFontSize != null
                                    ? ResponsiveHelper.getFontSize(context, bulletFontSize!)
                                    : ResponsiveHelper.getFontSize(context, 30),
                                  color: Colors.grey.shade200,
                                  height: 1.4,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

/// SpeakerDeckスタイルの番号付きリストスライドテンプレート
class NumberedListSlideTemplate extends SlideTemplate {
  final String title;
  final List<String> items;
  final double? titleFontSize;
  final double? itemFontSize;

  NumberedListSlideTemplate({
    super.key,
    required String route,
    required String slideTitle,
    required this.title,
    required this.items,
    this.titleFontSize,
    this.itemFontSize,
  }) : super(
          configuration: FlutterDeckSlideConfiguration(
            route: route,
            title: slideTitle,
          ),
        );

  @override
  Widget build(BuildContext context) {
    return FlutterDeckSlide.custom(
      builder: (context) {
        return Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFF0a0a0a),
                Color(0xFF1a1a1a),
                Color(0xFF0f0f0f),
              ],
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(ResponsiveHelper.getSpacing(context, 60)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // タイトル
                Text(
                  title,
                  style: TextStyle(
                    fontSize: titleFontSize != null
                      ? ResponsiveHelper.getFontSize(context, titleFontSize!)
                      : ResponsiveHelper.getFontSize(context, 44),
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    letterSpacing: -0.5,
                  ),
                ),
                
                // タイトル下線
                Container(
                  margin: EdgeInsets.only(
                    top: ResponsiveHelper.getSpacing(context, 16),
                    bottom: ResponsiveHelper.getSpacing(context, 48),
                  ),
                  height: 2,
                  width: ResponsiveHelper.getSpacing(context, 60),
                  color: Colors.white,
                ),
                
                SizedBox(height: ResponsiveHelper.getSpacing(context, 40)),
                
                // 番号付きアイテム
                Expanded(
                  child: ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.only(
                          bottom: ResponsiveHelper.getSpacing(context, 24),
                        ),
                        padding: EdgeInsets.all(ResponsiveHelper.getSpacing(context, 24)),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.05),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: Colors.white.withValues(alpha: 0.1),
                            width: 1,
                          ),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: ResponsiveHelper.getSpacing(context, 36),
                              height: ResponsiveHelper.getSpacing(context, 36),
                              margin: EdgeInsets.only(
                                right: ResponsiveHelper.getSpacing(context, 20),
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Center(
                                child: Text(
                                  '${index + 1}',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: ResponsiveHelper.getFontSize(context, 18),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                items[index],
                                style: TextStyle(
                                  fontSize: itemFontSize != null
                                    ? ResponsiveHelper.getFontSize(context, itemFontSize!)
                                    : ResponsiveHelper.getFontSize(context, 22),
                                  color: Colors.grey.shade200,
                                  height: 1.4,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

/// SpeakerDeckスタイルのコンテンツスライドテンプレート
class ContentSlideTemplate extends SlideTemplate {
  final String title;
  final String content;
  final List<String>? bulletPoints;
  final double? titleFontSize;
  final double? contentFontSize;
  final double? bulletFontSize;

  ContentSlideTemplate({
    super.key,
    required String route,
    required String slideTitle,
    required this.title,
    required this.content,
    this.bulletPoints,
    this.titleFontSize,
    this.contentFontSize,
    this.bulletFontSize,
  }) : super(
          configuration: FlutterDeckSlideConfiguration(
            route: route,
            title: slideTitle,
          ),
        );

  @override
  Widget build(BuildContext context) {
    return FlutterDeckSlide.custom(
      builder: (context) {
        return Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFF0a0a0a),
                Color(0xFF1a1a1a),
                Color(0xFF0f0f0f),
              ],
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(ResponsiveHelper.getSpacing(context, 60)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // タイトル
                Text(
                  title,
                  style: TextStyle(
                    fontSize: titleFontSize != null
                      ? ResponsiveHelper.getFontSize(context, titleFontSize!)
                      : ResponsiveHelper.getFontSize(context, 44),
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    letterSpacing: -0.5,
                  ),
                ),
                
                // タイトル下線
                Container(
                  margin: EdgeInsets.only(
                    top: ResponsiveHelper.getSpacing(context, 16),
                    bottom: ResponsiveHelper.getSpacing(context, 48),
                  ),
                  height: 2,
                  width: ResponsiveHelper.getSpacing(context, 60),
                  color: Colors.white,
                ),
                
                SizedBox(height: ResponsiveHelper.getSpacing(context, 40)),
                
                // メインコンテンツ
                Text(
                  content,
                  style: TextStyle(
                    fontSize: contentFontSize != null
                      ? ResponsiveHelper.getFontSize(context, contentFontSize!)
                      : ResponsiveHelper.getFontSize(context, 26),
                    color: Colors.grey.shade200,
                    height: 1.5,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                
                // 箇条書きポイント
                if (bulletPoints != null && bulletPoints!.isNotEmpty) ...[
                  SizedBox(height: ResponsiveHelper.getSpacing(context, 32)),
                  Expanded(
                    child: ListView.builder(
                      itemCount: bulletPoints!.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.only(
                            bottom: ResponsiveHelper.getSpacing(context, 24),
                          ),
                          padding: EdgeInsets.all(ResponsiveHelper.getSpacing(context, 0)),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: ResponsiveHelper.getSpacing(context, 8),
                                height: ResponsiveHelper.getSpacing(context, 8),
                                margin: EdgeInsets.only(
                                  top: ResponsiveHelper.getSpacing(context, 12),
                                  right: ResponsiveHelper.getSpacing(context, 20),
                                ),
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  bulletPoints![index].startsWith('•')
                                    ? bulletPoints![index].substring(1).trim()
                                    : bulletPoints![index],
                                  style: TextStyle(
                                    fontSize: bulletFontSize != null
                                      ? ResponsiveHelper.getFontSize(context, bulletFontSize!)
                                      : ResponsiveHelper.getFontSize(context, 24),
                                    color: Colors.grey.shade300,
                                    height: 1.4,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ],
            ),
          ),
        );
      },
    );
  }
}

/// SpeakerDeckスタイルのセンタリング表示スライドテンプレート
class CenterSlideTemplate extends SlideTemplate {
  final String title;
  final String? subtitle;
  final String? description;
  final double? titleFontSize;
  final double? subtitleFontSize;
  final double? descriptionFontSize;

  CenterSlideTemplate({
    super.key,
    required String route,
    required String slideTitle,
    required this.title,
    this.subtitle,
    this.description,
    this.titleFontSize,
    this.subtitleFontSize,
    this.descriptionFontSize,
  }) : super(
          configuration: FlutterDeckSlideConfiguration(
            route: route,
            title: slideTitle,
          ),
        );

  @override
  Widget build(BuildContext context) {
    return FlutterDeckSlide.custom(
      builder: (context) {
        return Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFF0a0a0a),
                Color(0xFF1a1a1a),
                Color(0xFF0f0f0f),
              ],
            ),
          ),
          child: Center(
            child: Padding(
              padding: EdgeInsets.all(ResponsiveHelper.getSpacing(context, 60)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // メインタイトル
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: titleFontSize != null
                        ? ResponsiveHelper.getFontSize(context, titleFontSize!)
                        : ResponsiveHelper.getFontSize(context, 56),
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      height: 1.1,
                      letterSpacing: -1.0,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  
                  // 副題
                  if (subtitle != null) ...[
                    SizedBox(height: ResponsiveHelper.getSpacing(context, 50)),
                    Text(
                      subtitle!,
                      style: TextStyle(
                        fontSize: subtitleFontSize != null
                          ? ResponsiveHelper.getFontSize(context, subtitleFontSize!)
                          : ResponsiveHelper.getFontSize(context, 30),
                        color: Colors.grey.shade300,
                        height: 1.3,
                        fontWeight: FontWeight.w300,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                  
                  // 説明
                  if (description != null) ...[
                    SizedBox(height: ResponsiveHelper.getSpacing(context, 40)),
                    Text(
                      description!,
                      style: TextStyle(
                        fontSize: descriptionFontSize != null
                          ? ResponsiveHelper.getFontSize(context, descriptionFontSize!)
                          : ResponsiveHelper.getFontSize(context, 22),
                        color: Colors.grey.shade400,
                        height: 1.4,
                        fontWeight: FontWeight.w300,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
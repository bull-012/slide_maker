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
    
    if (shortestSide < 600) return 0.7;  // Mobile
    if (shortestSide < 900) return 0.85; // Tablet
    if (shortestSide < 1200) return 1.0; // Desktop Small
    return 1.2; // Desktop Large
  }

  static double getFontSize(BuildContext context, double baseFontSize) {
    return baseFontSize * getScaleFactor(context);
  }

  static double getSpacing(BuildContext context, double baseSpacing) {
    return baseSpacing * getScaleFactor(context);
  }
}

/// 改善されたタイトルスライドテンプレート
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
                Color(0xFF1e3c72),
                Color(0xFF2a5298),
                Color(0xFF4f79a4),
              ],
            ),
          ),
          child: Center(
            child: Padding(
              padding: EdgeInsets.all(ResponsiveHelper.getSpacing(context, 40)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // メインタイトル
                  Container(
                    padding: EdgeInsets.all(ResponsiveHelper.getSpacing(context, 20)),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: Colors.white.withValues(alpha: 0.2),
                        width: 1,
                      ),
                    ),
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: ResponsiveHelper.getFontSize(context, 56),
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        height: 1.2,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  
                  // 副題
                  if (subtitle != null) ...[
                    SizedBox(height: ResponsiveHelper.getSpacing(context, 40)),
                    Text(
                      subtitle!,
                      style: TextStyle(
                        fontSize: ResponsiveHelper.getFontSize(context, 28),
                        color: Colors.white.withValues(alpha: 0.9),
                        height: 1.3,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                  
                  // 作者と日付
                  if (author != null || date != null) ...[
                    SizedBox(height: ResponsiveHelper.getSpacing(context, 60)),
                    Container(
                      padding: EdgeInsets.all(ResponsiveHelper.getSpacing(context, 16)),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.05),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        children: [
                          if (author != null)
                            Text(
                              author!,
                              style: TextStyle(
                                fontSize: ResponsiveHelper.getFontSize(context, 22),
                                color: Colors.white.withValues(alpha: 0.8),
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          if (author != null && date != null)
                            SizedBox(height: ResponsiveHelper.getSpacing(context, 8)),
                          if (date != null)
                            Text(
                              date!,
                              style: TextStyle(
                                fontSize: ResponsiveHelper.getFontSize(context, 18),
                                color: Colors.white.withValues(alpha: 0.7),
                              ),
                              textAlign: TextAlign.center,
                            ),
                        ],
                      ),
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

/// 改善された箇条書きスライドテンプレート
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
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFFf7f0fd),
                Color(0xFFe6f3ff),
              ],
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(ResponsiveHelper.getSpacing(context, 60)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // タイトル
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(ResponsiveHelper.getSpacing(context, 20)),
                  decoration: BoxDecoration(
                    color: const Color(0xFF6366f1),
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.1),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: titleFontSize != null 
                        ? ResponsiveHelper.getFontSize(context, titleFontSize!)
                        : ResponsiveHelper.getFontSize(context, 40),
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                
                SizedBox(height: ResponsiveHelper.getSpacing(context, 40)),
                
                // 箇条書き
                Expanded(
                  child: ListView.builder(
                    itemCount: bullets.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.only(
                          bottom: ResponsiveHelper.getSpacing(context, 20),
                        ),
                        padding: EdgeInsets.all(ResponsiveHelper.getSpacing(context, 20)),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.05),
                              blurRadius: 6,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: ResponsiveHelper.getSpacing(context, 24),
                              height: ResponsiveHelper.getSpacing(context, 24),
                              margin: EdgeInsets.only(
                                top: ResponsiveHelper.getSpacing(context, 4),
                                right: ResponsiveHelper.getSpacing(context, 16),
                              ),
                              decoration: const BoxDecoration(
                                color: Color(0xFF6366f1),
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: Text(
                                  '${index + 1}',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: ResponsiveHelper.getFontSize(context, 14),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                bullets[index].startsWith('•') 
                                  ? bullets[index].substring(1).trim()
                                  : bullets[index],
                                style: TextStyle(
                                  fontSize: bulletFontSize != null
                                    ? ResponsiveHelper.getFontSize(context, bulletFontSize!)
                                    : ResponsiveHelper.getFontSize(context, 24),
                                  color: const Color(0xFF374151),
                                  height: 1.4,
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

/// 改善された番号付きリストスライドテンプレート
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
                Color(0xFF0f172a),
                Color(0xFF1e293b),
                Color(0xFF334155),
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
                      : ResponsiveHelper.getFontSize(context, 40),
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
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
                          color: Colors.white.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: Colors.white.withValues(alpha: 0.2),
                            width: 1,
                          ),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: ResponsiveHelper.getSpacing(context, 40),
                              height: ResponsiveHelper.getSpacing(context, 40),
                              margin: EdgeInsets.only(
                                right: ResponsiveHelper.getSpacing(context, 20),
                              ),
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  colors: [Color(0xFF06b6d4), Color(0xFF0891b2)],
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Center(
                                child: Text(
                                  '${index + 1}',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: ResponsiveHelper.getFontSize(context, 18),
                                    fontWeight: FontWeight.bold,
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
                                    : ResponsiveHelper.getFontSize(context, 28),
                                  color: Colors.white.withValues(alpha: 0.95),
                                  height: 1.3,
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

/// 改善されたコンテンツスライドテンプレート
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
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color(0xFFfef3c7),
                Color(0xFFfde68a),
                Color(0xFFf59e0b),
              ],
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(ResponsiveHelper.getSpacing(context, 60)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // タイトル
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(ResponsiveHelper.getSpacing(context, 24)),
                  decoration: BoxDecoration(
                    color: const Color(0xFF92400e),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: titleFontSize != null
                        ? ResponsiveHelper.getFontSize(context, titleFontSize!)
                        : ResponsiveHelper.getFontSize(context, 40),
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                
                SizedBox(height: ResponsiveHelper.getSpacing(context, 40)),
                
                // メインコンテンツ
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(ResponsiveHelper.getSpacing(context, 30)),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.9),
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.1),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Text(
                    content,
                    style: TextStyle(
                      fontSize: contentFontSize != null
                        ? ResponsiveHelper.getFontSize(context, contentFontSize!)
                        : ResponsiveHelper.getFontSize(context, 26),
                      color: const Color(0xFF374151),
                      height: 1.5,
                    ),
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
                            bottom: ResponsiveHelper.getSpacing(context, 16),
                          ),
                          padding: EdgeInsets.all(ResponsiveHelper.getSpacing(context, 20)),
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: 0.8),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: ResponsiveHelper.getSpacing(context, 8),
                                height: ResponsiveHelper.getSpacing(context, 8),
                                margin: EdgeInsets.only(
                                  top: ResponsiveHelper.getSpacing(context, 8),
                                  right: ResponsiveHelper.getSpacing(context, 16),
                                ),
                                decoration: const BoxDecoration(
                                  color: Color(0xFF92400e),
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
                                      : ResponsiveHelper.getFontSize(context, 22),
                                    color: const Color(0xFF374151),
                                    height: 1.4,
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

/// 改善されたセンタリング表示スライドテンプレート
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
            gradient: RadialGradient(
              center: Alignment.center,
              radius: 1.0,
              colors: [
                Color(0xFF667eea),
                Color(0xFF764ba2),
                Color(0xFF6B73FF),
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
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: ResponsiveHelper.getSpacing(context, 40),
                      vertical: ResponsiveHelper.getSpacing(context, 30),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(
                        color: Colors.white.withValues(alpha: 0.3),
                        width: 2,
                      ),
                    ),
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: titleFontSize != null
                          ? ResponsiveHelper.getFontSize(context, titleFontSize!)
                          : ResponsiveHelper.getFontSize(context, 48),
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        height: 1.2,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  
                  // 副題
                  if (subtitle != null) ...[
                    SizedBox(height: ResponsiveHelper.getSpacing(context, 50)),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: ResponsiveHelper.getSpacing(context, 30),
                        vertical: ResponsiveHelper.getSpacing(context, 20),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Text(
                        subtitle!,
                        style: TextStyle(
                          fontSize: subtitleFontSize != null
                            ? ResponsiveHelper.getFontSize(context, subtitleFontSize!)
                            : ResponsiveHelper.getFontSize(context, 32),
                          color: Colors.white.withValues(alpha: 0.95),
                          height: 1.3,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                  
                  // 説明
                  if (description != null) ...[
                    SizedBox(height: ResponsiveHelper.getSpacing(context, 40)),
                    Container(
                      padding: EdgeInsets.all(ResponsiveHelper.getSpacing(context, 24)),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.08),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Text(
                        description!,
                        style: TextStyle(
                          fontSize: descriptionFontSize != null
                            ? ResponsiveHelper.getFontSize(context, descriptionFontSize!)
                            : ResponsiveHelper.getFontSize(context, 24),
                          color: Colors.white.withValues(alpha: 0.9),
                          height: 1.4,
                        ),
                        textAlign: TextAlign.center,
                      ),
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
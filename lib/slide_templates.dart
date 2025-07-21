import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';

/// スライドの基本テンプレートクラス
abstract class SlideTemplate extends FlutterDeckSlideWidget {
  const SlideTemplate({
    super.key,
    required FlutterDeckSlideConfiguration configuration,
  }) : super(configuration: configuration);
}

/// タイトルスライドテンプレート
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
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: const TextStyle(fontSize: 64, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              if (subtitle != null) ...[
                const SizedBox(height: 40),
                Text(
                  subtitle!,
                  style: const TextStyle(fontSize: 36),
                  textAlign: TextAlign.center,
                ),
              ],
              if (author != null) ...[
                const SizedBox(height: 60),
                Text(
                  author!,
                  style: const TextStyle(fontSize: 28),
                  textAlign: TextAlign.center,
                ),
              ],
              if (date != null) ...[
                const SizedBox(height: 20),
                Text(
                  date!,
                  style: const TextStyle(fontSize: 24),
                  textAlign: TextAlign.center,
                ),
              ],
            ],
          ),
        );
      },
    );
  }
}

/// 箇条書きスライドテンプレート
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
    this.titleFontSize = 48,
    this.bulletFontSize = 32,
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
        return Padding(
          padding: const EdgeInsets.all(60.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: titleFontSize, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 60),
              ...bullets.map((bullet) => Padding(
                    padding: const EdgeInsets.only(bottom: 30),
                    child: Text(
                      bullet.startsWith('•') ? bullet : '• $bullet',
                      style: TextStyle(fontSize: bulletFontSize),
                    ),
                  )),
            ],
          ),
        );
      },
    );
  }
}

/// 番号付きリストスライドテンプレート
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
    this.titleFontSize = 48,
    this.itemFontSize = 36,
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
        return Padding(
          padding: const EdgeInsets.all(60.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: titleFontSize, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 60),
              ...items.asMap().entries.map((entry) => Padding(
                    padding: const EdgeInsets.only(bottom: 40),
                    child: Text(
                      '${entry.key + 1}. ${entry.value}',
                      style: TextStyle(fontSize: itemFontSize),
                    ),
                  )),
            ],
          ),
        );
      },
    );
  }
}

/// シンプルなコンテンツスライドテンプレート
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
    this.titleFontSize = 48,
    this.contentFontSize = 32,
    this.bulletFontSize = 28,
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
        return Padding(
          padding: const EdgeInsets.all(60.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: titleFontSize, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 60),
              Text(
                content,
                style: TextStyle(fontSize: contentFontSize),
              ),
              if (bulletPoints != null) ...[
                const SizedBox(height: 40),
                ...bulletPoints!.map((point) => Padding(
                      padding: const EdgeInsets.only(bottom: 30),
                      child: Text(
                        point.startsWith('•') ? point : '• $point',
                        style: TextStyle(fontSize: bulletFontSize),
                      ),
                    )),
              ],
            ],
          ),
        );
      },
    );
  }
}

/// センタリング表示スライドテンプレート
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
    this.titleFontSize = 64,
    this.subtitleFontSize = 40,
    this.descriptionFontSize = 28,
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
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: titleFontSize, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              if (subtitle != null) ...[
                const SizedBox(height: 80),
                Text(
                  subtitle!,
                  style: TextStyle(fontSize: subtitleFontSize),
                  textAlign: TextAlign.center,
                ),
              ],
              if (description != null) ...[
                const SizedBox(height: 60),
                Text(
                  description!,
                  style: TextStyle(fontSize: descriptionFontSize),
                  textAlign: TextAlign.center,
                ),
              ],
            ],
          ),
        );
      },
    );
  }
}
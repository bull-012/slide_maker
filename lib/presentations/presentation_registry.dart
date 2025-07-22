import '../slide_config.dart';
import 'default_slide_config.dart';
import 'figma_ai_presentation_config.dart';

/// 発表資料レジストリ - すべての発表資料を管理
class PresentationRegistry {
  /// 利用可能な発表資料のリスト
  static const List<PresentationItem> presentations = [
    PresentationItem(
      id: 'default',
      title: 'デフォルト発表資料',
      description: '基本的なスライドテンプレートのサンプル',
      config: DefaultSlideConfig.presentation,
    ),
    PresentationItem(
      id: 'tech-demo',
      title: 'Flutter技術デモ',
      description: 'flutter_deckの活用方法',
      config: CustomSlideConfig.techPresentation,
    ),
    PresentationItem(
      id: 'figma-flutter',
      title: 'Figma×Flutter連携ガイド',
      description: 'デザインがそのままアプリになる実用的な手法',
      config: FigmaAIPresentationConfig.presentation,
    ),
  ];

  /// IDから発表資料を取得
  static SlideConfig? getPresentation(String id) {
    final item = presentations.where((p) => p.id == id).firstOrNull;
    return item?.config;
  }

  /// 全発表資料の概要を取得
  static List<String> getPresentationSummaries() {
    return presentations.map((p) => '${p.id}: ${p.title} - ${p.description}').toList();
  }
}

/// 発表資料アイテム
class PresentationItem {
  final String id;
  final String title;
  final String description;
  final SlideConfig config;

  const PresentationItem({
    required this.id,
    required this.title,
    required this.description,
    required this.config,
  });
}
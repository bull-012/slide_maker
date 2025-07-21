/// スライドのコンテンツ設定クラス
class SlideConfig {
  final String title;
  final String? subtitle;
  final String? author;
  final String? date;
  final List<SlideData> slides;

  const SlideConfig({
    required this.title,
    this.subtitle,
    this.author,
    this.date,
    required this.slides,
  });
}

/// 個別スライドのデータクラス
class SlideData {
  final String route;
  final String title;
  final SlideType type;
  final Map<String, dynamic> content;

  const SlideData({
    required this.route,
    required this.title,
    required this.type,
    required this.content,
  });
}

/// スライドタイプの列挙型
enum SlideType {
  title,
  bullet,
  numberedList,
  content,
  center,
}
import '../slide_config.dart';

/// デフォルトのスライド設定
class DefaultSlideConfig {
  static const SlideConfig presentation = SlideConfig(
    title: '発表タイトル',
    subtitle: '副題やテーマ',
    author: '発表者名',
    date: '2025年07月21日',
    slides: [
      SlideData(
        route: '/title',
        title: 'タイトル',
        type: SlideType.title,
        content: {
          'title': '発表タイトル',
          'subtitle': '副題やテーマ',
          'author': '発表者名',
          'date': '2025年07月21日',
        },
      ),
      SlideData(
        route: '/introduction',
        title: '自己紹介',
        type: SlideType.bullet,
        content: {
          'title': '自己紹介',
          'bullets': [
            '名前: あなたの名前',
            '所属: 会社名・チーム名',
            '経験: 専門分野・得意技術',
            '趣味: 興味のあること',
          ],
        },
      ),
      SlideData(
        route: '/agenda',
        title: 'アジェンダ',
        type: SlideType.numberedList,
        content: {
          'title': 'アジェンダ',
          'items': [
            '背景・課題',
            '解決アプローチ',
            '実装・結果',
            'まとめ',
          ],
        },
      ),
      SlideData(
        route: '/main',
        title: 'メインコンテンツ',
        type: SlideType.content,
        content: {
          'title': 'メインコンテンツ',
          'content': 'ここに主要な内容を記述します',
          'bulletPoints': [
            'ポイント1',
            'ポイント2',
            'ポイント3',
          ],
        },
      ),
      SlideData(
        route: '/wrapup',
        title: 'まとめ',
        type: SlideType.center,
        content: {
          'title': 'ありがとうございました',
          'subtitle': '質疑応答',
          'description': 'ご質問・ご意見をお聞かせください',
        },
      ),
    ],
  );
}

/// カスタムスライド設定の例
class CustomSlideConfig {
  static const SlideConfig techPresentation = SlideConfig(
    title: 'Flutter で作るスライド発表',
    subtitle: 'flutter_deckの活用方法',
    author: 'Flutter Developer',
    date: '2025年07月21日',
    slides: [
      SlideData(
        route: '/title',
        title: 'タイトル',
        type: SlideType.title,
        content: {
          'title': 'Flutter で作るスライド発表',
          'subtitle': 'flutter_deckの活用方法',
          'author': 'Flutter Developer',
          'date': '2025年07月21日',
        },
      ),
      SlideData(
        route: '/what-is-flutter-deck',
        title: 'flutter_deckとは',
        type: SlideType.content,
        content: {
          'title': 'flutter_deckとは',
          'content': 'FlutterでプレゼンテーションスライドをHot Reloadで作成できるパッケージ',
          'bulletPoints': [
            'Flutterアプリとしてスライドを作成',
            'キーボードナビゲーション対応',
            'ダークモード・ライトモード切り替え',
            'デモアプリの埋め込みが可能',
          ],
        },
      ),
      SlideData(
        route: '/benefits',
        title: 'メリット',
        type: SlideType.bullet,
        content: {
          'title': 'Flutter でスライドを作るメリット',
          'bullets': [
            'デモを資料に直接埋め込める',
            'アニメーションが自由に作れる',
            'Hot Reloadで効率的に開発できる',
            'Webアプリとしてデプロイ可能',
            'バックエンド連携が簡単',
          ],
        },
      ),
      SlideData(
        route: '/demo',
        title: 'デモ',
        type: SlideType.center,
        content: {
          'title': 'デモタイム！',
          'subtitle': '実際にスライドを操作してみましょう',
        },
      ),
      SlideData(
        route: '/conclusion',
        title: '結論',
        type: SlideType.center,
        content: {
          'title': 'ありがとうございました',
          'subtitle': '質疑応答',
          'description': 'Flutter でのスライド作成についてご質問をどうぞ！',
        },
      ),
    ],
  );
}
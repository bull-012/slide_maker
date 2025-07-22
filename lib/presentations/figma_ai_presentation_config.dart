import '../slide_config.dart';

/// Figma AI フレンドリー設計のプレゼンテーション設定
class FigmaAIPresentationConfig {
  static const SlideConfig presentation = SlideConfig(
    title: 'デザイナーの作業がそのままコードになる方法',
    subtitle: 'Figmaからアプリまで、一緒に作るデザインシステム',
    author: 'エンジニアからデザイナーへ',
    date: '2025年07月22日',
    slides: [
      // タイトルスライド
      SlideData(
        route: '/title',
        title: 'タイトル',
        type: SlideType.title,
        content: {
          'title': 'デザイナーの作業が\nそのままコードになる方法',
          'subtitle': 'Figmaからアプリまで、一緒に作るデザインシステム',
          'author': 'エンジニアからデザイナーへ',
          'date': '2025年07月22日',
        },
      ),

      // デザイナーの悩み
      SlideData(
        route: '/designer-pain',
        title: 'デザイナーの悩み',
        type: SlideType.content,
        content: {
          'title': 'こんなこと、ありませんか？',
          'content': 'デザイナーが感じる実装とのギャップ',
          'bulletPoints': [
            '😔 Figmaで作ったデザインが実装で崩れている',
            '😥 エンジニアに作り直しを依頼するのが申し訳ない',
            '😓 せっかく作ったコンポーネントが活用されていない',
            '🤔 デザインシステムを作っても開発で使われない',
          ],
        },
      ),

      // 理想の姿
      SlideData(
        route: '/ideal-world',
        title: '理想の姿',
        type: SlideType.center,
        content: {
          'title': 'あなたがFigmaで作ったデザインが',
          'subtitle': 'そのままアプリになる',
          'description': 'コンポーネントも、色も、サイズも、全てが連動する世界',
        },
      ),

      // そのために必要なこと
      SlideData(
        route: '/what-we-need',
        title: 'そのために必要なこと',
        type: SlideType.numberedList,
        content: {
          'title': 'デザイナーの作業をコードにつなげるために',
          'items': [
            'Figmaのコンポーネントを開発でも理解できる構造に',
            '色やサイズを「変数」として作ってもらう',
            'レイヤーに意味のある名前をつけてもらう',
            'Figmaで作った通りに動くコンポーネントを作る',
          ],
        },
      ),

      // 「変数」って何？
      SlideData(
        route: '/what-is-variable',
        title: '「変数」って何？',
        type: SlideType.content,
        content: {
          'title': '変数 = デザインの「共通ルール」',
          'content': '例えば、メインカラーを青から緑に変えたい時…',
          'bulletPoints': [
            '✅ 変数あり：1箇所で変えるだけで全てのボタンが緑になる',
            '❌ 変数なし：100個のボタンを一つずつ手作業で変更',
            '🎨 デザインの一貫性が保たれる',
            '🚀 変更作業が爆速になる',
          ],
        },
      ),

      // レイヤーの命名が超重要
      SlideData(
        route: '/naming-matters',
        title: 'レイヤーの命名が超重要',
        type: SlideType.content,
        content: {
          'title': 'レイヤー名がコードに直結します',
          'content': 'エンジニアはレイヤー名で「何を作るべきか」を理解します',
          'bulletPoints': [
            '❌ 「Group 123」→ エンジニアは何を作るべきかわからない',
            '✅ 「UserProfileCard」→ ユーザープロフィールカードだと一発でわかる',
            '✅ 「PrimaryButton」→ メインボタンだとスタイルもわかる',
            '💬 コミュニケーションコストが激減！',
          ],
        },
      ),

      // PropertiesとVariantsとは？
      SlideData(
        route: '/properties-variants',
        title: 'PropertiesとVariantsとは？',
        type: SlideType.content,
        content: {
          'title': 'コンポーネンチの「設定」が実装の「props」になります',
          'content': 'ボタンコンポーネントで考えてみましょう',
          'bulletPoints': [
            '🎨 Properties: Size=Large, Style=Primary, State=Default',
            '🔄 Variants: 大きさ・色・状態の全組み合わせパターン',
            '💻 開発側: <Button size="large" variant="primary" />',
            '✨ Figmaの設定がそのままコードに！',
          ],
        },
      ),

      // デザイナーへのお願い
      SlideData(
        route: '/designer-request',
        title: 'デザイナーへのお願い',
        type: SlideType.content,
        content: {
          'title': 'これだけやってもらえれば実装が激変！',
          'content': '日常のデザイン作業でちょっと意識するだけ',
          'bulletPoints': [
            '🎨 色・サイズ・間隔は変数で管理してほしい',
            '🏷️ レイヤー名は意味のある名前で作ってほしい',
            '📎 Auto Layoutでレスポンシブ対応してほしい',
            '🧩 コンポーネントはProperties/Variantsを設定してほしい',
          ],
        },
      ),

      // React Web対応
      SlideData(
        route: '/react',
        title: 'React Web対応',
        type: SlideType.content,
        content: {
          'title': '将来のReact+MUI展開への準備',
          'content': 'Web展開時にFull Powerを発揮',
          'bulletPoints': [
            'MUIコンポーネントと1対1対応',
            'Figma Dev Mode MCP対応準備',
            'Code Connect設定の事前準備',
            'レスポンシブ対応の明確化',
          ],
        },
      ),

      // プラットフォーム対応表
      SlideData(
        route: '/platform-mapping',
        title: 'プラットフォーム対応',
        type: SlideType.content,
        content: {
          'title': 'Figma → Flutter & React対応表',
          'content': '統一されたデザイン言語での実装',
          'bulletPoints': [
            'Button/Primary → ElevatedButton & MUI Button',
            'Card/Product → Card Widget & MUI Card',
            'spacing-4 → 16.0 & theme.spacing(2)',
            'primary-500 → Colors.blue & theme.palette.primary',
          ],
        },
      ),

      // Auto Layout
      SlideData(
        route: '/auto-layout',
        title: 'Auto Layout設計',
        type: SlideType.content,
        content: {
          'title': 'レスポンシブ対応Auto Layout',
          'content': 'Flutter & React両方で実装しやすい構造',
          'bulletPoints': [
            'Column/Row方向を明確に指定',
            'Gap, Paddingは必ず変数使用',
            'Fill container / Hug contentsを適切に',
            'ブレークポイント対応を注釈で明記',
          ],
        },
      ),

      // 開発フロー
      SlideData(
        route: '/development-flow',
        title: '開発フロー',
        type: SlideType.numberedList,
        content: {
          'title': '実装フロー',
          'items': [
            'Figmaでデザイン（変数・命名規則遵守）',
            'Flutter: 変数情報を活用して手動実装',
            'React: Dev Mode MCP + Code Connectで自動生成',
            '両プラットフォームでの動作確認',
          ],
        },
      ),

      // デザイナー向け指示
      SlideData(
        route: '/designer-guidelines',
        title: 'デザイナー向け指示',
        type: SlideType.content,
        content: {
          'title': 'デザイナーに依頼すべき項目',
          'content': '優先度付きで段階的に実装',
          'bulletPoints': [
            '🔥 高：変数化、レイヤー命名、Auto Layout',
            '📋 中：開発注釈、インタラクション状態',
            '🚀 低：Code Connect準備、MUI詳細対応',
            '⚠️ 禁止：絶対位置、ハードコード値、意味のない名前',
          ],
        },
      ),

      // 期待する効果
      SlideData(
        route: '/benefits',
        title: '期待する効果',
        type: SlideType.bullet,
        content: {
          'title': 'この設計で得られる効果',
          'bullets': [
            'Flutter開発の効率化（変数活用）',
            'React Web展開時の爆速実装',
            'プラットフォーム間でのデザイン一貫性',
            'AIコード生成の精度向上',
            'チーム間のコミュニケーション改善',
          ],
        },
      ),

      // アクションプラン
      SlideData(
        route: '/action-plan',
        title: 'アクションプラン',
        type: SlideType.numberedList,
        content: {
          'title': 'Next Steps',
          'items': [
            'デザイナーとの要件整理・合意',
            '既存Figmaファイルの変数化',
            '命名規則とコンポーネント構造の統一',
            'Flutter実装での効果検証',
            'React Web展開準備',
          ],
        },
      ),

      // まとめ
      SlideData(
        route: '/conclusion',
        title: 'まとめ',
        type: SlideType.center,
        content: {
          'title': 'ひとつのFigmaで',
          'subtitle': '複数プラットフォーム対応',
          'description': '今すぐFlutter効率化、将来React爆速展開',
        },
      ),

      // 質疑応答
      SlideData(
        route: '/qa',
        title: '質疑応答',
        type: SlideType.center,
        content: {
          'title': 'ありがとうございました',
          'subtitle': '質疑応答',
          'description': 'ご質問・ご相談をお聞かせください',
        },
      ),
    ],
  );
}
import '../slide_config.dart';

/// Figma AI フレンドリー設計のプレゼンテーション設定
class FigmaAIPresentationConfig {
  static const SlideConfig presentation = SlideConfig(
    title: 'AIフレンドリーなFigma設計',
    subtitle: 'Flutter & React両対応のデザインシステム構築',
    author: 'Development Team',
    date: '2025年07月21日',
    slides: [
      // タイトルスライド
      SlideData(
        route: '/title',
        title: 'タイトル',
        type: SlideType.title,
        content: {
          'title': 'AIフレンドリーなFigma設計',
          'subtitle': 'Flutter & React両対応のデザインシステム構築',
          'author': 'Development Team',
          'date': '2025年07月21日',
        },
      ),

      // 現状と課題
      SlideData(
        route: '/current-situation',
        title: '現状と課題',
        type: SlideType.content,
        content: {
          'title': '現在の開発環境と課題',
          'content': '現在Flutter、将来Web展開でReact+MUIを予定',
          'bulletPoints': [
            '現在：Flutterアプリ開発中',
            '将来：Web版をReact+MUI+Next.jsで展開',
            'Figma Dev Mode MCPは現在未対応',
            'AIに適切なUIを出力させたい',
          ],
        },
      ),

      // 目標とビジョン
      SlideData(
        route: '/vision',
        title: '目標とビジョン',
        type: SlideType.center,
        content: {
          'title': 'ひとつのFigmaで',
          'subtitle': 'Flutter & React両対応',
          'description': 'AIが理解しやすい統一されたデザインシステム',
        },
      ),

      // 基本戦略
      SlideData(
        route: '/strategy',
        title: '基本戦略',
        type: SlideType.numberedList,
        content: {
          'title': '基本戦略',
          'items': [
            'プラットフォーム間で共通の変数体系を構築',
            'AIが理解しやすい命名規則を統一',
            'コンポーネント構造をFlutter & React対応',
            '将来のCode Connect準備',
          ],
        },
      ),

      // 変数設計
      SlideData(
        route: '/variables',
        title: '変数設計',
        type: SlideType.content,
        content: {
          'title': '統一変数システム（最重要）',
          'content': 'Flutter & React両方で理解できる変数命名',
          'bulletPoints': [
            'カラー：primary-50 → primary-900',
            'スペーシング：spacing-1(4px) → spacing-8(32px)',
            'タイポグラフィ：display-large, body-medium',
            'Material Design準拠で統一',
          ],
        },
      ),

      // 命名規則
      SlideData(
        route: '/naming',
        title: '命名規則',
        type: SlideType.content,
        content: {
          'title': 'AI理解しやすい命名規則',
          'content': '意味のある名前でAIの理解を促進',
          'bulletPoints': [
            '❌ Group 123, Rectangle 4',
            '✅ UserCard, PrimaryButton',
            '✅ NavigationHeader, ProductGrid',
            'コンポーネント：Button/Primary/Large',
          ],
        },
      ),

      // コンポーネント構造
      SlideData(
        route: '/components',
        title: 'コンポーネント構造',
        type: SlideType.content,
        content: {
          'title': 'プラットフォーム対応コンポーネント設計',
          'content': 'Foundation → Primitives → Patterns → Pages',
          'bulletPoints': [
            'Foundation: Colors, Typography, Spacing',
            'Primitives: Button, Input, Card',
            'Patterns: Header, Navigation',
            'Pages: 実際の画面構成',
          ],
        },
      ),

      // Flutter対応
      SlideData(
        route: '/flutter',
        title: 'Flutter対応',
        type: SlideType.content,
        content: {
          'title': '現在のFlutter開発への適用',
          'content': '手動だが効率的な変換を実現',
          'bulletPoints': [
            'Material Design準拠のWidget選択',
            '変数情報を活用したTheme設定',
            'Auto Layoutに対応したFlutter構造',
            '明確な命名でコード理解を促進',
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
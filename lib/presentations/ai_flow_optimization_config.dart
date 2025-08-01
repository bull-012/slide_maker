import '../slide_config.dart';

/// AI開発フロー最適化プレゼンテーション設定
class AIFlowOptimizationConfig {
  static const SlideConfig presentation = SlideConfig(
    title: 'AIで開発フロー最適化',
    subtitle: '自動化で仕事をゼロに - 楽しながら前進する開発',
    author: 'ぶる',
    date: '2025年8月1日',
    slides: [
      // タイトルスライド
      SlideData(
        route: '/title',
        title: 'タイトル',
        type: SlideType.title,
        content: {
          'title': 'AIで開発フロー最適化',
          'subtitle': '自動化で仕事をゼロに - 楽しながら前進する開発',
          'author': '開発効率化推進チーム',
          'date': '2025年8月1日',
        },
      ),

      // 核心メッセージ
      SlideData(
        route: '/core-message',
        title: '核心メッセージ',
        type: SlideType.center,
        content: {
          'title': 'AIの真価は開発フローの最適化',
          'subtitle': 'コード生成ではなく、開発者の時間を生み出すこと',
          'description': '本来やるべきことに集中できる環境づくり',
        },
      ),

      // 3つの要点
      SlideData(
        route: '/three-points',
        title: '3つの要点',
        type: SlideType.numberedList,
        content: {
          'title': '今日お伝えしたい3つのこと',
          'items': [
            '開発フローの無駄を自動化で解決する',
            '音駆動開発でコンテキストスイッチを最小化',
            '社内ツールは「動けばOK」の精神で素早く作る',
          ],
        },
      ),

      // 要点1: 開発フローの無駄
      SlideData(
        route: '/point1-waste',
        title: '要点1: 開発フローの無駄',
        type: SlideType.center,
        content: {
          'title': '見えないコストが蓄積している',
          'subtitle': '1日30分の無駄',
          'description': 'CI/CD待ち、画面切り替え、定型作業の繰り返し',
        },
      ),

      // 具体例: 無駄の例
      SlideData(
        route: '/waste-examples',
        title: '具体例: よくある無駄',
        type: SlideType.bullet,
        content: {
          'title': '日々遭遇する時間の無駄',
          'bullets': [
            'lint忘れで再コミット・CI再実行（5分×3回/日）',
            'GitHub Actions の結果を音で通知（20分/日→即座に把握）',
            'freee勤怠の手動入力（5分/日）',
            'ブラック検知の手動確認（10分/週）',
          ],
        },
      ),

      // 要点2: コンテキストスイッチの最小化
      SlideData(
        route: '/point2-context',
        title: '要点2: コンテキストスイッチの最小化',
        type: SlideType.center,
        content: {
          'title': '集中力の分断を防ぐ',
          'subtitle': '作業を中断せずに状態を把握',
          'description': '画面切り替えによる生産性低下を解決',
        },
      ),

      // 具体例: コンテキストスイッチを減らす方法
      SlideData(
        route: '/context-examples',
        title: '具体例: コンテキストスイッチを減らす方法',
        type: SlideType.bullet,
        content: {
          'title': '実際に使えるテクニック',
          'bullets': [
            '音駆動開発：マリオBGM＋GitHub Actions Watch＋AquaVoice',
            '別リポジトリで並行開発：git worktreeより疲れない',
            'AIの思考を深くする：カスタムコマンドで深い分析',
            '1つの作業の思考を深くする：質の向上',
          ],
        },
      ),

      // 要点3: 社内ツールの哲学
      SlideData(
        route: '/point3-tools',
        title: '要点3: 社内ツールの哲学',
        type: SlideType.center,
        content: {
          'title': '社内ツールは「動けばOK」',
          'subtitle': 'プロダクションと社内ツールの品質基準を分ける',
          'description': '完璧を求めず、まずは時間削減を実現',
        },
      ),

      // 具体例: 自動化ツール
      SlideData(
        route: '/tool-examples',
        title: '具体例: 実際の自動化ツール',
        type: SlideType.bullet,
        content: {
          'title': '遊び心から生まれた実用ツール',
          'bullets': [
            'freee勤怠自動入力（青野さん作）',
            'ブラック検知自動化(作成中)',
            'PR作成時に必要なことを全部入れたコマンド',
            'lint忘れ自動修正スクリプト',
          ],
        },
      ),

      // 音駆動開発の詳細
      SlideData(
        route: '/sound-driven-detail',
        title: '音駆動開発の詳細',
        type: SlideType.content,
        content: {
          'title': '個人的に音駆動開発にハマってます',
          'content': 'マリオの音楽で開発フローを音楽化',
          'bulletPoints': [
            '処理開始：マリオのテーマ曲が流れて集中モード突入',
            '確認タイミング：ジャンプ音で「レビューお願いします」',
            '処理完了：ゴール音で達成感と次のタスクへ',
            '並行処理：BGMリセットで新しいコンテキスト開始',
            'GitHub CI完了：成功音/失敗音で結果を即座に把握',
          ],
        },
      ),

      // AIの思考を深くする
      SlideData(
        route: '/ai-deep-thinking',
        title: 'AIの思考を深くする',
        type: SlideType.content,
        content: {
          'title': 'AI疲れ・対話疲れをなくす方法',
          'content': 'カスタムコマンドで1回の指示で深い分析を実現',
          'bulletPoints': [
            '何度も質問する必要がない → 対話疲れを解消',
            '1回の指示で深い分析 → AIとの往復を最小化',
            'sequential-thinking：段階的に複雑な問題を解決',
            'ultrathink：構造化された分析で重要な決定',
            '待ち時間を有効活用 → 他の作業に集中できる',
          ],
        },
      ),

      // その他の自動化ツール
      SlideData(
        route: '/other-tools',
        title: 'その他の自動化ツール',
        type: SlideType.content,
        content: {
          'title': 'まだまだある自動化の可能性',
          'content': '実験中・アイデア段階のツール',
          'bulletPoints': [
            'AquaVoice（\$10で実験中）：音声入力でハンズフリー開発',
            'Figma Dev Mode MCP：UIの取得・再現が可能に',
            'Role-based AI Architecture：専門家AIの議論で最適解',
            'ブラウザ操作の自動化：定型作業をスクリプト化',
            '社内で眠っている便利ツールたち',
          ],
        },
      ),

      // アクションプラン
      SlideData(
        route: '/action-plan',
        title: 'アクションプラン',
        type: SlideType.numberedList,
        content: {
          'title': '明日から始める3つのステップ',
          'items': [
            '最も頻繁な作業を1つ選んで自動化',
            '音通知を作ってみる（Claude Code使う人向け）',
            '社内の自動化ツールを探して使ってみる',
          ],
        },
      ),

      // まとめ
      SlideData(
        route: '/conclusion',
        title: 'まとめ',
        type: SlideType.center,
        content: {
          'title': '楽をするための努力が',
          'subtitle': '組織全体の生産性を上げる',
          'description': '自動化で時間を作り、本来の価値創造へ',
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
          'description': 'ご質問・実践事例、アイデアの共有をお待ちしています',
        },
      ),
    ],
  );
}

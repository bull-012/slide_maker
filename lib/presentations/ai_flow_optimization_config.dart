import '../slide_config.dart';

/// AI開発フロー最適化プレゼンテーション設定
class AIFlowOptimizationConfig {
  static const SlideConfig presentation = SlideConfig(
    title: 'AIで開発フロー最適化',
    subtitle: '自動化で仕事をゼロに - 楽しながら前進する開発',
    author: '開発効率化推進チーム',
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

      // パラダイムシフト
      SlideData(
        route: '/paradigm-shift',
        title: 'パラダイムシフト',
        type: SlideType.content,
        content: {
          'title': 'AIの使い方が変わってきた',
          'content': 'コード生成から開発フロー全体の最適化へ',
          'bulletPoints': [
            '以前：「AIでコード生成！効率化！」',
            '現在：「AIで開発フロー全体を自動化・最適化」',
            '開発自体より、開発を取り巻く作業の効率化にこそ価値がある',
            '「楽をするための努力」という逆説的な面白さ',
          ],
        },
      ),

      // 現状の無駄
      SlideData(
        route: '/current-waste',
        title: '現状の無駄',
        type: SlideType.content,
        content: {
          'title': '日々の開発で感じる無駄',
          'content': '見えないコストの蓄積',
          'bulletPoints': [
            'CI/CDでlint忘れ → 再コミット・再実行の無駄',
            '1回数ドルのコスト × 回数 = 見えないコストの蓄積',
            '気づくタイミングの遅れ = 全体的なスピード感の低下',
            'コンテキストスイッチによる集中力の分散',
          ],
        },
      ),

      // 開発フローの自動化事例
      SlideData(
        route: '/automation-examples',
        title: '自動化事例',
        type: SlideType.content,
        content: {
          'title': '実際に自動化できること',
          'content': '日々の作業を自動化で解決',
          'bulletPoints': [
            'lint忘れの自動修正フロー',
            'PR作成時の自動チェック強化',
            'デプロイ前の各種検証の自動化',
            '「気づくタイミング」を前倒しする仕組み作り',
          ],
        },
      ),

      // 並行作業の最適化
      SlideData(
        route: '/parallel-optimization',
        title: '並行作業の最適化',
        type: SlideType.content,
        content: {
          'title': '効率的な並行作業の工夫',
          'content': '負荷を分散して効率化',
          'bulletPoints': [
            'git worktreeは疲れる → 別リポジトリで同時開発',
            '5分の待ち時間を活用した思考の深化',
            'コンテキストスイッチを減らす工夫',
            '１つあたりの思考の深さを深くして質を上げる',
          ],
        },
      ),

      // 日常業務の自動化
      SlideData(
        route: '/daily-automation',
        title: '日常業務の自動化',
        type: SlideType.content,
        content: {
          'title': '身近な自動化の例',
          'content': '遊び心から生まれる実用的なツール',
          'bulletPoints': [
            'ブラック検知の自動化',
            'freee勤怠の自動化（青野さんの例）',
            '定型作業の自然言語による自動化',
            '社内ツールは「まず動く」を優先、徐々に改善',
          ],
        },
      ),

      // Figma Dev Mode MCP
      SlideData(
        route: '/figma-mcp',
        title: 'Figma Dev Mode MCP',
        type: SlideType.content,
        content: {
          'title': 'Figmaからコードへの挑戦',
          'content': 'UIは取得できるが、まだ課題あり',
          'bulletPoints': [
            'UIの取得・再現は可能に',
            'コード品質の制御が課題',
            'インタラクション・状態管理の難しさ',
            'Role-based AI Architectureの検討',
          ],
        },
      ),

      // 解決アプローチ
      SlideData(
        route: '/solution-approach',
        title: '解決アプローチ',
        type: SlideType.numberedList,
        content: {
          'title': 'Figma → コードの課題解決',
          'items': [
            'View専門家AIとLogic専門家AIの分離',
            '両者のdebateによる最適解の導出',
            'コンテキスト設計の工夫',
            '段階的な自動化（完全自動化を目指さない）',
          ],
        },
      ),

      // 社内ナレッジの共有
      SlideData(
        route: '/knowledge-sharing',
        title: '社内ナレッジ共有',
        type: SlideType.content,
        content: {
          'title': '隠れた自動化ツールの共有',
          'content': '遊び心から生まれる実用ツール',
          'bulletPoints': [
            '社内で密かに作られている便利ツールたち',
            '車輪の再発明を防ぐ',
            'データベース化して共有文化を作る',
            '「楽をするための努力」を組織の力に',
          ],
        },
      ),

      // キーメッセージ
      SlideData(
        route: '/key-message',
        title: 'キーメッセージ',
        type: SlideType.center,
        content: {
          'title': 'AIの真価は',
          'subtitle': 'コードを書くことではなく',
          'description': '開発者が本来やるべきことに集中できる環境を作ること',
        },
      ),

      // 実践的なTips
      SlideData(
        route: '/practical-tips',
        title: '実践的なTips',
        type: SlideType.bullet,
        content: {
          'title': '今すぐ始められる自動化',
          'bullets': [
            'CI/CDパイプラインの見直し',
            'pre-commitフックの活用',
            '定型作業のスクリプト化',
            'AIツールを開発フローに組み込む',
            '失敗を恐れず、まず試してみる',
          ],
        },
      ),

      // 投資対効果
      SlideData(
        route: '/roi',
        title: '投資対効果',
        type: SlideType.content,
        content: {
          'title': '自動化の投資対効果',
          'content': '小さな積み重ねが大きな差に',
          'bulletPoints': [
            '1回5分の作業 × 1日10回 = 50分/日',
            '50分/日 × 20日 = 1000分/月 ≈ 17時間/月',
            '17時間 = 2営業日分の時間創出',
            'その時間で新しい価値創造へ',
          ],
        },
      ),

      // アクションプラン
      SlideData(
        route: '/action-plan',
        title: 'アクションプラン',
        type: SlideType.numberedList,
        content: {
          'title': '明日から始める第一歩',
          'items': [
            '現在の開発フローの無駄を洗い出す',
            '最も頻繁に行う作業から自動化',
            '社内の自動化事例を収集・共有',
            'AIツールの開発フロー統合を試す',
            '成果を測定し、改善サイクルを回す',
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
          'subtitle': 'チーム全体の生産性を上げる',
          'description': '自動化で仕事をゼロに、そして新しい価値創造へ',
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
          'description': 'ご質問・実践事例の共有をお待ちしています',
        },
      ),
    ],
  );
}
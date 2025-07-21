# Flutter スライド作成ツール

Flutter と flutter_deck を使用して発表資料を作成するプロジェクトです。

## 特徴

- **再利用可能なテンプレート**: 共通化されたスライドテンプレートで効率的にスライドを作成
- **設定ベース**: JSON のような設定データでスライドコンテンツを管理
- **複数のスライドタイプ**: タイトル、箇条書き、番号付きリスト、コンテンツ、センタリング表示に対応
- **テーマ対応**: ダークモード・ライトモードの切り替え
- **Hot Reload**: Flutter の Hot Reload でリアルタイムにスライドを編集

## クイックスタート

### 1. FVM とFlutter環境のセットアップ

このプロジェクトは **FVM（Flutter Version Management）** を使用しています。

```bash
# FVMをインストール（未インストールの場合）
dart pub global activate fvm

# プロジェクトのFlutterバージョンをインストール
fvm install

# プロジェクトでFVMを使用するよう設定
fvm use 3.32.5
```

### 2. 依存関係のインストール

```bash
# FVM経由でpackageをインストール
fvm flutter pub get
```

### 3. スライドの実行

```bash
# デスクトップアプリとして実行
fvm flutter run -d macos

# Webアプリとして実行（推奨）
fvm flutter run -d web-server --web-port 8080
```

## 使い方

### 基本的な使い方

アプリを起動すると発表資料選択画面が表示されます：

```bash
fvm flutter run -d web-server --web-port 8080
```

選択画面で利用可能な発表資料から選んでタップして発表を開始できます。

### FVM使用時の注意点

- **すべてのflutterコマンドは `fvm flutter` で実行してください**
- IDEの設定でFVMのFlutterパスを指定することを推奨
- プロジェクトのFlutterバージョンは `.fvmrc` で管理されています

### 新しい発表資料の追加

新しい発表資料を追加するには以下の手順に従ってください：

#### 1. 発表資料設定ファイルの作成

`lib/presentations/` フォルダに新しいファイルを作成：

```dart
// lib/presentations/my_presentation_config.dart
import '../slide_config.dart';

class MyPresentationConfig {
  static const SlideConfig presentation = SlideConfig(
    title: 'マイプレゼンテーション',
    subtitle: '説明',
    author: '発表者名',
    date: '2025年07月21日',
    slides: [
      // スライドを定義...
    ],
  );
}
```

#### 2. レジストリへの登録

`lib/presentations/presentation_registry.dart` でインポートと登録：

```dart
import 'my_presentation_config.dart';

static const List<PresentationItem> presentations = [
  // 既存の発表資料...
  PresentationItem(
    id: 'my-presentation',
    title: 'マイプレゼンテーション',
    description: 'プレゼンテーションの説明',
    config: MyPresentationConfig.presentation,
  ),
];
```

#### 2. ヘルパー関数を使用した作成

```dart
final slides = [
  SlideHelper.createTitleSlide(
    title: 'プレゼンテーションタイトル',
    subtitle: '副題',
    author: '発表者',
    date: '2025年07月21日',
  ),
  SlideHelper.createBulletSlide(
    route: '/intro',
    title: '自己紹介',
    bullets: [
      '名前: John Doe',
      '職業: Flutter開発者',
      '経験: 5年',
    ],
  ),
  SlideHelper.createContentSlide(
    route: '/main',
    title: 'メイン内容',
    content: '詳細な説明をここに記述',
    bulletPoints: [
      'ポイント1',
      'ポイント2',
      'ポイント3',
    ],
  ),
];

final config = SlideConfig(
  title: 'カスタムプレゼン',
  slides: slides,
);
```

## スライドタイプ

### 1. タイトルスライド (SlideType.title)

```dart
SlideData(
  type: SlideType.title,
  content: {
    'title': 'メインタイトル',
    'subtitle': '副題（オプション）',
    'author': '発表者名（オプション）',
    'date': '日付（オプション）',
  },
)
```

### 2. 箇条書きスライド (SlideType.bullet)

```dart
SlideData(
  type: SlideType.bullet,
  content: {
    'title': 'スライドタイトル',
    'bullets': [
      '箇条書き項目1',
      '箇条書き項目2',
      '箇条書き項目3',
    ],
  },
)
```

### 3. 番号付きリストスライド (SlideType.numberedList)

```dart
SlideData(
  type: SlideType.numberedList,
  content: {
    'title': 'スライドタイトル',
    'items': [
      'アイテム1',
      'アイテム2',
      'アイテム3',
    ],
  },
)
```

### 4. コンテンツスライド (SlideType.content)

```dart
SlideData(
  type: SlideType.content,
  content: {
    'title': 'スライドタイトル',
    'content': 'メインコンテンツの説明',
    'bulletPoints': ['ポイント1', 'ポイント2'], // オプション
  },
)
```

### 5. センタリング表示スライド (SlideType.center)

```dart
SlideData(
  type: SlideType.center,
  content: {
    'title': 'メインタイトル',
    'subtitle': '副題（オプション）',
    'description': '説明（オプション）',
  },
)
```

## フォントサイズのカスタマイズ

各スライドタイプでフォントサイズをカスタマイズできます：

```dart
SlideData(
  type: SlideType.bullet,
  content: {
    'title': 'カスタムフォント',
    'bullets': ['項目1', '項目2'],
    'titleFontSize': 52.0,
    'bulletFontSize': 28.0,
  },
)
```

## キーボードショートカット

- **→** または **Enter**: 次のスライド
- **←**: 前のスライド
- **Home**: 最初のスライド
- **End**: 最後のスライド
- **M**: 発表中のお絵描きモード
- **D**: ダーク/ライトモードの切り替え

## プロジェクト構造

```
lib/
├── main.dart                      # アプリケーションのエントリーポイント
├── presentation_selector.dart     # 発表資料選択画面
├── slide_templates.dart           # 再利用可能なスライドテンプレート
├── slide_config.dart             # スライド設定とデータクラス
├── slide_builder.dart            # スライド生成とヘルパー関数
└── presentations/                # 発表資料管理フォルダ
    ├── presentation_registry.dart    # 発表資料レジストリ
    ├── default_slide_config.dart     # デフォルト発表資料
    └── figma_ai_presentation_config.dart # Figma AI設計発表資料
```

### 発表資料の管理

- `presentations/` フォルダに各発表資料を配置
- `presentation_registry.dart` で発表資料を登録
- 起動時に選択画面で発表資料を選択

## 開発のヒント

### FVM環境での開発

1. **Hot Reload を活用**: `fvm flutter run` でスライドの内容を変更したら Hot Reload で即座に確認
2. **IDE設定**: VS Code や Android Studio で FVM の Flutter パスを設定
   ```bash
   # FVMのFlutterパスを確認
   fvm flutter --version
   fvm which flutter
   ```

### プロジェクト開発Tips

3. **設定ファイルを分離**: 大きなプレゼンテーションでは設定を別ファイルに分離
4. **テンプレートの再利用**: 共通のスライドレイアウトはテンプレートを活用
5. **レスポンシブ対応**: 異なる画面サイズでもレイアウトが崩れないよう余白を適切に設定

### FVMコマンド参考

```bash
# バージョン確認
fvm flutter --version

# パッケージ管理
fvm flutter pub get
fvm flutter pub upgrade

# ビルド・テスト
fvm flutter test
fvm flutter build web
fvm flutter analyze
```

## ビルドとデプロイ

### 自動デプロイ（推奨）

このプロジェクトはGitHub Actionsによる自動デプロイが設定されています：

#### GitHub Pages自動デプロイ
- `main` ブランチにpushすると自動でGitHub Pagesにデプロイ
- GitHub Pagesは https://username.github.io/slide_maker/ でアクセス可能
- ビルド、テスト、デプロイが自動実行

#### PR Preview機能
- Pull Requestを作成すると自動でプレビューサイトを生成
- https://username.github.io/slide_maker/pr-{番号}/ でプレビュー確認可能
- PRがクローズされると自動でプレビューサイトを削除

### 手動デプロイ

必要に応じて手動でビルド・デプロイも可能：

```bash
# FVM経由でWebアプリとしてビルド
fvm flutter build web --base-href "/slide_maker/"

# 分析・テスト実行
fvm flutter analyze
fvm flutter test

# GitHub CLI使用の場合（推奨）
gh workflow run deploy.yml
```

### デスクトップアプリとしてビルド

```bash
# macOS
fvm flutter build macos

# Windows  
fvm flutter build windows

# Linux
fvm flutter build linux
```

## プロジェクトの特徴

### FVM管理
- Flutter 3.32.5 で固定
- チーム開発でのFlutterバージョン統一
- ローカル開発とCI/CDの環境一致

### 自動化
- GitHub Actions による自動デプロイ
- PR プレビュー機能
- 自動テスト・静的解析実行

### 開発効率
- Hot Reload 対応
- モジュラー設計による保守性
- 設定ベースのスライド管理

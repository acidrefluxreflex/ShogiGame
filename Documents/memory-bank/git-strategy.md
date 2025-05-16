# ShogiGame プロジェクトのブランチ戦略

## メインブランチ構成
1. `main`
   - プロダクションリリース用
   - 直接コミット禁止
   - タグによるバージョン管理

2. `develop`
   - 開発の中心ブランチ
   - feature ブランチのマージ先
   - CIによる自動テスト実行

## 機能開発ブランチ（feature/*）

### ゲームロジック関連
- `feature/game-board`（将棋盤の実装）
- `feature/piece-movement`（駒の移動ロジック）
- `feature/promotion-rules`（駒の成りロジック）
- `feature/game-state`（ゲーム状態管理）

### オンライン対戦関連
- `feature/firebase-auth`（認証機能）
- `feature/realtime-matching`（マッチング機能）
- `feature/game-sync`（ゲーム状態同期）

### UI/UX関連
- `feature/board-ui`（将棋盤UI）
- `feature/piece-animations`（駒の移動アニメーション）
- `feature/settings-screen`（設定画面）

## リリース関連ブランチ
1. `release/*`
   - バージョン番号に基づく命名（例：`release/1.0.0`）
   - App Store提出前の最終調整
   - バグ修正のみ許可
   - `main`と`develop`の両方にマージ

2. `hotfix/*`
   - 本番環境での緊急バグ修正用
   - `main`から分岐
   - 修正後、`main`と`develop`の両方にマージ

## ブランチ運用ルール

### コミットメッセージ規約
```
<type>(<scope>): <subject>

<body>

<footer>
```

### レビュープロセス
- featureブランチ → develop: 最低1名のレビュー必須
- release → main: 最低2名のレビュー必須
- hotfix → main: 緊急時は1名のレビューで可

### マージ戦略
- feature → develop: squash merge
- release/hotfix → main: merge commit

### CI/CD連携
- feature ブランチ: ユニットテスト
- develop: ユニットテスト + UIテスト
- release: 全テスト + ベータ配布
- main: App Store提出

## ブランチフロー図

```mermaid
gitGraph
    commit
    branch develop
    checkout develop
    commit id: "Initial Setup"
    branch feature/game-logic
    commit id: "Basic Board"
    commit id: "Piece Movement"
    checkout develop
    branch feature/firebase-integration
    commit id: "Auth"
    commit id: "Realtime DB"
    checkout develop
    merge feature/game-logic
    merge feature/firebase-integration
    branch release/1.0.0
    commit id: "Version Bump"
    commit id: "Bug Fixes"
    checkout main
    merge release/1.0.0
    checkout develop
    branch hotfix/1.0.1
    commit id: "Critical Fix"
    checkout main
    merge hotfix/1.0.1
    checkout develop
    merge hotfix/1.0.1

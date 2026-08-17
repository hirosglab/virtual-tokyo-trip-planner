---
title: "Room Floor Design Specification"
type: "design-spec"
status: "draft"
tags:
  - floors
  - room-design
  - roblox-studio
links:
  - "./object-deployment-plan.md"
description: "各ゾーンの床設計仕様書。Workspace/Floors に作成したゾーン（ZoneA_Center_Floor, ZoneB_Middle_Floor, ZoneC_Base_Floor）についての設計・命名・素材・配置ルールを定義します。"
---

# Room Floor Design Spec

対象パス
- Workspace/Floors
  - ZoneA_Center_Floor
  - ZoneB_Middle_Floor
  - ZoneC_Base_Floor

概要
- この仕様書はワークスペースに置く床オブジェクトの設計仕様を記述します。ZoneC_Base_Floor の詳細仕様を含み、テンプレート名・配置時の命名規則・推奨素材を明記しています。

命名規則（既存のworkspace-hierarchy.md に準拠）
- フォルダ / オブジェクト名: PascalCase + アンダースコア区切り
- ゾーン名そのものは既に Workspace/Floors 下に作成済み（例: ZoneC_Base_Floor）
- 床タイル／素材テンプレート: `FloorTile_[Material]_Template`（例: `FloorTile_Stone_Template`）
- 配置済みインスタンス: `FloorTile_[Material]_[NN]`（例: `FloorTile_Stone_01`）
- ゾーン単位のモデル: `Zone_[ZoneID]_Floor_Model`（例: `Zone_ZoneC_Floor_Model`）

共通仕様
- 各ゾーンは Model でまとめ、Model を Workspace/Floors/<ZoneName> に配置する。
- テンプレートは ReplicatedStorage/Env_Templates/Floor_Templates に保管し、必要時に Clone して Workspace に配置するワークフローを採用する。
- CollectionService タグを付与する: `CollectionService:AddTag(model, "Floor")` と合わせて `ZoneA`, `ZoneB`, `ZoneC` などゾーンタグを追加する。

ZoneC_Base_Floor（詳細）
- Workspace path: `Workspace/Floors/ZoneC_Base_Floor`
- 目的: シーンの基礎床（ベースプレーン）。広域の歩行領域と周辺オブジェクトの基盤を提供する。
- サイズ / グリッド:
  - 推奨セルサイズ: 4m x 4m（Roblox ワールド単位）
  - 合計概算範囲: 40m x 30m（必要に応じて調整）
- レイヤ構成（下から上へ）:
  1. CollisionPlane（透明な衝突プレーン、CanCollide = true）
  2. BaseMesh（メッシュ or Part、見た目の基礎）
  3. DecorativeTiles（タイル群、飾り・歩行指示など）
  4. EdgeTrim（周囲の縁取りモデル）
- 推奨オブジェクト構成（Model 内）:
  - Zone_ZoneC_Floor_Model (Model)
    - Base_Mesh (Part / MeshPart) — 名前例: `Base_Mesh_ZoneC`
    - Tiles (Folder)
      - FloorTile_Concrete_01
      - FloorTile_Concrete_02
      - ...
    - Edge (Folder)
      - Edge_Trim_01
    - CollisionPlane (Part)
- マテリアル／見た目
  - メインマテリアル: Concrete / SmoothPlastic（日本の市街地ベースを想定）
  - 色味: 中間のグレー基調、アクセントで黄線や横断歩道テクスチャを配置
  - ライト: baked なライト環境がある場合は BaseMesh に適切なライト設定を行う。ランタイムでの光源は別途管理。

テンプレート例（ReplicatedStorage 側）
- ReplicatedStorage/Env_Templates/Floor_Templates/FloorTile_Concrete_Template
- ReplicatedStorage/Env_Templates/Floor_Templates/Zone_ZoneC_Floor_Model_Template

運用手順（短く）
1. テンプレートを ReplicatedStorage で更新。
2. 編集／配置担当はテンプレートを Clone して `Workspace/Floors/ZoneC_Base_Floor` 内に配置。
3. 配置後、インスタンス名を `FloorTile_[Material]_[NN]` にリネームして連番を付与。
4. 完了したら CollectionService タグを付与し、配置状態を管理する（例: `Placed` タグ）。

注意点
- ZoneC はベース領域なので、衝突と視認性を優先してモデルを最小限に保つ。
- 大量のタイルを配置する場合は、1つの Model にマージしてパフォーマンスを確保する（Union/MeshPart の利用を検討）。

変更履歴
- 2026-08-17: 初版作成。Workspace/Floors 下に ZoneA_Center_Floor, ZoneB_Middle_Floor, ZoneC_Base_Floor を作成済みの情報を反映。ZoneC の詳細仕様を追加。

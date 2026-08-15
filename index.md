---
title: "Virtual Tokyo Trip Planner - Project Index"
type: "index"
status: "active"
tags:
  - project-index
  - navigation
  - documentation
links:
  - "./README.md"
  - "./planning/presentation-schedule.md"
  - "./planning/milestone-1-progress.md"
  - "./planning/tokyo-trip-plan-2026.md"
  - "./roblox-world/object-deployment-plan.md"
  - "./roblox-world/room-layout-design.md"
  - "./roblox-world/objects/info-board-featured-spots.md"
  - "./roblox-world/objects/info-board-specific-shops.md"
  - "./roblox-world/objects/workspace-hierarchy.md"
  - "./roblox-world/scripts/client/info-board/ShopBoard_PopUpController.lua"
description: "Virtual Tokyo Trip Planner プロジェクト全体のドキュメント構造・相対パス・各ファイルの役割を網羅したメインインデックス"
---

# Virtual Tokyo Trip Planner - Project Index

本プロジェクトにおける全ドキュメントの構造、依存関係（相対パス）、および各ファイルの役割をまとめたメインインデックスです。

---

## 📂 ディレクトリ構造とファイル一覧

    virtual-tokyo-trip-planner/
    ├─ README.md
    ├─ index.md (本ファイル)
    ├─ planning/
    │  ├─ presentation-schedule.md
    │  ├─ tokyo-trip-plan-2026.md
    │  └─ milestone-1-progress.md
    └─ roblox-world/
       ├─ assets/
       │  ├─ room-layout-diagram.svg
       │  └─ specific-spot-shop-boards-design.svg
       ├─ scripts/
       │  └─ client/
       │     └─ info-board/
       │        └─ ShopBoard_PopUpController.lua
       ├─ objects/
       │  ├─ info-board-featured-spots.md
       │  ├─ info-board-specific-shops.md
       │  └─ workspace-hierarchy.md
       ├─ object-deployment-plan.md
       └─ room-layout-design.md

---

## 📜 ドキュメント詳細とナビゲーション

### 1. プロジェクトルート (Root)

* **README.md** (`./README.md`)
  * **役割**: プロジェクトの概要、目的、リポジトリの基本情報を記述するメイン説明書。
* **index.md** (`./index.md`)
  * **役割**: 全ファイルの相互リンクと構造を管理するインデックスドキュメント。

---

### 2. 旅行計画 (`planning/`)

* **presentation-schedule.md** (`./planning/presentation-schedule.md`)
  * **役割**: プレゼンテーションのマイルストーン（8月末、9月末、10月中頃）に応じたRobloxオブジェクトおよび機能の開発スケジュール。
* **milestone-1-progress.md** (`./planning/milestone-1-progress.md`)
  * **役割**: Milestone 1（8月末の第一回プレゼンテーション）に向けた進捗管理票。
* **tokyo-trip-plan-2026.md** (`./planning/tokyo-trip-plan-2026.md`)
  * **役割**: 2026年の東京旅行計画（第1回・第2回）の基本日程、宿泊先、飲食店、観光スポット一覧。

---

### 3. Roblox ワールド設計 (`roblox-world/`)

* **assets/** (`./roblox-world/assets/`)
  * **役割**: ワールド設計に使用する図面・SVG 等の静的アセットを格納します。
  * **現在のアセット**:
    * `room-layout-diagram.svg` (`./roblox-world/assets/room-layout-diagram.svg`)
    * `specific-spot-shop-boards-design.svg` (`./roblox-world/assets/specific-spot-shop-boards-design.svg`)

* **scripts/** (`./roblox-world/scripts/`)
  * **役割**: Roblox 用の Lua スクリプトを格納するディレクトリ（クライアント/サーバ/モジュール別に整理）。
  * **追加されたスクリプト**:
    * `client/info-board/ShopBoard_PopUpController.lua` — StarterPlayerScripts に配置する LocalScript。ShopBoard の Center_Display_Surface に近づいたときに Popup を表示、離れたら非表示にするクライアント制御スクリプト（ファイル: `./roblox-world/scripts/client/info-board/ShopBoard_PopUpController.lua`）。

* **object-deployment-plan.md** (`./roblox-world/object-deployment-plan.md`)
  * **役割**: `tokyo-trip-plan-2026.md` の旅行計画をRoblox空間上のオブジェクト（案内板、3Dモデル、プロップ）へマッピング・配置する展開プラン。
  * **主要関連リンク**:
    * 旅行マスタープラン: `../planning/tokyo-trip-plan-2026.md`
    * 空間レイアウト設計: `./room-layout-design.md`
    * 主要観光スポット案内板: `./objects/info-board-featured-spots.md`
    * 飲食店・ショップ案内板: `./objects/info-board-specific-shops.md`

* **room-layout-design.md** (`./roblox-world/room-layout-design.md`)
  * **役割**: Robloxワールド空間全体（円形ルーム構造、スポーン地点、放射状ゾーン配置）の空間デザイン仕様書。
  * **主要関連リンク**:
    * 設計図面（アセット）: `./assets/room-layout-diagram.svg`
    * オブジェクト配置計画: `./object-deployment-plan.md`

* **objects/info-board-featured-spots.md** (`./roblox-world/objects/info-board-featured-spots.md`)
  * **役割**: 主要観光スポット（Featured Sightseeing Spots）専用案内板の3Dパーツ構造、材質・カラー定義、および SurfaceGui (1024x768) レイアウト仕様書。
  * **主要関連リンク**:
    * オブジェクト配置計画: `../object-deployment-plan.md`

* **objects/info-board-specific-shops.md** (`./roblox-world/objects/info-board-specific-shops.md`)
  * **役割**: 東京の飲食店・ショップ・レストラン等を紹介する案内板の3Dパーツ構造、材質・カラー定義、および SurfaceGui レイアウト仕様書。
  * **スクリプト連携**: `./roblox-world/scripts/client/info-board/ShopBoard_PopUpController.lua` により、プレイヤー接近時のポップアップ表示がクライアント側で制御されます。
  * **主要関連リンク**:
    * オブジェクト配置計画: `../object-deployment-plan.md`
    * 旅行マスタープラン: `../../planning/tokyo-trip-plan-2026.md`

* **objects/workspace-hierarchy.md** (`./roblox-world/objects/workspace-hierarchy.md`)
  * **役割**: Robloxワールド内の全オブジェクトのワークスペース階層構造、命名規約、パーツの親子関係（フォルダ分類）を定義したリファレンス。
  * **主要関連リンク**:
    * 主要観光スポット案内板: `./info-board-featured-spots.md`
    * 飲食店・ショップ案内板: `./info-board-specific-shops.md`

---

## 🔗 相対パス参照ルール（クイックリファレンス）

ドキュメント間で相互リンクや画像参照を行う際は、自身のファイル位置を基準に以下のルールでパスを記述します。

* **同じフォルダ内のファイルを参照する場合**: `./filename.md`
* **1つ上のフォルダに戻って参照する場合**: `../filename.md` または `../folder/filename.md`
* **ルート(`index.md`)から配下を参照する場合**: `./planning/...` や `./roblox-world/...`

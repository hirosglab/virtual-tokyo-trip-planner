---
title: "Milestone 1 (End of August) Progress Management Tracker"
type: "progress-tracker"
status: "in-progress"
tags:
  - progress-tracking
  - milestone-1
  - presentation-goals
  - roblox-development
links:
  - "./presentation-schedule.md"
  - "./tokyo-trip-plan-2026.md"
  - "../roblox-world/object-deployment-plan.md"
  - "../roblox-world/room-layout-design.md"
  - "../roblox-world/objects/info-board-featured-spots.md"
  - "../roblox-world/objects/workspace-hierarchy.md"
description: "8月末の第一回プレゼンテーション（シンガポール参加者向け）に向けたRobloxオブジェクト構築およびワールド基盤の進捗管理票"
---

# 🎯 Milestone 1 (8月末) 進捗管理票

本ドキュメントは、8月末に予定されている**「第一回プレゼンテーション（シンガポール参加者向け）」**に向けた開発進捗を管理するためのトラッカーです。

---

## 📊 全体進捗サマリー

| カテゴリー | タスク総数 | 完了 | 未着手 | 進捗率 |
| :--- | :---: | :---: | :---: | :---: |
| **Information Boards** | 27 | 13 | 14 | 48% |
| **World Environment** | 2 | 0 | 2 | 0% |
| **3D Objects & Props (Prototypes)** | 4 | 0 | 4 | 0% |
| **合計** | **33** | **13** | **20** | **39%** |

---

## 📋 詳細進捗タスクリスト

### 1. 🪧 Custom Information Boards (全面実装)

#### 1.1 Featured Sightseeing Spots Boards (全18箇所)
* **フォルダ**: `Workspace.Featured_Sightseeing_Spots_Boards`

| Status | Object Name | Location / Area | Spot Name |
| :---: | :--- | :--- | :--- |
| [x] | `InfoBoard_01_Kabukicho` | Shinjuku / 新宿 | Kabuki-cho / 歌舞伎町 |
| [x] | `InfoBoard_02_OmoideYokocho` | Shinjuku / 新宿 | Omoide-Yokocho Memory Lane / 思い出横丁 |
| [x] | `InfoBoard_03_ShinjukuEastExit` | Shinjuku / 新宿 | Shinjuku Station East Exit Area / 新宿駅東口エリア |
| [x] | `InfoBoard_04_TakeshitaStreet` | Harajuku / 原宿 | Takeshita Street / 竹下通り |
| [x] | `InfoBoard_05_MeijiJingu` | Harajuku / 原宿 | Meiji Jingu / 明治神宮 |
| [x] | `InfoBoard_06_OmotesandoAvenue` | Omotesando / 表参道 | Omotesando Avenue / 表参道 |
| [x] | `InfoBoard_07_ShibuyaSky` | Shibuya / 渋谷 | Shibuya Sky / 渋谷スカイ |
| [x] | `InfoBoard_08_ShibuyaCrossing` | Shibuya / 渋谷 | Shibuya Crossing / 渋谷スクランブル交差点 |
| [x] | `InfoBoard_09_ShibuyaCenterGai` | Shibuya / 渋谷 | Shibuya Center-Gai / 渋谷センター街 |
| [x] | `InfoBoard_10_TsukijiOuterMarket` | Tsukiji / 築地 | Tsukiji Outer Market / 築地場外市場 |
| [x] | `InfoBoard_11_GinzaStreet` | Ginza / 銀座 | Ginza Street / 銀座通り |
| [x] | `InfoBoard_12_AkihabaraElectricTown` | Akihabara / 秋葉原 | Akihabara Electric Town / 秋葉原電気街 |
| [x] | `InfoBoard_13_Sensoji` | Asakusa / 浅草 | Senso-ji Temple & Kaminarimon / 雷門 |
| [ ] | `InfoBoard_14_SumidaRiver` | Asakusa / 浅草 | Sumida River / 隅田川 |
| [ ] | `InfoBoard_15_TokyoStation` | Tokyo / 東京 | Tokyo Central Station / 東京駅 |
| [ ] | `InfoBoard_16_ImperialPalace` | Tokyo / 東京 | Tokyo Imperial Palace / 皇居 |
| [ ] | `InfoBoard_17_ShinbashiUnderpass` | Tokyo / 新橋 | Shinbashi Guard Underpass Alley / 新橋ガード下 |
| [ ] | `InfoBoard_18_AzabuArea` | Azabu / 麻布 | Azabu / 麻布 |

#### 1.2 Specific Spot & Shop Boards (全6箇所)
* **フォルダ**: `Workspace.Specific_Shop_Boards`

| Status | Object Name | Location / Area | Shop & Facility Name |
| :---: | :--- | :--- | :--- |
| [ ] | `ShopBoard_01_AnimateIkebukuro` | Ikebukuro / 池袋 | Animate Ikebukuro Main Store / アニメイト池袋本店 |
| [ ] | `ShopBoard_02_TeamLabBorderless` | Azabu / 麻布 | Mori Building Digital Art Museum (teamLab Borderless) / チームラボボーダレス |
| [ ] | `ShopBoard_03_DashiOkume` | Azabu / 麻布 | Dashi Okume / だし尾粂 |
| [ ] | `ShopBoard_04_MyPigCafe` | Harajuku / 原宿 | My Pig Cafe / 豚カフェ |
| [ ] | `ShopBoard_05_TokyoCharacterStreet` | Tokyo / 東京 | Tokyo Character Street / 東京キャラクターストリート |
| [ ] | `ShopBoard_06_AkihabaraRadioKaikan` | Akihabara / 秋葉原 | Akihabara Radio Kaikan / 秋葉原ラジオ会館 |

#### 1.3 Accommodations & Restaurants Boards

| Status | Board Type | Target Name | Notes |
| :---: | :--- | :--- | :--- |
| [ ] | Accommodations | Apa Hotel Shinjuku / アパホテル新宿 | 宿泊先案内ボード |
| [ ] | Restaurants | Teppanyaki 10 / 鉄板焼き10 | 飲食スポット案内ボード |
| [ ] | Restaurants | Tokyo Yakiniku Heijoen / 東京焼肉平城苑 | 飲食スポット案内ボード |

---

### 2. 🏛️ World Environment (基礎構築)

| Status | Task Item | Details / Specifications |
| :---: | :--- | :--- |
| [ ] | **部屋全体の外壁・床の設定** | `room-layout-design.md` に基づく円形ルーム・床パーツおよび外壁の配置 |
| [ ] | **スポーン地点の設定** | プレイヤー生成位置（SpawnLocation）の配置と調整 |

---

### 3. 📦 3D Objects & Props (試作プロトタイプ)

Milestone 1 ではプレゼン用の試作モデル（数点）を優先して作成・配置します。

#### 3.1 Iconic Major Landmarks (試作)
* **フォルダ**: `Workspace.Iconic_Major_Landmarks_Objects`

| Status | Object Name | Spot Name | Target Prototype |
| :---: | :--- | :--- | :--- |
| [ ] | `Landmark_01_KabukichoArch` | Kabuki-cho / 歌舞伎町 | 歌舞伎町ネオンアーチ（簡易モデリング） |
| [ ] | `Landmark_05_KaminarimonGate` | Senso-ji Temple / 浅草寺 | 雷門の大提灯・ゲート構造（簡易モデリング） |

#### 3.2 Small Prop & Detail Objects (試作)
* **フォルダ**: `Workspace.Small_Prop_Detail_Objects`

| Status | Category | Object Name | Target Prototype |
| :---: | :--- | :--- | :--- |
| [ ] | Foods & Drinks | `Prop_Food_FattyTunaSushi` | テーブル装飾用 寿司（トロ）プロップ |
| [ ] | Street Props | `Prop_Detail_PaperLantern` | 街並み演出用 提灯プロップ |

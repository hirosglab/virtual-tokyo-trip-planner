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
  - "../roblox-world/room-spatial-dimension-spec.md"
  - "../roblox-world/objects/info-board-featured-spots.md"
  - "../roblox-world/objects/workspace-hierarchy.md"
description: "8月末の第一回プレゼンテーション（シンガポール参加者向け）に向けたRobloxオブジェクト構築およびワールド基盤の進捗管理票"
---

# 🎯 Milestone 1 (8月末) 進捗管理票

本ドキュメントは、8月末に予定されている**「第一回プレゼンテーション（シンガポール参加者向け）」**に向けた開発進捗を管理するためのトラッカーである。

---

## 📊 全体進捗サマリー

| カテゴリー | タスク総数 | 完了 | 未着手 | 進捗率 |
| :--- | :---: | :---: | :---: | :---: |
| **Information Boards (Featured Sightseeing)** | 18 | 18 | 0 | 100% |
| **Information Boards (Specific Shops)** | 7 | 3 | 4 | 43% |
| **Information Boards (Accommodations)** | 2 | 0 | 2 | 0% |
| **World Environment (Floors & Spawn)** | 4 | 3 | 1 | 75% |
| **World Environment (Outer Walls)** | 12 | 0 | 12 | 0% |
| **3D Objects & Props (Prototypes)** | 4 | 0 | 4 | 0% |
| **合計** | **47** | **24** | **23** | **51%** |

---

## 📋 詳細進捗タスクリスト

### 1. 🪧 Custom Information Boards (全面実装)

#### 1.1 Featured Sightseeing Spots Boards (全18箇所) ✅ 100% 完了
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
| [x] | `InfoBoard_10_TokyoStation` | Tokyo / 東京 | Tokyo Central Station / 東京駅 |
| [x] | `InfoBoard_11_ImperialPalace` | Tokyo / 東京 | Tokyo Imperial Palace / 皇居 |
| [x] | `InfoBoard_12_ShinbashiUnderpass` | Tokyo / 新橋 | Shinbashi Guard Underpass Alley / 新橋ガード下 |
| [x] | `InfoBoard_13_TsukijiOuterMarket` | Tsukiji / 築地 | Tsukiji Outer Market / 築地場外市場 |
| [x] | `InfoBoard_14_GinzaStreet` | Ginza / 銀座 | Ginza Street / 銀座通り |
| [x] | `InfoBoard_15_AkihabaraElectricTown` | Akihabara / 秋葉原 | Akihabara Electric Town / 秋葉原電気街 |
| [x] | `InfoBoard_16_AzabuArea` | Azabu / 麻布 | Azabu / 麻布 |
| [x] | `InfoBoard_17_Sensoji` | Asakusa / 浅草 | Senso-ji Temple & Kaminarimon / 雷門 |
| [x] | `InfoBoard_18_SumidaRiver` | Asakusa / 浅草 | Sumida River / 隅田川 |

#### 1.2 Specific Spot & Shop Boards (全7箇所) 📌 43% 進捗
* **フォルダ**: `Workspace.Specific_Shop_Boards`

| Status | Object Name | Location / Area | Shop & Facility Name |
| :---: | :--- | :--- | :--- |
| [x] | `ShopBoard_01_Teppanyaki10` | Ginza / 銀座 | Teppanyaki 10 / 鉄板焼き10 |
| [x] | `ShopBoard_02_TeamLabBorderless` | Azabu / 麻布 | Mori Building Digital Art Museum (teamLab Borderless) / チームラボボーダレス |
| [x] | `ShopBoard_03_DashiOkume` | Azabu / 麻布 | Dashi Okume / だし尾粂 |
| [ ] | `ShopBoard_04_AnimateIkebukuro` | Ikebukuro / 池袋 | Animate Ikebukuro Main Store / アニメイト池袋本店 |
| [ ] | `ShopBoard_05_MyPigCafe` | Harajuku / 原宿 | My Pig Cafe / 豚カフェ |
| [ ] | `ShopBoard_06_TokyoCharacterStreet` | Tokyo / 東京 | Tokyo Character Street / 東京キャラクターストリート |
| [ ] | `ShopBoard_07_AkihabaraRadioKaikan` | Akihabara / 秋葉原 | Akihabara Radio Kaikan / 秋葉原ラジオ会館 |

> 備考: `ShopBoard_01_Teppanyaki10` はローカルのポップアップ制御（`roblox-world/scripts/client/info-board/ShopBoard_PopUpController.lua`）が実装済みで、案内板の表示・非表示アニメーションが動作することを確認しました。
> `ShopBoard_02_TeamLabBorderless` と `ShopBoard_03_DashiOkume` は配置・表示コンテンツの最終確認まで完了しています（表示やテクスチャ、リンク配置の検証済み）。

#### 1.3 Accommodations Boards 📌 0% 進捗

| Status | Board Type | Target Name | Notes |
| :---: | :--- | :--- | :--- |
| [ ] | Accommodations | Apa Hotel Shinjuku / アパホテル新宿 | 宿泊先案内ボード |
| [ ] | Accommodations | Hotel Monte Hermana Tokyo / ホテル モンテ エルマーナ東京 | 宿泊先案内ボード |

---

### 2. 🏛️ World Environment (基礎構築) 📌 19% 進捗

#### 2.1 Floor & Spawn Setup (床材・スポーン配置) ✅ 75% 進捗
* **フォルダ**: `Workspace.Floors`

| Status | Object Name | Zone / Role | Specification & Position |
| :---: | :--- | :--- | :--- |
| [x] | `ZoneA_Center_Floor` | ZONE A (エントリー) | `Size = (2.0, 50.0, 50.0)`, `Pos = (0, 1.0, 0)`, `Ori = (0, 0, 90)` |
| [x] | `ZoneB_Middle_Floor` | ZONE B (交流・ホテル) | `Size = (0.4, 130.0, 130.0)`, `Pos = (0, 0.2, 0)`, `Ori = (0, 0, 90)` |
| [x] | `ZoneC_Base_Floor` | ZONE C (メイン展示) | `Size = (0.2, 230.0, 230.0)`, `Pos = (0, 0.1, 0)`, `Ori = (0, 0, 90)` |
| [x] | `SpawnLocation` | スポーン地点 | ZONE A 中央内部隠蔽配置 `(0, 0.5, 0)` の位置・調整作業 |

#### 2.2 12-Sided Outer Wall Setup (12面体外壁構築) 📌 0% 進捗
* **フォルダ**: `Workspace.Walls` （設置予定）

##### 🔹 Main Walls (モノトーン大板 6枚)
| Status | Panel Name | Target Angle | Center Position $(X, Y, Z)$ | Rotation $(R_x, R_y, R_z)$ |
| :---: | :--- | :---: | :--- | :--- |
| [ ] | `MainWall_01` | `0°` (北) | `(0.00, 15.00, -120.00)` | `(0, 0, 0)` |
| [ ] | `MainWall_02` | `60°` | `(103.92, 15.00, -60.00)` | `(0, -60, 0)` |
| [ ] | `MainWall_03` | `120°` | `(103.92, 15.00, 60.00)` | `(0, -120, 0)` |
| [ ] | `MainWall_04` | `180°` (南) | `(0.00, 15.00, 120.00)` | `(0, 180, 0)` |
| [ ] | `MainWall_05` | `240°` | `(-103.92, 15.00, 60.00)` | `(0, 120, 0)` |
| [ ] | `MainWall_06` | `300°` | `(-103.92, 15.00, -60.00)` | `(0, 60, 0)` |

##### 🔸 Sub Walls (紅葉柄薄板 6枚)
| Status | Panel Name | Target Angle | Center Position $(X, Y, Z)$ | Rotation $(R_x, R_y, R_z)$ |
| :---: | :--- | :---: | :--- | :--- |
| [ ] | `SubWall_01` | `30°` | `(60.00, 15.00, -103.92)` | `(0, -30, 0)` |
| [ ] | `SubWall_02` | `90°` (東) | `(120.00, 15.00, 0.00)` | `(0, -90, 0)` |
| [ ] | `SubWall_03` | `150°` | `(60.00, 15.00, 103.92)` | `(0, -150, 0)` |
| [ ] | `SubWall_04` | `210°` | `(-60.00, 15.00, 103.92)` | `(0, 150, 0)` |
| [ ] | `SubWall_05` | `270°` (西) | `(-120.00, 15.00, 0.00)` | `(0, 90, 0)` |
| [ ] | `SubWall_06` | `330°` | `(-60.00, 15.00, -103.92)` | `(0, 30, 0)` |

---

### 3. 📦 3D Objects & Props (試作プロトタイプ) 📌 0% 進捗

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

---

## 📈 進捗ハイライト

✅ **Featured Sightseeing Spots Boards**: 全18箇所が完了し、第一回プレゼンテーションの中核となる情報ボード群が完成しました。

✅ **Specific Spot & Shop Boards**: `ShopBoard_01_Teppanyaki10` のポップアップ制御を実装・確認（`roblox-world/scripts/client/info-board/ShopBoard_PopUpController.lua`）。`ShopBoard_02_TeamLabBorderless` と `ShopBoard_03_DashiOkume` を作成・配置完了。

✅ **World Environment (Floors)**: `Workspace.Floors` フォルダを作成し、同心円状の3階層床パーツ（`ZoneA_Center_Floor`, `ZoneB_Middle_Floor`, `ZoneC_Base_Floor`）の寸法・トランスフォーム配置（`Orientation = (0, 0, 90)` による回転制御含む）を完了しました。

📌 **次のタスク優先順位**:
1. 12面体外壁（`Walls` フォルダ / 全12パネル）の配置構築
2. Specific Spot & Shop Boards の残り実装（ShopBoard_04〜07）
3. SpawnLocation の最終位置調整およびスポーン隠蔽の確認
4. 3D Objects & Props のプロトタイプ開発

最終更新: 2026-08-17

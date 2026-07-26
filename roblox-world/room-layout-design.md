---
title: "Roblox Room Layout & Spatial Design Spec"
type: "specification"
status: "approved"
tags:
  - roblox-architecture
  - spatial-design
  - level-design
links:
  - "./object-deployment-plan.md"
  - "./information-board.md"
  - "/assets/room-layout-diagram.svg"
description: "Robloxワールド空間全体（円形ルーム構造、スポーン地点、放射状ゾーン分割、ボード配置）のレイアウト設計書"
---

# Roblox Room Layout & Spatial Design Spec

## 📐 Room Layout Diagram
![Roblox Room Layout Diagram](../assets/room-layout-diagram.png)
*※ 設計図の元データ・編集は Google Draw 参照*

---

## 🏛️ Architecture & Layout
* **Room Shape:** Perfect Circular Room (放射状分割の円形構造).
* **Center Hub (中央スポーン領域):** 
  * `SpawnLocation` は中央の五角形/台形プラットフォーム `(0, y, 0)` に配置。
  * プレイヤーはスポーン直後に360度全方向のゾーンを見渡すことが可能。
  * 中央部には **Base Information Core**（宿泊施設・レストラン情報）を設置。
* **Perimeter & Zone Division (6大エリア分割):** 
  * 円形空間を中央から放射状に6つの主要エリア（扇形セクター）へ分割。
  * **1st Trip Hemisphere (前半ゾーン):** Shinjuku / Harajuku / Shibuya
  * **2nd Trip Hemisphere (後半ゾーン):** Tokyo / Asakusa / Ginza

---

## 🗺️ Spatial Board Placement & Flow
1. **Outer Wall Zone (最外周・外壁面):**
   * **Information Board (太線):** 円形の外壁に沿って大型の案内板（Featured Sightseeing Spots等）を湾曲・設置。
2. **Inner Zone (内側・セクター内部):**
   * **Shop Board (細線):** 各エリアのセクター内部に、通路を形成するように斜め・放射状に店舗/施設ボード（Specific Spot & Shop Boards）を並列配置。
3. **Spatial Flow (中央から外壁へ):**
   * **Center:** スポーン・全体概要把握 $\rightarrow$ **Mid-Radius:** 各エリアのShop Board閲覧 $\rightarrow$ **Perimeter:** 壁面のメインInformation Board到達。

---

## 🎨 Design & Aesthetics
* **Theme:** Modern Virtual Meeting Room / Cyber-Travel Museum.
* **Lighting:** エリアごとに雰囲気を際立たせるアンビエントライティングの設定。
* **Interactive Elements:** 
  * 各ボードおよびプロップは `Anchored = true` に設定。
  * *Future Expansion:* 中央スポーン付近に DataStore を活用した「意見書き込みチャットボックス」および「投票ボックス」を設置予定。

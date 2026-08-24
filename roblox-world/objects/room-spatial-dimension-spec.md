---
title: "Roblox Room Spatial Dimension & Object Placement Spec"
type: "specification"
status: "approved"
tags:
  - roblox-architecture
  - spatial-design
  - 3d-math-spec
  - level-design
links:
  - "./room-layout-design.md"
  - "./room-wall-design-spec.md"
  - "./objects/info-board-featured-spots.md"
  - "./objects/info-board-specific-shops.md"
description: "Roblox空間の3Dサイズ設計書（同心円シリンダーゾーン構造、最新外壁寸法・角度・位置計算、およびFeatured Spots案内板のトランスフォーム算出）"
---

# Roblox Room Spatial Dimension & Object Placement Spec

本ドキュメントは `room-layout-design.md` および最新の `room-wall-design-spec.md` をベースに、Robloxワールド内に各オブジェクトを正確かつゆとりをもって配置するためのサイズ・トランスフォーム計算結果を定義する。

---

## 📐 Overview & Spatial Scale Concept

* **基準プレイヤーサイズ:** 1 Avatar Height $\approx$ 5.0 studs
* **設計指針:** 大型案内板 (`Border` 12.0 × 9.0 studs) や空中浮遊Shop Board、大型ランドマークを複数配置してもプレイヤーが窮屈に感じないよう、十分な歩行径および視認距離を確保する。
* **ゾーン構造:** ZONE C を底面とし、その上に ZONE B、最上部に厚みを持たせた ZONE A を重ねる階層構造（Cylinder Partの `Orientation = (0, 0, 90)` または Roblox standard Cylinder 配置）。

---

## 🏛️ Cylinder Zones Dimensions (ZONE A, B, C)

ZONE A・B・C は円盤状シリンダーパーツを垂直方向に重ねて構築する。

| Zone | 半径 ($R$) | 直径 ($D$) | 厚み (Y軸 Size) | 配置中心座標 $(X, Y, Z)$ | 役割・空間的余裕 |
| :--- | :--- | :--- | :--- | :--- | :--- |
| **ZONE A** | `25.0 studs` | `50.0 studs` | `2.0 studs` | `(0.00, 1.00, 0.00)` | スポーン＆全体把握。厚みをつけて一段高いプラットフォームに設定。 |
| **ZONE B** | `65.0 studs` | `130.0 studs` | `0.4 studs` | `(0.00, 0.20, 0.00)` | 交流・ホテルボード・意見箱・投票BOX・ランドマークゲート用の中間層。 |
| **ZONE C** | `115.0 studs`| `230.0 studs`| `0.2 studs` | `(0.00, 0.10, 0.00)` | メイン展示層。外壁案内板、浮遊Shop Board、空中プロップをゆとりをもって配置。 |

> 💡 **高さの重なり (Stacking)**:
> ZONE C の上面は $Y = 0.2$。ZONE B は $Y = 0.0 \sim 0.4$ （上面 $Y = 0.4$）。ZONE A は $Y = 0.0 \sim 2.0$ （上面 $Y = 2.0$）となり、中央へ向かうほどステージ状に高くなる。

---

## 🛑 Outer Wall Dimensions & Seamless Transform

外壁は幅広のメイン壁面（MainWall: 幅 76.0 studs / 半径 $R=107.0\text{ studs}$）と、アクセント壁面（SubWall: 幅 41.2 studs）を交互に連結し、12角形外壁の隙間を完全に埋める（Gapless Joint）幾何計算に基づいて配置する。

### Wall Specifications
* **Main Wall (6枚 / 木目調展示大板):** 幅 `76.0 studs`, 高さ `30.0 studs`, 厚み `2.0 studs`
* **Sub Wall (6枚 / 青地紅葉・銀杏柄壁紙アクセント):** 幅 `41.2 studs`, 高さ `30.0 studs`, 厚み `1.0 studs`

### 12 Wall Panels Placement Table

| Panel Name | 面の種類 | 角度 ($\theta$) | Size $(X, Y, Z)$ | Center Position $(X, Y, Z)$ | Orientation $(R_x, R_y, R_z)$ |
| :--- | :--- | :---: | :--- | :--- | :--- |
| **MainWall_01** | メイン (Wood) | `0°` (北) | `2.0, 30.0, 76.0` | `(0.00, 15.00, -107.00)` | `(0, 90, 0)` |
| **SubWall_01** | サブ (壁紙Decal) | `30°` | `1.0, 30.0, 41.2` | `(55.83, 15.00, -96.70)` | `(0, 60, 0)` |
| **MainWall_02** | メイン (Wood) | `60°` | `2.0, 30.0, 76.0` | `(92.66, 15.00, -53.50)` | `(0, 30, 0)` |
| **SubWall_02** | サブ (壁紙Decal) | `90°` (東) | `1.0, 30.0, 41.2` | `(111.66, 15.00, 0.00)` | `(0, 0, 0)` |
| **MainWall_03** | メイン (Wood) | `120°` | `2.0, 30.0, 76.0` | `(92.66, 15.00, 53.50)` | `(0, -30, 0)` |
| **SubWall_03** | サブ (壁紙Decal) | `150°` | `1.0, 30.0, 41.2` | `(55.83, 15.00, 96.70)` | `(0, -60, 0)` |
| **MainWall_04** | メイン (Wood) | `180°` (南) | `2.0, 30.0, 76.0` | `(0.00, 15.00, 107.00)` | `(0, -90, 0)` |
| **SubWall_04** | サブ (壁紙Decal) | `210°` | `1.0, 30.0, 41.2` | `(-55.83, 15.00, 96.70)` | `(0, -120, 0)` |
| **MainWall_05** | メイン (Wood) | `240°` | `2.0, 30.0, 76.0` | `(-92.66, 15.00, 53.50)` | `(0, -150, 0)` |
| **SubWall_05** | サブ (壁紙Decal) | `270°` (西) | `1.0, 30.0, 41.2` | `(-111.66, 15.00, 0.00)` | `(0, 180, 0)` |
| **MainWall_06** | メイン (Wood) | `300°` | `2.0, 30.0, 76.0` | `(-92.66, 15.00, -53.50)` | `(0, 150, 0)` |
| **SubWall_06** | サブ (壁紙Decal) | `330°` | `1.0, 30.0, 41.2` | `(-55.83, 15.00, -96.70)` | `(0, 120, 0)` |

---

## 🖼️ Featured Sightseeing Spots Boards Placement

6枚の広幅 MainWall の内面（壁面厚みを考慮した半径 $R_{board} = 105.0\text{ studs}$）に配置する `info-board-featured-spots.md` 案内板の正確な配置計算結果。
プレイヤーの目線の高さ（地上 $Y = 0.2$ から目線 $Y \approx 5.5$）に合わせて中心高さを設定する。

### Board Specifications & Placement Standard
* **Board Size:** `12.0, 9.0, 0.4 studs`
* **Placement Height (Y):** `Y = 7.00 studs` （ボード中心高さ。プレイヤー目線から見上げる位置）
* **Placement Radius:** `R = 105.00 studs` （MainWall中心 $R=107.0$ の内側 `2.0 studs` 手前）
* **Orientation:** 内側（中心 `(0, 0, 0)`）を向くように配置設定。

### 6 Area Featured Boards Position Table

| Area Name | 対象壁面 | 角度 ($\theta$) | Board Position $(X, Y, Z)$ | Board Rotation $(R_x, R_y, R_z)$ |
| :--- | :--- | :---: | :--- | :--- |
| **Shinjuku** | MainWall_01 (北) | `0°` | `(0.00, 7.00, -105.00)` | `(0, 180, 0)` |
| **Shibuya** | MainWall_02 (北東) | `60°` | `(90.93, 7.00, -52.50)` | `(0, -120, 0)` |
| **Tokyo** | MainWall_03 (南東) | `120°` | `(90.93, 7.00, 52.50)` | `(0, -60, 0)` |
| **Ginza** | MainWall_04 (南) | `180°` | `(0.00, 7.00, 105.00)` | `(0, 0, 0)` |
| **Asakusa** | MainWall_05 (南西) | `240°` | `(-90.93, 7.00, 52.50)` | `(0, 60, 0)` |
| **Harajuku** | MainWall_06 (北西) | `300°` | `(-90.93, 7.00, -52.50)` | `(0, 120, 0)` |

---

## 🛍️ Specific Spot & Shop Boards (Note)

* `info-board-specific-shops.md`（両面シリンダーボード）は、ZONE C の中間領域（半径 $R = 75.0 \sim 95.0\text{ studs}$）の空中に自由配置する。
* 各エリアのセクター内に放射状・通路状に配置するため、固定座標計算からは除外する。
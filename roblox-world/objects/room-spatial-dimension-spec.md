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
  - "./objects/info-board-featured-spots.md"
  - "./objects/info-board-specific-shops.md"
description: "Roblox空間の3Dサイズ設計書（同心円シリンダーゾーン構造、12面体外壁寸法・角度・位置計算、およびFeatured Spots案内板のトランスフォーム算出）"
---

# Roblox Room Spatial Dimension & Object Placement Spec

本ドキュメントは `room-layout-design.md` をベースに、Robloxワールド内に各オブジェクトを正確かつゆとりをもって配置するためのサイズ・トランスフォーム計算結果を定義する。

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

## 🛑 12-Sided Outer Wall Dimensions & Transform

外壁は半径 $R_{wall} = 120.0\text{ studs}$ の正12角形（12面体）として構築する。
各壁面パーツの中央位置（Center Position）および回転角度（Y-Axis Rotation）は以下の計算に基づいて算出される。

### Wall Specifications
* **メインウォール (6枚 / モノトーン大板):** 幅 `64.0 studs`, 高さ `30.0 studs`, 厚み `2.0 studs`
* **サブウォール (6枚 / 薄板・紅葉柄):** 幅 `64.0 studs`, 高さ `30.0 studs`, 厚み `1.0 studs`
* **アスペクト比・外周配置:** 12角形の1辺の長さ $L = 2 \times 120 \times \tan(15^\circ) \approx 64.31\text{ studs}$ に合わせ、幅を `64.0 studs` に設定。

### 12 Wall Panels Placement Table

| Panel No. | 面の種類 | 角度 ($\theta$) | Center Position $(X, Y, Z)$ | Rotation $(R_x, R_y, R_z)$ |
| :--- | :--- | :--- | :--- | :--- |
| **Wall 1** | メイン (モノトーン) | `0°` (北) | `(0.00, 15.00, -120.00)` | `(0, 0, 0)` |
| **Wall 2** | サブ (紅葉柄) | `30°` | `(60.00, 15.00, -103.92)` | `(0, -30, 0)` |
| **Wall 3** | メイン (モノトーン) | `60°` | `(103.92, 15.00, -60.00)` | `(0, -60, 0)` |
| **Wall 4** | サブ (紅葉柄) | `90°` (東) | `(120.00, 15.00, 0.00)` | `(0, -90, 0)` |
| **Wall 5** | メイン (モノトーン) | `120°` | `(103.92, 15.00, 60.00)` | `(0, -120, 0)` |
| **Wall 6** | サブ (紅葉柄) | `150°` | `(60.00, 15.00, 103.92)` | `(0, -150, 0)` |
| **Wall 7** | メイン (モノトーン) | `180°` (南) | `(0.00, 15.00, 120.00)` | `(0, 180, 0)` |
| **Wall 8** | サブ (紅葉柄) | `210°` | `(-60.00, 15.00, 103.92)` | `(0, 150, 0)` |
| **Wall 9** | メイン (モノトーン) | `240°` | `(-103.92, 15.00, 60.00)` | `(0, 120, 0)` |
| **Wall 10** | サブ (紅葉柄) | `270°` (西) | `(-120.00, 15.00, 0.00)` | `(0, 90, 0)` |
| **Wall 11** | メイン (モノトーン) | `300°` | `(-103.92, 15.00, -60.00)` | `(0, 60, 0)` |
| **Wall 12** | サブ (紅葉柄) | `330°` | `(-60.00, 15.00, -103.92)` | `(0, 30, 0)` |

---

## 🖼️ Featured Sightseeing Spots Boards Placement

外壁内面（半径 $R_{board} = 118.0\text{ studs}$）に沿って並べる `info-board-featured-spots.md` 案内板の配置計算結果。
プレイヤーの目線の高さ（地上 $Y = 0.2$ から目線 $Y \approx 5.5$）に合わせて中心高さを設定。

### Board Specifications & Placement Standard
* **Board Size:** `12.0, 9.0, 0.4 studs`
* **Placement Height (Y):** `Y = 7.00 studs` （ボード中心高さ。プレイヤー目線から見上げる位置）
* **Placement Radius:** `R = 118.00 studs` （壁面 $R=120$ の内側 `2.0 studs` 手前）
* **Orientation:** 内側（中心 `(0, 0, 0)`）を向くように壁面回転角に $+180^\circ$ を加算。

### 6 Area Featured Boards Position Table

| Area Name | 対象壁面 | 角度 ($\theta$) | Board Position $(X, Y, Z)$ | Board Rotation $(R_x, R_y, R_z)$ |
| :--- | :--- | :--- | :--- | :--- |
| **Shinjuku** | Wall 1 (北) | `0°` | `(0.00, 7.00, -118.00)` | `(0, 180, 0)` |
| **Shibuya** | Wall 3 (北東) | `60°` | `(102.19, 7.00, -59.00)` | `(0, -120, 0)` |
| **Tokyo** | Wall 5 (南東) | `120°` | `(102.19, 7.00, 59.00)` | `(0, -60, 0)` |
| **Ginza** | Wall 7 (南) | `180°` | `(0.00, 7.00, 118.00)` | `(0, 0, 0)` |
| **Asakusa** | Wall 9 (南西) | `240°` | `(-102.19, 7.00, 59.00)` | `(0, 60, 0)` |
| **Harajuku** | Wall 11 (北西) | `300°` | `(-102.19, 7.00, -59.00)` | `(0, 120, 0)` |

---

## 🛍️ Specific Spot & Shop Boards (Note)

* `info-board-specific-shops.md`（両面シリンダーボード）は、ZONE C の中間領域（半径 $R = 75.0 \sim 105.0\text{ studs}$）の空中に自由配置する。
* 各エリアのセクター内に放射状・通路状に配置するため、固定座標計算からは除外する。

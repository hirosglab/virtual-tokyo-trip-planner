---
title: "Roblox Room Wall Design Spec"
type: "specification"
status: "approved"
tags:
  - roblox-architecture
  - spatial-design
  - wall-design
  - level-design
links:
  - "./room-layout-design.md"
  - "./room-spatial-dimension-spec.md"
  - "./room-floor-design-spec.md"
  - "./objects/info-board-featured-spots.md"
  - "./objects/workspace-hierarchy.md"
description: "メインウォール拡幅（76 studs）およびサブウォール幅狭アクセント化（36 studs）に伴う寸法・トランスフォーム再計算・カラー仕様書"
---

# Roblox Room Wall Hardware & Spatial Design Spec

本ドキュメントは、メイン展示壁面（MainWall）の空間占有率を高めつつ、紅葉柄のサブウォール（SubWall）をすっきりとしたアクセントパネルとして機能させるための寸法変更・再計算結果を定義する。

---

## 📐 Dimension Ratio & Clearance Logic

* **MainWall (メイン壁面):** 幅 `76.0 studs`（案内板や大型コンテンツがゆとりをもって設置できるメイン面）
* **SubWall (アクセント壁面):** 幅 `36.0 studs`（紅葉デカールをあしらうスタイリッシュなアクセント面）
* **配置中心半径 ($R_{center}$):** `107.0 studs`
  幅広化に伴い、MainWallの両端（角部分）が床（半径 $115.0\text{ studs}$）から出ないよう配置半径を調整。
  $$\text{Corner Radius} = \sqrt{107.0^2 + (76.0 / 2)^2} = \sqrt{11449 + 1444} \approx 113.55\text{ studs} \le 115.0\text{ studs}$$

---

## 🏗️ Wall 3D Part Hierarchy & Spatial Structure

外壁は `Workspace.Walls` の配下にサブフォルダ（`MainWalls` / `SubWalls`）を挟まず、全パーツ（`MainWall_01`〜`06` および `SubWall_01`〜`06`）をフラットに配置して構成する。

    Workspace
    └── 🏛️ Walls
        ├── 🪵 MainWall_01 (Part)  --> Size: 2.0, 30.0, 76.0 (0° / 北)
        ├── 🪵 MainWall_02 (Part)  --> Size: 2.0, 30.0, 76.0 (60°)
        ├── 🪵 MainWall_03 (Part)  --> Size: 2.0, 30.0, 76.0 (120°)
        ├── 🪵 MainWall_04 (Part)  --> Size: 2.0, 30.0, 76.0 (180° / 南)
        ├── 🪵 MainWall_05 (Part)  --> Size: 2.0, 30.0, 76.0 (240°)
        ├── 🪵 MainWall_06 (Part)  --> Size: 2.0, 30.0, 76.0 (300°)
        │
        ├── 🍁 SubWall_01 (Part)   --> Size: 1.0, 30.0, 36.0 (30°)
        │   └── 🖼️ Decal_AutumnLeaves (Decal / Inner Surface)
        ├── 🍁 SubWall_02 (Part)   --> Size: 1.0, 30.0, 36.0 (90° / 東)
        │   └── 🖼️ Decal_AutumnLeaves (Decal / Inner Surface)
        ├── 🍁 SubWall_03 (Part)   --> Size: 1.0, 30.0, 36.0 (150°)
        │   └── 🖼️ Decal_AutumnLeaves (Decal / Inner Surface)
        ├── 🍁 SubWall_04 (Part)   --> Size: 1.0, 30.0, 36.0 (210°)
        │   └── 🖼️ Decal_AutumnLeaves (Decal / Inner Surface)
        ├── 🍁 SubWall_05 (Part)   --> Size: 1.0, 30.0, 36.0 (270° / 西)
        │   └── 🖼️ Decal_AutumnLeaves (Decal / Inner Surface)
        └── 🍁 SubWall_06 (Part)   --> Size: 1.0, 30.0, 36.0 (330°)
            └── 🖼️ Decal_AutumnLeaves (Decal / Inner Surface)

---

## 🎨 Material & Color Specifications

| Wall Category | Material | Color (RGB) | Surface Color Name | Dimensions (Size Z) | Design Rationale & Visual Effect |
| :--- | :--- | :--- | :--- | :--- | :--- |
| **Main Walls (6枚)** | `Wood` | `[170, 114, 0]` | Light Natural Oak | **`76.0 studs`** (幅広) | 横幅を広く取り、情報掲示板や各種グラフィックを余裕をもって展開できるプライマリ展示壁。 |
| **Sub Walls (6枚)** | `Wood` | `[185, 125, 75]` | Warm Teak | **`36.0 studs`** (幅狭) | 内面に紅葉デカールを貼付。メイン壁面の間に挟まるスリムなアクセント柱として空間を引き締める。 |

---

## 📐 Recalculated Wall Transform Summary

全12枚のトランスフォーム（Size / Position / Orientation）設定値。

### 🔹 Main Walls (幅広メイン壁 6枚)

| Panel Name | Angle ($\theta$) | Size $(X, Y, Z)$ | Center Position $(X, Y, Z)$ | Orientation $(R_x, R_y, R_z)$ | Sector / Board |
| :--- | :---: | :--- | :--- | :--- | :--- |
| **MainWall_01** | `0°` (北) | `2.0, 30.0, 76.0` | `(0.00, 15.00, -107.00)` | `(0, 90, 0)` | Shinjuku Board |
| **MainWall_02** | `60°` | `2.0, 30.0, 76.0` | `(92.66, 15.00, -53.50)` | `(0, 30, 0)` | Shibuya Board |
| **MainWall_03** | `120°` | `2.0, 30.0, 76.0` | `(92.66, 15.00, 53.50)` | `(0, -30, 0)` | Tokyo Board |
| **MainWall_04** | `180°` (南) | `2.0, 30.0, 76.0` | `(0.00, 15.00, 107.00)` | `(0, -90, 0)` | Ginza Board |
| **MainWall_05** | `240°` | `2.0, 30.0, 76.0` | `(-92.66, 15.00, 53.50)` | `(0, -150, 0)` | Asakusa Board |
| **MainWall_06** | `300°` | `2.0, 30.0, 76.0` | `(-92.66, 15.00, -53.50)` | `(0, 150, 0)` | Harajuku Board |

### 🔸 Sub Walls (幅狭アクセント壁 6枚)

| Panel Name | Angle ($\theta$) | Size $(X, Y, Z)$ | Center Position $(X, Y, Z)$ | Orientation $(R_x, R_y, R_z)$ | Theme / Decal Status |
| :--- | :---: | :--- | :--- | :--- | :--- |
| **SubWall_01** | `30°` | `1.0, 30.0, 36.0` | `(53.50, 15.00, -92.66)` | `(0, 60, 0)` | Autumn Red Decal (内面) |
| **SubWall_02** | `90°` (東) | `1.0, 30.0, 36.0` | `(107.00, 15.00, 0.00)` | `(0, 0, 0)` | Autumn Red Decal (内面) |
| **SubWall_03** | `150°` | `1.0, 30.0, 36.0` | `(53.50, 15.00, 92.66)` | `(0, -60, 0)` | Autumn Red Decal (内面) |
| **SubWall_04** | `210°` | `1.0, 30.0, 36.0` | `(-53.50, 15.00, 92.66)` | `(0, -120, 0)` | Autumn Red Decal (内面) |
| **SubWall_05** | `270°` (西) | `1.0, 30.0, 36.0` | `(-107.00, 15.00, 0.00)` | `(0, 180, 0)` | Autumn Red Decal (内面) |
| **SubWall_06** | `330°` | `1.0, 30.0, 36.0` | `(-53.50, 15.00, -92.66)` | `(0, 120, 0)` | Autumn Red Decal (内面) |

---

## 🧭 Spatial Visual Layout (Wide Main vs Narrow Sub)

    ===================================================================================
                       [ZoneC_Base_Floor Radius = 115.0 studs Boundary]
                                                │
                 [═════════ MainWall_01 (0°: Size Z=76.0, Pos=(0, 15, -107)) ═════════]
             (330°) [SubWall_06 (36.0)]         │               [SubWall_01 (36.0)] (30°)
                    🍁                          │                       🍁
        [MainWall_06 (76.0: Harajuku)]          │           [MainWall_02 (76.0: Shibuya)]
                                                │
    (270°) [SubWall_05] 🍁 ────────────────── (0,0) ────────────────── 🍁 [SubWall_02] (90°)
                                                │
        [MainWall_05 (76.0: Asakusa)]           │           [MainWall_03 (76.0: Tokyo)]
             (210°) [SubWall_04 (36.0)]         │               [SubWall_03 (36.0)] (150°)
                    🍁                          │                       🍁
                 [═════════ MainWall_04 (180°: Size Z=76.0, Pos=(0, 15, 107)) ═════════]
                                                │
                       [ZoneC_Base_Floor Radius = 115.0 studs Boundary]
    ===================================================================================

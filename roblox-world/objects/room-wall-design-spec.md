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
description: "メインウォール拡幅（76 studs）、隙間ゼロ接合仕様（SubWall: 41.2 studs）、および和風紅葉・銀杏壁紙デカール仕様に伴う正確なトランスフォーム仕様書"
---

# Roblox Room Wall Hardware & Spatial Design Spec

本ドキュメントは、幅広に設定されたメイン展示壁面（MainWall）の端と、青地に赤・黄の紅葉・銀杏柄の壁紙（Decal）を貼り付けるアクセント用サブウォール（SubWall）の端を隙間なく（Gapless）ピッタリ接合するためのトランスフォーム座標再計算結果およびグラフィック仕様を定義する。

---

## 📐 Dimension Ratio & Seamless Clearance Logic

* **MainWall (メイン壁面):** 幅 `76.0 studs` / 厚み `2.0 studs`
* **SubWall (アクセント壁面):** 幅 **`41.2 studs`**（隙間なく接合するための必要サイズ） / 厚み `1.0 studs`
* **配置計算ロジック:** 
  MainWall（半径 $R=107.0\text{ studs}$）の端点（$X=38.00, Z=-107.00$）と、隣り合う MainWall の端点（$X=73.66, Z=-86.41$）の中間地点（$X=55.83, Z=-96.70$）に SubWall の中心を配置することで、12角形外壁の隙間を完全に埋める。

---

## 🏗️ Wall 3D Part Hierarchy & Spatial Structure

外壁は `Workspace.Walls` の配下にサブフォルダ（`MainWalls` / `SubWalls`）を挟まず、全パーツ（`MainWall_01`〜`06` および `SubWall_01`〜`06`）をフラットに配置して構成する。`SubWall` には info-board と同様にイメージ画像を Decal として内面（Inner Surface）に貼付する。

    Workspace
    └── 🏛️ Walls
        ├── 🪵 MainWall_01 (Part)  --> Size: 2.0, 30.0, 76.0 (0° / 北)
        ├── 🪵 MainWall_02 (Part)  --> Size: 2.0, 30.0, 76.0 (60°)
        ├── 🪵 MainWall_03 (Part)  --> Size: 2.0, 30.0, 76.0 (120°)
        ├── 🪵 MainWall_04 (Part)  --> Size: 2.0, 30.0, 76.0 (180° / 南)
        ├── 🪵 MainWall_05 (Part)  --> Size: 2.0, 30.0, 76.0 (240°)
        ├── 🪵 MainWall_06 (Part)  --> Size: 2.0, 30.0, 76.0 (300°)
        │
        ├── 🍁 SubWall_01 (Part)   --> Size: 1.0, 30.0, 41.2 (30°)
        │   └── 🖼️ Decal_AutumnBlueWallpaper (Decal / Face: Front or Back)
        ├── 🍁 SubWall_02 (Part)   --> Size: 1.0, 30.0, 41.2 (90° / 東)
        │   └── 🖼️ Decal_AutumnBlueWallpaper (Decal / Face: Front or Back)
        ├── 🍁 SubWall_03 (Part)   --> Size: 1.0, 30.0, 41.2 (150°)
        │   └── 🖼️ Decal_AutumnBlueWallpaper (Decal / Face: Front or Back)
        ├── 🍁 SubWall_04 (Part)   --> Size: 1.0, 30.0, 41.2 (210°)
        │   └── 🖼️ Decal_AutumnBlueWallpaper (Decal / Face: Front or Back)
        ├── 🍁 SubWall_05 (Part)   --> Size: 1.0, 30.0, 41.2 (270° / 西)
        │   └── 🖼️ Decal_AutumnBlueWallpaper (Decal / Face: Front or Back)
        └── 🍁 SubWall_06 (Part)   --> Size: 1.0, 30.0, 41.2 (330°)
            └── 🖼️ Decal_AutumnBlueWallpaper (Decal / Face: Front or Back)

---

## 🎨 Material & Color Specifications

| Wall Category | Material | Color (RGB) | Surface Color / Decal Spec | Dimensions (Size Z) | Design Rationale & Visual Effect |
| :--- | :--- | :--- | :--- | :--- | :--- |
| **Main Walls (6枚)** | `Wood` | `[170, 114, 0]` | Light Natural Oak | **`76.0 studs`** (幅広) | 横幅を広く取り、情報掲示板（info-board）や各種グラフィックを余裕をもって展開できるプライマリ展示壁。 |
| **Sub Walls (6枚)** | `SmoothPlastic` | `[255, 255, 255]` | **Blue Autumn Leaf Wallpaper** (Decal貼付) | **`41.2 studs`** (隙間ゼロ) | 藍色・青地をベースに赤や黄色の紅葉・銀杏が散りばめられた和風モダン壁紙画像を内面に適用。空間を引き締める鮮やかなアクセント面。 |

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

### 🔸 Sub Walls (隙間ゼロ接合壁紙アクセント壁 6枚)

| Panel Name | Angle ($\theta$) | Size $(X, Y, Z)$ | Center Position $(X, Y, Z)$ | Orientation $(R_x, R_y, R_z)$ | Theme / Decal Asset |
| :--- | :---: | :--- | :--- | :--- | :--- |
| **SubWall_01** | `30°` | `1.0, 30.0, 41.2` | `(55.83, 15.00, -96.70)` | `(0, 60, 0)` | 青地・紅葉/銀杏柄 Decal (内面) |
| **SubWall_02** | `90°` (東) | `1.0, 30.0, 41.2` | `(111.66, 15.00, 0.00)` | `(0, 0, 0)` | 青地・紅葉/銀杏柄 Decal (内面) |
| **SubWall_03** | `150°` | `1.0, 30.0, 41.2` | `(55.83, 15.00, 96.70)` | `(0, -60, 0)` | 青地・紅葉/銀杏柄 Decal (内面) |
| **SubWall_04** | `210°` | `1.0, 30.0, 41.2` | `(-55.83, 15.00, 96.70)` | `(0, -120, 0)` | 青地・紅葉/銀杏柄 Decal (内面) |
| **SubWall_05** | `270°` (西) | `1.0, 30.0, 41.2` | `(-111.66, 15.00, 0.00)` | `(0, 180, 0)` | 青地・紅葉/銀杏柄 Decal (内面) |
| **SubWall_06** | `330°` | `1.0, 30.0, 41.2` | `(-55.83, 15.00, -96.70)` | `(0, 120, 0)` | 青地・紅葉/銀杏柄 Decal (内面) |

---

## 🧭 Spatial Visual Layout (Gapless Seamless Joint & Wallpaper Accent)

    ===================================================================================
                       [ZoneC_Base_Floor Radius = 115.0 studs Boundary]
                                                │
                 [═════════ MainWall_01 (0°: Size Z=76.0, Pos=(0, 15, -107)) ═════════]
             (330°) [SubWall_06 (41.2)]         │               [SubWall_01 (41.2)] (30°)
                    🍁(青地・紅葉銀杏)           │               🍁(青地・紅葉銀杏)
        [MainWall_06 (76.0: Harajuku)]          │           [MainWall_02 (76.0: Shibuya)]
                                                │
    (270°) [SubWall_05] 🍁 ────────────────── (0,0) ────────────────── 🍁 [SubWall_02] (90°)
       (青地・紅葉銀杏)                          │                          (青地・紅葉銀杏)
        [MainWall_05 (76.0: Asakusa)]           │           [MainWall_03 (76.0: Tokyo)]
             (210°) [SubWall_04 (41.2)]         │               [SubWall_03 (41.2)] (150°)
                    🍁(青地・紅葉銀杏)           │               🍁(青地・紅葉銀杏)
                 [═════════ MainWall_04 (180°: Size Z=76.0, Pos=(0, 15, 107)) ═════════]
                                                │
                       [ZoneC_Base_Floor Radius = 115.0 studs Boundary]
    ===================================================================================

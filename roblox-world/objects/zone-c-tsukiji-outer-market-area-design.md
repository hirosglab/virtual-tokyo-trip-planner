---
title: "Roblox Zone C Tsukiji Outer Market Area Design Spec"
type: "specification-zone-c-tsukiji"
status: "approved"
tags:
  - roblox-spatial-design
  - zone-c
  - tsukiji-outer-market
  - info-board-13
  - 3d-object-placement
links:
  - "../index.md"
  - "../object-deployment-plan.md"
  - "./room-spatial-dimension-spec.md"
  - "./info-board-featured-spots.md"
  - "./info-board-specific-shops.md"
  - "./workspace-hierarchy.md"
description: "Zone C の InfoBoard_13_TsukijiOuterMarket 前地区における立体空間レイアウト、案内板立面・平面仕様、および寿司プロップ等の3D配置トランスフォーム仕様書"
---

# Roblox Zone C Tsukiji Outer Market Area Design Spec

本ドキュメントは `room-spatial-dimension-spec.md` および `info-board-featured-spots.md` に基づき、Zone C の MainWall_04（南側）に位置する **InfoBoard_13_TsukijiOuterMarket** 前地区の立体空間デザイン、立面・平面レイアウト仕様、ならびに周辺に配置する3Dフードプロップ（寿司オブジェクト等）の配置トランスフォームを定義する。

---

## 🏛️ Area Overview & Spatial Concept

InfoBoard_13_TsukijiOuterMarket 前地区は、築地場外市場の活気ある海鮮・寿司カルチャーを体験・視認できる Zone C の主要展示エリアである。
壁面に備え付けられた主要観光案内板（InfoBoard_13）を中心に、前面の Zone C 床面（Y = 0.2 studs）上に立体的なフードプロップ（トロ、タマゴ、サーモンの各種寿司 3D Model）を展開し、プレイヤーが接近した際の没入感を高める設計とする。

---

## 📐 Elevation & Plan Layout Specifications

本エリアの立面および平面の構成・寸法仕様は、アセットとして管理されている以下の SVG 設計図面に準拠する。

### 1. 立面仕様 (Elevation Spec)
* **参照アセット**: `tsukiji-outer-market-elevation-spec.svg` (`./roblox-world/assets/tsukiji-outer-market-elevation-spec.svg`)
  ![Roblox Tsukiji Outer Market Elevation Diagram](../assets/tsukiji-outer-market-elevation-spec.svg)
* **主要構造**:
  * **MainWall_04**: 高さ 30.0 studs / 厚み 2.0 studs / 木目調仕上げ
  * **InfoBoard_13_TsukijiOuterMarket**: 
    * Wall Mount 中心高さ: `Y = 7.00 studs`
    * Size: `12.0, 9.0, 0.4 studs`
    * 表面 Display_Surface (SurfaceGui 1024x768): 左側エリア解説文 / 右側場外市場ビジュアル画像
  * **Floor Placement Level**: Zone C 床面 Top Elevation `Y = 0.20 studs` （プロップの設置基準面: `Y = 4.00 studs`）

### 2. 平面仕様 (Plan Spec)
* **参照アセット**: `tsukiji-outer-market-plan-spec.svg` (`./roblox-world/assets/tsukiji-outer-market-plan-spec.svg`)
![Roblox Tsukiji Outer Market Plan Diagram](../assets/tsukiji-outer-market-plan-spec.svg)
* **レイアウト軸**:
  * MainWall_04 壁面位置: `Z = 107.00 studs`
  * InfoBoard_13 配置位置: `X = 22.00 studs`, `Z = 105.00 studs`
  * 展示プロップ群展開領域: `X = 15.0 ~ 37.0 studs`, `Z = 68.0 ~ 94.0 studs` （InfoBoard_13 前方の歩行・視認ゾーン）

---

## 🍣 3D Object & Prop Deployment Transform Table

InfoBoard_13 前地区の床面（Y = 4.0 studs）に調整・配置された 3D オブジェクト（寿司プロップ群）の座標一覧。

### Prop Placement Table

| Prop Name / Object ID | Item Type | Position (X, Y, Z) | Orientation (Rx, Ry, Rz) | Parent Folder / Workspace Hierarchy |
| :--- | :--- | :--- | :--- | :--- |
| **Prop_Sushi_Toro_01** | Fatty Tuna Sushi / トロ | `(36.20, 4.00, 93.50)` | `(0, 0, 0)` | `Workspace.Props.Food.TsukijiArea` |
| **Prop_Sushi_Toro_02** | Fatty Tuna Sushi / トロ | `(15.80, 4.00, 81.00)` | `(0, 0, 0)` | `Workspace.Props.Food.TsukijiArea` |
| **Prop_Sushi_Toro_03** | Fatty Tuna Sushi / トロ | `(34.20, 4.00, 68.50)` | `(0, 0, 0)` | `Workspace.Props.Food.TsukijiArea` |
| **Prop_Sushi_Tamago_01** | Egg Sushi / タマゴ | `(31.80, 4.00, 93.50)` | `(0, 0, 0)` | `Workspace.Props.Food.TsukijiArea` |
| **Prop_Sushi_Tamago_02** | Egg Sushi / タマゴ | `(19.40, 4.00, 81.00)` | `(0, 0, 0)` | `Workspace.Props.Food.TsukijiArea` |
| **Prop_Sushi_Tamago_03** | Egg Sushi / タマゴ | `(30.96, 4.00, 68.50)` | `(0, 0, 0)` | `Workspace.Props.Food.TsukijiArea` |
| **Prop_Sushi_Salmon_01** | Salmon Sushi / サーモン | `(18.50, 4.00, 93.50)` | `(0, 0, 0)` | `Workspace.Props.Food.TsukijiArea` |
| **Prop_Sushi_Salmon_02** | Salmon Sushi / サーモン | `(34.50, 4.00, 81.00)` | `(0, 0, 0)` | `Workspace.Props.Food.TsukijiArea` |
| **Prop_Sushi_Salmon_03** | Salmon Sushi / サーモン | `(16.50, 4.00, 68.50)` | `(0, 0, 0)` | `Workspace.Props.Food.TsukijiArea` |

---

## 📂 Workspace Hierarchy & Integration

築地エリアのオブジェクト群は、メンテナンス性およびスクリプト制御の容易化のため、以下の階層構造に従って `Workspace` 内に整理・格納する。

    Workspace
    ├── 🏛️ Walls
    │    └── MainWall_04
    │         └── 🖼️ InfoBoard_13_TsukijiOuterMarket
    └── 📦 Props
         └── 📁 TsukijiArea
              ├── Prop_Sushi_Toro_01
              ├── Prop_Sushi_Toro_02
              ├── Prop_Sushi_Toro_03
              ├── Prop_Sushi_Tamago_01
              ├── Prop_Sushi_Tamago_02
              ├── Prop_Sushi_Tamago_03
              ├── Prop_Sushi_Salmon_01
              ├── Prop_Sushi_Salmon_02
              └── Prop_Sushi_Salmon_03

---

## 🔗 Related Documentation & Links

* メインインデックス: `../index.md`
* 全体オブジェクト配置計画: `../object-deployment-plan.md`
* 空間座標・寸法計算仕様書: `./room-spatial-dimension-spec.md`
* 主要観光スポット案内板仕様書: `./info-board-featured-spots.md`
* ワークスペース階層仕様書: `./workspace-hierarchy.md`

---
title: "Roblox Room Floor Design Spec"
type: "specification"
status: "approved"
tags:
  - roblox-architecture
  - spatial-design
  - floor-design
  - level-design
links:
  - "./room-layout-design.md"
  - "./room-spatial-dimension-spec.md"
  - "./objects/info-board-featured-spots.md"
  - "./objects/info-board-specific-shops.md"
  - "./objects/workspace-hierarchy.md"
description: "Robloxワールド空間における3つの階層シリンダー床パーツの立体構造、寸法、材質、および色設定（ゾーン機能および案内板視認性最適化）の設計書"
---

# Roblox Room Floor Hardware & Spatial Design Spec

本ドキュメントは `room-layout-design.md` および `room-spatial-dimension-spec.md` に定義された空間構造に基づき、空間のベースとなる同心円状シリンダー床（ZONE A, ZONE B, ZONE C）の3Dパーツ構成、寸法、材質、およびカラーリング仕様を定義する。

---

## 🏗️ Floor 3D Part Hierarchy & Spatial Stacking Logic

床面は3つの円柱パーツ（Cylinder）を垂直方向に重ね合わせるステップ構造（段階的プラットフォーム）として構築する。中央の ZONE A は Spawn Location を内部に隠蔽できるよう十分な厚みを持たせ、最下層の ZONE C は空間全体の基盤として機能させる。

    Workspace
    └── 🏛️ Floors
        │
        ├── 🔲 ZoneC_Base_Floor (Part / Cylinder)     --> Size: 0.2, 230.0, 230.0
        │                                                  (最下層・外周メイン展示層)
        │
        ├── 🧱 ZoneB_Middle_Floor (Part / Cylinder)   --> Size: 0.4, 130.0, 130.0
        │                                                  (中間層・交流・ホテルボード層)
        │
        └── 🧱 ZoneA_Center_Floor (Part / Cylinder)   --> Size: 2.0, 50.0, 50.0
             │                                             (最上層・中央プラットフォーム / 地図予定地)
             └── 📍 Invisible_SpawnLocation           --> Size: 1.0, 12.0, 12.0
                                                           (ZONE A 内部に非可視化配置)

> 💡 **Spawn隠蔽と高さ設定（Stacking）**:
> ZONE A は厚み `2.0 studs`（$Y = 0.0 \sim 2.0$）で構築され、内部に `Size = (1.0, 12.0, 12.0)` の SpawnLocation を完全に内包・隠蔽する。
> 床面の高位差（ZONE C: $Y=0.2$, ZONE B: $Y=0.4$, ZONE A: $Y=2.0$）により、中心に向かってステージ状に一段高くなる立体感を生み出す。

---

## 🎨 Color & Material Setup

各ゾーンの床面は、展示オブジェクト（案内板・店舗ボード）の視認性を損なわず、かつ空間全体のテーマ（秋のシックなモダンサイバーテイスト）に馴染む色・材質を設定する。

### Hardware Floor Parts Specifications

| Zone Object | Material | Color (RGB) | Surface Color Name | Design Rationale & Visual Effect |
| :--- | :--- | :--- | :--- | :--- |
| **ZoneA_Center_Floor (中央)** | `SmoothPlastic` | `[220, 222, 225]` | Light Warm Gray | シンプルの極致を意識したマットなライトグレー。将来的な「東京23区地図」の投影・載置時にラインやテキストの可視性を邪魔しないニュートラルカラー。Spawnを隠蔽する分厚い筐体。 |
| **ZoneB_Middle_Floor (中間)** | `SmoothPlastic` | `[45, 48, 55]` | Charcoal Neutral Gray | 中間の繋ぎとなる落ち着いたダークグレー。ZONE A と ZONE C の段差・境目をクリアに視認させつつ、周囲のホテルボードやゲートを引き立てる。 |
| **ZoneC_Base_Floor (最下層)** | `SmoothPlastic` | `[18, 20, 26]` | Deep Dark Slate | 上部に配置される `info-board-featured-spots.md`（Earth Blue/Navy）や `info-board-specific-shops.md`（Dark Slate/Neon/Red Icon）のビジュアルおよび文字・発光パーツが最も際立つ超低明度・無彩色のダークトーン。 |

> 💡 **ZONE C におけるオブジェクト視認性補足**:
> ZONE C の床面を極めて明度の低い `[18, 20, 26]`（Deep Dark Slate）に設定することで、空中に浮遊する `info-board-specific-shops.md` のネオンリング（Emerald Green / Vivid Yellow）や鮮やかな赤背景カテゴリバッジとの間に強力なコントラストを生み出し、プレイヤー視点での視認性を極大化させる。

---

## 📐 Dimensional Data & Transform Summary

| Zone Name | Shape | Radius ($R$) | Diameter ($D$) | Size $(X, Y, Z)$ | Position $(X, Y, Z)$ | Orientation $(R_x, R_y, R_z)$ | Top Elevation ($Y$) |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| **ZoneA_Center_Floor** | Cylinder | `25.0 studs` | `50.0 studs` | `2.0, 50.0, 50.0` | `(0.00, 1.00, 0.00)` | `(0, 0, 90)` | `Y = 2.00` |
| **ZoneB_Middle_Floor** | Cylinder | `65.0 studs` | `130.0 studs` | `0.4, 130.0, 130.0` | `(0.00, 0.20, 0.00)` | `(0, 0, 90)` | `Y = 0.40` |
| **ZoneC_Base_Floor** | Cylinder | `115.0 studs` | `230.0 studs` | `0.2, 230.0, 230.0` | `(0.00, 0.10, 0.00)` | `(0, 0, 90)` | `Y = 0.20` |

---

## 🧭 Spatial Visual Layout (Floor Layer Profile)

    ===================================================================================
    [ZONE C: Base Floor (R=115, Y_top=0.2) - Deep Dark Slate [18, 20, 26]]
    - 上部配置: Featured Spots 案内板 (外壁沿い) & 浮遊 Specific Shop Boards
    ---------------------------------------------------------------------------------
            [ZONE B: Middle Floor (R=65, Y_top=0.4) - Charcoal Gray [45, 48, 55]]
            - 上部配置: Hotel Boards, 交流チャットBOX, ランドマークゲート
            -----------------------------------------------------------------
                    [ZONE A: Center Platform (R=25, Y_top=2.0) - Light Gray [220, 222, 225]]
                    - 内部: Embedded SpawnLocation (非可視化・隠蔽)
                    - 上面: 将来的な「東京23区地図」展示用シンプル平面
    ===================================================================================

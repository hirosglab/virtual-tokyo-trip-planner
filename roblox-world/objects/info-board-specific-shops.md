---
title: "Roblox Information Board Spec - Specific Spot & Shop Boards"
type: "specification-info-board-specific"
status: "approved"
tags:
  - roblox-ui
  - 3d-hardware-spec
  - surface-gui
  - shop-board
  - double-sided
links:
  - "../object-deployment-plan.md"
  - "./info-board-featured-spots.md"
  - "../assets/specific-spot-shop-boards-design.svg"
description: "特定店舗・施設（Specific Spot & Shop Boards）専用案内板の両面（Double-Sided）対応、中心部が最も分厚い凸型階層3D構造、およびSurfaceGuiレイアウト仕様を定義します。"
---

# Roblox Information Board Hardware & UI Spec (Specific Spot & Shop Boards)

This document defines the 3D Parts hierarchy, double-sided UI configuration, dynamic materials/colors, and spatial depth logic for the cylindrical Specific Spot & Shop Boards (../assets/specific-s[...]

---
## 📐 Information Board Layout Diagram
![Roblox Informationboard Layout Diagram](../assets/specific-spot-shop-boards-design.svg)
*※ 設計図の元データ・編集は Google Draw 参照*

## 🏗️ 3D Part Hierarchy & Spatial Depth Logic

To support 360-degree viewing (both Front and Back sides) and to create a **convex museum-grade volumetric depth** where the board is thickest at the center, the Cylindrical Parts are layered outw[...[...]

### Depth & Thickness Distribution (Center-Thick Structure)
1. **Core / Display Layer (Center):** Thickness = `1.0` studs (Thickest)
2. **Inner Status Frame Layer:** Thickness = `0.3` studs
3. **Outer Border Base Layer:** Thickness = `0.1` studs (Thinnest)

```
[Side Profile Depth Concept]
       Outer Base (0.1)  ──┐
 Inner Status Frame (0.3)  ──┼─┐
 Center Display Surface (1.0)──┼─┼─ [ THICK CENTER CORE ]
 Inner Status Frame (0.3)  ──┼─┘
       Outer Base (0.1)  ──┘
```

### Complete Model Hierarchy

    SpecificShopBoard (Model)
    │
    ├── 🔲 Outer_Border_Cylinder (Base Ring)   --> Size: 0.1, 8.0, 8.0 (Shape: Cylinder)
    │   │
    │   ├── 🧱 Inner_Status_Cylinder (Status Frame) --> Size: 0.3, 6.8, 6.8 (Shape: Cylinder)
    │   │
    │   ├── 🖼️ Display_Surface_Front (Thick Core Face) --> Size: 1.0, 6.0, 6.0 (Shape: Cylinder)
    │   │   └── 📄 SurfaceGui_Front (Face: Right / CanvasSize: 1024 x 1024)
    │   │       ├── 🖼️ Center_Image_Label (512 x 512, Circle Mask via UICorner)
    │   │       └── 📁 PopUp_Info_Frame (Canvas Overlay - Proximity Activated)
    │   │           ├── 🔤 Spot_Name (TextLabel)
    │   │           └── 🔤 Description (TextLabel)
    │   │
    │   └── 🖼️ Display_Surface_Back (Rear Core Face) --> Rendered via SurfaceGui Face: Back
    │       └── 📄 SurfaceGui_Back (Face: Left / CanvasSize: 1024 x 1024)
    │           ├── 🖼️ Center_Image_Label (512 x 512, Circle Mask via UICorner)
    │           └── 📁 PopUp_Info_Frame (Canvas Overlay - Proximity Activated)
    │
    └── 🏷️ Category_Icon_Cylinder (Top-Right Badge) --> Size: 0.2, 2.2, 2.2 (Double-Sided GUI)
        ├── 📄 Category_SurfaceGui_Front (Face: Right / CanvasSize: 256 x 256)
        │   └── 🖼️ Icon_ImageLabel (Category Pictogram)
        └── 📄 Category_SurfaceGui_Back (Face: Left / CanvasSize: 256 x 256)
            └── 🖼️ Icon_ImageLabel (Category Pictogram)

> 💡 **SurfaceGuiのCanvasSize設定（Tips）**:
> `SizingMode` のプロパティを `PixelsPerStud` から `FixedSize` に変更することで、`CanvasSize` プロパティの入力が可能になり、任意の解像度（例: 1024 x 768）を正確に指定
---

## 🎨 Color & Material Setup

The Outer Base uses **Slate Charcoal** for strong visual contrast, while the middle status ring utilizes **Neon Emission** to signal status. Both Front and Back SurfaceGuis share the same dynamic [...][...]

### Hardware Parts & Materials

| Object | Material | Color (RGB) | Visual Effect & State |
| :--- | :--- | :--- | :--- |
| **Outer_Border_Cylinder (外枠)** | `SmoothPlastic` | `[40, 42, 54]` | Dark Slate Gray (Base ring background) |
| **Inner_Status_Cylinder (内枠 - Proposed)** | `Neon` | `[255, 204, 0]` | Vivid Yellow Neon Glow |
| **Inner_Status_Cylinder (内枠 - Confirmed)** | `Neon` | `[0, 230, 118]` | Emerald Green Neon Glow |
| **Display_Surface_Front/Back (中心表示面)** | `SmoothPlastic` | `[18, 18, 24]` | Deep Obsidian Black (Thickest center) |
| **Category_Icon_Cylinder (カテゴリ枠)** | `SmoothPlastic` | `[60, 64, 72]` | Metallic Gray Badge Ring |

### Dynamic UI & Popup Colors (Front & Back Shared)

| UI Element | Color (RGB) | Font / Style | Usage |
| :--- | :--- | :--- | :--- |
| **PopUp Frame Background** | `[15, 17, 23]` (Transparency: 0.15) | Dark Frosted Glass | Contrast backdrop on Outer Border |
| **PopUp Spot Name** | `[255, 255, 255]` | `Montserrat` (Bold, Size 36) | Clear white header text |
| **PopUp Description** | `[220, 225, 230]` | `Source Sans Pro` (Size 28) | Soft white body text |

---

## 📐 UI Layout Architecture (Both Front & Back SurfaceGui)

    ==================================================================
    |             SurfaceGui_Front / Back (1024 x 1024)              |
    |                                                                |
    |                   ┌────────────────────────┐                   |
    |                   │                        │                   |
    |                   │ 🖼️ Center_Image_Label  │                   |
    |                   │    (512 x 512 Circular)│   ┌────────────┐  |
    |                   │                        │   │ Category   │  |
    |                   │   ・Featured Image     │   │ Icon Badge │  |
    |                   │   ・UICorner = 1.0     │   │ (Top-Right)│  |
    |                   └────────────────────────┘   └────────────┘  |
    |                                                                |
    |   ==========================================================   |
    |   | 📁 PopUp_Info_Frame (Triggered via Proximity/Hover)    |   |
    |   |                                                        |   |
    |   |  🔤 Spot_Name (TextSize: 36)                          |   |
    |   |  🔤 Description Text (TextSize: 28 / TextWrapped)      |   |
    |   ==========================================================   |
    ==================================================================

---

## 📁 SurfaceGui Component Details (Front & Back)

### ① 🖼️ Center_Image_Label (Front & Back Face)
* **Purpose**: Displays the shop highlight image or logo on both sides of the center cylinder.
* **Rotation**: 180
* **Size**: `{1.0, 0}, {1.0, 0}` (512 x 512 px)
* **Position**: `{0, 0}, {0, 0}` (Centered horizontally in top half)
* **BackgroundTransparency**: `1`
* **ScaleType**: `Stretch`
* **Child Components**:
  * `UICorner`: `CornerRadius = {1, 0}` (Creates a perfect circle mask)
  * `UIStroke`: `Thickness = 4`, `Color = Status Dynamic (Yellow/Green)`

### ② 🏷️ Category_Icon_Cylinder Badge (Front & Back)
* **Purpose**: Displays a 2D pictogram icon on both sides of the badge to indicate the spot category (e.g., Dining, Shopping).
* **SurfaceGui Setup**: 
  * Front: `Category_SurfaceGui_Front` (`Face = Right`, `CanvasSize = 256 x 256`)
  * Back: `Category_SurfaceGui_Back` (`Face = Left`, `CanvasSize = 256 x 256`)
* **Child Components (`Icon_ImageLabel`)**:
  * **Size**: `{0.8, 0}, {0.8, 0}` (204 x 204 px)
  * **Position**: `{0.1, 0}, {0.1, 0}` (Centered inside badge)
  * **BackgroundTransparency**: `1`
  * **ImageColor3**: `[255, 255, 255]`
  * **ScaleType**: `Fit`
  * **Sub-Components**:
    * `UICorner`: `CornerRadius = {1, 0}` (Circular mask fitting badge boundary)
    * `UIStroke`: `Thickness = 2`, `Color = [200, 205, 215]`, `ApplyStrokeMode = Border`

### ③ 📁 PopUp_Info_Frame (Bottom Half Overlay)
* **Purpose**: Triggers independently or synchronously on both sides when a player approaches within 8 studs.
* **Size**: `{0.86, 0}, {0.28, 0}`
* **Position**: `{0.07, 0}, {0.68, 0}`
* **BackgroundColor3**: `[15, 17, 23]`
* **BackgroundTransparency**: `0.15`
* **Child Components**:
  * `UICorner`: `CornerRadius = {0.08, 0}`
  * `Spot_Name (TextLabel)`: TextSize `36`, Font `Montserrat Bold`, Position `{0.05, 0}, {0.1, 0}`
  * `Description (TextLabel)`: TextSize `28`, Font `Source Sans Pro`, Position `{0.05, 0}, {0.45, 0}`, `TextWrapped = true`

---

## ⚡ Dynamic Logic & Double-Sided Synchronization

1. **Dual SurfaceGui Update**:
   * Any change to `Status` attribute (`"Proposed"` or `"Confirmed"`) updates both `SurfaceGui_Front` and `SurfaceGui_Back` simultaneously.
2. **Double-Sided Image Binding**:
   * The script assigns the image decal URL to both `SurfaceGui_Front.Center_Image_Label` and `SurfaceGui_Back.Center_Image_Label` to ensure identical visuals from all viewing angles.

---

## 🖼️ Center Image Generation Spec (DALL·E 3 Prompt Template)

`Center_Image_Label`（正円マスク領域）に挿入する店舗・施設用イメージを DALL·E 3 等の生成AIで作成する際の定型スペックおよびプロンプトテンプレートです。

### 📐 生成スペック要件
* **Image Engine**: DALL·E 3 (または同等クオリティの画像生成AI)
* **Aspect Ratio**: `1:1` (正方形)
* **Resolution**: `1024 x 1024 px` 以上（推奨: `2048 x 2048 px`）
* **Composition & Lighting Rules**:
  * **正円切り抜き（UICorner）対策**: メイン被写体は**画面中央の 50% 以内**に配置する。四隅は半径50%の円形マスクで切除されるため、重要な要素は外周に配置しない。
  * **ライティング仕様**: 暗い円形フレーム（Obsidian Black）内での視認性を高めるため、**明るく洗練された背景（Bright, well-lit background / ambient light）** を基本条件とする。

### 📝 プロンプト構造テンプレート

```text
[Main Subject Description], served/located in [Store Style / Reference Name]. Gourmet photography / Architectural shot, bright and well-lit background, warm soft lighting, vibrant ambient atmosphere, perfectly centered composition with abundant outer margins on all four sides, 8k resolution, photorealistic, cinematic shot.
```

### 💡 生成用プロンプト実例（鉄板焼き店舗のケース）

* **対象料理 / 店舗**: 鉄板焼き10（和牛ステーキ・海鮮鉄板焼き）
* **英語プロンプト文**:
  > A high-end Teppanyaki dish featuring thick Japanese Wagyu steak and fresh grilled seafood (seared lobster and scallops) served on a hot iron griddle. Gourmet food photography, luxury restaurant ambiance like Teppanyaki 10, **bright and well-lit background with warm glowing ambient light**, perfectly centered composition with abundant margins on all four sides, dramatic steam rising, 8k resolution, photorealistic, cinematic shot.

* **要素ブレイクダウン**:
  * **料理内容**: 分厚い和牛ステーキ、伊勢海老・ホタテ等の新鮮な海鮮鉄板焼き
  * **雰囲気・背景**: 「鉄板焼き10」風の高級感ある店内、**明るく光の回った空間背景（Bright & well-lit）**、温かみのあるライティング、立ち上る湯気
  * **構図（重要）**: 中央配置（Centered composition） ＋ 四隅に十分な余白（Abundant margins）
  * **画質・スタイル**: 8K・実写風（Photorealistic）・正方形（1:1）

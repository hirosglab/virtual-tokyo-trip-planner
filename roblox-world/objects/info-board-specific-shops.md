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
  - "./assets/specific-spot-shop-boards-design.svg"
description: "特定店舗・施設（Specific Spot & Shop Boards）専用案内板の両面（Double-Sided）対応、中心部が最も分厚い凸型階層3D構造、およびSurfaceGuiレイアウト設計書"
---

# Roblox Information Board Hardware & UI Spec (Specific Spot & Shop Boards)

This document defines the 3D Parts hierarchy, double-sided UI configuration, dynamic materials/colors, and spatial depth logic for the cylindrical Specific Spot & Shop Boards (../assets/specific-spot-shop-boards-design.svg).

---
## 📐 Information Board Layout Diagram
![Roblox Informationboard Layout Diagram](./assets/specific-spot-shop-boards-design.svg)
*※ 設計図の元データ・編集は Google Draw 参照*

## 🏗️ 3D Part Hierarchy & Spatial Depth Logic

To support 360-degree viewing (both Front and Back sides) and to create a **convex museum-grade volumetric depth** where the board is thickest at the center, the Cylindrical Parts are layered outward along the Z-axis from a central thick core.

### Depth & Thickness Distribution (Center-Thick Structure)
1. **Core / Display Layer (Center):** Thickness = `0.5` studs (Thickest)
2. **Inner Status Frame Layer:** Thickness = `0.3` studs
3. **Outer Border Base Layer:** Thickness = `0.1` studs (Thinnest)

```
[Side Profile Depth Concept]
       Outer Base (0.1)  ──┐
 Inner Status Frame (0.3)  ──┼─┐
 Center Display Surface (0.5)──┼─┼─ [ THICK CENTER CORE ]
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
    │   ├── 🖼️ Display_Surface_Front (Thick Core Face) --> Size: 0.5, 6.0, 6.0 (Shape: Cylinder)
    │   │   └── 📄 SurfaceGui_Front (Face: Front / CanvasSize: 1024 x 1024)
    │   │       ├── 🖼️ Center_Image_Label (512 x 512, Circle Mask via UICorner)
    │   │       └── 📁 PopUp_Info_Frame (Canvas Overlay - Proximity Activated)
    │   │           ├── 🔤 Spot_Name (TextLabel)
    │   │           └── 🔤 Description (TextLabel)
    │   │
    │   └── 🖼️ Display_Surface_Back (Rear Core Face) --> Rendered via SurfaceGui Face: Back
    │       └── 📄 SurfaceGui_Back (Face: Back / CanvasSize: 1024 x 1024)
    │           ├── 🖼️ Center_Image_Label (512 x 512, Circle Mask via UICorner)
    │           └── 📁 PopUp_Info_Frame (Canvas Overlay - Proximity Activated)
    │
    └── 🏷️ Category_Icon_Cylinder (Top-Right Badge) --> Size: 0.2, 2.2, 2.2 (Double-Sided GUI)
        ├── 📄 Category_SurfaceGui_Front (Face: Front / CanvasSize: 256 x 256)
        │   └── 🖼️ Icon_ImageLabel (Category Pictogram)
        └── 📄 Category_SurfaceGui_Back (Face: Back / CanvasSize: 256 x 256)
            └── 🖼️ Icon_ImageLabel (Category Pictogram)

---

## 🎨 Color & Material Setup

The Outer Base uses **Slate Charcoal** for strong visual contrast, while the middle status ring utilizes **Neon Emission** to signal status. Both Front and Back SurfaceGuis share the same dynamic color logic.

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
* **Size**: `{0.5, 0}, {0.5, 0}` (512 x 512 px)
* **Position**: `{0.25, 0}, {0.2, 0}` (Centered horizontally in top half)
* **BackgroundTransparency**: `1`
* **ScaleType**: `Crop`
* **Child Components**:
  * `UICorner`: `CornerRadius = {1, 0}` (Creates a perfect circle mask)
  * `UIStroke`: `Thickness = 4`, `Color = Status Dynamic (Yellow/Green)`

### ② 🏷️ Category_Icon_Cylinder Badge (Front & Back)
* **Purpose**: Displays a 2D pictogram icon on both sides of the badge.
* **SurfaceGui setup**: `Category_SurfaceGui_Front` (`Face = Front`) and `Category_SurfaceGui_Back` (`Face = Back`).

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

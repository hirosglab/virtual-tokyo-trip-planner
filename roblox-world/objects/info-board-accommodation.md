---
title: "Roblox Information Board Spec - Accommodations Board"
type: "specification-info-board-accommodations"
status: "approved"
tags:
  - roblox-ui
  - 3d-hardware-spec
  - surface-gui
  - info-board
  - accommodations-board
links:
  - "../object-deployment-plan.md"
description: "宿泊施設（Accommodations Board）専用案内板の3Dパーツ構造、色・材質、およびSurfaceGuiレイアウト設計書"
---

# Roblox Information Board Hardware & UI Spec (Accommodations Board)

This document defines the 3D Parts hierarchy, materials, colors, and UI layout for the custom Accommodations Boards used across the virtual tour zones.

## 3D Part Hierarchy & Spatial Layers

The board is constructed using layered thin Block Parts and includes a ground base part for placement. To prevent texture flickering (Z-fighting), each forward layer is slightly offset along the Z-axis by 0.01 studs.

    InformationBoard (Model)
    │
    ├── Base_Support (Ground Part)      --> Size: 13.0, 1.0, 1.0
    └── Board_Body (Model / Group)
        │
        ├── Border (Base Part)          --> Size: 12.0, 9.0, 0.4
        └── Frame (Sub Part)            --> Size: 10.0, 8.0, 0.3
            └── Display_Surface         --> Size: 9.0, 7.0, 0.1
                └── SurfaceGui (SizingMode: FixedSize / CanvasSize: 1024 x 768)
                    ├── Left_Zone (UI Frame for Media & Facilities - 512 x 768)
                    │   ├── Hotel Icon (ImageLabel)
                    │   ├── Facility Icon 1 (ImageLabel)
                    │   └── Facility Icon 2 (ImageLabel)
                    └── Right_Zone (UI Frame for Text - 512 x 768)
                        ├── Date (TextLabel)
                        ├── Area (TextLabel)
                        └── Description (TextLabel)

> SurfaceGuiのCanvasSize設定（Tips）:
> SizingMode のプロパティを PixelsPerStud から FixedSize に変更することで、CanvasSize プロパティの入力が可能になり、任意の解像度（例: 1024 x 768）を正確に指定

### Color & Material Setup

| Object | Material | Color (RGB) | Visual Effect |
| :--- | :--- | :--- | :--- |
| **Border (外枠)** | SmoothPlastic | [25, 25, 25] | Black |
| **Frame (内枠)** | SmoothPlastic | [16, 44, 87] | Earth Blue |
| **Display_Surface (表示面)** | SmoothPlastic | [0, 0, 127] | Navy Blue |
| **Base_Support (接地部/底面)** | SmoothPlastic | [25, 25, 25] | Black |
| **UI Texts (文字情報)** | -- | [255, 255, 255] | White |

---

## UI Layout Architecture (2 Main Zones)

    ==================================================================
    |                     SurfaceGui (1024 x 768)                    |
    |======================================= layout =================|
    |    📁 Left_Zone (512 x 768)       |    📁 Right_Zone (512x768) |
    |                                   |                            |
    |   ┌───────────────────────────┐   |   🔤 Date                  |
    |   │                           │   |    (TextSize: 40)          |
    |   │                           │   |                            |
    |   │ 🖼️ Hotel Icon             │   |   🔤 Area                  |
    |   │    (ImageLabel)           │   |    (TextSize: 48)          |
    |   │                           │   |                            |
    |   │                           │   |   🔤 Description           |
    |   └───────────────────────────┘   |    (TextSize: 40 / Wrapped)|
    |   ┌────────┐     ┌────────┐       |                            |
    |   │Facility│     │Facility│       |                            |
    |   │Icon 1  │     │Icon 2  │       |                            |
    |   └────────┘     └────────┘       |                            |
    ==================================================================

SurfaceGui（解像度: 1024 x 768）の内部を左右50%ずつに分割し、左側にホテルアイコンと施設アイコン、右側に宿泊日程や地域、特徴を配置します。

---

## Left_Zone (左側50%領域：アイコンおよびメディア)

### Frame Properties
* **Size**: {0.5, 0}, {1, 0}
* **Position**: {0, 0}, {0, 0}
* **BackgroundTransparency**: 1

### ① Hotel Icon (ImageLabel)
* **Purpose**: ホテルであることを示すイラストレーション
* **Image Source**: Unsplash / Pixabay / Custom Assets
* **Properties**:
  * **Size**: {0.85, 0}, {0.55, 0}
  * **Position**: {0.075, 0}, {0.05, 0}
  * **BackgroundTransparency**: 1
  * **ScaleType**: Fit

### ② Facility Icon 1 (ImageLabel)
* **Purpose**: ホテル内の特記できる施設アイコン（例: 温泉浴場）
* **Properties**:
  * **Size**: {0.38, 0}, {0.28, 0}
  * **Position**: {0.075, 0}, {0.66, 0}
  * **BackgroundTransparency**: 1
  * **ScaleType**: Fit

### ③ Facility Icon 2 (ImageLabel)
* **Purpose**: ホテル内の特記できる施設アイコン（例: コインランドリーなど）
* **Properties**:
  * **Size**: {0.38, 0}, {0.28, 0}
  * **Position**: {0.545, 0}, {0.66, 0}
  * **BackgroundTransparency**: 1
  * **ScaleType**: Fit

---

## Right_Zone (右側50%領域：テキスト情報)

### Frame Properties
* **Size**: {0.5, 0}, {1, 0}
* **Position**: {0.5, 0}, {0, 0}
* **BackgroundTransparency**: 1

### Shared Text Properties
* **BackgroundTransparency**: 1
* **TextColor3**: [255, 255, 255]
* **TextXAlignment**: Left

### ① Date (TextLabel)
* **Purpose**: Display Stay Schedule
* **Text**: 1st - 2nd Nov
* **Font**: Roboto Condensed (Bold)
* **TextSize**: 40
* **Size**: {0.9, 0}, {0.12, 0}
* **Position**: {0.05, 0}, {0.06, 0}

### ② Area (TextLabel)
* **Purpose**: Display Hotel Location Area
* **Text**: Shinjuku / 新宿
* **Font**: Montserrat (Bold)
* **TextSize**: 48
* **Size**: {0.9, 0}, {0.18, 0}
* **Position**: {0.05, 0}, {0.22, 0}

### ③ Description (TextLabel)
* **Purpose**: Display Hotel Features and Nearby Information
* **Text**: Nightlife & Entertainment District / Godzilla Head / Shopping Malls
* **Font**: Source Sans Pro (Bold)
* **TextSize**: 40
* **TextWrapped**: true
* **TextYAlignment**: Top
* **Size**: {0.9, 0}, {0.50, 0}
* **Position**: {0.05, 0}, {0.44, 0}

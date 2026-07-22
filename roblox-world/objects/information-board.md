# Roblox Information Board Hardware & UI Specification

This document defines the 3D Parts hierarchy, materials, colors, and UI layout for the custom Information Boards used across the virtual tour zones.

---

## 🏗️ 3D Part Hierarchy & Spatial Layers

The board is constructed using three layered thin Block Parts to create a museum-grade 3D depth effect. To prevent texture flickering (Z-fighting), each forward layer is slightly offset along the Z-axis by `0.01` studs.

    InformationBoard (Model)
    │
    ├── 🔲 Border (Base Part)             --> Size: 12.0, 9.0, 0.4
    │   └── 🧱 Frame (Sub Part)           --> Size: 10.0, 8.0, 0.3
    │        └── 🖼️ Display_Surface       --> Size: 9.0, 7.0, 0.1
    │             └── 📄 SurfaceGui (SizingMode: FixedSize / CanvasSize: 1024 x 768)
    │                  ├── 📁 Left_Frame (UI Frame for Text - 512 x 768)
    │                  │    ├── 🔤 Area Badge (TextLabel)
    │                  │    ├── 🔤 Spot Name (TextLabel)
    │                  │    ├── 🔤 Category (TextLabel)
    │                  │    └── 🔤 Description (TextLabel)
    │                  └── 📁 Right_Frame (UI Frame for Media - 512 x 768)
    │                       └── 🖼️ Image / VideoFrame (ImageLabel/VideoFrame)

> 💡 **SurfaceGuiのCanvasSize設定（Tips）**:
> `SizingMode` のプロパティを `PixelsPerStud` から `FixedSize` に変更することで、`CanvasSize` プロパティの入力が可能になり、任意の解像度（例: 1024 x 768）を正確に指定

### 🎨 Color & Material Setup

| Object | Material | Color (RGB) | Visual Effect |
| :--- | :--- | :--- | :--- |
| **Border (外枠)** | `SmoothPlastic` | `[25, 25, 25]` | Black |
| **Frame (内枠)** | `SmoothPlastic`  | `[16, 44, 87]` | Earth Blue |
| **Display_Surface (表示面)** | `SmoothPlastic` | `[0, 0, 127]` | Navy Blue |
| **UI Texts (文字情報)** | `--` | `[255, 255, 255]` | White |

---

## 📐 UI Layout Architecture (2 Frames)

    ==================================================================
    |                        SurfaceGui (1024 x 768)                  |
    |======================================= layout =================|
    |        📁 Left_Frame (512 x 768)      |   📁 Right_Frame (512x768)  |
    |                                       |                            |
    |  [🔤 Area Badge (TextSize: 40)]      |   ┌────────────────────┐   |
    |                                       |   │                    │   |
    |  🔤 Spot Name                         |   │ 🖼️ Image           │   |
    |    (TextSize: 48)                     |   │   (Full Fill / Fit)│   |
    |                                       |   │                    │   |
    |  [🔤 Category (TextSize: 40)]        |   │ ・フレーム全体配置  │   |
    |                                       |   │ ・Fit表示          │   |
    |  🔤 Description                       |   │                    │   |
    |    (TextSize: 40 / Wrapped)           |   └────────────────────┘   |
    |                                       |                            |
    ==================================================================

`SurfaceGui`（解像度: `1024 x 768`）の内部を左右50%ずつに分割し、情報の整理とビジュアルの訴求を両立させます。

---

## 📁 Left_Frame (Left 50% Zone: Text & Details)

### ⚙️ Frame Properties
*   **Size**: `{0.5, 0}, {1, 0}` （横幅ピッタリ50%、縦幅100%）
*   **Position**: `{0, 0}, {0, 0}` （左上に配置）
*   **BackgroundTransparency**: `1` （背景を透明にして後ろの表示面パーツの色を透過）

### 💡 Shared Text Properties
*   **BackgroundTransparency**: `1` （背景を透明に）
*   **TextColor3**: `[255, 255, 255]` （文字色を白に）
*   **TextXAlignment**: `Left` （左揃えに。Spot NameやDescriptionで綺麗に揃える）

### ① 🔤 Area Badge (TextLabel)
*   **Purpose**: Display Area Name
*   **Text**: `Shinjuku / 新宿`
*   **Font**: `Roboto Condensed` (Bold)
*   **TextSize**: `40`
*   **Size**: `{0.9, 0}, {0.1, 0}`
*   **Position**: `{0.05, 0}, {0.05, 0}` （少し内側に余白を持たせて配置）

### ② 🔤 Spot Name (TextLabel)
*   **Purpose**: Prominently Display Location Name
*   **Text**: `Kabuki-cho / 歌舞伎町`
*   **Font**: `Montserrat` (Bold)
*   **TextSize**: `48`
*   **Size**: `{0.9, 0}, {0.15, 0}`
*   **Position**: `{0.05, 0}, {0.18, 0}`

### ③ 🔤 Category (TextLabel)
*   **Purpose**: Display Category
*   **Text**: `NIGHTLIFE DISTRICT`
*   **Font**: `Highway Gothic` (Bold)
*   **TextColor3**: `[0, 170, 255]` （青・シアン系のアクセントカラー）
*   **TextSize**: `40`
*   **Size**: `{0.9, 0}, {0.1, 0}`
*   **Position**: `{0.05, 0}, {0.35, 0}`

### ④ 🔤 Description (TextLabel)
*   **Purpose**: Display Readable Description Text
*   **Text**: `Explore Tokyo's most famous nightlife and entertainment district.`
*   **Font**: `Source Sans Pro` (Bold)
*   **TextSize**: `40`
*   **TextWrapped**: `true` （⚠️ ここを true にしないと、枠外に文字がはみ出して見えなくなってしまう）
*   **TextYAlignment**: `Top` （上揃え。解説が長くなっても上から綺麗に読める）
*   **Size**: `{0.9, 0}, {0.45, 0}`
*   **Position**: `{0.05, 0}, {0.48, 0}`

---

## 📁 Right_Frame (右側50%領域：メディア)

### ⚙️ Frame Properties
*   **Size**: `{0.5, 0}, {1, 0}` （横幅ピッタリ50%、縦幅100%）
*   **Position**: `{0.5, 0}, {0, 0}` （右半分にぴったりズレて配置）
*   **BackgroundTransparency**: `1` （背景を透明に設定）

### 🖼️ Image / VideoFrame (ImageLabel/VideoFrame)
*   **Purpose**: Visual Promotion of the Attraction
*   **Image Source**: `Unsplash`
*   **Properties**:
    *   **Size**: `{1, 0}, {1, 0}` （Right_Frame枠全体いっぱいに拡大表示）
    *   **Position**: `{0, 0}, {0, 0}` （左上ピッタリに配置）
    *   **BackgroundTransparency**: `1`
    *   **ScaleType**: `Fit` （⚠️ 元画像が縦長・横長どちらでもアスペクト比を保ったまま枠内に収める）

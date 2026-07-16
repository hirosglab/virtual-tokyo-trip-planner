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
    │             └── 📄 SurfaceGui (CanvasSize: 1024 x 768)
    │                  ├── 📁 Left_Frame (UI Frame for Text - 512 x 768)
    │                  │    ├── 🔤 Area Badge (TextLabel)
    │                  │    ├── 🔤 Spot Name (TextLabel)
    │                  │    ├── 🔤 Category (TextLabel)
    │                  │    └── 🔤 Description (TextLabel)
    │                  └── 📁 Right_Frame (UI Frame for Media - 512 x 768)
    │                       └── 🖼️ Image / VideoFrame (ImageLabel/VideoFrame)

### 🎨 Color & Material Setup (色の組み合わせ案)

| Object / 対象 | Material / マテリアル | Color (RGB) / カラー | Visual Effect / 見え方のイメージ |
| :--- | :--- | :--- | :--- |
| **Border (外枠)** | `SmoothPlastic` | `[25, 25, 25]` | Black |
| **Frame (内枠)** | `SmoothPlastic` <br>*(or `Neon` for glow)* | `[16, 44, 87]` | Blue |
| **Display_Surface (表示面)** | `SmoothPlastic` | `[15, 15, 20]` | Dark Navy |
| **UI Texts (文字情報)** | `--` | `[255, 255, 255]` | White |

---

## 📐 UI Layout Architecture (2フレーム構成)

    ==================================================================
    |                        SurfaceGui (1024 x 768)                  |
    |======================================= layout =================|
    |        📁 Left_Frame (512 x 768)      |   📁 Right_Frame (512x768)  |
    |                                       |                            |
    |  [🔤 Area Badge (TextSize: 40)]      |   ┌────────────────────┐   |
    |                                       |   │                    │   |
    |  🔤 Spot Name                         |   │ 🖼️ Image           │   |
    |    (TextSize: 48)                     |   │   (Aspect Ratio)   │   |
    |                                       |   │                    │   |
    |  [🔤 Category (TextSize: 40)]        |   │ ・中央配置         │   |
    |                                       |   │ ・Fit表示          │   |
    |  🔤 Description                       |   │                    │   |
    |    (TextSize: 40 / Wrapped)           |   └────────────────────┘   |
    |                                       |                            |
    ==================================================================

`SurfaceGui`（解像度: `1024 x 768`）の内部を左右50%ずつに分割し、情報の整理とビジュアルの訴求を両立させます。

---

## 📁 Left_Frame (左側50%領域：文字情報)

### 💡 全テキスト共通のプロパティ設定（おすすめ）
*   **BackgroundTransparency**: `1` （背景を透明に）
*   **TextColor3**: `[255, 255, 255]` （文字色を白に）
*   **TextXAlignment**: `Left` （左揃えに。Spot NameやDescriptionで綺麗に揃います）

### ① 🔤 Area Badge (TextLabel)
*   **役割**: エリア名の表示
*   **Text**: `Shinjuku / 新宿`
*   **Font**: `Roboto Condensed` (Bold)
*   **TextSize**: `40`
*   **Size**: `{0.9, 0}, {0.1, 0}`
*   **Position**: `{0.05, 0}, {0.05, 0}` （少し内側に余白を持たせて配置）

### ② 🔤 Spot Name (TextLabel)
*   **役割**: 観光地名を大きく強調
*   **Text**: `Kabuki-cho / 歌舞伎町`
*   **Font**: `Montserrat` (Bold)
*   **TextSize**: `48`
*   **Size**: `{0.9, 0}, {0.15, 0}`
*   **Position**: `{0.05, 0}, {0.18, 0}`

### ③ 🔤 Category (TextLabel)
*   **役割**: カテゴリーの表示
*   **Text**: `NIGHTLIFE DISTRICT`
*   **Font**: `Highway Gothic` (Bold)
*   **TextColor3**: `[0, 170, 255]` （青・シアン系のアクセントカラーにすると引き締まります！）
*   **TextSize**: `40`
*   **Size**: `{0.9, 0}, {0.1, 0}`
*   **Position**: `{0.05, 0}, {0.35, 0}`

### ④ 🔤 Description (TextLabel)
*   **役割**: 読みやすい解説文
*   **Text**: `Explore Tokyo's most famous nightlife and entertainment district.`
*   **Font**: `Source Sans Pro` (Bold)
*   **TextSize**: `40`
*   **TextWrapped**: `true` （⚠️ 超重要：これを true にしないと、枠外に文字がはみ出して見えなくなってしまいます）
*   **TextYAlignment**: `Top` （上揃え。解説が長くなっても上から綺麗に読めるようになります）
*   **Size**: `{0.9, 0}, {0.45, 0}`
*   **Position**: `{0.05, 0}, {0.48, 0}`

---

## 📁 Right_Frame (右側50%領域：メディア)

### 🖼️ Image / VideoFrame (ImageLabel/VideoFrame)
*   **役割**: ビジュアルによる観光地の訴求
*   **詳細**: 現地のイメージ写真、または自身で撮影した臨場感のあるビデオ（思い出横丁の景観など）をアスペクト比を維持して中央配置（`ScaleType` = `Fit` 推奨）。

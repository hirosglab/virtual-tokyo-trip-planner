# Roblox Information Board Hardware & UI Specification

This document defines the 3D Parts hierarchy, materials, colors, and UI layout for the custom Information Boards used across the virtual tour zones.

---

## 🏗️ 3D Part Hierarchy & Spatial Layers

The board is constructed using three layered thin Block Parts to create a museum-grade 3D depth effect. To prevent texture flickering (Z-fighting), each forward layer is slightly offset along the Z-axis by `0.01` studs.

```text
InformationBoard (Model)
│
├── 🔲 Border (Base Part)
│    └── 🧱 Frame (Sub Part) 
│         └── 🖼️ Display_Surface (UI Canvas Part)
│              └── 📄 SurfaceGui (CanvasSize: 1024 x 768)
│                   ├── 📁 Left_Frame (UI Frame for Text)
│                   │    ├── 🔤 Area Badge (TextLabel)
│                   │    ├── 🔤 Spot Name (TextLabel)
│                   │    ├── 🔤 Category (TextLabel)
│                   │    └── 🔤 Description (TextLabel)
│                   └── 📁 Right_Frame (UI Frame for Media)
│                        └── 🖼️ Image / VideoFrame (ImageLabel/VideoFrame)
```
### 🎨 Color & Material Setup (色の組み合わせ案)

| Object / 対象 | Material / マテリアル | Color (RGB) / カラー | Visual Effect / 見え方のイメージ |
| :--- | :--- | :--- | :--- |
| **Border (外枠)** | `SmoothPlastic` | `[25, 25, 25]` | Black |
| **Frame (内枠)** | `SmoothPlastic` <br>*(or `Neon` for glow)* | `[16, 44, 87]` | Blue |
| **Display_Surface (表示面)** | `SmoothPlastic` | `[15, 15, 20]` | Dark Navy |
| **UI Texts (文字情報)** | `--` | `[255, 255, 255]` | White |

---

### 📐 UI Layout Architecture (2フレーム構成)

`SurfaceGui`（解像度: `1024 x 768`）の内部を左右50%ずつに分割し、情報の整理とビジュアルの訴求を両立させます。

* **Left_Frame (左側50%領域：文字情報)**
  * **Area Badge:** エリア名を表示（例: `Shinjuku / 新宿`）
  * **Spot Name:** 観光地名を大きく強調（例: `Kabuki-cho / 歌舞伎町` / フォント: `GothamBold`）
  * **Category:** キャッチーなカテゴリー枠（例: `NIGHTLIFE DISTRICT` / 青・シアン系のアクセントカラー）
  * **Description:** 読みやすい解説文（例: `Explore Tokyo's most famous...` / テキストの自動折り返し有効）
* **Right_Frame (右側50%領域：メディア)**
  * **Image / VideoFrame:** 現地のイメージ写真、または自身で撮影した臨場感のあるビデオ（思い出横丁の景観など）をアスペクト比を維持して中央配置。

# Blender Lantern UV Mapping & Texture Baking Learning & Development Log

Blenderを用いた和風赤提灯（Lantern_Red）の制作過程において、メッシュの滑らかさ制御（スムーズシェーディング）、UV展開手法（円筒投影 / シーム設定）、プロシージャルノード（波形テクスチャ）を用いた提灯の竹ひご模様生成、乗算合成による金具統合、およびCyclesレンダラーを用いた1枚のPNGテクスチャへのベイク（Bake）ワークフローに関する学習記録です。

使用環境：
- Blender 5.2.2 LTS / Windows
- Roblox Studio（エクスポート対象環境）
- 目的：築地・東京プレゼン用ワールド（Roblox）に配置する伝統的な赤提灯アセットの制作とテクスチャ軽量化
- 制作対象：Lantern_Red（提灯本体、上下の黒金具、竹ひご横縞模様の統合）

---
## 📌 オブジェクト構造とシェーダーノード構成

提灯モデルの3Dメッシュ構造と、テクスチャベイク直前に確立したシェーダーノード接続構造です。

### オブジェクト構造
```
 Scene Collection
 └── Collection
     ├── Camera
     └── Lantern_Red (Mesh)
         ├── Shade Smooth (スムーズシェーディング適用)
         └── Material.001 (Shader Material)
```
### ノード接続構成（ベイク実行直前）
```
 [ Texture Coordinate ]
       │ (UV)
       ▼
  [ Wave Texture ] (Scale: 20.000 / Distortion: 2.000 / Detail: 2.000)
       │ (Factor)
       ▼
   [ Color Ramp ] (Color)
       │
       ▼
     [ Mix ] (Mix Color / Factor = Color Ramp)
       │ (A: 白 / B: 赤 Hex #D80000)
       │
       ├─────────────────────────────────┐ (Result)
       │                                 ▼
       │                          [ Multiply ] (Multiply Color)
       │                                 ▲
  [ T_Lantern_Base ] (画像Color) ────────┘ (B: 金具黒・赤地の基本テクスチャ)
       │
       │ (Result)
       ▼
 [ Principled BSDF ] ──▶ (Base Color) ──▶ [ Material Output ]

  [ T_Lantern_WireBaked ] (未接続 / 単体選択状態でアクティブ化)
```
## 🔍 スムーズシェーディングとUV展開手法

球体・円筒形状のメッシュに対して、ローポリゴン特有の面のカクつき（カセット感）を消去し、テクスチャを歪みなく割り当てるための処理手法です。

### 1. スムーズシェーディング（Shade Smooth）の適用
- 操作: 3Dビューポートで Lantern_Red を右クリック ➔ Shade Smooth を選択。
- 効果: 頂点法線が補間され、ローポリメッシュの表面が滑らかな曲面として描写されます。

### 2. UV展開：円筒投影（Cylinder Projection）とシーム設定
- シームのマーク（Mark Seam）: 編集モード（Edit Mode）で提灯の背面の縦一列の辺を選択し、右クリック ➔ Mark Seam を実行。
- UV展開の実行: 全選択（A）後、U ➔ Cylinder Projection（円筒投影） を実行。
- UV整列: UV Editor上で縦横の変形を補正し、長方形のメッシュ（UVアイランド）として綺麗に配置します。これにより、横ひご模様が提灯の外周に沿って均一に巻き付く状態を確保しました。

## 🔍 プロシージャル横線パターンと乗算合成ノード

テクスチャ画像（T_Lantern_Base）に記録されている「上下の黒い金属金具」を活かしつつ、プロシージャル（計算生成）で赤いボディ部分に均一な白い竹ひご（横線）を付与するノード設計です。

### 1. 竹ひご模様の生成ノード群
- Texture Coordinate: UV 出力を使用。メッシュの形状ではなく、円筒投影されたUVマップの座標系に基づいて模様を生成します。
- Wave Texture: 
  - 方向: Y 軸指定（水平の縞模様を生成）。
  - Scale (20.000): 横線の本数・密度を指定。
  - Distortion (2.000): 直線状の縞に微小なわたり・揺らぎを与え、手作り和紙提灯の竹ひごの不均一さを表現。
- Color Ramp: 境界線をシャープに整え、線の太さと間隔を調整。
- Mix (Mix Color): 白（竹ひご）と赤（#D80000 / 提灯の地の色）をFactorに基づいて合成。

### 2. 金具を保持する乗算合成ノード：Multiply
- 問題点: 単に Mix ノードの出力を接続すると、ベーステクスチャに描かれた上下の黒い金具部分まで赤いプロシージャル模様で上書きされてしまう。
- 解決ノード: Multiply（乗算） ノードの導入。
  - 入力 A: Mix ノードの出力（赤地 ＋ 白い横線模様）
  - 入力 B: T_Lantern_Base（黒い金具＋ベース色画像）の Color 出力
- 乗算合成の原理: 黒色部分のRGB値は 0 であるため、どんな色が乗算されても 0 × Color = 0 となり、「上下の金具部分が確実に漆黒として保持」されます。

## ⚙️ Cyclesによるテクスチャベイク（Bake）完全手順

複雑に組まれたシェーダーノード（Wave Texture, Mix, Multiply）の出力結果を1枚のPNG画像（T_Lantern_WireBaked.png）として固定・焼き付ける手順です。

### 1. ベイク用受け皿ノードの配置とアクティブ化
1. Shader Editor上に Image Texture ノードを追加し、新規画像（T_Lantern_WireBaked / 1024x1024等）をセット。
2. このノードはどこにも線を繋がず、クリックして白枠で囲まれた状態（アクティブ）にしておく。

### 2. レンダラーとベイクパラメータの設定
1. プロパティパネルの Render Properties（カメラアイコン） を開き、Render Engine を Eevee から Cycles へ変更。
2. Bake アコーディオンを展開し、各項目を以下のように設定：
```
 [ Bake Settings ]
 ├── Bake Type ────────────────── [ Diffuse ]
 ├── View From ────────────────── [ Above Surface ]
 └── Influence
     └── Contributions
         ├── Direct ───────────── [ OFF ] (陰影・ライトを排除)
         ├── Indirect ─────────── [ OFF ] (関節光を排除)
         └── Color ────────────── [ ON ] (純粋な表面カラーのみ書き出し)
```
### 3. ベイク実行時のエラー回避とトラブルシューティング
- エラー事例: Object "Light" is not a mesh
  - 原因: 3Dビューポート上で提灯を選択していても、アウトライナー上でライト等の非メッシュオブジェクトがアクティブ要素として残っているとベイク処理が失敗する。
  - 対策: アウトライナー上で Lantern_Red を直接クリックしてアクティブ化するか、不要な Light オブジェクトを一時的に削除（Delete）してからベイクを実行する。

### 4. ベイク画像の保存とノードの軽量化
1. ベイク完了後、Image Editorに生成された画像を確認し、上部メニュー Image ➔ Save As... から T_Lantern_WireBaked.png として保存。
2. Shader Editor上の不要になったプロシージャルノード群（Texture Coordinate, Wave Texture, Color Ramp, Mix, Multiply等）を削除。
3. T_Lantern_WireBaked 画像ノードの Color を Principled BSDF の Base Color に直接接続し、マテリアル構成を最小化（軽量化）。
4. レンダラーを Cycles から Eevee に戻し、作業用リアルタイム描画を復元。

## 📋 学習項目および設定パラメータ一覧

| 区分 | 項目 / ノード | 設定値 / 操作 | 目的・効果 |
|---|---|---|---|
| Mesh | Shade Smooth | 右クリック ➔ Shade Smooth | 表面ポリゴンの滑らかな曲面補間 |
| UV | Cylinder Projection | U ➔ Cylinder Projection | 円筒状オブジェクトに対する歪みのないUV展開 |
| UV | Mark Seam | 編集モードで背面エッジ指定 | 円筒投影時の展開基準線の定義 |
| Shader | Wave Texture | Scale: 20.0 / Distortion: 2.0 | 提灯の和紙竹ひご模様とうねりの再現 |
| Shader | Multiply (乗算) | A: Mix出力 / B: Base画像 | 黒い金具部分（RGB=0）を絶対に塗り潰さず透過・保持 |
| Render | Render Engine | Cycles | テクスチャベイク機能の有効化 |
| Bake | Bake Type | Diffuse | 表面色情報のベイク処理の選択 |
| Bake | Contributions | Direct: OFF / Indirect: OFF / Color: ON | ライティングや影を排除した純粋なカラーテクスチャの抽出 |
| Troubleshooting | Light Elimination | Delete または アウトライナー直接選択 | 非メッシュ選択によるベイクエラーの回避 |

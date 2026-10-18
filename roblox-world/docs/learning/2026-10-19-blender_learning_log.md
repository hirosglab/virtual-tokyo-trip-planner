# Blender Lantern UV Mapping Correction & Workflow Learning & Development Log

Blenderを用いた和風赤提灯（Lantern_Kaminarimon）の制作において、円筒状メッシュに対する効率的なUV展開手法（円筒投影 / リンク選択の活用）、および金具オブジェクト（kanagu_upper / kanagu_lower）との分離構造におけるテクスチャベイクとRoblox Studioでのマテリアル管理に関する学習記録です。

使用環境：
- Blender 5.2.2 LTS / Windows
- Roblox Studio（エクスポート対象環境）
- 目的：築地・東京プレゼン用ワールド（Roblox）に配置する伝統的な赤提灯アセットの構造最適化
- 制作対象：Lantern_Kaminarimon（提灯本体の赤地・竹ひご横線ベイク）および独立金具パーツ

---

## 📌 オブジェクト構造と分離方針

提灯アセット全体の3Dメッシュ構造と、Robloxインポート後の質感を最適化するための分離方針です。

### オブジェクト構造
```
 Scene Collection
 └── Collection
     ├── Camera
     ├── kanagu_upper (Mesh)
     ├── kanagu_lower (Mesh)
     └── Lantern_Kaminarimon (Mesh)
         ├── Shade Smooth (スムーズシェーディング適用)
         └── Material.002 (Shader Material: 赤地＋竹ひごテクスチャ)
```

### Robloxインポート・着色方針
- 提灯本体（Lantern_Kaminarimon）: プロシージャル生成した赤地と竹ひごの横線パターンをCyclesでベイクした1枚のテクスチャを適用。
- 上下の金具（kanagu_upper / kanagu_lower）: テクスチャ画像を使用せず独立したオブジェクトとして保持し、Roblox Studio上のTextureIDを空欄にした上で、プロパティのColorおよびMaterial（Metal等）で直接着色・質感を制御。

---

## 🔍 円筒投影（Cylinder Projection）による効率的なUV展開

複雑なシーム設定や手動展開で破綻しやすい円筒形状に対して、確実かつ歪みなく長方形のUVアイランドを生成する手順です。

### 1. 正面視点への切り替え
- 操作: 3Dビューポート上でキーボードの 1 キー（テンキーの1）を押し、真横（正面）からの平行投影視点に設定。

### 2. メッシュのリンク選択
- 操作: キーボードの 3 キーを押して「面選択モード」に変更し、提灯本体の面を1つクリックした後、 L キー（リンク選択）を押す。
- 効果: シームで区切られた提灯本体のメッシュ要素だけが1発で全選択され、不要な金具パーツへの選択拡張を防止。

### 3. 円筒投影の実行とUV整列
- 操作: キーボードの U キーを押し、メニューから Cylinder Projection（円筒投影） を選択。
- 調整: 左側のUVエディター画面で A キーによる全選択を行い、 S キーや S > X / S > Y を用いて、テクスチャグリッド内に綺麗に収まる長方形へサイズを整える。これにより、後続の波形テクスチャ（Wave Texture）が外周に沿って均一に巻き付く状態を確保。

---

## ⚙️ プロシージャル模様の最適化とベイク運用

上下の黒い金具を独立パーツとして切り離したことに伴い、提灯本体（Lantern_Kaminarimon）のテクスチャには純粋な「赤地＋竹ひご横線」のみを焼き付ける構成への刷新です。

### 1. シェーダーノード構成（本体専用）
- Texture Coordinate (UV) ➔ Wave Texture (Y / Scale: 6.000 / Distortion: 2.000) ➔ Color Ramp ➔ Mix Color (白と濃い赤の合成) ➔ Principled BSDF (Base Color)

### 2. ベイク用受け皿ノードの準備
- Image Texture ノードを新規作成し、T_Lantern_WireBaked（1024x1024等）をセット。
- 線はどこにも接続せず、該当ノードを選択（白枠のアクティブ状態）にしておく。

### 3. Cyclesによるベイク処理
- Render Engineを Cycles に変更し、Bake Type を Diffuse（Contributionsは Color のみ ON）に設定してベイクを実行。
- 焼き上がった画像を保存し、マテリアル構成を軽量化してEevee描画へ復元。

---

## 📋 学習項目および設定パラメータ一覧

| 区分 | 項目 / ノード | 設定値 / 操作 | 目的・効果 |
|---|---|---|---|
| UV | Cylinder Projection | U ➔ Cylinder Projection | 円筒状オブジェクトに対する歪みのない一括UV展開 |
| UV | Linked Selection | 編集モードで面選択後 L キー | シーム境界を活かした特定メッシュの一発全選択 |
| Shader | Wave Scale Adjustment | Scale: 6.000 | 提灯の竹ひご横線の本数・密度の最適化 |
| Workflow | Mesh Separation | kanagu_upper / lower の独立保持 | Robloxプロパティによる個別着色とテクスチャ軽量化 |
| Render | Cycles Bake (Color) | Diffuse / Color: ON (Direct/Indirect: OFF) | ライティングの影響を排除した純粋なカラーテクスチャの抽出 |

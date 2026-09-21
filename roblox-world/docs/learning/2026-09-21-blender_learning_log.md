# Blender Sushi Toro Advanced Learning & Development Log

Blenderの基本形状から進め、編集モード（Edit Mode）によるメッシュ加工、プロシージャルノード（Procedural Nodes）を用いた質感表現、そしてRobloxへの適用（テクスチャベイク）を視野に入れた発展的なモデリングおよびシェーディング手法の学習記録です。

使用環境：
- Blender 5.2.2 LTS
- Windows
- 目的：築地の旅行プレゼン用ワールド（Roblox）に浮かせる3D寿司デコレーションの制作
- 制作対象：トロ握り寿司（Sushi_Toro / Sushi_Rice）
- 方針：ローポリ寄りのキャッチーかつ立体的な造形と、シェーダーノードによる表現力の向上

---

## 📌 オブジェクト構造

現在構成されている3Dシーンの階層関係です。
```
  Scene Collection
  └── Collection
      ├── Camera
      ├── Light
      ├── Sushi_Rice
      │   ├── Noise Texture (Bump)
      │   └── アイボリー系Material
      │
      └── Sushi_Toro
          ├── Proportional Editing (変形加工)
          ├── Bevel Modifier
          └── Mat_Toro (Procedural Shader)
```
---

## 🔍 トロの形状加工：編集モードとプロポーショナル編集

直方体だった `Sushi_Toro` を、実際の握り寿司のように「シャリを覆うように自然に垂れ下がる形状」へ変形させる操作を学習しました。

### 1. タブキーによるモード切り替え
* **`Tab` キー**: オブジェクトモード（Object Mode）と編集モード（Edit Mode）を交互に切り替えます。
* 頂点（Vertex）・辺（Edge）・面（Face）を選択して形状を直接加工可能な状態にします。

### 2. ループカット：`Ctrl + R`
* メッシュに分割線（エッジループ）を挿入します。
* `Ctrl + R` を押し、マウスホイールをスクロールして分割数を増やし、クリックで位置を確定します。これにより、メッシュが滑らかに曲がるための関節（頂点群）を作成しました。

### 3. プロポーショナル編集（Proportional Editing）：`O`
* **機能**: 選択した頂点だけでなく、周囲の頂点も影響範囲に応じて滑らかに追従・連動して変形させる機能。
* **ショートカット**: `O` キーでオン/オフ切替。
* **影響範囲の調整**: 変形操作（`G` など）の最中に**マウスホイールをスクロール**することで、白色の円（影響範囲）の大きさを拡大・縮小できます。
* **応用**: トロの中央付近の頂点を選んで `G` ➔ `Z` で押し下げつつ、端を垂れ下がらせることで、有機的で自然な撓（たわ）みを表現しました。

---

## 🔍 シャリ（Sushi_Rice）の質感表現：凹凸（Bump）設定

単なる平滑な立方体から、米粒の集合体のような質感を表現するためにシェーダーノードでノイズを加える手法を学習しました。

### ノード構成（シャリ）
```
  [ Noise Texture ]
        │ (Factor)
        ▼
     [ Bump ]
        │ (Normal)
        ▼
  [ Principled BSDF ] ──▶ [ Material Output ]
```
### 設定パラメータと役割
* **Noise Texture (Scale: 15.000 / Detail: 5.000 / Roughness: 0.200)**: 表面にランダムな微細パターンを生成。
* **Bump (Strength: 0.100 / Distance: 0.050)**: 白黒のノイズ情報を法線（Normal）の凹凸情報に変換。Strengthを抑えることで、過剰なゴツゴツ感を防ぎ柔らかな米粒感を演出。
* **Principled BSDF (Base Color: アイボリー系 / Roughness: 0.200)**: ツヤ感をやや残したお米の質感を設定。

---

## 🔍 トロ（Sushi_Toro）のマテリアル：カラーランプと波形テクスチャ

プロシージャルノードを組み合わせ、トロの「赤身のベース色」と「脂身・筋の縞模様」を自動生成するシェーディング手法を学習しました。

### ノード構成（トロ）
```
  [ Texture Coordinate ]
        │ (Generated)
        ▼
     [ Mapping ] ── (Rotation Z: 30°〜45°)
        │ (Vector)
        ▼
  [ Wave Texture ] ── (Scale: 4.000 / Distortion: 2.000)
        │ (Factor)
        ▼
   [ Color Ramp ] ── (Color) ──▶ [ Principled BSDF ] ──▶ [ Material Output ]
        │ (Factor)
        ▼
     [ Bump ] ───── (Normal) ───▶ (Normal)
```
---

## ⚙️ 各ノードの機能とパラメータ設定

### 1. Wave Texture（波形テクスチャ）
* **役割**: 規則的な縞模様（ストライプ）を生成し、トロの「筋」のベースを作成します。
* **Scale (4.000)**: 筋の密度（本数）をコントロール。数値を上げると筋が増えて細くなります。
* **Distortion (2.000)**: 直線的な縞模様を少しうねらせ、自然な肉の筋表現に変化させます。

### 2. Texture Coordinate & Mapping（斜めの筋表現）
* **役割**: 模様の貼り付け位置や角度をコントロールします。
* **Rotation Z (30°〜45°)**: 垂直・水平に入っていた筋を斜めに傾け、本物のトロのような自然なラインを形成します。

### 3. Color Ramp（カラーランプ）
* **役割**: Wave Textureのグラデーション数値を「指定した2色のカラーコード」へ変換します。
* **配色の数値指定（Hexコード）**:
  * **赤身（ベース肉色）**: Hex `#D84343`（つまみ位置：左側）
  * **筋・脂身色**: Hex `#FAD0D0`（つまみ位置：右側・白寄りの薄ピンク）
* **調整のコツ**: 右側のつまみを左側のつまみへ近づける（寄せる）ことで、太かった帯状の模様が細くシャープな「筋」に切り替わります。

### 4. Bump（控えめな質感）
* **Strength (0.100)**: 凹凸の強さを極小に抑え、表面のゴツゴツ感を消して生魚らしいなめらかな質感に仕上げます。

---

## 💡 Robloxへのエクスポートと今後の課題（テクスチャベイク）

Roblox（Studio）へモデルを持ち込む際の技術的な仕様と注意点について確認しました。

1. **プロシージャルノードの非対応**
   * Blenderのノード（Wave TextureやColor Rampなど）で作成した複雑なテクスチャは、FBX形式等でそのまま書き出してもRoblox側には引き継がれず、単色になってしまいます。
2. **テクスチャベイク（Bake）の必要性**
   * RobloxでBlenderと同じ見た目を再現するには、ノードで生成した色や凹凸を1枚の画像ファイル（PNG等）に焼き付ける「ベイク（Bake）」処理を行い、UVマップに割り当てる必要があります。

---

## 📋 学習項目および設定パラメータ一覧

| 区分 | 項目 / ノード | 設定値 / ショートカット | 目的・効果 |
|---|---|---|---|
| Edit Mode | 編集モード切替 | Tab | メッシュの直接加工 |
| Edit Mode | ループカット | Ctrl + R | 曲げ加工用の分割線追加 |
| Edit Mode | プロポーショナル編集 | O (ホイールで範囲調整) | 自然な滑らかさでのネタの垂れ下がり表現 |
| Rice Shader | Noise Texture | Scale: 15.0 / Detail: 5.0 | 米粒のランダムな凸凹パターンの生成 |
| Rice Shader | Bump | Strength: 0.100 | シャリ表面の柔らかい立体感 |
| Toro Shader | Wave Texture | Scale: 4.0 / Distortion: 2.0 | トロの筋模様とうねりの生成 |
| Toro Shader | Mapping | Rotation Z: 30°〜45° | 筋のラインを斜めに傾ける |
| Toro Shader | Color Ramp (地の色) | Hex: D84343 | マグロ赤身の基本色指定 |
| Toro Shader | Color Ramp (筋の色) | Hex: FAD0D0 | 脂身・筋の薄ピンク色指定 |
| Toro Shader | Bump | Strength: 0.100 | 生魚の滑らかな質感（凹凸の低減） |

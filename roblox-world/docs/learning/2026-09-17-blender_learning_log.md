# Blender Sushi Toro Learning & Development Log

Blenderを初めて使い、基本操作を学びながら、Robloxで使用することを想定したローポリ寄りの握り寿司「Toro」の最初の3Dモデルを制作した記録です。

使用環境：

- Blender 5.2.2 LTS
- Windows
- 目的：Roblox向けの3Dモデル制作
- 制作対象：トロ握り寿司
- 方針：まずは複雑なモデリングを避け、基本的なCube操作から形を作る

---

## 📌 最初の状態

Blenderを起動すると、初期状態では以下のオブジェクトが配置されていました。

    Scene Collection
    └── Collection
        ├── Camera
        ├── Cube
        └── Light

最初はBlenderの基本操作そのものを理解することを優先し、初期配置されているCubeを使ってモデリングを開始した。

---

## 🔍 Blenderの基本操作

今回の制作を通して、まず以下の基本操作を学習した。

### 1. オブジェクトの移動：`G`

`G` は Grab / Move のショートカット。

オブジェクトを選択して `G` を押すと、3D空間内でオブジェクトを移動できる。

例えば、

    G → Z → 0.5 → Enter

とすると、Z軸方向へ0.5移動する。

今回のToroでは、シャリの上に載せるためにZ方向の位置調整に使用した。

---

### 2. オブジェクトの拡大・縮小：`S`

`S` は Scale のショートカット。

例えば、

    S → X → 1.2 → Enter

とすると、X軸方向だけ1.2倍に拡大できる。

同様に、

    S → Y → 0.85 → Enter
    S → Z → 0.45 → Enter

のように軸を指定することで、立方体を直方体へ変形できる。

今回の寿司制作では、この操作が基本的な形作りの中心になった。

---

### 3. 回転：`R`

`R` は Rotate のショートカット。

例えば、

    R → Z → 45 → Enter

とすると、Z軸を中心に45度回転する。

今回のToroでは大きな回転操作は行わなかったが、Blenderの基本的な変形操作として確認した。

---

## 📌 最初のシャリを作る

初期Cubeを寿司のシャリとして利用した。

オブジェクト名を、

    Sushi_Rice

とした。

立方体のままでは寿司のシャリらしくないため、各軸方向に異なる倍率でスケールした。

### 使用したScale

    X = 1.4
    Y = 0.85
    Z = 0.45

これにより、Cubeを横長で高さの低いシャリ形状に変形した。

---

## 🔍 Scaleによる3D形状の理解

3Dオブジェクトでは、X・Y・Zの3方向を独立して変形できる。

- X：左右方向
- Y：奥行き方向
- Z：高さ方向

したがって、

    S X 1.4

は横方向を1.4倍、

    S Y 0.85

は奥行きを0.85倍、

    S Z 0.45

は高さを0.45倍にする操作になる。

この操作によって、基本的な「箱型」の寿司形状を作ることができた。

---

## 📌 Scaleの適用：`Ctrl + A → Scale`

形状をScaleで変更した後、

    Ctrl + A → Scale

を実行した。

これは現在の見た目の大きさを、オブジェクトのScale値に依存しない「基準となるサイズ」として確定する操作。

### 学習したこと

Blenderでは、

「見た目の大きさ」

と

「オブジェクトが保持しているScale値」

は別の概念として存在する。

そのため、モデリングを進める際には、必要に応じてScaleを適用しておくことが重要だと理解した。

---

# 📌 シャリにBevelを追加

Cubeをそのまま使用すると、角が完全に直角になっている。

実際の寿司は角が丸みを帯びているため、Bevel Modifierを追加した。

    Sushi_Rice
    └── Bevel

設定：

    Width Type : Offset
    Amount     : 0.15 m
    Segments   : 3
    Limit Method : Angle
    Angle      : 30°

---

## 🔍 Bevelとは

Bevelは、3Dモデルの角を削って丸みや面取りを作る機能。

例えば完全なCubeでは、

    ┌────────┐
    │        │
    │        │
    └────────┘

のように角が鋭い。

Bevelを使用すると、

    ╭────────╮
    │        │
    │        │
    ╰────────╯

のように角に面取りが入る。

今回のような食品モデルでは、Bevelによって単純なCubeでも柔らかい形状を作ることができる。

---

## 🔍 Segmentsの意味

BevelのSegmentsは、角の丸みを何段階の面で表現するかを決める。

今回：

    Segments = 3

とした。

Segmentsを増やすほど滑らかな丸みになるが、同時にポリゴン数も増える。

今回はRoblox向けの比較的シンプルなモデルを想定しているため、まずは3程度から始める。

---

# 📌 シャリのマテリアル

シャリにはアイボリー系の色を設定した。

マテリアル名：

    Material

シャリは真っ白ではなく、米らしい薄いアイボリー系の色とした。

これによって、Viewport上でもToroとの区別がつきやすくなった。

---

# 📌 Toroオブジェクトを追加

次に、Toroをシャリとは別のCubeとして作成した。

オブジェクト名：

    Sushi_Toro

最初の構造は、

    Scene Collection
    └── Collection
        ├── Camera
        ├── Light
        ├── Sushi_Rice
        └── Sushi_Toro

となった。

ここで、1つのCubeを加工して寿司全体を作るのではなく、

    Sushi_Rice
    +
    Sushi_Toro

という2つのオブジェクトを組み合わせて寿司を構成する考え方を学んだ。

---

# 📌 Toroの基本形状

ToroもCubeをベースに作成した。

初期段階では、シャリとは異なる比率にするため、

    X方向：1.25
    Y方向：0.75
    Z方向：0.35

を基本としてスケールした。

Toroはシャリの上に載せるため、Z方向へ移動した。

    G → Z → 0.55

これにより、Toroがシャリの上側に位置する基本配置を作った。

---

## 🔍 Toroの形状調整

Toroは単純な薄い直方体ではなく、寿司ネタとしてシャリを覆う形に近づける必要がある。

そのため、以下のようなScale操作を行いながら形状を調整した。

- Z方向を縮めてネタを薄くする
- X方向を拡大してシャリを覆う長さに近づける
- シャリとの位置関係を確認する
- Perspective Viewから立体的な見え方を確認する

最終的にX方向について、

    Scale X = 1.2

となる状態まで調整した。

---

# 📌 ToroにもBevelを追加

Toroもシャリと同じく、Cubeの鋭い角をそのまま残さないようにBevel Modifierを追加した。

設定：

    Width Type : Offset
    Amount     : 0.15 m
    Segments   : 3
    Limit Method : Angle
    Angle      : 30°

これにより、Toroの角にも丸みが加わった。

---

# 📌 Toroとシャリの位置関係

最初のモデルでは、

    Sushi_Toro
    ─────────────
       Sushi_Rice
    ────────────

という基本的な上下関係を作った。

実際の握り寿司では、Toroはシャリの上に単純に置かれているだけではなく、シャリより少し長く、左右方向にネタが覆いかぶさるような形になる。

そのため、ToroのX方向の長さを調整し、シャリより長く見えるようにした。

---

## 🔍 3Dモデルを見る方向の重要性

Front Orthographic Viewだけで確認すると、

    Sushi_Toro
    ─────────
    Sushi_Rice
    ────────

のような平面的な関係しか分からない。

そこでPerspective Viewに切り替え、斜め方向から確認した。

Perspective Viewでは、

- Toroの厚み
- シャリとの重なり
- 前後方向の位置
- Bevelによる丸み
- Toroがシャリを覆っているように見えるか

などを確認できる。

今回の制作を通して、3Dモデリングでは一方向だけでなく複数の視点から確認することが重要だと学んだ。

---

# 📌 Toroのマテリアル

Toroに専用マテリアルを作成した。

マテリアル名：

    Mat_Toro

Base Colorを赤系に設定した。

ViewportをMaterial Previewで確認すると、Toroが赤色になり、シャリとの区別が明確になった。

構造としては、

    Sushi_Rice
        └── アイボリー系マテリアル

    Sushi_Toro
        └── Mat_Toro
            └── 赤系Base Color

となった。

---

# 🔍 MaterialとBase Color

Blenderでは、オブジェクトそのものに直接「赤」という情報を持たせるのではなく、Materialを作成して、そのMaterialのSurface設定を変更する。

今回使用した基本的な考え方：

    Object
      ↓
    Material
      ↓
    Principled BSDF
      ↓
    Base Color

Principled BSDFはBlenderで一般的に使用されるシェーダーで、色だけでなく、

- Metallic
- Roughness
- Alpha
- IOR
- Specular
- Transmission

など、材質に関係するさまざまな設定をまとめて扱うことができる。

今回はまずBase Colorを変更するところから学習した。

---

# 📌 最初のToroモデル

ここまでの作業によって、最初のToroモデルが完成した。

    Scene Collection
    └── Collection
        ├── Camera
        ├── Light
        ├── Sushi_Rice
        │   ├── Bevel
        │   └── アイボリー系Material
        │
        └── Sushi_Toro
            ├── Bevel
            └── Mat_Toro
                └── 赤系Base Color

見た目としては、

    ╭────────────────────╮
    │      TORO          │
    ╰────────────────────╯
       ╭──────────────╮
       │     RICE     │
       ╰──────────────╯

というシンプルな2オブジェクト構成になった。

現時点ではリアルな寿司を完全に再現することが目的ではなく、

「Cube → 基本形状 → Bevel → 配置 → Material」

というBlenderの基本的な制作ワークフローを実際に体験することができた点が重要。

---

# 🧠 今回学習したBlenderの基本概念

## 1. Object

3D空間に存在する個々のモデル。

今回：

    Sushi_Rice
    Sushi_Toro

---

## 2. Transform

オブジェクトの位置・回転・大きさを管理する基本情報。

主な項目：

    Location
    Rotation
    Scale

今回使用した主なショートカット：

    G = 移動
    R = 回転
    S = 拡大・縮小

---

## 3. Modifier

オブジェクトの形状に追加の加工を行う仕組み。

今回使用したModifier：

    Bevel

---

## 4. Material

オブジェクトの材質や色を設定する仕組み。

今回：

    Sushi_Rice → アイボリー系
    Sushi_Toro → Mat_Toro / 赤系

---

## 5. Viewport

3Dモデルを作成・確認する作業画面。

今回確認した主な表示方法：

    Front Orthographic View
    Perspective View
    Material Preview

特にPerspective Viewを使うことで、2D的な見え方だけでは判断できない立体的な形状を確認できた。

---

# 💡 今回の制作から理解したこと

### 1. Blenderは最初から複雑なモデリングをする必要がない

最初はCubeしかなかったが、

    Cube
      ↓
    Scale
      ↓
    Bevel
      ↓
    Material
      ↓
    Position調整

という単純な工程だけでも、寿司として認識できる形を作ることができた。

---

### 2. 3Dモデルは複数の単純なオブジェクトを組み合わせて作れる

今回の寿司は、

    シャリ = Sushi_Rice
    ネタ   = Sushi_Toro

という2つのオブジェクトから構成した。

この考え方は、今後より複雑なRoblox用モデルを作る際にも基本となる。

---

### 3. Bevelはローポリモデルでも非常に重要

単純なCubeでもBevelを加えることで、硬い箱型の印象から柔らかい食品のような形へ近づけることができた。

特にRoblox向けのシンプルなモデルでは、細かい形状を大量にモデリングするより、

    シンプルな形状
    +
    適切なBevel
    +
    Material

という方法が有効であることを実感した。

---

### 4. モデリングでは「見た目」と「数値」の両方を見る

今回、

    Scale
    Location
    Bevel Amount
    Segments

などの数値を変更しながら、実際のViewportで形状を確認した。

つまり、

    数値を設定
        ↓
    3D形状を確認
        ↓
    違和感を発見
        ↓
    数値を調整
        ↓
    再確認

という反復作業がBlenderでの基本的な制作方法になる。

---

# 📋 今回の学習項目一覧

| 項目 | 学習内容 | Sushi_Toroでの使用 |
|---|---|---|
| Object | 3Dオブジェクトの基本 | Sushi_Rice / Sushi_Toro |
| G | オブジェクト移動 | ToroのZ位置調整 |
| S | オブジェクトの拡大・縮小 | シャリ・Toroの形状作成 |
| R | オブジェクト回転 | 基本操作として確認 |
| Ctrl + A → Scale | Scaleの適用 | シャリの形状確定 |
| Modifier | 非破壊的な加工 | Bevel |
| Bevel | エッジの面取り・丸み | シャリ / Toro |
| Segments | Bevelの分割数 | 3 |
| Material | 材質設定 | シャリ / Toro |
| Base Color | 基本色 | Toroを赤色に設定 |
| Perspective View | 立体的な確認 | Toroとシャリの位置関係確認 |
| Orthographic View | 正投影での確認 | 正面形状の確認 |

---

# 🎯 現在のモデル

現在は、以下の2オブジェクトからなる最初のToroモデルまで到達した。

    Sushi_Rice
        ↓
    アイボリー系
        ↓
    Bevel

    Sushi_Toro
        ↓
    赤系 Mat_Toro
        ↓
    Bevel
        ↓
    Sushi_Riceの上に配置

現段階ではまだ完成品ではなく、今後、

- Toroの形状をより寿司らしくする
- シャリとToroの接触・覆い方を調整する
- 色や質感を調整する
- 必要に応じてより細かな形状を追加する
- RobloxへのExportを検討する

という発展が可能。

まずは「Blenderの基本操作だけで、Cubeから最初の寿司モデルを作る」という第一段階を完了した。

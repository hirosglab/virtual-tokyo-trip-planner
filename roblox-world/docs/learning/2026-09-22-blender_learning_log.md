# Blender Sushi Toro Texture Bake & FBX Export Learning & Development Log

Blenderで構築したプロシージャルノードによる質感表現（色・筋・凹凸）を、Robloxなどの外部エンジンで利用できるように画像テクスチャへ焼き付ける「ベイク（Bake）」処理と、FBX形式でのエクスポート手順の学習記録です。
```
使用環境
　Blender 5.2.2 LTS
　Windows
　目的：築地の旅行プレゼン用ワールド（Roblox）に浮かせる3D寿司デコレーションの制作
　制作対象：トロ握り寿司（Sushi_Toro / Sushi_Rice）
　方針：プロシージャルノードの色・凹凸を画像テクスチャへ焼き付け、マテリアルを統合してFBX形式で出力
```
## 📌 オブジェクト構造とベイク準備

テクスチャベイクを実行する直前のシーン構成およびUV展開状態です。
```
Scene Collection
  Collection
    Camera
    Light
    Sushi_Rice
      UV Unwrapping (スマートUV投影)
    Sushi_Toro
      UV Unwrapping (シームをマーク -> 展開)
```
## 🔍 UV展開とベイク用ノードの設定

プロシージャルノードで作成した色や凹凸を単一の画像テクスチャ（PNG）として焼き付ける（ベイクする）ための前準備手法を学習しました。

### 1. UVシームのマークと展開（Unwrap）
Mark Seam（シームをマーク）：3Dモデルのメッシュを2D平面に切り開くための「切れ目（縫い目）」を指定します。編集モード（Edit Mode）でエッジを選択し、右クリックメニューから Mark Seam を実行します。
Unwrap（展開）：A キーで全選択後、U -> Unwrap を実行してメッシュを平面上に展開します。
スマートUV投影（Smart UV Project）：Sushi_Rice のような複雑な形状の場合、U -> Smart UV Project を使用して自動的に角度に基づいて切り分け、展開を完了させます。

### 2. ベイク用 Image Texture ノードの配置
ベイク先の作成：Shader Editor上で Shift + A -> Texture -> Image Texture を追加します。
新規テクスチャ作成：ノードの New ボタンを押し、解像度（例: 1024x1024 / 2048x2048）を指定して空の画像を作成します。
アクティブ状態の保持：この Image Texture ノードをどのノードにも接続せず、選択状態（黄色い枠がついた状態）にしておくことで、ベイク結果の出力先として指定されます。

## 🔍 テクスチャベイクの実行手順（Cycles）

Blender内蔵のCyclesレンダラーを利用して、シェーダーノードの情報を画像へ変換する操作手順を学習しました。

### 1. レンダリングエンジンの切り替え
Render Properties タブで Render Engine を Eevee から Cycles へ変更します（※ベイク機能はCyclesでのみ動作します）。

### 2. ベイクタイプの設定と実行
Diffuse（ディフューズ）ベイク：
Bake Type を Diffuse に設定。Contribution の Direct と Indirect のチェックを外し、Color のみを有効にすることで、照明の影響を受けない純粋なベースカラーテクスチャを書き出します。Bake ボタンを押して処理を実行します。

Roughness / Normal ベイク：
同様に Bake Type を Roughness や Normal に切り替えて順次ベイクを実行し、それぞれのマップを画像として保存（Image -> Save As）します。

## 💡 FBX形式でのエクスポートとRoblox読み込み

ベイクしたテクスチャを標準的なプリンシプルBSDF（Principled BSDF）の Base Color 等に割り当て直し、Roblox Studioに持ち込む手順を確認しました。

1. マテリアルノードの書き換え
   ベイク用に作成した各種ノード（Wave TextureやColor Rampなど）を取り外し、ベイク画像（PNG）を接続したシンプルかつ標準的なマテリアル構成に変更します。
2. FBX出力設定
   File -> Export -> FBX (.fbx) を選択。
   Include: Selected Objects にチェックを入れ、カメラやライトを除外。
   Transform: Apply Transform にチェックを入れてスケールや回転のズレを防ぎます。
3. Roblox Studioへのインポート
   Asset Manager または 3D Importer を使用してFBXを読み込み、ベイクしたPNGテクスチャを SurfaceAppearance や ColorMap に割り当てて適用を完了させます。

## 📋 学習項目および設定パラメータ一覧

| 区分 | 項目 / 操作 | 設定値 / ショートカット | 目的・効果 |
|---|---|---|---|
| UV Editor | シームのマーク | 右クリック -> Mark Seam | メッシュを平面に切り開く縫い目の設定 |
| UV Editor | UV展開 | U -> Unwrap | 3D表面を2D平面にマップ化 |
| UV Editor | スマートUV投影 | U -> Smart UV Project | 複雑な形状の自動UV分割展開 |
| Shader Editor | ベイク用テクスチャノード | Shift + A -> Image Texture | 焼き付け先画像の受け皿を作成 |
| Render Settings | レンダラー変更 | Render Engine: Cycles | ベイク機能の使用可能化 |
| Bake Settings | ディフューズベイク | Bake Type: Diffuse (Colorのみ) | 純粋な表面色テクスチャの抽出 |
| Bake Settings | ノーマルベイク | Bake Type: Normal | 凹凸情報の法線マップ画像化 |
| Export | FBXエクスポート | File -> Export -> FBX | Roblox等の外部エンジン用フォーマット書き出し |

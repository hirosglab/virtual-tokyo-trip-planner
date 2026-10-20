# Blender Lantern UV Mapping Correction & Workflow Learning & Development Log

Blenderを用いた和風赤提灯（Lantern_Kaminarimon）の制作において、円筒状メッシュに対する効率的なUV展開手法（円筒投影 / リンク選択の活用）、および金具オブジェクト（kanagu_upper / kanagu_lower）との分離構造におけるテクスチャベイクとRoblox Studioでのマテリアル管理に関する学習記録です。

使用環境：
- Blender 5.2.2 LTS / Windows
- Roblox Studio（エクスポート対象環境）
- 目的：築地・東京プレゼン用ワールド（Roblox）に配置する伝統的な赤提灯アセットの構造最適化
- 制作対象：Lantern_Kaminarimon（提灯本体の赤地・竹ひご横線ベイク）および独立金具パーツ


## 📌 オブジェクト構造と分離方針

提灯アセット全体の3Dメッシュ構造と、Robloxインポート後の質感を最適化するための分離方針です。
```
オブジェクト構造
  Scene Collection
  └── Collection
      ├── Camera
      ├── kanagu_upper (Mesh)
      ├── kanagu_lower (Mesh)
      └── Lantern_Kaminarimon (Mesh)
          ├── Shade Smooth (スムーズシェーディング適用)
          └── Material.002 (Shader Material: 赤地＋竹ひごテクスチャ)
```
Robloxインポート・着色方針
- 提灯本体（Lantern_Kaminarimon）: プロシージャル生成した赤地と竹ひごの横線パターンをCyclesでベイクした1枚のテクスチャを適用。
- 上下の金具（kanagu_upper / kanagu_lower）: テクスチャ画像を使用せず独立したオブジェクトとして保持し、Roblox Studio上のTextureIDを空欄にした上で、プロパティのColorおよびMaterial（Metal等）で直接着色・質感を制御。


## 🔍 円筒投影（Cylinder Projection）による効率的なUV展開

複雑なシーム設定や手動展開で破綻しやすい円筒形状に対して、確実かつ歪みなく長方形のUVアイランドを生成する手順です。

1. 正面視点への切り替え
- 操作: 3Dビューポート上でキーボードの 1 キー（テンキーの1）を押し、真横（正面）からの平行投影視点に設定。

2. メッシュのリンク選択
- 操作: キーボードの 3 キーを押して「面選択モード」に変更し、提灯本体の面を1つクリックした後、 L キー（リンク選択）を押す。
- 効果: シームで区切られた提灯本体のメッシュ要素だけが1発で全選択され、不要な金具パーツへの選択拡張を防止。

3. 円筒投影の実行とUV整列
- 操作: キーボードの U キーを押し、メニューから Cylinder Projection（円筒投影） を選択。
- 注意点と解決策: Cylinder Projectionを実行した際に線状に潰れてしまうのは、投影の計算基準やスケールが極端に縮小されている状態が原因です。実行直後に画面の左下に小さく表示されるポップアップメニュー（または F9 キー）を確認し、「Scale to Bounds（境界に合わせる）」にチェックを入れます。これにより、UVエディターの枠内に綺麗に展開されます。
- 調整: Left側のUVエディター画面で A キーによる全選択を行い、 S キーや S > X / S > Y を用いて整える。


## ⚙️ プロシージャル模様の最適化とベイク運用

上下の黒い金具を独立パーツとして切り離したことに伴い、提灯本体（Lantern_Kaminarimon）のテクスチャには純粋な「赤地＋竹ひご横線」のみを焼き付ける構成への刷新です。

1. シェーダーノード構成の詳細
- Texture Coordinate ノードを追加。
- Wave Texture（波形テクスチャ） ノードを追加。Texture Coordinate の UV 出力を、Wave Texture の Vector 入力に接続。
- Wave Texture パラメータ設定: 方向は Y、Scale は 20.000、Distortion は 2.000、Detail は 2.000。
- Color Ramp（カラーランプ） ノードを追加。Wave Texture の Color（または Factor）を Color Ramp の Fac に接続し、白と黒のグラデーションの境界を縮めてはっきりした横線になるように調整。
- Mix Color（カラーミックス） ノードを追加。演算モードを Mix にし、Factor 入力に Color Ramp の Color を接続。A（色1）は白（竹ひごの色）、B（色2）は鮮やかな赤（#D80000 など）を設定。

2. ベイク用受け皿ノードの準備
- Image Texture ノードを新規作成し、T_Lantern_WireBaked（1024x1024等）をセット。
- 線はどこにも接続せず、該当ノードを選択（白枠のアクティブ状態）にしておく。

3. Cyclesによるベイク処理
- Render Engineを Cycles に変更し、Bake Type を Diffuse（Contributionsは Color のみ ON）に設定してベイクを実行。
- 焼き上がった画像を保存し、マテリアル構成を軽量化してEevee描画へ復元。


## 🛠️ 金具パーツ（kanagu_lower等）の空洞化・傾き対策

Robloxエクスポート時に下部金具パーツなどが中身空洞（裏面カリングによる透過）に見えたり、大きく傾いてしまう現象へのBlender側での検証と修正手順です。

1. 中身が空洞（透明）に見える原因と修正方法
- 原因: 面（ポリゴン）の向き（法線/Normal）が裏返っているため、Roblox等のバックフェイスカリングにより裏面が描画されず透明になってしまっている。
- 修正手順: オブジェクトを選択して Tab キーで編集モードに入り、A キーで全選択後、Shift + N を押して「Recalculate Outside（外側に再計算）」を実行し表面の向きを統一する。必要に応じてモディファイアーから「Solidify（厚み付け）」を適用する。

2. 横に傾いて（回転して）配置される原因と修正方法
- 原因: トランスフォーム（Rotation/Scale）の未適用や、複数オブジェクト間における原点（Origin）のズレ。
- 修正手順: オブジェクトモードで該当パーツを選択し、Ctrl + A から「All Transforms（全トランスフォームを適用）」を実行して回転やスケールを初期化（Freeze）する。また、必要に応じて複数パーツ全体の原点を統一する。


## 📋 学習項目および設定パラメータ一覧

| 区分 | 項目 / ノード | 設定値 / 操作 | 目的・効果 |
|---|---|---|---|
| UV | Cylinder Projection | U ➔ Cylinder Projection (Scale to Bounds ON) | 円筒状オブジェクトに対する歪みのない一括UV展開と潰れの防止 |
| UV | Linked Selection | 編集モードで面選択後 L キー | シーム境界を活かした特定メッシュの一発全選択 |
| Shader | Wave Texture Config | Direction: Y / Scale: 20.000 / Distortion: 2.000 / Detail: 2.000 | 提灯の竹ひご横線の本数・密度の最適化 |
| Workflow | Mesh Separation & Transform Fix | kanaguの独立保持 / Ctrl + A (All Transforms) | Robloxプロパティによる個別着色と姿勢・向きの正常化 |
| Render | Cycles Bake (Color) | Diffuse / Color: ON (Direct/Indirect: OFF) | ライティングの影響を排除した純粋なカラーテクスチャの抽出 |

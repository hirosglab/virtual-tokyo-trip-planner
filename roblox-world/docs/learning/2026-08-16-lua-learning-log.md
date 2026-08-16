# Roblox Lua Learning & Development Log

Luaの基本文法と開発知見の整理ログです。


## 📌 該当コード
```lua　
for _, object in ipairs(workspace:GetDescendants()) do
  setupBoard(object)
end
```
## 🔍 構成要素の詳細説明

### 1. 汎用for文（Generic For Loop）と `ipairs`
配列（テーブル）の全要素を順番に走査するための基本構文です。

    for index, value in ipairs(targetTable) do
        -- 繰り返し処理
    end

* **ipairs(...) ** : リストを1つずつ取り出せる状態にする。
* **`_`（アンダースコア）**: ループのインデックス（何番目かを表す数値）を使用せず、要素本体（オブジェクト）のみを扱う場合、慣習として変数名を `_` と表記します。
* **ループ変数のスコープ（有効範囲）** : 自動的にローカル変数になる: for の直後に記述した変数（_ や data など）は、明示的に local をつけなくてもスコープ（有効範囲）が for ... end の内部のみに制限されます。


### 2. オブジェクトツリーの走査（`GetChildren` vs `GetDescendants`）

* **`GetChildren()`**: 指定したオブジェクトの**直下（1階層目）**の子要素のみを取得。
* **`GetDescendants()`**: ネストされた配下の**全階層（子・孫要素すべて）**を再帰的に全取得。

## 📌 該当コード

```lua
if string.sub(shopBoard.Name, 1, #TARGET_NAME_PREFIX) ~= TARGET_NAME_PREFIX then
    return
end
```

---

## 🔍 構成要素の詳細説明

### 1. オブジェクト名の取得：`shopBoard.Name`
* **意味**: 引数として渡されたオブジェクト（`shopBoard`）のプロパティである `Name`（名前）を取得します。
* **例**: オブジェクトの名前が `"ShopBoard_01_Teppanyaki10"` の場合、文字列 `"ShopBoard_01_Teppanyaki10"` が得られます。

---

### 2. 文字列切り出し関数：`string.sub(s, i, j)`
指定した文字列から一部を切り出すLuaの標準関数です。

* **第1引数 (`s`)**: 対象となる文字列（`shopBoard.Name`）
* **第2引数 (`i`)**: 切り出しの開始位置（`1` = 1文字目から）
* **第3引数 (`j`)**: 切り出しの終了位置（`#TARGET_NAME_PREFIX` = プレフィックスの文字数まで）

#### 長さ取得演算子 `#`
* **`#TARGET_NAME_PREFIX`**: 文字列の前に `#` を付けると、その文字列の長さ（文字数）を返します。
* **具体例**: `TARGET_NAME_PREFIX = "ShopBoard_"` の場合、文字数は `10` となります。
* **結果**: `string.sub(shopBoard.Name, 1, 10)` と同義になり、**「オブジェクト名の先頭1文字目から10文字目まで」** を切り出します。

---

### 3. 比較演算子：`~=`
* **意味**: **「等しくない（Not Equal）」** を表す比較演算子です。（※他言語での `!=` に相当します）
* **挙動**: 左辺と右辺の値が一致しない場合に `true` を返し、一致する場合に `false` を返します。

---

## ⚙️ 処理全体の流れ（ステップバイステップ）

1. **名前の先頭部分を抽出**:
   `shopBoard.Name` の先頭から `TARGET_NAME_PREFIX` と同じ文字数分だけ文字列を切り出します。
2. **プレフィックスとの比較**:
   切り出した文字列が `TARGET_NAME_PREFIX`（例: `"ShopBoard_"`）と一致するかどうかを比較演算子 `~=` で判定します。
3. **一致しない場合の脱出 (`return`)**:
   先頭文字列が一致しない場合（`true` の場合）、`return` が実行されて関数の処理をその時点で即座に終了します（早期リターン）。これにより、関係のないパーツやモデルの初期化処理がスキップされます。

---

## 📌 該当コード

```lua
local surfacePart = shopBoard:WaitForChild("Center_Display_Surface", 5)
if not surfacePart then return end

local surfaceGui = surfacePart:WaitForChild("SurfaceGui_Front", 5)
if not surfaceGui then return end

local frame = surfaceGui:WaitForChild("PopUp_Info_Frame", 5)
if not frame then return end
```

---

## 🔍 構成要素の詳細説明

### 1. タイムアウト付き子要素の待機：`WaitForChild("要素名", タイムアウト秒数)`

`WaitForChild` は、指定した名前の子要素が生成・読み込まれるまで処理を一時待機するRoblox専用の関数です。

* **第1引数**: 検索・待機したい子要素の名前（文字列）
* **第2引数（重要）**: **タイムアウト時間（秒）**
  * 第2引数を省略すると、要素が見つからない場合に**永久に処理が停止（無限待機）**し、StudioのOutputに警告が出続けます。
  * `5` を指定することで、**「最大5秒間探して見つからなければ `nil`（空）を返して次へ進む」** という安全な挙動になります。

---

### 2. 否定演算子とガード節：`if not 変数 then return end`

取得した変数が正常にセットされたかをチェックし、取得失敗（`nil`）時に処理を打ち切るテクニックです。

* **`not`（否定演算子）**: 
  * 値が `nil` または `false` の場合に `true` に反転します。
  * `if not surfacePart then` は **「もし `surfacePart` が取得できていない（`nil` である）ならば」** という条件判定になります。
* **`return`**: 
  * 条件が成立した時点で関数を即座に終了します。
  * これにより、後続のコードで `nil.SurfaceGui_Front` のような参照エラー（いわゆる Null Pointer エラー）が発生してスクリプト全体が落ちるのを防ぎます。

---

## ⚙️ 階層検索のステップバイステップ

1. **`Center_Display_Surface`（3Dパーツ）を待機**:
   看板モデル（`shopBoard`）内に `Center_Display_Surface` が出現するのを最大5秒待ちます。5秒経っても存在しなければ `return` して処理を中断します。
2. **`SurfaceGui_Front`（UIコンテナ）を待機**:
   `surfacePart` の直下に `SurfaceGui_Front` が出現するのを最大5秒待ちます。存在しなければ `return` します。
3. **`PopUp_Info_Frame`（UIフレーム）を待機**:
   `surfaceGui` の直下に `PopUp_Info_Frame` が出現するのを最大5秒待ちます。存在しなければ `return` します。

---

## 💡 メリット（なぜこの書き方が良いのか）

* **非同期読み込みへの対応**: クライアント側（LocalScript）では、サーバーから3DモデルやUIのデータが届くまでに若干のタイムラグが生じます。`WaitForChild` を使うことで、読み込み完了前に処理が走ってエラーになるのを防げます。
* **無限フリーズの防止**: タイムアウト（`5`）を設定しているため、万が一パーツの命名ミスやモデルの破損があっても、スクリプトが無限に停止することがありません。
* **可読性の向上**: `if` 文を何重にもネスト（深掘り）させず、`if not ... then return end` を上から順に並べる「ガード節」スタイルにすることで、コードが非常に読みやすくなります。

## 📌 該当コード

```lua
RunService.Heartbeat:Connect(function()
    local character = player.Character
    if not character then return end
    
    local hrp = character:FindFirstChild("HumanoidRootPart")
    if not hrp then return end

    -- 登録されているすべてのボードに対して距離判定
    for _, data in ipairs(boardsData) do
        local distance = (hrp.Position - data.surfacePart.Position).Magnitude
        
        if distance <= TRIGGER_DISTANCE and not data.isOpen then
            data.isOpen = true
            data.frame.Visible = true
        elseif distance > TRIGGER_DISTANCE and data.isOpen then
            data.isOpen = false
            data.frame.Visible = false
        end
    end
end)
```

---

## 🔍 構成要素の詳細説明

### 1. 毎フレーム実行イベント：`RunService.Heartbeat`
* **`RunService`**: ゲームの物理演算やフレーム処理のタイミングを制御するRoblox標準サービスです。
* **`Heartbeat`**: 物理演算（物理シミュレーション）が計算された直後、**毎フレーム（通常1秒間に約60回）発火するイベント**です。
* **`:Connect(function() ... end)`**: イベントが発火するたびに実行する匿名関数（コールバック関数）を接続・登録します。

---

### 2. プレイヤー位置の取得と安全策（Guard Clauses）

```lua
local character = player.Character
if not character then return end

local hrp = character:FindFirstChild("HumanoidRootPart")
if not hrp then return end
```

* **`player.Character`**: プレイヤーが操作する3Dキャラクターのアバターモデルを取得します。
* **`HumanoidRootPart` (HRP)**: キャラクターの位置の中心（腰付近）となる透明な3Dパーツです。キャラクターの位置座標を取得する際の標準的な参照先となります。
* **`FindFirstChild` と `not ... return`**: プレイヤーがまだスポーンしていない時やリスポーン（死亡時）の瞬間は、`Character` や `HumanoidRootPart` が `nil`（存在しない）状態になります。この時に位置計算を行おうとするとエラーが発生するため、`nil` の場合は即座に処理を中断して安全に回避します。

---

### 3. 距離計算：`(Position A - Position B).Magnitude`

```lua
local distance = (hrp.Position - data.surfacePart.Position).Magnitude
```

* **`hrp.Position`**: プレイヤーの現在位置（`Vector3` 座標：$X, Y, Z$）
* **`data.surfacePart.Position`**: 看板の中心パーツの現在位置（`Vector3` 座標）
* **`Vector3` の引き算**: 2点間の方向ベクトルを算出します。
* **`.Magnitude`**: ベクトルの「大きさ（長さ）」を返します。つまり、**プレイヤーと看板の直線距離（単位：Studs）** が数値として取得できます。

---

### 4. 条件分岐によるUI表示切り替え

```lua
if distance <= TRIGGER_DISTANCE and not data.isOpen then
    data.isOpen = true
    data.frame.Visible = true
elseif distance > TRIGGER_DISTANCE and data.isOpen then
    data.isOpen = false
    data.frame.Visible = false
end
```

毎フレーム距離をチェックし、**「状態が変化した瞬間だけ」** UIの表示・非表示を切り替えます。

* **表示判定 (`distance <= TRIGGER_DISTANCE and not data.isOpen`)**:
  * 距離が `TRIGGER_DISTANCE`（8 Studs）以内になり、かつ **「まだ開いていない状態（`isOpen == false`）」** の場合に発火します。
  * `isOpen = true` に更新し、UIフレームを表示（`Visible = true`）にします。
* **非表示判定 (`distance > TRIGGER_DISTANCE and data.isOpen`)**:
  * 距離が 8 Studs より遠くなり、かつ **「現在開いている状態（`isOpen == true`）」** の場合に発火します。
  * `isOpen = false` に更新し、UIフレームを非表示（`Visible = false`）にします。

---

## 💡 フラグ管理（`data.isOpen`）を行っている理由

もし `and not data.isOpen` や `and data.isOpen` などの状態チェックを行わず、単に `distance <= 8` のとき毎回 `Visible = true` を実行してしまうと、**毎秒60回も表示更新処理やTweenアニメーションが再呼び出しされ、動作が重くなったりアニメーションがガタついたりする原因**になります。

`isOpen` というフラグを持たせることで、**「範囲内に入った最初の1回」** と **「範囲外に出た最初の1回」** だけ処理を実行する効率的な作りにしています。

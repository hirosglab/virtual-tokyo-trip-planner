````
# Roblox Lua Learning & Development Log

Luaの基本文法と開発知見の整理ログです。

---

## 📌 Lua文法・概念

```lua
for _, object in ipairs(workspace:GetDescendants()) do

setupBoard(object)

end 
```

### 1. 汎用for文（Generic For Loop）と `ipairs`
配列（テーブル）の全要素を順番に走査するための基本構文です。

    for index, value in ipairs(targetTable) do
        -- 繰り返し処理
    end

* **ipairs(...) ** : リストを1つずつ取り出せる状態にする。
* **`_`（アンダースコア）**: ループのインデックス（何番目かを表す数値）を使用せず、要素本体（オブジェクト）のみを扱う場合、慣習として変数名を `_` と表記します。

---

### 2. オブジェクトツリーの走査（`GetChildren` vs `GetDescendants`）

* **`GetChildren()`**: 指定したオブジェクトの**直下（1階層目）**の子要素のみを取得。
* **`GetDescendants()`**: ネストされた配下の**全階層（子・孫要素すべて）**を再帰的に全取得。

````
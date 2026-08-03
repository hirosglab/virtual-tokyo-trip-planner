---
title: "Roblox Workspace Hierarchy & Naming Conventions"
type: "workspace-structure"
status: "active"
tags:
  - roblox-studio
  - workspace
  - naming-convention
links:
  - "../object-deployment-plan.md"
  - "./info-board-featured-spots.md"
description: "Roblox Studio の Workspace 内におけるフォルダ階層構造およびオブジェクトの命名規則定義書"
---

# Roblox Workspace Hierarchy

## 📁 Workspace Folder Tree
~~~
Workspace
│
├── 📁 Featured_Sightseeing_Spots_Boards
│   ├── 📄 InfoBoard_01_Kabukicho
│   ├── 📄 InfoBoard_02_OmoideYokocho
│   ├── 📄 InfoBoard_03_ShinjukuEastExit
│   ├── 📄 InfoBoard_04_TakeshitaStreet
│   ├── 📄 InfoBoard_05_MeijiJingu
│   ├── 📄 InfoBoard_06_OmotesandoAvenue
│   ├── 📄 InfoBoard_07_ShibuyaSky
│   ├── 📄 InfoBoard_08_ShibuyaCrossing
│   ├── 📄 InfoBoard_09_ShibuyaCenterGai
│   ├── 📄 InfoBoard_10_TsukijiOuterMarket
│   ├── 📄 InfoBoard_11_GinzaStreet
│   ├── 📄 InfoBoard_12_AkihabaraElectricTown
│   ├── 📄 InfoBoard_13_Sensoji
│   ├── 📄 InfoBoard_14_SumidaRiver
│   ├── 📄 InfoBoard_15_TokyoStation
│   ├── 📄 InfoBoard_16_ImperialPalace
│   ├── 📄 InfoBoard_17_ShinbashiUnderpass
│   └── 📄 InfoBoard_18_AzabuArea
│
├── 📁 Specific_Shop_Boards
│   ├── 📄 ShopBoard_01_AnimateIkebukuro
│   ├── 📄 ShopBoard_02_TeamLabBorderless
│   ├── 📄 ShopBoard_03_DashiOkume
│   ├── 📄 ShopBoard_04_MyPigCafe
│   ├── 📄 ShopBoard_05_TokyoCharacterStreet
│   └── 📄 ShopBoard_06_AkihabaraRadioKaikan
│
├── 📁 Iconic_Major_Landmarks_Objects
│   ├── 📄 Landmark_01_KabukichoArch
│   ├── 📄 Landmark_02_ShibuyaCenterGaiArch
│   ├── 📄 Landmark_03_TakeshitaStreetGate
│   ├── 📄 Landmark_04_GinzaMitsukoshiFacade
│   ├── 📄 Landmark_05_KaminarimonGate
│   └── 📄 Landmark_06_TokyoTower
│
└── 📁 Small_Prop_Detail_Objects
    ├── 📁 Foods_And_Drinks
    │   ├── 📄 Prop_Food_FattyTunaSushi
    │   ├── 📄 Prop_Food_SalmonSushi
    │   ├── 📄 Prop_Food_Yakitori
    │   ├── 📄 Prop_Drink_SakeSet
    │   ├── 📄 Prop_Food_Yakiniku
    │   └── 📄 Prop_Food_HarajukuCrepe
    ├── 📁 Street_And_Shop_Props
    │   ├── 📄 Prop_Detail_ShoppingBag
    │   └── 📄 Prop_Detail_PaperLantern
    └── 📁 Bonus_Features
        ├── 📄 Prop_Bonus_GodzillaHead
        ├── 📄 Prop_Bonus_Shinjuku3DCat
        └── 📄 Prop_Bonus_HachikoStatue
~~~
---

## 🏷️ Naming Conventions

### 1. フォルダ命名規則
* **ケーススタディ**: アッパーキャメルケース（PascalCase）＋ アンダースコア区切り
* **例**: `Featured_Sightseeing_Spots_Boards`, `Iconic_Major_Landmarks_Objects`, `Small_Prop_Detail_Objects`

### 2. オブジェクト（案内板）命名規則
* **プレフィックス**:
  * 広域エリア案内板: `InfoBoard_`
  * 店舗・特定施設案内板: `ShopBoard_`
* **インデックス**: 2桁のゼロ埋め数字 (`01`, `02`, ... `18`)
* **識別子**: スポット名またはエリア名のパスカルケース
* **フォーマット**: `[Prefix]_[No]_[SpotName]`
* **例**: `InfoBoard_01_Kabukicho`, `ShopBoard_02_TeamLabBorderless`

### 3. 主要ランドマーク（Iconic Major Landmarks）命名規則
* **プレフィックス**: `Landmark_`
* **インデックス**: 2桁のゼロ埋め数字 (`01`, `02`, ... `06`)
* **フォーマット**: `Landmark_[No]_[LandmarkName]`
* **例**: `Landmark_01_KabukichoArch`, `Landmark_05_KaminarimonGate`

### 4. スモールプロップ（Small Prop & Detail Objects）命名規則
* **サブフォルダ分類**:
  * `Foods_And_Drinks`: 食べ物・飲み物関連モデル (`Prop_Food_`, `Prop_Drink_`)
  * `Street_And_Shop_Props`: ショップ・街並み小物モデル (`Prop_Detail_`)
  * `Bonus_Features`: ボーナス・オプション作成モデル (`Prop_Bonus_`)
* **フォーマット**: `Prop_[Category]_[ItemName]`
* **例**: `Prop_Food_FattyTunaSushi`, `Prop_Drink_SakeSet`, `Prop_Bonus_HachikoStatue`

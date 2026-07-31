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
~~~text
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
│
└── 📁 Small_Prop_Detail_Objects
~~~
---

## 🏷️ Naming Conventions

### 1. フォルダ命名規則
* **ケーススタディ**: アッパーキャメルケース（PascalCase）＋ アンダースコア区切り
* **例**: `Featured_Sightseeing_Spots_Boards`, `Specific_Shop_Boards`

### 2. オブジェクト（案内板）命名規則
* **プレフィックス**:
  * 広域エリア案内板: `InfoBoard_`
  * 店舗・特定施設案内板: `ShopBoard_`
* **インデックス**: 2桁のゼロ埋め数字 (`01`, `02`, ... `18`)
* **識別子**: スポット名またはエリア名のパスカルケース
* **フォーマット**: `[Prefix]_[No]_[SpotName]`
* **例**: `InfoBoard_01_Kabukicho`, `ShopBoard_02_TeamLabBorderless`

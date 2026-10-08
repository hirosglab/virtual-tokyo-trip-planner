---
title: "Roblox Object Deployment Plan"
type: "deployment-plan"
status: "in-progress"
tags:
  - roblox-deployment
  - object-mapping
  - progress-tracking
links:
  - "../planning/tokyo-trip-plan-2026.md"
  - "./objects/info-board-featured-spots.md"
  - "./objects/info-board-specific-shops.md"
  - "./room-layout-design.md"
  - "./room-floor-design-spec.md"
description: "旅行計画をRoblox空間上のオブジェクト（床材、案内板、3Dモデル、プロップ）へマッピング・配置するプラン"
---

# Roblox Object Deployment Plan

## 🏛️ Floor & Room Structure Parts

RobloxのWorkspace内には床材専用フォルダFloorsを配置し、同心円状の3階層シリンダー構造（ZONE A, B, C）を展開する。

## 🏛️ Floor Zones Overview & Roles

| Zone Name | Role & Design Concept |
| :--- | :--- |
| **ZoneA_Center_Floor** | **エントリー＆全体把握ゾーン**<br>スポーン地点を内部に隠蔽する中央プラットフォーム。全体を見渡せる高台となっており、視認性の高いライトグレーで将来的な地図の投影・載置にも対応。 |
| **ZoneB_Middle_Floor** | **交流＆ホテル情報ゾーン**<br>プレゼン参加者が集い交流する中間プラットフォーム。ホテル情報ボードや意見箱・投票BOXを設置し、落ち着いたチャコールグレーで空間のつなぎ目を形成。 |
| **ZoneC_Base_Floor** | **メイン観光＆店舗展示ゾーン**<br>外壁沿いの観光案内板や空中に浮遊する店舗ボードが並ぶ最下層の展示エリア。暗めのダークスレートカラーにより、展示オブジェクトやネオン発光の視認性を極大化。 |

---

## Custom Information Boards

### Accommodations
* **Apa Hotel Shinjuku / アパホテル新宿**
* **Hotel Monte Hermana Tokyo / ホテル モンテ エルマーナ東京**

### Featured Sightseeing Spots
| No | Area | Spot | Category | Description |
| :--- | :--- | :--- | :--- | :--- |
| 1 | **Shinjuku / 新宿** | Kabuki-cho / 歌舞伎町 | **NIGHTLIFE DISTRICT** | Explore Tokyo's most famous nightlife and entertainment district. |
| 2 | **Shinjuku / 新宿** | Omoide-Yokocho Memory Lane / 思い出横丁 | **RETRO IZAKAYA ALLEY** | A nostalgic alley packed with cozy yakitori and izakaya stalls. |
| 3 | **Shinjuku / 新宿** | Shinjuku Station East Exit Area / 新宿駅東口エリア | **VIBRANT RETAIL HUB** | A bustling shopping and entertainment district packed with endless shops and dep... |
| 4 | **Harajuku / 原宿** | Takeshita Street / 竹下通り | **KAWAII STREET** | The epicenter of Japanese street fashion and trendy sweets. |
| 5 | **Harajuku / 原宿** | Meiji Jingu / 明治神宮 | **TRADITIONAL SHRINE** | A serene Shinto shrine dedicated to Emperor Meiji, surrounded by forest. |
| 6 | **Harajuku / 原宿** | Omotesando Avenue / 表参道 | **FASHION & ARCHITECTURE** | A sophisticated tree-lined avenue lined with flagship luxury stores and stunning modern architecture. |
| 7 | **Shibuya / 渋谷** | Shibuya Sky / 渋谷スカイ | **SKY OBSERVATION DECK** | A stunning open-air observation deck with 360-degree city views. |
| 8 | **Shibuya / 渋谷** | Shibuya Crossing / 渋谷スクランブル交差点 | **WORLD'S CROSSING** | The world's busiest intersection and a symbol of modern Tokyo. |
| 9 | **Shibuya / 渋谷** | Shibuya Center-Gai / 渋谷センター街 | **YOUTH CULTURE HUB** | A bustling pedestrian street filled with shops, music, and youth fashion. |
| 10 | **Tokyo / 東京** | Tokyo Central Station / 東京駅 | **HISTORIC BRICK HUB** | A stunning red-brick station building blending history and modern transport. |
| 11 | **Tokyo / 東京** | Tokyo / お台場 | **WATER FRONT DISTRICT** | Iconic futuristic waterfront district and the legendary real-world setting for Digimon Adventure. |
| 12 | **Tokyo / 新橋** | Shinbashi Guard Underpass Alley / 新橋ガード下 | **SALARYMAN NIGHTLIFE** | A lively retro alley where local workers gather for food and drinks. |
| 13 | **Tsukiji / 築地** | Tsukiji Outer Market / 築地場外市場 | **SEAFOOD STREET FOOD** | A bustling historic market filled with fresh seafood, sushi, and local street food snacks. |
| 14 | **Ginza / 銀座** | Ginza Street / 銀座通り | **HIGH-CLASS FASHION STREET** | A sophisticated avenue famous for luxury shopping and weekend pedestrian hours. |
| 15 | **Akihabara / 秋葉原** | Akihabara Electric Town / 秋葉原電気街 | **OTAKU & TECH CAPITAL** | The global hub for anime, manga, retro video games, and electronics. |
| 16 | **Azabu / 麻布** | Azabu / 麻布 | **INTERNATIONAL & LUXURY ZONE** | An exclusive, sophisticated neighborhood blending historic charm, global embassies, and modern architecture. |
| 17 | **Asakusa / 浅草** | Senso-ji Temple & Kaminarimon / 浅草寺雷門 | **HISTORIC TEMPLE GATE** | Tokyo's oldest temple, guarded by the iconic red lantern gate. |
| 18 | **Asakusa / 浅草** | Sumida River / 隅田川 | **SCENIC RIVERSIDE VIEW** | A beautiful waterfront area perfect for river cruises and skyline views. |

### 🛍️ Specific Spot & Shop Boards
| No | Status | Area | Shop & Facility (Pop Up) | Category | Description (Pop Up) |
| :--- | :--- | :--- | :--- | :--- | :--- |
| 1 | **Confirmed** | **Ginza / 銀座** | Teppanyaki 10 / 鉄板焼き10 | Restaurant | **GRILLED WAGYU & SEA FOODS** |
| 2 | **Confirmed** | **Azabu / 麻布** | Mori Building Digital Art Museum (teamLab Borderless) / チームラボボーダレス | Art | **DIGITAL ART MUSEUM** |
| 3 | **Confirmed** | **Azabu / 麻布** | Dashi Okume / だし尾粂 | Shopping | **150 YEAR OLD BROTH SHOP** |
| 4 | **Proposed** | **Ikebukuro / 池袋** | Animate Ikebukuro Main Store / アニメイト池袋本店 | Shopping | **BIGGEST ANIME & MANGA SHOP** |
| 5 | **Proposed** | **Harajuku / 原宿** | My Pig Cafe / 豚カフェ | Cafe | **ANIMAL CAFE** |
| 6 | **Proposed** | **Tokyo / 東京** | Tokyo Character Street / 東京キャラクターストリート | Shopping | **POP CULTURE STREET** |
| 7 | **Proposed** | **Akihabara / 秋葉原** | Akihabara Radio Kaikan / 秋葉原ラジオ会館 | Shopping | **GAME ANIME FIGURES & TRADING CARDS** |

---

## 3D Environment Objects

### Iconic Major Landmarks
| Area | Spot | Notes |
| :--- | :--- | :--- |
| **Shinjuku / 新宿** | Kabuki-cho / 歌舞伎町 | Neon arch or gateway structure |
| **Shibuya / 渋谷** | Shibuya Center-Gai / 渋谷センター街 | Signboard entrance arch |
| **Harajuku / 原宿** | Takeshita Street / 竹下通り | Iconic colorful entrance gate |
| **Ginza / 銀座** | Ginza Mitsukoshi / 銀座三越 | Historic facade or lion statue |
| **Asakusa / 浅草** | Senso-ji Temple & Kaminarimon / 雷門 | Big red lantern and traditional gate |
| **Minato / 港区** | Tokyo Tower / 東京タワー | Miniaturized iconic red tower |

### Small Prop & Detail Objects

#### 1. General & Common Objects
* **Shopping Bag / ショッピングバッグ** (Prop_Shopping_Bag / Default: Visible) / 対象エリア: 新宿東口(InfoBoard_03), 表参道(InfoBoard_06), 渋谷センター街(InfoBoard_09), 銀座通り(InfoBoard_14), 麻布(InfoBoard_16) / 演出仕様: プレイヤーが案内板から40 studs以内に接近すると空中で自動回転を開始。共通モデルを活用し各エリアの商環境を演出。
* **Japanese Red Paper Lantern / 赤提灯** (Prop_Lantern_Red / Default: Invisible) / 対象エリア: 思い出横丁(InfoBoard_02), 新橋ガード下(InfoBoard_12) / 演出仕様: プレイヤーが40 studs以内に接近すると両サイド・アバターやや上空に提灯6つが時間差（案内板側からZone B方向へ順次）で出現。
* **Kabuki-cho Godzilla Head / ゴジラヘッド** (Prop_Godzilla_Head / Default: Visible) / 対象エリア: 歌舞伎町(InfoBoard_01) / 演出仕様: プレイヤーが40 studs以内に接近すると上空配置されたゴジラ頭部のAnchorが解除（またはTween落下）され地面に落下。
* **Shinjuku 3D Cat / 3D巨大猫** (Prop_Cat / Default: Visible) / 対象エリア: 新宿東口(InfoBoard_03) / 演出仕様: プレイヤーが40 studs以内に接近すると表情アニメーションが変化。
* **Takeshita Street Crepe / 原宿クレープ** (Prop_Crepe / Default: Invisible) / 対象エリア: 竹下通り(InfoBoard_04) / 演出仕様: プレイヤーが40 studs以内に接近すると両サイド・アバター頭部付近に色違いクレープが時間差で出現。
* **Micro Pig / 豚カフェの豚** (Prop_Pig / Default: Visible) / 対象エリア: 竹下通り(InfoBoard_04) / 演出仕様: プレイヤーが40 studs以内に接近すると寝転がっていた豚が寝返りを打つ。
* **Meiji Jingu Autumn Leaf Canopy / 紅葉の天蓋** (Prop_Autumn_Leaf / Default: Invisible) / 対象エリア: 明治神宮(InfoBoard_05) / 演出仕様: プレイヤーが40 studs以内に接近すると頭上に8x3配置の紅葉天蓋が出現。
* **Shibuya Crossing White Tile / 横断歩道ネオンタイル** (White_Tile / Default: Visible) / 対象エリア: 渋谷スクランブル交差点(InfoBoard_08) / 演出仕様: 地面に設置された薄い白色パーツが、40 studs以内に接近するとマテリアルがNeonに変化して発光。
* **Hachiko Dog / ハチ公像・犬** (Prop_Dog / Default: Visible) / 対象エリア: 渋谷スクランブル交差点(InfoBoard_08) / 演出仕様: プレイヤーが40 studs以内に接近すると寝転がっていた犬が起き上がる。
* **Tsukiji Fresh Sushi / 築地各種寿司** (Prop_Sushi_Toro, Prop_Sushi_Tamago, Prop_Sushi_Salmon_01 / Default: Invisible) / 対象エリア: 築地場外市場(InfoBoard_13) / 演出仕様: プレイヤーが40 studs以内に接近するとアバター頭部・両サイド付近にトロ・タマゴ・サーモンが時間差（_01→_02→_03）で順次出現。
* **Asakusa Wagashi / 浅草和菓子** (Prop_Wagashi / Default: Invisible) / 対象エリア: 浅草寺(InfoBoard_17) / 演出仕様: プレイヤーが40 studs以内に接近すると両サイド・アバター頭部付近に異なる和菓子オブジェクトが時間差で出現。

#### 2. Detailed Spot & Area Deployment Master Table

| No | Area | Spot | Infoboard Name | Prop Objects | Default Visibility | Description |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| 1 | Shinjuku / 新宿 | Kabuki-cho / 歌舞伎町 | InfoBoard_01_Kabukicho | Prop_Godzilla_Head | Visible | プレーヤーがInfoboardから40 studs内に近づくと上空に配置されていたゴジラの頭部Anchorが外れ地面に落ちてくる。 |
| 2 | Shinjuku / 新宿 | Omoide-Yokocho Memory Lane / 思い出横丁 | InfoBoard_02_OmoideYokocho | Prop_Lantern_Red | Invisible | プレーヤーがInfoboardから40 studs内に近づくと両サイド、アバターやや上空にProp_Lantern_Red6つ並んで出現。Infoboardに近いところからZone Bに向かって時間差で出現。 |
| 3 | Shinjuku / 新宿 | Shinjuku Station East Exit Area / 新宿駅東口エリア | InfoBoard_03_ShinjukuEastExit | Prop_Shopping_Bag / Prop_Cat | Visible | プレーヤーがInfoboardから40 studs内に近づくとShopping Bagは空中で回転を始め、Catは表情がアニメーションで変化。 |
| 4 | Harajuku / 原宿 | Takeshita Street / 竹下通り | InfoBoard_04_TakeshitaStreet | Prop_Crepe / Prop_Pig | Crepe: Invisible / Pig: Visible | プレーヤーが40 studs内に近づくと両サイド頭部付近に色違いクレープが時間差出現。寝転がっていた豚は寝返りをうつ。 |
| 5 | Harajuku / 原宿 | Meiji Jingu / 明治神宮 | InfoBoard_05_MeijiJingu | Prop_Autumn_Leaf | Invisible | プレーヤーがInfoboardから40 studs内に近づくと、頭上に8 x 3でProp_Autumn_Leafの天蓋が出現。 |
| 6 | Harajuku / 原宿 | Omotesando Avenue / 表参道 | InfoBoard_06_OmotesandoAvenue | Prop_Shopping_Bag | Visible | プレーヤーがInfoboardから40 studs内に近づくと空中で回転を始める。 |
| 7 | Shibuya / 渋谷 | Shibuya Sky / 渋谷スカイ | InfoBoard_07_ShibuyaSky | Prop_Helipad_Light / Prop_Cloud | Invisible | プレーヤーが40 studs内に近づくと足元に薄い雲エフェクトが広がり、サーチライトオブジェクトが灯る。(TBD候補) |
| 8 | Shibuya / 渋谷 | Shibuya Crossing / 渋谷スクランブル交差点 | InfoBoard_08_ShibuyaCrossing | White_Tile / Prop_Dog | Visible | 地面の白タイルがNeonマテリアルへ変化して発光。寝転がっていた犬オブジェクトが起き上がる。 |
| 9 | Shibuya / 渋谷 | Shibuya Center-Gai / 渋谷センター街 | InfoBoard_09_ShibuyaCenterGai | Prop_Shopping_Bag | Visible | プレーヤーがInfoboardから40 studs内に近づくと空中で回転を始める。 |
| 10 | Tokyo / 東京 | Tokyo Central Station / 東京駅 | InfoBoard_10_TokyoStation | Prop_Mini_Shinkansen | Visible | プレーヤーが40 studs内に近づくとミニサイズの新幹線オブジェクトが掲示板周りを滑らかに周回。(TBD候補) |
| 11 | Tokyo / 東京 | Odaiba / お台場 | InfoBoard_11_Odaiba | Prop_StatueOfLiberty_Mini | Visible | プレーヤーが40 studs内に近づくと自由の女神ミニチュアの周辺ライティングがレインボー発光に変化。(TBD候補) |
| 12 | Tokyo / 新橋 | Shinbashi Guard Underpass Alley / 新橋ガード下 | InfoBoard_12_ShinbashiUnderpass | Prop_Lantern_Red | Invisible | プレーヤーがInfoboardから40 studs内に近づくと両サイドやや上空に赤提灯6つが時間差で出現。 |
| 13 | Tsukiji / 築地 | Tsukiji Outer Market / 築地場外市場 | InfoBoard_13_TsukijiOuterMarket | Prop_Sushi_Toro / Prop_Sushi_Tamago / Prop_Sushi_Salmon_01 | Invisible | プレーヤーが40 studs内に近づくと両サイド頭部付近にトロ・タマゴ・サーモンが交互に時間差で出現。 |
| 14 | Ginza / 銀座 | Ginza Street / 銀座通り | InfoBoard_14_GinzaStreet | Prop_Shopping_Bag | Visible | プレーヤーがInfoboardから40 studs内に近づくと空中で回転を始める。 |
| 15 | Akihabara / 秋葉原 | Akihabara Electric Town / 秋葉原電気街 | InfoBoard_15_AkihabaraElectricTown | Prop_Pixel_Heart | Invisible | プレーヤーが40 studs内に近づくとホログラム風のピクセルハートが空中に出現し浮遊・明滅。(TBD候補) |
| 16 | Azabu / 麻布 | Azabu / 麻布 | InfoBoard_16_AzabuArea | Prop_Shopping_Bag | Visible | プレーヤーがInfoboardから40 studs内に近づくと空中で回転を始める。 |
| 17 | Asakusa / 浅草 | Senso-ji Temple & Kaminarimon / 浅草寺雷門 | InfoBoard_17_Sensoji | Prop_Wagashi | Invisible | プレーヤーが40 studs内に近づくと両サイド頭部付近に異なる和菓子オブジェクトが交互に時間差で出現。 |
| 18 | Asakusa / 浅草 | Sumida River / 隅田川 | InfoBoard_18_SumidaRiver | Prop_Cherry_Blossom | Invisible | プレーヤーが40 studs内に近づくと頭上に小さな花火エフェクトと桜の花弁オブジェクトが出現。(TBD候補) |

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

Robloxの`Workspace`内には床材専用フォルダ`Floors`を配置し、同心円状の3階層シリンダー構造（ZONE A, B, C）を展開する。

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
| 11 | **Tokyo / 東京** | Tokyo Imperial Palace / 皇居 | **IMPERIAL HERITAGE SITE** | The main residence of the Emperor, featuring beautiful gardens and ruins. |
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
* **Fatty Tuna Sushi / 寿司（トロ）** (Food prop for tables or decorations)
* **Salmon Sushi / 寿司（サーモン）** (Food prop for tables or decorations)
* **Yakitori / 焼き鳥** (Food prop for tables or decorations)
* **Sake Bottle & Cup / 日本酒（お銚子・お猪口）** (Food & drink prop for tables or decorations)
* **Yakiniku / 焼肉** (Food prop for tables or decorations)
* **Shopping Bag / ショッピングバッグ** (Detail prop for shops or decorations)
* **Harajuku Crepe / 原宿クレープ** (Street food item model)
* **Japanese Paper Lantern / 提灯（ちょうちん）** (Decorative lighting & street prop)
* **Kabuki-cho Godzilla Head / ゴジラヘッド** *(Bonus/Optional feature if time permits)*
* **Cross Shinjuku Vision 3D Cat / クロス新宿ビジョン 3D巨大猫** *(Bonus/Optional feature if time permits)*
* **Hachiko Statue / ハチ公像** *(Bonus/Optional feature if time permits)*

# Roblox Room Layout & Spatial Design Spec

## 🏛️ Architecture & Layout
* **Room Shape:** Perfect Circular Room.
* **Center Hub:** 
  * `SpawnLocation` is placed at the exact coordinates `(0, y, 0)`.
  * Features the **Base Information Core** (Accommodations & Restaurants).
* **Perimeter Division:** 
  * The circular space is split 50/50 down the middle.
  * **Left Hemisphere:** 1st Trip Zones (Shinjuku, Harajuku, Shibuya, Ikebukuro).
  * **Right Hemisphere:** 2nd Trip Zones (Tsukiji, Ginza, Asakusa, Tokyo/Shinbashi/Azabu).

## 🗺️ Spatial Flow & Navigation (Center to Wall)
1. **Spawn Point (Center):** Player logs in, views the 360° overview of the trip.
2. **Area Gates (Mid-Radius):** Representative landmark gates act as visual signs for each city.
3. **Information Boards (Perimeter Walls):** Large display boards attached to the outer walls behind each gate.
4. **Airspace (Mid-Air):** Small visual props float and rotate gently between the center and the walls.

## 🎨 Design & Aesthetics
* **Theme:** Modern Virtual Meeting Room / Cyber-Travel Museum.
* **Lighting:** Ambient lighting configured to highlight the current zone.
* **Interactive Elements:** 
  * Floating props must have `Anchored = true` and a smooth rotation script applied.
  * *Future Expansion:* A dynamic Feedback/Discussion board at the Center Hub using DataStores or external integration.

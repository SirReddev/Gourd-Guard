# 🎃 Gourd Guard — Master Commands & Systems Guide

A comprehensive manual covering all datapack commands, scoreboard systems, HUD architecture, item glow systems, and volumetric skybox summon commands in **Gourd Guard**.

---

## 📑 Table of Contents
1. [⏱️ Match Timer & HUD](#1-⏱️-match-timer--hud)
2. [🪙 Coin Economy & Pop-Up Notifications](#2-🪙-coin-economy--pop-up-notifications)
3. [✨ Item Glow System (18 Colors)](#3-✨-item-glow-system-18-colors)
4. [🌌 Volumetric Shader Skyboxes (Cosmic Nebula & Spooky Halloween)](#4-🌌-volumetric-shader-skyboxes)
5. [👁️ HUD Visibility & Global Controls](#5-👁️-hud-visibility--global-controls)
6. [📊 Scoreboard Objectives Reference](#6-📊-scoreboard-objectives-reference)
7. [🎨 Resource Pack & Shader Architecture](#7-🎨-resource-pack--shader-architecture)

---

## 1. ⏱️ Match Timer & HUD

The match countdown timer is rendered in the **top box** of the player's card HUD.

### Timer Control Commands
| Command | Description |
| :--- | :--- |
| `/function gourd_guard:hud/start_timer` | **Starts / Resumes** the timer countdown from its current time. |
| `/function gourd_guard:hud/timer/start` | Alternate command to start/resume the countdown. |
| `/function gourd_guard:hud/pause_timer` | **Pauses / Freezes** the countdown in place. |
| `/function gourd_guard:hud/timer/pause` | Alternate command to pause the countdown. |
| `/function gourd_guard:hud/timer/stop` | Alternate command to stop the countdown. |
| `/function gourd_guard:hud/reset_timer` | Resets the timer back to `5:00` in a **paused** state. |
| `/function gourd_guard:hud/timer/reset` | Alternate command to reset the timer to `5:00`. |

### 🚀 Quick Timer Presets (Sets Time & Starts Automatically)
| Command | Time Set | Behavior |
| :--- | :--- | :--- |
| `/function gourd_guard:hud/timer/start_5m` | `5:00` | Sets match time to 5 minutes and starts countdown. |
| `/function gourd_guard:hud/timer/start_1m` | `1:00` | Sets match time to 1 minute and starts countdown. |
| `/function gourd_guard:hud/timer/start_10s` | `0:10` | Sets match time to 10 seconds for testing urgency states. |

### 🚦 Urgency Color Progression
* **Green (`#55FF55`)**: Remaining time $> \text{2:00}$
* **Yellow (`#FFFF55`)**: Remaining time between $\text{1:00}$ and $\text{1:59}$
* **Orange (`#FFAA00`)**: Remaining time between $\text{0:30}$ and $\text{0:59}$
* **Red (`#FF5555`)**: Critical time $< \text{0:30}$

---

## 2. 🪙 Coin Economy & Pop-Up Notifications

Coins are rendered in the **bottom box** of the player's card HUD.

| Command | Action | Pop-Up Indicator |
| :--- | :--- | :--- |
| `/function gourd_guard:hud/coins/add_50` | Adds `50` coins to the executing player. | Green `+50` floating badge for 2 seconds. |
| `/function gourd_guard:hud/coins/add_100` | Adds `100` coins to the executing player. | Green `+100` floating badge for 2 seconds. |
| `/function gourd_guard:hud/coins/remove_50` | Deducts `50` coins from the player. | Red `-50` floating badge for 2 seconds. |
| `/function gourd_guard:hud/coins/remove_100` | Deducts `100` coins from the player. | Red `-100` floating badge for 2 seconds. |
| `/function gourd_guard:hud/coins/reset` | Resets executing player's coins to `0`. | Pop-up fades out. |
| `/function gourd_guard:hud/reset_coins` | Resets all players' coins to `0`. | Global balance reset. |

### 🔒 Zero-Shift Pixel Guarantee
* Supports all coin values from **`0` to `999,999+`** (1 to 6+ digits).
* When numbers increase or decrease, the HUD container **never shifts horizontally**.
* Pop-ups (`+XX` and `-XX`) use exact **`0.0px net width`** cancellation advances.

---

## 3. ✨ Item Glow System (18 Colors)

Dropped items can be given colored glows automatically via `custom_data`. The system runs a 1-time zero-lag tag evaluation per dropped item.

### Giving Glowing Items to Players:
```mcfunction
/give @p <item>[custom_data={glow_<color>:1b}]
```

### 🌈 All Supported Colors:
| Color Tag | Example Give Command |
| :--- | :--- |
| `glow_aqua` | `/give @p diamond[custom_data={glow_aqua:1b}]` |
| `glow_gold` | `/give @p gold_ingot[custom_data={glow_gold:1b}]` |
| `glow_purple` | `/give @p netherite_sword[custom_data={glow_purple:1b}]` |
| `glow_lime` | `/give @p emerald[custom_data={glow_lime:1b}]` |
| `glow_red` | `/give @p redstone[custom_data={glow_red:1b}]` |
| `glow_blue` | `/give @p lapis_lazuli[custom_data={glow_blue:1b}]` |
| `glow_green` | `/give @p slime_ball[custom_data={glow_green:1b}]` |
| `glow_yellow` | `/give @p torch[custom_data={glow_yellow:1b}]` |
| `glow_orange` | `/give @p pumpkin[custom_data={glow_orange:1b}]` |
| `glow_pink` | `/give @p cherry_blossom[custom_data={glow_pink:1b}]` |
| `glow_magenta` | `/give @p amethyst_shard[custom_data={glow_magenta:1b}]` |
| `glow_cyan` | `/give @p prismarine_crystals[custom_data={glow_cyan:1b}]` |
| `glow_white` | `/give @p iron_ingot[custom_data={glow_white:1b}]` |
| `glow_light_blue` | `/give @p soul_torch[custom_data={glow_light_blue:1b}]` |
| `glow_light_gray` | `/give @p cobblestone[custom_data={glow_light_gray:1b}]` |
| `glow_gray` | `/give @p flint[custom_data={glow_gray:1b}]` |
| `glow_brown` | `/give @p leather[custom_data={glow_brown:1b}]` |
| `glow_black` | `/give @p coal[custom_data={glow_black:1b}]` |

---

## 4. 🌌 Volumetric Shader Skyboxes

Procedural, raymarched volumetric shader environments that can be summoned directly as `item_display` entities into the arena (exact Towerfall architecture).

### 🔮 1. Cosmic Nebula
```mcfunction
/summon item_display ~ ~ ~ {item:{id:"minecraft:carved_pumpkin",components:{"minecraft:item_model":"gourd_guard:skybox_nebula"}},transformation:{scale:[1000f,1000f,1000f]},Tags:["skybox"]}
```
* **Features**: Deep stellar gas clouds, flowing aurora curtains, glittering stars, and cosmic needle shooting stars.

---

### 🎃 2. Spooky Halloween (Mist, Harvest Moon, Haunted Aurora & Comets)
```mcfunction
/summon item_display ~ ~ ~ {item:{id:"minecraft:carved_pumpkin",components:{"minecraft:item_model":"gourd_guard:skybox_halloween"}},transformation:{scale:[1000f,1000f,1000f]},Tags:["skybox"]}
```
* **Features**:
  * **Rolling Volumetric Mist & Graveyard Fog**: Creeping pumpkin-orange & spectral green fog hugging the horizon.
  * **Giant Glowing Harvest Moon**: Glowing amber harvest moon disc with soft glowing cloud haze.
  * **Haunted Spectral Aurora**: Ghostly spectral green and haunted witch-violet ribbons rippling across the dark sky.
  * **Flaming Pumpkin & Spectral Comets**: Shooting comets in pumpkin-flame orange, acid green, and phantom purple.
  * **Twinkling Starfield**: Sparkling celestial starfield overhead.

---

### 🌌 3. Purple Portal / Void Rift
```mcfunction
/summon item_display ~ ~ ~ {item:{id:"minecraft:carved_pumpkin",components:{"minecraft:item_model":"gourd_guard:skybox_purple"}},transformation:{scale:[1000f,1000f,1000f]},Tags:["skybox"]}
```
* **Features**:
  * **Colossal Swirling Void Vortex**: Giant purple cosmic singularity directly overhead at the zenith.
  * **Galactic Energy Spiral Arms**: Radiant electric violet, neon magenta, and royal purple streams spiraling inward.
  * **Arcane Rune Rings**: Orbiting magical halo rings pulsating with arcane glyphs across the celestial dome.
  * **Falling Void Meteors**: Cosmic shooting meteors plunging from the rift.
  * **Deep Midnight Horizon Fog**: Seamless transition into dark void fog at the horizon.

---

### 🧹 Remove Active Skybox
```mcfunction
/kill @e[type=item_display,tag=skybox]
```

---

## 5. 👁️ HUD Visibility & Global Controls

| Command | Description |
| :--- | :--- |
| `/function gourd_guard:hud/toggle` | Toggles the HUD on/off for the **executing player**. |
| `/function gourd_guard:hud/show` | Forces the HUD to **show** for the executing player. |
| `/function gourd_guard:hud/hide` | Forces the HUD to **hide** for the executing player. |
| `/function gourd_guard:hud/toggle_all` | Toggles HUD visibility for **all players on the server**. |
| `/function gourd_guard:hud/reset` | **Master Global Reset**: Resets timer (5:00 paused), clears all coins to 0, and clears pop-ups. |
| `/function gourd_guard:hud/setup` | Initializes all scoreboard objectives and title tick timers. |

---

## 6. 📊 Scoreboard Objectives Reference

| Scoreboard Name | Target / Holder | Purpose |
| :--- | :--- | :--- |
| `coins` | `@s` (Player) | Current coin balance. |
| `coins_prev` | `@s` (Player) | Previous tick balance (for delta tracking). |
| `coins_diff` | `@s` (Player) | Amount gained or lost (displayed in pop-up). |
| `coins_pop` | `@s` (Player) | Countdown tick timer for pop-up display (40 ticks = 2s). |
| `coins_pop_type` | `@s` (Player) | `1` = Gain (Green `+XX`), `2` = Loss (Red `-XX`). |
| `timer_min` | `.global` | Current remaining minutes. |
| `timer_sec` | `.global` | Current remaining seconds. |
| `timer_ticks` | `.global` | Internal tick counter (20 ticks = 1 second). |
| `timer_active` | `.global` | `1` = Running / Counting down, `0` = Paused / Stopped. |
| `hud_toggle` | `@s` (Player) | `0` = HUD Visible, `1` = HUD Hidden. |
| `glow_init` | `.init` | Team setup flag for Item Glow. |

---

## 7. 🎨 Resource Pack & Shader Architecture

```
assets/
├── gourd_guard/
│   ├── font/
│   │   └── hud.json                   (Bitmap font registrations)
│   ├── items/
│   │   ├── skybox_nebula.json         (Cosmic Nebula Item)
│   │   └── skybox_halloween.json      (Spooky Halloween Item)
│   ├── models/item/
│   │   ├── skybox_nebula.json         (Cosmic Nebula Model)
│   │   └── skybox_halloween.json      (Spooky Halloween Model)
│   ├── shaders/include/
│   │   └── skyboxes.glsl              (Cosmic Nebula & Spooky Halloween Shader Engines)
│   └── textures/
│       ├── gui/hud/
│       │   ├── hud_bg.png             (3-Tier Card Frame Texture)
│       │   ├── timer.png              (Stopwatch Icon)
│       │   └── coin.png               (Gold Coin Icon)
│       └── item/skybox/
│           ├── nebula.png             (Signature ID 1)
│           └── halloween.png          (Signature ID 2)
└── minecraft/
    ├── font/
    │   └── default.json               (Negative Space & Padding Advances)
    └── shaders/core/
        ├── item.vsh / item.fsh        (Skybox Raymarching & Emissive Shading)
        ├── text.vsh                   (HUD Positioning, 3-Tier Layout, Colors)
        └── text.fsh                   (52x52 Skin Overlay & Texture Rasterizer)
```

---

## 🔄 Quick Development Reloads
* **Datapack Code**: Run **`/reload`** in chat.
* **Textures & Shaders**: Press **`F3 + T`** in-game.
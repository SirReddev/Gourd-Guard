# Gourd Guard

**Gourd Guard** is a custom Halloween-themed minigame for **Minecraft 26.2 (VANILLA) Java Realms** featuring a custom Core Shader HUD, dynamic Minecrafter font rendering, custom candy mechanics, custom items with glowing team outlines, boss health bars, wave progression systems, procedural custom skyboxes, arcade loot drops, and Animated Java NPC rigs with locator-based particle physics and spatial 3D audio.

---

## Repository Structure

| Directory | Description |
| :--- | :--- |
| **`datapack/`** | Contains all game functions, scoreboards, timer ticks, candy collection mechanics, wave managers, loot tables, macro actionbar renderers, and Animated Java NPC controllers (`data/gourd_guard/`, `data/aj/`). |
| **`resourcepack/`** | Contains custom text core shaders (`assets/minecraft/shaders/core/`), procedural skybox shaders (`assets/gourd_guard/shaders/`), Minecrafter bitmap font (`assets/gourd_guard/font/`), custom textures, 3D candy models, NPC sound effects, and font glyphs. |

---

## Custom HUD & Core Shaders

The HUD uses a custom vertex shader (`text.vsh`) with color-hooked glyphs to achieve absolute, pixel-perfect positioning, custom font scaling, and drift-free rendering on any screen resolution.

### 1. Top-Left Match HUD
- **Player Card Frame** (`#01FFFF` / `\uE001`): Wooden background frame.
- **Animated Player Avatar** (`#010000`): Live player skin face with hat layer (56x56px).
- **Stopwatch Timer Icon** (`#0100FE` / `\uE003`): Custom icon (14x14px).
- **Match Countdown Timer** (`#0100FF`):
  - Minecrafter font (`gourd_guard:minecrafter`) with balanced 8px bold colon.
  - Dynamic color transitions:
    - Green (`#55FF55`) when > 2m
    - Yellow (`#FFFF55`) when 1m - 2m
    - Orange (`#FFAA00`) when 30s - 1m
    - Red (`#FF5555`) when < 30s
- **Candy Icon** (`#01FF00` / `\uE002`): Custom candy sprite (16x16px).
- **Candy Score** (`#01FE00`): Player candy balance in Minecrafter font with animated pop-up deltas (+XX in green / -XX in red).

### 2. Top-Center Objective HUD
- **Pumpkin Icon** (`#01AA00` / `\uE101`): Objective head icon.
- **Health Bar** (`#01AA01` / `\uE102` - `\uE116`): 20-step dynamic health bar with exact 72px backstep cursor isolation.

### 3. Top-Right Hanging Sign HUD
- **Hanging Sign Board** (`#01BB00` / `\uE200`): Double wooden board backdrop anchored to `guiWidth`.
- **Wave Display** (`#01BB01`): `WAVE <number>` scaled 1.85x in pure white Minecrafter font.
- **Ghost Mob Icon** (`#01BB02` / `\uE201`): Custom ghost icon (14x14px).
- **Mob Count Score** (`#01BB03`): Remaining mob count scaled 1.4x in pure white Minecrafter font.

---

## Animated Java NPCs (Witchstand)

The **Witchstand** NPC is built with Blockbench and exported through **Animated Java (MC-Build)**. It features an automated lifecycle, locked horizontal pitch rotation, continuous idle animations, custom name tags with font badges, locator-targeted particle physics, and spatial sound effects.

### Features:
- **Pitch-Locked Rotation**: Spawns facing the summoner with vertical pitch locked strictly to `0 degrees` (`execute rotated ~ 0`).
- **Stabilized Name Tag**: Renders a vertical billboard name tag `[NPC] The Witch` featuring the custom `\uE300` badge glyph (`assets/gourd_guard/textures/font/tag_npc.png`).
- **Locator Slime Particles**: Green slime particles pop and bounce out of the cauldron using Animated Java's exact `locator` coordinate system.
- **Close-Range Spatial Audio**: Custom stirring sound effect (`gourd_guard:npc.witchstand.stir`) plays at the cauldron locator, categorized under `neutral` ("Friendly Creatures") and attenuated within a 5-block radius.

### NPC Commands:
| Command | Description |
| :--- | :--- |
| `/function gourd_guard:npc/witchstand/summon` | Spawns the Witchstand NPC at the current position, starts the idle animation loop, stabilizes the name tag, and begins ambient stirring audio. |
| `/function gourd_guard:npc/witchstand/remove` | Removes the nearest Witchstand NPC within 6 blocks and silences audio. |
| `/function gourd_guard:npc/witchstand/remove_all` | Cleans up all Witchstand NPC models in loaded chunks. |
| `/function gourd_guard:npc/witchstand/pop_slime` | Triggers a single green slime burst at the cauldron locator. |
| `/function gourd_guard:npc/witchstand/play_stir_sound` | Plays the ambient stirring sound at the cauldron locator for players within 5 blocks. |

---

## Custom Sound Events

All custom sound events are registered in `assets/gourd_guard/sounds.json` and localized in `assets/minecraft/lang/en_us.json`:

| Sound Event | Category | Subtitle | File Path |
| :--- | :--- | :--- | :--- |
| `gourd_guard:npc.witchstand.stir` | `neutral` (Friendly Creatures) | "Cauldron stirs" | `assets/gourd_guard/sounds/npc/witchstand/stirring_potion.ogg` |
| `gourd_guard:hud.timer10s` | `record` (Jukebox/Radio) | - | `assets/gourd_guard/sounds/hud/timer10s.ogg` |
| `gourd_guard:objective.hit` | `hostile` (Hostile Creatures) | "Gourd Objective damaged" | `assets/gourd_guard/sounds/objective/gourd_hit.ogg` |
| `gourd_guard:objective.damage` | `hostile` (Hostile Creatures) | "Gourd Objective damaged" | `assets/gourd_guard/sounds/objective/gourd_hit.ogg` |
| `gourd_guard:gourd.hit` | `hostile` (Hostile Creatures) | "Gourd Objective damaged" | `assets/gourd_guard/sounds/objective/gourd_hit.ogg` |

---

## Custom Font Glyphs

Custom bitmap font glyphs are defined across `minecraft:default` and `gourd_guard:minecrafter`:

| Glyph Code | Description | Dimensions | Texture Path |
| :--- | :--- | :--- | :--- |
| `\uE001` | Top-Left Player Card Frame | 114x42 px | `assets/gourd_guard/textures/hud/player_card.png` |
| `\uE002` | Candy Icon | 16x16 px | `assets/gourd_guard/textures/hud/candy_icon.png` |
| `\uE003` | Stopwatch Timer Icon | 14x14 px | `assets/gourd_guard/textures/hud/timer_icon.png` |
| `\uE101` | Pumpkin Objective Icon | 14x14 px | `assets/gourd_guard/textures/hud/pumpkin_icon.png` |
| `\uE102` - `\uE116` | 20-Step Health Bar Segments | 72x12 px | `assets/gourd_guard/textures/hud/hp_bar_*.png` |
| `\uE200` | Hanging Sign Wave Board | 134x32 px | `assets/gourd_guard/textures/hud/hanging_sign.png` |
| `\uE201` | Ghost Mob Icon | 14x14 px | `assets/gourd_guard/textures/hud/ghost_icon.png` |
| `\uE300` | `[NPC]` Tag Badge | 22x9 px | `assets/gourd_guard/textures/font/tag_npc.png` |

---

## Command Reference

### Timer Commands
| Command | Description |
| :--- | :--- |
| `/function gourd_guard:hud/timer/start` | Start/resume the match countdown timer. |
| `/function gourd_guard:hud/timer/pause` | Pause the countdown timer. |
| `/function gourd_guard:hud/timer/reset` | Reset timer back to default (5:00). |
| `/function gourd_guard:hud/timer/start_5m` | Set timer to 5:00 and start immediately. |
| `/function gourd_guard:hud/timer/start_1m` | Set timer to 1:00 and start immediately. |
| `/function gourd_guard:hud/timer/start_10s` | Set timer to 0:10 (triggers red warning state). |

### Candy, Loot & Score Commands
| Command | Description |
| :--- | :--- |
| `/function gourd_guard:give_candy` | Gives the custom 3D model candy item to the player. |
| `/loot spawn ~ ~1 ~ loot gourd_guard:candy/boss` | Spawns a Boss candy burst (8 - 15 candies). |
| `/loot spawn ~ ~1 ~ loot gourd_guard:candy/large` | Spawns a Large candy drop (4 - 7 candies). |
| `/loot spawn ~ ~1 ~ loot gourd_guard:candy/medium` | Spawns a Medium candy drop (2 - 4 candies). |
| `/loot spawn ~ ~1 ~ loot gourd_guard:candy/small` | Spawns a Small candy drop (1 - 2 candies). |
| `/loot spawn ~ ~1 ~ loot gourd_guard:candy/single` | Spawns a Single candy drop (1 candy). |
| `/function gourd_guard:candy/drop` | Spawns a pop drop with outward arcade velocity. |
| `/function gourd_guard:hud/candy/add_50` | Add +50 coins to player (triggers green +50 pop-up). |
| `/function gourd_guard:hud/candy/add_100` | Add +100 coins to player (triggers green +100 pop-up). |
| `/function gourd_guard:hud/candy/remove_50` | Deduct 50 coins from player (triggers red -50 pop-up). |
| `/function gourd_guard:hud/candy/remove_100` | Deduct 100 coins from player (triggers red -100 pop-up). |
| `/function gourd_guard:hud/candy/reset` | Reset player candy score to 0. |

### Objective Bar Commands
| Command | Description |
| :--- | :--- |
| `/function gourd_guard:hud/objective/damage_10` | Deal 10 damage to the Pumpkin Objective. |
| `/function gourd_guard:hud/objective/damage_25` | Deal 25 damage to the Pumpkin Objective. |
| `/function gourd_guard:hud/objective/heal_10` | Heal 10 HP to the Pumpkin Objective. |
| `/function gourd_guard:hud/objective/heal_25` | Heal 25 HP to the Pumpkin Objective. |
| `/function gourd_guard:hud/objective/set_hp` | Set objective HP using score `.objective obj_hp`. |
| `/function gourd_guard:hud/objective/set_max_hp` | Set max HP using score `.objective obj_max_hp`. |
| `/function gourd_guard:hud/objective/toggle` | Toggle Objective HUD visibility. |
| `/function gourd_guard:hud/objective/show` | Force show Objective HUD. |
| `/function gourd_guard:hud/objective/hide` | Force hide Objective HUD. |

### Wave HUD Commands
| Command | Description |
| :--- | :--- |
| `/function gourd_guard:hud/wave/next_wave` | Advance to the next wave (+1). |
| `/function gourd_guard:hud/wave/prev_wave` | Return to previous wave (-1). |
| `/function gourd_guard:hud/wave/add_mob` | Increment mob count (+1). |
| `/function gourd_guard:hud/wave/sub_mob` | Decrement mob count (-1). |
| `/function gourd_guard:hud/wave/set_wave` | Set wave number via `.global wave`. |
| `/function gourd_guard:hud/wave/set_mobs` | Set mob count via `.global wave_mobs`. |
| `/function gourd_guard:hud/wave/toggle` | Toggle Wave HUD visibility. |
| `/function gourd_guard:hud/wave/show` | Force show Wave HUD. |
| `/function gourd_guard:hud/wave/hide` | Force hide Wave HUD. |

### Global HUD Visibility
| Command | Description |
| :--- | :--- |
| `/function gourd_guard:hud/toggle_all` | Toggle entire HUD on/off. |
| `/function gourd_guard:hud/show` | Force show full HUD. |
| `/function gourd_guard:hud/hide` | Force hide full HUD. |
| `/function gourd_guard:hud/reset` | Reset all HUD elements to default states. |

---

## Custom Items with Glowing Color Outlines

Dropped items with custom tags automatically receive glowing team outlines when dropped on the ground.

### Giving Items with Custom Glow Colors (1.21 Component Syntax):
Give an item with `custom_data={glow_<color>:1b}` where `<color>` is any of the supported colors:

```mcfunction
# Give a diamond sword that glows RED when dropped:
/give @s diamond_sword[custom_data={glow_red:1b}] 1

# Give a bow that glows GOLD when dropped:
/give @s bow[custom_data={glow_gold:1b}] 1

# Give an enchanted apple that glows AQUA when dropped:
/give @s enchanted_golden_apple[custom_data={glow_aqua:1b}] 1

# Give candy that glows BLACK (default candy glow):
/give @s pumpkin_pie[custom_model_data={floats:[1.0f],strings:["candy"]},custom_data={glow_black:1b,candy:1b},max_stack_size=1,item_name={"bold":true,"color":"dark_purple","italic":false,"text":"Candy"}] 1
```

### Supported Glow Colors:
- `glow_red`
- `glow_gold`
- `glow_yellow`
- `glow_green`
- `glow_lime`
- `glow_aqua`
- `glow_cyan`
- `glow_light_blue`
- `glow_blue`
- `glow_purple`
- `glow_magenta`
- `glow_pink`
- `glow_white`
- `glow_light_gray`
- `glow_gray`
- `glow_black`
- `glow_brown`

### Glowing Team Commands:
| Command | Description |
| :--- | :--- |
| `/function gourd_guard:item_glow/setup_teams` | Initializes all 16 Minecraft glowing team colors. |
| `/function gourd_guard:item_glow/colors/<color>` | Assigns executing item to specified color team (`red`, `green`, `blue`, `gold`, `aqua`, `black`, etc.). |

---

## Custom Skyboxes (Core Shaders)

The project includes custom procedural animated skybox shaders rendered directly in the game world using `item.vsh` and `item.fsh`.

### Available Skyboxes:
1. **Halloween Skybox** (Sky ID 2): Cosmic dark purple nebula gas swirls, twinkling starfields, animated witch-purple & spectral green aurora ribbons, shooting comets, and horizon void vignettes.
2. **Nebula Skybox** (Sky ID 1): Deep cosmic space nebula with starfields.

### How to Summon Skyboxes in the World:
Summon an Item Display entity wearing/holding the custom skybox item centered around the player or arena:

```mcfunction
# Summon the Halloween Animated Skybox at current position:
/summon item_display ~ ~ ~ {item:{id:"minecraft:item_frame",components:{"minecraft:item_model":"gourd_guard:skybox_halloween"}},transformation:{scale:[1000.0f,1000.0f,1000.0f],translation:[0.0f,0.0f,0.0f],rotation:[0.0f,0.0f,0.0f,1.0f]},teleport_duration:1}

# Summon the Nebula Animated Skybox at current position:
/summon item_display ~ ~ ~ {item:{id:"minecraft:item_frame",components:{"minecraft:item_model":"gourd_guard:skybox_nebula"}},transformation:{scale:[1000.0f,1000.0f,1000.0f],translation:[0.0f,0.0f,0.0f],rotation:[0.0f,0.0f,0.0f,1.0f]},teleport_duration:1}

# Clear active skybox displays:
/kill @e[type=item_display,distance=..100]
```

---

## Development & In-Game Reloading

- **Datapack Changes**: Run `/reload` in-game.
- **Resource Pack / Shaders / Sounds / Fonts**: Press `F3 + T` in-game.
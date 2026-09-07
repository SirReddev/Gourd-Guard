# Gourd Guard

Gourd Guard is a custom Halloween-themed minigame for Minecraft 1.21 Fabric featuring a custom Core Shader HUD, dynamic Minecrafter font rendering, custom candy mechanics, custom items, item glowing borders, boss health bars, wave progression systems, procedural custom skyboxes, and arcade loot drops.

---

## Repository Structure

| Directory | Description |
| :--- | :--- |
| **datapack/** | Contains all game functions, scoreboards, timer ticks, candy collection mechanics, wave managers, loot tables, and macro actionbar renderers (`data/gourd_guard/`). |
| **resourcepack/** | Contains custom text core shaders (`assets/minecraft/shaders/core/`), procedural skybox shaders (`assets/gourd_guard/shaders/`), Minecrafter bitmap font (`assets/gourd_guard/font/`), custom textures, 3D candy model, and sounds. |

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

- Datapack Changes: Run `/reload` in-game.
- Resource Pack / Shaders / Fonts: Press `F3 + T` in-game.
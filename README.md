# ðŸŽƒ Gourd Guard

**Gourd Guard** is a custom Halloween-themed minigame for **Minecraft 1.21 Fabric** featuring an advanced custom Core Shader HUD, dynamic Minecrafter font rendering, custom candy mechanics, custom items, item glowing borders, boss health bars, and wave progression systems.

---

## ðŸ“‚ Repository Structure

| Directory | Description |
| :--- | :--- |
| **datapack/** | Contains all game functions, scoreboards, timer ticks, candy collection mechanics, wave managers, and macro actionbar renderers (data/gourd_guard/). |
| **esourcepack/** | Contains custom text core shaders (ssets/minecraft/shaders/core/), Minecrafter bitmap font (ssets/gourd_guard/font/), custom textures, 3D candy model, and sounds. |

---

## ðŸ–¥ï¸ Custom HUD & Core Shaders

The HUD uses a custom vertex shader (	ext.vsh) with color-hooked glyphs to achieve absolute, pixel-perfect positioning, custom font scaling, and drift-free rendering on any screen resolution.

### 1. Top-Left Match HUD
- **Player Card Frame** (#01FFFF / \uE001): Wooden background frame.
- **Animated Player Avatar** (#010000): Live player skin face with hat layer (\times 56\text{px}$).
- **Stopwatch Timer Icon** (#0100FE / \uE003): Custom icon (\times 14\text{px}$).
- **Match Countdown Timer** (#0100FF):
  - Minecrafter font (gourd_guard:minecrafter) with balanced 8px bold colon.
  - Dynamic color transitions:
    - ðŸŸ¢ **Green** (#55FF55) when $> 2\text{m}$
    - ðŸŸ¡ **Yellow** (#FFFF55) when \text{m} - 2\text{m}$
    - ðŸŸ  **Orange** (#FFAA00) when \text{s} - 1\text{m}$
    - ðŸ”´ **Red** (#FF5555) when $< 30\text{s}$
- **Candy Icon** (#01FF00 / \uE002): Custom candy sprite (\times 16\text{px}$).
- **Candy Score** (#01FE00): Player candy balance in Minecrafter font with animated pop-up deltas (+XX in green / -XX in red).

### 2. Top-Center Objective HUD
- **Pumpkin Icon** (#01AA00 / \uE101): Objective head icon.
- **Health Bar** (#01AA01 / \uE102 - \uE116): 20-step dynamic health bar with exact 72px backstep cursor isolation.

### 3. Top-Right Hanging Sign HUD
- **Hanging Sign Board** (#01BB00 / \uE200): Double wooden board backdrop anchored to guiWidth.
- **Wave Display** (#01BB01): WAVE <number> scaled .85\times$ in pure white Minecrafter font.
- **Ghost Mob Icon** (#01BB02 / \uE201): Custom ghost icon (\times 14\text{px}$).
- **Mob Count Score** (#01BB03): Remaining mob count scaled .4\times$ in pure white Minecrafter font.

---

## ðŸŽ® Command Reference

### â±ï¸ Timer Commands
| Command | Description |
| :--- | :--- |
| /function gourd_guard:hud/timer/start | Start/resume the match countdown timer. |
| /function gourd_guard:hud/timer/pause | Pause the countdown timer. |
| /function gourd_guard:hud/timer/reset | Reset timer back to default (5:00). |
| /function gourd_guard:hud/timer/start_5m | Set timer to 5:00 and start immediately. |
| /function gourd_guard:hud/timer/start_1m | Set timer to 1:00 and start immediately. |
| /function gourd_guard:hud/timer/start_10s | Set timer to 0:10 (triggers red warning state). |

### ðŸ¬ Candy & Score Commands
| Command | Description |
| :--- | :--- |
| /function gourd_guard:give_candy | Gives the custom 3D model candy item to the player. |
| /function gourd_guard:hud/candy/add_50 | Add +50 coins to player (triggers green +50 pop-up). |
| /function gourd_guard:hud/candy/add_100 | Add +100 coins to player (triggers green +100 pop-up). |
| /function gourd_guard:hud/candy/remove_50 | Deduct 50 coins from player (triggers red -50 pop-up). |
| /function gourd_guard:hud/candy/remove_100 | Deduct 100 coins from player (triggers red -100 pop-up). |
| /function gourd_guard:hud/candy/reset | Reset player candy score to 0. |

### ðŸŽƒ Objective Bar Commands
| Command | Description |
| :--- | :--- |
| /function gourd_guard:hud/objective/damage_10 | Deal 10 damage to the Pumpkin Objective. |
| /function gourd_guard:hud/objective/damage_25 | Deal 25 damage to the Pumpkin Objective. |
| /function gourd_guard:hud/objective/heal_10 | Heal 10 HP to the Pumpkin Objective. |
| /function gourd_guard:hud/objective/heal_25 | Heal 25 HP to the Pumpkin Objective. |
| /function gourd_guard:hud/objective/set_hp | Set objective HP using score .objective obj_hp. |
| /function gourd_guard:hud/objective/set_max_hp | Set max HP using score .objective obj_max_hp. |
| /function gourd_guard:hud/objective/toggle | Toggle Objective HUD visibility. |
| /function gourd_guard:hud/objective/show | Force show Objective HUD. |
| /function gourd_guard:hud/objective/hide | Force hide Objective HUD. |

### ðŸ‘» Wave HUD Commands
| Command | Description |
| :--- | :--- |
| /function gourd_guard:hud/wave/next_wave | Advance to the next wave (+1). |
| /function gourd_guard:hud/wave/prev_wave | Return to previous wave (-1). |
| /function gourd_guard:hud/wave/add_mob | Increment mob count (+1). |
| /function gourd_guard:hud/wave/sub_mob | Decrement mob count (-1). |
| /function gourd_guard:hud/wave/set_wave | Set wave number via .global wave. |
| /function gourd_guard:hud/wave/set_mobs | Set mob count via .global wave_mobs. |
| /function gourd_guard:hud/wave/toggle | Toggle Wave HUD visibility. |
| /function gourd_guard:hud/wave/show | Force show Wave HUD. |
| /function gourd_guard:hud/wave/hide | Force hide Wave HUD. |

### ðŸ‘ï¸ Global HUD Visibility
| Command | Description |
| :--- | :--- |
| /function gourd_guard:hud/toggle_all | Toggle entire HUD on/off. |
| /function gourd_guard:hud/show | Force show full HUD. |
| /function gourd_guard:hud/hide | Force hide full HUD. |
| /function gourd_guard:hud/reset | Reset all HUD elements to default states. |

### âœ¨ Item Glowing Border Teams
| Command | Description |
| :--- | :--- |
| /function gourd_guard:item_glow/setup_teams | Initializes all 16 Minecraft glowing team colors. |
| /function gourd_guard:item_glow/colors/<color> | Applies glowing team (ed, green, lue, gold, qua, lack, etc.) |

---

## ðŸ› ï¸ Development & In-Game Reloading

- **Datapack Changes**: Run /reload in-game.
- **Resource Pack / Shaders / Fonts**: Press **F3 + T** in-game.
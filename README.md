# God UI Script

![](https://i.imgur.com/zyJut1p.gifv)

---

## Instructions

Move `God` folder to addons.

---

## Utility Functions

- Arrow Keys Work in Text Chat
- Extra slash commands
    - `/clc` to clear combat log
    - `/gm` to open a GM ticket
    - `/rc` for readycheck
    - `/cr` for check role

---

## UI Customization

### Character Frames

- Class color in HP bar
- Class icons instead of portraits

### Main Action Bar

- Hidden Background
- Hidden Button Borders
- Hidden Gryphons
- Repositioned to bottom center of screen with `30` offset y-axis
- Moved button anchor points from `MainMenuBartArtFrame` to `MainMenuBar`. (ArtFrame contains the background image, which we're not using.)

    **Bag Buttons**

    - Todo: Reposition to bottom right of screen. Hover to show.
    - Hidden

    **Ping Meter**

    - Repositioned to bottom left of screen

    **Micro Buttons**

    - Repositioned to bottom left of screen

### Bottom Left Action Bar

- Set BottomLeft anchor to TopLeft of `ActionButton1` (Lines up perfectly with Main action bar buttons)
- Hidden button borders

### Bottom Right Action Bar

- Set BottomLeft anchor to TopLeft of `MultiBarBottomLeftButton1` (Lines up perfectly with Main action bar buttons)
- Hidden button borders

### Minimap

- Hover mouse over minimap and scroll up/down to zoom.
- Hidden zoom buttons

### Frame Rate Counter

- Hidden `Frame rate` text label
- Repositioned to bottom right of screen
- Scaled to `0.9`

### XP Bar

- Repositioned to bottom center of screen
- Hidden until mouse hovered over bottom center of screen

---

## Scripting Reference

### Get UI Info

`/fstack`

### Show LUA Errors

`/console scriptErrors 1`

---
# README for Satb Framework

## Overview
The Satb Framework is a robust solution designed for Roblox game development.

## Installation for Roblox Studio
1. Open Roblox Studio.
2. Navigate to the "View" tab and enable "Explorer" and "Properties".
3. In the "Explorer" panel, right-click on `ReplicatedStorage`.
4. Select `Insert Object` > `ModuleScript` to create a new Module.
5. Copy and paste the necessary scripts from the Satb Framework into your ModuleScript.

## Usage Guide
### Lua Example for Basic Usage
```lua
local ArrowSystem = require(game.ReplicatedStorage:WaitForChild("ArrowSystem"))

ArrowSystem:initialize()
ArrowSystem:fireArrow()

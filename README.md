# OC Lua Types

Provides LuaCATS style type documentation for OpenComputers interfaces and APIs, based on https://ocdoc.cil.li/.

## Caveats

Since a lot of the time you will be importing components via the `require('component')` API, type inference will not work.
In those cases, you can easily set the type annotation yourself and enjoy full autocompletion afterwards:

```lua
---@type inventory_controller
local inventory_controller = require('component').inventory_controller
```

# How to import to your IDE

## VS Code
1. Install the extension `sumneko.lua`  
   https://marketplace.visualstudio.com/items?itemName=sumneko.lua
2. Configure your workspace settings `.vscode/settings.json`:  
   ```json
   {
        "Lua.workspace.library": [
            "path/to/OCLuaTypes/types"
        ]
   }
   ```

# Contributing

If you find bugs or missing entries in the types, or want to add more editor instructions, feel free to open a PR.
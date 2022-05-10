
---[[-----------------------------------------]]---
--      Init.lua - init file of micro-nvim       --
--               Author: Elai                    --
--              License: GPLv3                   --
---[[-----------------------------------------]]---

local core_modules = {

---- Core Settings --------------------------------
 "core/plugins",           -- Plugins + Packer Conf
 "core/keymaps",           -- Custom Mappings
 "core/options",           -- General Settings

---- Plugin Configurations ------------------------
 "configs/impatient",      -- Improve Startup Time
 "configs/colorshemes",    -- All Colorshemes
 "configs/treesitter",     -- Treesitter Config
 "configs/completion",     -- Auto Completion
 "configs/alpha-nvim",     -- Wellcome Screen
 "configs/nvim-tree",      -- File Explorer
 "configs/gitsigns",       -- Git Diff, Sign Column..
 "configs/comment-nvim",   -- Easily Comment Lines
 "configs/statusline",     -- Status Line
 "configs/colorizer",      -- Colors Highlighter

---- Other Utilities ------------------------------
 "utils/vstuff",           -- Other Stuff

}
-- Using pcall we can handle better any loading issues
for _, module in ipairs(core_modules) do
    local ok, err = pcall(require, module)
    if not ok then
      -- error("Error loading " .. module .. "\n\n" .. err)
      return
    end
end


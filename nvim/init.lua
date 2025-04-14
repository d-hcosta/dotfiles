-- Load the options from the config/options.lua file
require("core.options")
-- Load the keymaps from the config/keymaps.lua file
require("core.keymaps")
-- Setup lazy, this should always be last
-- Tell lazy that all plugin specs are found in the plugins directory
-- Pass it the options we specified above
require("core.lazy")

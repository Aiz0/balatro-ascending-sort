--- STEAMODDED HEADER
--- MOD_NAME: Ascending sort
--- MOD_ID: AizSort
--- MOD_AUTHOR: [Aiz]
--- MOD_DESCRIPTION: Click a sort button again to toggle ascending sort. you can also set your default sort.
--- BADGE_COLOUR: 0ea5e9
--- VERSION: 1.0.0
--- LOADER_VERSION_GEQ: 1.0.0-ALPHA-0731b-STEAMODDED

----------------------------------------------
------------MOD CODE -------------------------

local config = SMODS.current_mod.config

G.FUNCS.AizSort_callback = function(args)
    args = args or {}
    if
        args.cycle_config
        and args.cycle_config.ref_table
        and args.cycle_config.ref_value
    then
        args.cycle_config.ref_table[args.cycle_config.ref_value] = args.to_key
    end
end

SMODS.current_mod.config_tab = function()
    return {
        n = G.UIT.ROOT,
        config = {
            r = 0.1,
            align = "t",
            padding = 0.1,
            colour = G.C.BLACK,
            minw = 8,
            minh = 6,
        },
        nodes = {
            create_option_cycle({
                current_option = config.default_sort.value,
                options = config.default_sort.options,
                ref_table = config.default_sort,
                ref_value = "value",
                opt_callback = "AizSort_callback",
            }),
        },
    }
end

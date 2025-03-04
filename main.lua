local config = SMODS.current_mod.config

G.FUNCS.AizAscendingSort_callback = function(args)
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
    local loc_options = {}
    for i, v in ipairs(config.default_sort.options) do
        loc_options[i] = localize(v, "AizAscendingSort_options")
    end
    return {
        n = G.UIT.ROOT,
        config = {
            r = 0.1,
            align = "tm",
            padding = 0.1,
            colour = G.C.BLACK,
            minw = 8,
            minh = 6,
        },
        nodes = {
            create_option_cycle({
                label = localize("AizAscendingSort_default_sort"),
                current_option = config.default_sort.value,
                options = loc_options,
                ref_table = config.default_sort,
                ref_value = "value",
                opt_callback = "AizAscendingSort_callback",
                w = 6,
            }),
        },
    }
end

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
                opt_callback = "AizAscendingSort_callback",
            }),
        },
    }
end

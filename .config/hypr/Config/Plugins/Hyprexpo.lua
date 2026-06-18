hl.config({
    plugin = {
        hyprexpo = {
            columns = 3,
            gaps_in = 10,
            gaps_out = 10,
	    workspace_method = "first 1",
	    bg_col = "rgb(" .. BACKGROUND .. ")",

	    border_width = 2,
	    border_color = "rgb(" .. PRIMARY .. ")",
	    border_color_hover = "rgb(" .. PRIMARY .. ")",
	    border_color_focus = "rgb(" .. SECONDARY .. ")",
	    border_color_current = "rgb(" .. SECONDARY .. ")",

	    drag_drop_proxy_color = "rgba(" .. SECONDARY .. "20)",
	    drag_drop_proxy_active_color = "rgba(" .. PRIMARY .. "20)",

	    label_font_bold = 1,
	    label_font_size = 24,
	    label_bg_shape = "square",
	    label_color_default = "rgba(" .. SECONDARY .. "50)",
	    label_bg_color = "rgb(" .. BACKGROUND .. ")",
	    label_color_hover = "rgb(" .. PRIMARY .. ")",
	    label_color_focus = "rgb(" .. SECONDARY .. ")",
	    label_color_current = "rgb(" .. SECONDARY .. ")",
	    label_font_family = "JetBrainsMono Nerd Font",
        },
    },
})

hl.define_submap("hyprexpo", function()
    hl.bind("a",   	function() hl.plugin.hyprexpo.kb_focus("left") 	end)
    hl.bind("d",  	function() hl.plugin.hyprexpo.kb_focus("right") end)
    hl.bind("w",     	function() hl.plugin.hyprexpo.kb_focus("up") 	end)
    hl.bind("s",   	function() hl.plugin.hyprexpo.kb_focus("down") 	end)
    hl.bind("e", 	function() hl.plugin.hyprexpo.kb_confirm() 	end)
    hl.bind("q", 	function() hl.plugin.hyprexpo.expo("cancel") 	end)
    hl.bind("ALT + TAB",function() hl.plugin.hyprexpo.expo("cancel") 	end)
    hl.bind("1",      	function() hl.plugin.hyprexpo.kb_selecti(1) 	end)
    hl.bind("2",      	function() hl.plugin.hyprexpo.kb_selecti(2) 	end)
    hl.bind("3",      	function() hl.plugin.hyprexpo.kb_selecti(3) 	end)
    hl.bind("4",      	function() hl.plugin.hyprexpo.kb_selecti(4) 	end)
    hl.bind("5",      	function() hl.plugin.hyprexpo.kb_selecti(5) 	end)
    hl.bind("6",      	function() hl.plugin.hyprexpo.kb_selecti(6) 	end)
    hl.bind("7",      	function() hl.plugin.hyprexpo.kb_selecti(7) 	end)
    hl.bind("8",      	function() hl.plugin.hyprexpo.kb_selecti(8) 	end)
    hl.bind("9",      	function() hl.plugin.hyprexpo.kb_selecti(9) 	end)
    hl.bind("0",      	function() hl.plugin.hyprexpo.kb_selecti(10) 	end)
end)

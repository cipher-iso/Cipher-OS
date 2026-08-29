if hl.plugin.hyprglass then
    local hg = hl.plugin.hyprglass
    hg.config({ default_preset = "glass", layers = { enabled = 0 } })

    -- [ LAYER SURFACES ]
    hg.layer("waybar",  { mask_threshold = 0.85 })
    hg.layer("vicinae", { mask_threshold = 0.85 })
    hg.layer("swayosd", { mask_threshold = 0.85 }) 
    hg.layer("selection", { mask_threshold = 0.85 })
    hg.layer("swaync-notification-window", { mask_threshold = 0.85 })

    -- [ APPEARANCE SETTINGS ]
    hg.preset("glass", {
    	vibrancy = 0.25,
	contrast = 1.15,
	blur_strength = 1.5,
	lens_distortion = 1,
	tint_color = 0x00000090,
        edge_thickness = 0.075,
	vibrancy_darkness = 1,
	refraction_strength = 5,
    })
end

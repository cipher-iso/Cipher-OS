if hl.plugin.hyprglass then
    local hg = hl.plugin.hyprglass
    hg.config({ default_preset = "glass", tint_color = 0x00000000, layers = { enabled = 1 } })

    -- [ LAYER SURFACES ]
    hg.layer("waybar")
    hg.layer("vicinae", { mask_threshold = 0.6 })
    hg.layer("swayosd", { mask_threshold = 0.6 })
    hg.layer("swaync-notification-window", { mask_threshold = 0.6 })

    -- [ APPEARANCE SETTINGS ]
    hg.preset("glass", {
    	vibrancy = 1,
	brightness = 1,
	contrast = 1.2,
	saturation = 1.5,
	adaptive_dim = 1,
	blur_strength = 1.5,
        glass_opacity = 1.75,
        edge_thickness = 0.05,
	vibrancy_darkness = 0,
	refraction_strength = 5,
	chromatic_aberration = 0.25,
    })
end

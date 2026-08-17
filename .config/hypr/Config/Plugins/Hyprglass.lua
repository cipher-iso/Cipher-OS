if hl.plugin.hyprglass then
    local hg = hl.plugin.hyprglass
    hg.config({ default_preset = "glass", tint_color = 0x00000000, layers = { enabled = 1 } })

    -- [ LAYER SURFACES ]
    hg.layer("waybar",  { exclude = true })
    hg.layer("vicinae", { exclude = true })
    hg.layer("swayosd", { exclude = true })
    hg.layer("swaync-notification-window", { exclude = true })
    hg.layer("selection", { exclude = true })

    -- [ APPEARANCE SETTINGS ]
    hg.preset("glass", {
    	vibrancy = 1,
	contrast = 1.15,
	adaptive_dim = 1,
	blur_strength = 2,
	lens_distortion = 1,
        glass_opacity = 1,
        edge_thickness = 0.075,
	vibrancy_darkness = 0,
	refraction_strength = 5,
	chromatic_aberration = 0.25,
    })
end

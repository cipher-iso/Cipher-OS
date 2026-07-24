if hl.plugin.hyprglass then
    local hg = hl.plugin.hyprglass

    hg.config({
        default_preset = "glass",
        tint_color = 0x00000000,
        layers = { enabled = 1 },
    })

    -- Layer surfaces: each call whitelists the namespace and configures it
    hg.layer("vicinae")
    hg.layer("waybar")
    hg.layer("swaync")

    -- Preset
    hg.preset("glass", {
        glass_opacity = 1.75,
        blur_strength = 1.5,
	chromatic_aberration = 0.25,
	refraction_strength = 5,
	edge_thickness = 0.05,
	vibrancy = 1,
	vibrancy_darkness = 0,
	brightness = 1,
	saturation = 1.5,
	contrast = 1.2,
	adaptive_dim = 1,
    })
end

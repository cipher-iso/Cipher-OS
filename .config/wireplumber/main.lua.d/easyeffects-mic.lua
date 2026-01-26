-- Disable autoconnect so we can control it manually
rule = {
  matches = {
    {
      { "node.name", "matches", "alsa_input.usb-Focusrite_Scarlett_2i2_USB-00.HiFi__Mic1__source" }
    }
  },
  apply_properties = {
    ["node.autoconnect"] = false
  }
}
table.insert(alsa_monitor.rules, rule)

-- Create loopback from mic to EasyEffects input
Session:load_module("libpipewire-module-loopback", {
  ["capture.props"] = {
    ["node.name"] = "Mic-to-EasyEffects",
    ["media.class"] = "Audio/Source",
    ["node.description"] = "Looped Mic to EasyEffects"
  },
  ["playback.props"] = {
    ["target.node"] = "easyeffects_sink"
  }
})


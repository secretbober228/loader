--ЧУНДРА ЧУЧУНДРА ЧУНДРА ЧУЧУНДРА
--фу блять кто им позволил лурапф настраивать я хз
local ui = require("gamesense/pui")
local _entity = require("gamesense/entity")
local weapons = require("gamesense/csgo_weapons")
local anti_aims = require("gamesense/antiaim_funcs")
local base64 = require("gamesense/base64")
local clipboard = require("gamesense/clipboard")
local images = require("gamesense/images")
local vector = require("vector")
local ui_hotkey, renderer_circle_outline, renderer_rectangle, ui_is_menu_open, globals_frametime, globals_realtime, ui_reference, client_delay_call, globals_curtime, client_random_int, client_exec, entity_is_enemy, entity_get_player_name, client_userid_to_entindex, ui_color_picker, renderer_text, renderer_measure_text, client_screen_size, math_min, math_max, entity_get_players, entity_is_dormant, client_current_threat, entity_get_player_weapon, entity_get_game_rules, math_abs, ui_slider, ui_new_label, ui_checkbox, ui_combobox, ui_multiselect, bit_band, client_latency, client_set_clan_tag, client_set_event_callback, contains, entity_get_local_player, entity_get_prop, entity_is_alive, entity_set_prop, globals_tickcount, math_floor, toticks, ui_get, ui_new_checkbox, ui_new_multiselect, ui_set, ui_set_callback = ui.hotkey, renderer.circle_outline, renderer.rectangle, ui.is_menu_open, globals.frametime, globals.realtime, ui.reference, client.delay_call, globals.curtime, client.random_int, client.exec, entity.is_enemy, entity.get_player_name, client.userid_to_entindex, ui.color_picker, renderer.text, renderer.measure_text, client.screen_size, math.min, math.max, entity.get_players, entity.is_dormant, client.current_threat, entity.get_player_weapon, entity.get_game_rules, math.abs, ui.slider, ui.label, ui.checkbox, ui.combobox, ui.multiselect, bit.band, client.latency, client.set_clan_tag, client.set_event_callback, contains, entity.get_local_player, entity.get_prop, entity.is_alive, entity.set_prop, globals.tickcount, math.floor, toticks, ui.get, ui.checkbox, ui.new_multiselect, ui.set, ui.set_callback

local function contains(tab, val)
    for index, value in ipairs(tab) do
        if value == val then return true end
    end
    return false
end

local cfg_tbl = {
    {
        name = "Default",
        data = "W3siYnVpbGRlciI6eyJzdGF0ZSI6ImZha2VsYWcifSwidGFiIjoiY29uZmlncyIsInZpc3VhbHMiOnsiZ2xvd19yYWQiOjQsImluZGljYXRvcnNfdHlwZSI6IkFsdGVybmF0aXZlIiwiZ2xvdyI6ZmFsc2UsIm91dHB1dCI6e30sInZlbF95IjoyNTAsImVsZW1lbnRzIjpbIldhdGVybWFyayIsIkhpdCBMb2dzIiwiSW5kaWNhdG9ycyIsIlZlbG9jaXR5IFdhcm5pbmciXSwiY29sb3JfM19jIjoiI0FGQUZBRkZGIiwiY29sb3JfMV9jIjoiI0FGQUZBRkZGIiwic3dpdGNoX2NvbG9yX2MiOiIjRkZGRkZGRkYiLCJtYWluX2NvbG9yX2MiOiIjRkY1MTUxRkYiLCJjb2xvcl80X2MiOiIjRkY1MTUxRkYiLCJjb2xvcl8yX2MiOiIjQUZBRkFGRkYifSwibWFpbl9jaGVjayI6dHJ1ZSwibWFpbiI6eyJhdm9pZF9iYWNrc3RhYl9kaXN0IjozMDAsInJlc2V0X3RpbWUiOjE3LCJmcmVlc3RhbmRpbmdfZGlzIjp7fSwib3B0aW9ucyI6WyJBdm9pZCBiYWNrc3RhYiJdfSwibWlzYyI6eyJhbmltX2JyZWFrZXIiOlsiQmFja3dhcmQgbGVncyIsIkZyZWV6ZSBsZWdzIGluIGFpciJdLCJraWxsc2F5IjpmYWxzZSwiY2xhbnRhZyI6ZmFsc2V9LCJjb25maWdzIjp7ImNmZ19saXN0IjowLCJjZmdfbmFtZSI6InRlbmFnIn19LFt7ImVuYWJsZSI6dHJ1ZSwieF93YXlfc2xpZGVyIjoxLCJib2R5eWF3X2FkZCI6NjAsImJvZHlfeWF3IjoiSml0dGVyIiwiZGVmZW5zaXZlX3BpdGNoIjoiT2ZmIiwid2F5XzIiOjE4MCwiYW50aV9icnV0ZSI6ZmFsc2UsInlhd19qaXR0ZXIiOiJDZW50ZXIiLCJhbnRpX2JydXRlX29wdGlvbnMiOnt9LCJ5YXdfZmxpY2tfdG8iOjAsIndheV8xIjo5MCwid2F5XzQiOi05MCwieWF3X2ppdHRlcl9zbGlkZXJfbCI6MCwiZGVmZW5zaXZlX3lhdyI6IkluaGVyaXQiLCJ5YXdfbGVmdCI6MCwiZGVmZW5zaXZlX2FhIjpmYWxzZSwieWF3IjoiMTgwIiwiZm9yY2VfZGVmZW5zaXZlIjpmYWxzZSwid2F5XzUiOi0xODAsInlhd19mbGlja19zcGVlZCI6MSwieWF3X2ppdHRlcl9zbGlkZXJfciI6Miwid2F5XzYiOjAsIndheV83Ijo5MCwieWF3X2ZsaWNrX2Zyb20iOjAsInlhd19yaWdodCI6MCwid2F5XzMiOjB9LHsiZW5hYmxlIjp0cnVlLCJ4X3dheV9zbGlkZXIiOjEsImJvZHl5YXdfYWRkIjo3MSwiYm9keV95YXciOiJKaXR0ZXIiLCJkZWZlbnNpdmVfcGl0Y2giOiJPZmYiLCJ3YXlfMiI6MTgwLCJhbnRpX2JydXRlIjpmYWxzZSwieWF3X2ppdHRlciI6IkNlbnRlciIsImFudGlfYnJ1dGVfb3B0aW9ucyI6e30sInlhd19mbGlja190byI6MCwid2F5XzEiOjkwLCJ3YXlfNCI6LTkwLCJ5YXdfaml0dGVyX3NsaWRlcl9sIjoxOSwiZGVmZW5zaXZlX3lhdyI6IkluaGVyaXQiLCJ5YXdfbGVmdCI6LTE1LCJkZWZlbnNpdmVfYWEiOmZhbHNlLCJ5YXciOiIxODAiLCJmb3JjZV9kZWZlbnNpdmUiOmZhbHNlLCJ3YXlfNSI6LTE4MCwieWF3X2ZsaWNrX3NwZWVkIjoxLCJ5YXdfaml0dGVyX3NsaWRlcl9yIjoyLCJ3YXlfNiI6MCwid2F5XzciOjkwLCJ5YXdfZmxpY2tfZnJvbSI6MCwieWF3X3JpZ2h0Ijo0MSwid2F5XzMiOjB9LHsiZW5hYmxlIjp0cnVlLCJ4X3dheV9zbGlkZXIiOjEsImJvZHl5YXdfYWRkIjo4MiwiYm9keV95YXciOiJKaXR0ZXIiLCJkZWZlbnNpdmVfcGl0Y2giOiJPZmYiLCJ3YXlfMiI6MTgwLCJhbnRpX2JydXRlIjpmYWxzZSwieWF3X2ppdHRlciI6IkNlbnRlciIsImFudGlfYnJ1dGVfb3B0aW9ucyI6e30sInlhd19mbGlja190byI6MCwid2F5XzEiOjkwLCJ3YXlfNCI6LTkwLCJ5YXdfaml0dGVyX3NsaWRlcl9sIjo1OCwiZGVmZW5zaXZlX3lhdyI6IkluaGVyaXQiLCJ5YXdfbGVmdCI6MCwiZGVmZW5zaXZlX2FhIjpmYWxzZSwieWF3IjoiMTgwIiwiZm9yY2VfZGVmZW5zaXZlIjpmYWxzZSwid2F5XzUiOi0xODAsInlhd19mbGlja19zcGVlZCI6MSwieWF3X2ppdHRlcl9zbGlkZXJfciI6NjIsIndheV82IjowLCJ3YXlfNyI6OTAsInlhd19mbGlja19mcm9tIjowLCJ5YXdfcmlnaHQiOjAsIndheV8zIjowfSx7ImVuYWJsZSI6dHJ1ZSwieF93YXlfc2xpZGVyIjoxLCJib2R5eWF3X2FkZCI6NjUsImJvZHlfeWF3IjoiSml0dGVyIiwiZGVmZW5zaXZlX3BpdGNoIjoiT2ZmIiwid2F5XzIiOjE4MCwiYW50aV9icnV0ZSI6ZmFsc2UsInlhd19qaXR0ZXIiOiJDZW50ZXIiLCJhbnRpX2JydXRlX29wdGlvbnMiOnt9LCJ5YXdfZmxpY2tfdG8iOjAsIndheV8xIjo5MCwid2F5XzQiOi05MCwieWF3X2ppdHRlcl9zbGlkZXJfbCI6NjUsImRlZmVuc2l2ZV95YXciOiJJbmhlcml0IiwieWF3X2xlZnQiOjAsImRlZmVuc2l2ZV9hYSI6ZmFsc2UsInlhdyI6IjE4MCIsImZvcmNlX2RlZmVuc2l2ZSI6ZmFsc2UsIndheV81IjotMTgwLCJ5YXdfZmxpY2tfc3BlZWQiOjEsInlhd19qaXR0ZXJfc2xpZGVyX3IiOjc1LCJ3YXlfNiI6MCwid2F5XzciOjkwLCJ5YXdfZmxpY2tfZnJvbSI6MCwieWF3X3JpZ2h0IjowLCJ3YXlfMyI6MH0seyJlbmFibGUiOnRydWUsInhfd2F5X3NsaWRlciI6MSwiYm9keXlhd19hZGQiOjUyLCJib2R5X3lhdyI6IkppdHRlciIsImRlZmVuc2l2ZV9waXRjaCI6Ik9mZiIsIndheV8yIjoxODAsImFudGlfYnJ1dGUiOmZhbHNlLCJ5YXdfaml0dGVyIjoiQ2VudGVyIiwiYW50aV9icnV0ZV9vcHRpb25zIjp7fSwieWF3X2ZsaWNrX3RvIjowLCJ3YXlfMSI6OTAsIndheV80IjotOTAsInlhd19qaXR0ZXJfc2xpZGVyX2wiOjUyLCJkZWZlbnNpdmVfeWF3IjoiSW5oZXJpdCIsInlhd19sZWZ0IjowLCJkZWZlbnNpdmVfYWEiOmZhbHNlLCJ5YXciOiIxODAiLCJmb3JjZV9kZWZlbnNpdmUiOmZhbHNlLCJ3YXlfNSI6LTE4MCwieWF3X2ZsaWNrX3NwZWVkIjoxLCJ5YXdfaml0dGVyX3NsaWRlcl9yIjo2NSwid2F5XzYiOjAsIndheV83Ijo5MCwieWF3X2ZsaWNrX2Zyb20iOjAsInlhd19yaWdodCI6MCwid2F5XzMiOjB9LHsiZW5hYmxlIjp0cnVlLCJ4X3dheV9zbGlkZXIiOjEsImJvZHl5YXdfYWRkIjo2MCwiYm9keV95YXciOiJKaXR0ZXIiLCJkZWZlbnNpdmVfcGl0Y2giOiJPZmYiLCJ3YXlfMiI6MTgwLCJhbnRpX2JydXRlIjpmYWxzZSwieWF3X2ppdHRlciI6IkNlbnRlciIsImFudGlfYnJ1dGVfb3B0aW9ucyI6e30sInlhd19mbGlja190byI6MCwid2F5XzEiOjkwLCJ3YXlfNCI6LTkwLCJ5YXdfaml0dGVyX3NsaWRlcl9sIjozNiwiZGVmZW5zaXZlX3lhdyI6IkluaGVyaXQiLCJ5YXdfbGVmdCI6MjEsImRlZmVuc2l2ZV9hYSI6ZmFsc2UsInlhdyI6IjE4MCIsImZvcmNlX2RlZmVuc2l2ZSI6ZmFsc2UsIndheV81IjotMTgwLCJ5YXdfZmxpY2tfc3BlZWQiOjEsInlhd19qaXR0ZXJfc2xpZGVyX3IiOjU0LCJ3YXlfNiI6MCwid2F5XzciOjkwLCJ5YXdfZmxpY2tfZnJvbSI6MCwieWF3X3JpZ2h0IjozMCwid2F5XzMiOjB9LHsiZW5hYmxlIjp0cnVlLCJ4X3dheV9zbGlkZXIiOjEsImJvZHl5YXdfYWRkIjo2MCwiYm9keV95YXciOiJPZmYiLCJkZWZlbnNpdmVfcGl0Y2giOiJPZmYiLCJ3YXlfMiI6MTgwLCJhbnRpX2JydXRlIjpmYWxzZSwieWF3X2ppdHRlciI6IkNlbnRlciIsImFudGlfYnJ1dGVfb3B0aW9ucyI6e30sInlhd19mbGlja190byI6MCwid2F5XzEiOjkwLCJ3YXlfNCI6LTkwLCJ5YXdfaml0dGVyX3NsaWRlcl9sIjo4MCwiZGVmZW5zaXZlX3lhdyI6IkluaGVyaXQiLCJ5YXdfbGVmdCI6MCwiZGVmZW5zaXZlX2FhIjpmYWxzZSwieWF3IjoiMTgwIiwiZm9yY2VfZGVmZW5zaXZlIjpmYWxzZSwid2F5XzUiOi0xODAsInlhd19mbGlja19zcGVlZCI6MSwieWF3X2ppdHRlcl9zbGlkZXJfciI6MzQsIndheV82IjowLCJ3YXlfNyI6OTAsInlhd19mbGlja19mcm9tIjowLCJ5YXdfcmlnaHQiOjAsIndheV8zIjowfSx7ImVuYWJsZSI6dHJ1ZSwieF93YXlfc2xpZGVyIjoxLCJib2R5eWF3X2FkZCI6NzMsImJvZHlfeWF3IjoiSml0dGVyIiwiZGVmZW5zaXZlX3BpdGNoIjoiT2ZmIiwid2F5XzIiOjE4MCwiYW50aV9icnV0ZSI6ZmFsc2UsInlhd19qaXR0ZXIiOiJDZW50ZXIiLCJhbnRpX2JydXRlX29wdGlvbnMiOnt9LCJ5YXdfZmxpY2tfdG8iOjAsIndheV8xIjo5MCwid2F5XzQiOi05MCwieWF3X2ppdHRlcl9zbGlkZXJfbCI6NTIsImRlZmVuc2l2ZV95YXciOiJJbmhlcml0IiwieWF3X2xlZnQiOjAsImRlZmVuc2l2ZV9hYSI6ZmFsc2UsInlhdyI6IjE4MCIsImZvcmNlX2RlZmVuc2l2ZSI6ZmFsc2UsIndheV81IjotMTgwLCJ5YXdfZmxpY2tfc3BlZWQiOjEsInlhd19qaXR0ZXJfc2xpZGVyX3IiOjYyLCJ3YXlfNiI6MCwid2F5XzciOjkwLCJ5YXdfZmxpY2tfZnJvbSI6MCwieWF3X3JpZ2h0IjowLCJ3YXlfMyI6MH1dXQ=="
    }
}
local data = {
    lua_name = "luno",
    lua_build = "nightly",
    user_name = "UwUboy",
    upd = "ХУЙНЯ"
}
local config
local w, h = client_screen_size()
local ver = "crack"
local aa_states = {"shared", "stand", "run", "slowwalk", "crouch", "crouch-air", "air", "fakelag"}
local indicator_names = {"shared", "stand", "run", "walk", "crouch", "c-air", "air", "fakelag"}
local ui_elements = {
    main_check = ui_checkbox("AA", "Anti-aimbot angles", "Enable luno"),
    tab = ui_combobox("AA", "Anti-aimbot angles", "Tab", {"main", "builder", "visuals", "misc", "configs"}, nil, false),
    main = {
        name = ui_new_label("AA", "Anti-aimbot angles", "Welcome back: \v" .. data.user_name),
        info = ui_new_label("AA", "Anti-aimbot angles", "Your build is: \v" .. data.lua_build),
        upd = ui_new_label("AA", "Anti-aimbot angles", "Last update was: \v" .. data.upd),
        ds = ui.button("AA", "Other", "discord: МММММММММ МАРОЖЕННОЕЕЕ"),

    },
    builder = {
        options = ui_multiselect("AA", "Anti-aimbot angles", "Options", {"Avoid backstab", "Reset Anti-bruteforce time", "Disable AA during Warmup", "Freestanding disablers", "Manual AA"}),
        avoid_backstab_dist = ui_slider("AA", "Anti-aimbot angles", "\v-> \rdistance", 50, 400, 300),
        reset_time = ui_slider("AA", "Anti-aimbot angles", "\v-> \rreset time", 1, 300, 17, true, "s", 0.1),
        freestanding_dis = ui_multiselect("AA", "Anti-aimbot angles", "\v-> \rdisablers", {"Standing", "Moving", "Crouching", "In-Air", "Air duck", "Slow walk"}),
        manual_left = ui_hotkey("AA", "Anti-aimbot angles", "Manual AA Left"),
        manual_right = ui_hotkey("AA", "Anti-aimbot angles", "Manual AA Right"),
        state = ui_combobox("AA", "Anti-aimbot angles", "State", aa_states),
    },
    visuals = {
        elements = ui_multiselect("AA", "Anti-aimbot angles", "Elements", {"Watermark", "Hit Logs", "Indicators", "Velocity Warning", "Manual arrows", "Aspect ratio", "Minimum damage indicator"}),
        output = ui_multiselect("AA", "Anti-aimbot angles", "Output", {"Console", "Notification"}),
        glow = ui_checkbox("AA", "Anti-aimbot angles", "\v-> \rGlow"),
        glow_rad = ui_slider("AA", "Anti-aimbot angles", "\v-> \rRadius", 1, 10, 4),
        color_1 = ui_new_label("AA", "Anti-aimbot angles", "Start", {175, 175, 175, 255}),
        color_2 = ui_new_label("AA", "Anti-aimbot angles", "End", {175, 175, 175, 255}),
        color_3 = ui_new_label("AA", "Anti-aimbot angles", "Version", {175, 175, 175, 255}),
        color_4 = ui_new_label("AA", "Anti-aimbot angles", "Hitlogs", {255, 81, 81, 255}),
        indicators_type = ui_combobox("AA", "Anti-aimbot angles", "Indicators Type", "Default", "Alternative"),
        main_color = ui_new_label("AA", "Anti-aimbot angles", "\v-> \rMain Color", {255, 81, 81, 255}),
        switch_color = ui_new_label("AA", "Anti-aimbot angles", "\v-> \rSwitch Color", {255, 81, 81, 255}),
        vel_y = ui_slider("AA", "Anti-aimbot angles", "\v-> \rVelocity Y", 1, h-40, 250),
        asp_v = ui_slider("AA", "Anti-aimbot angles", "Aspect ratio value", 0, 200, 0),
    },
    misc = {
        anim_breaker = ui_multiselect("AA", "Anti-aimbot angles", "Animation breaker", {"Backward legs", "Walking Legs in air", "Freeze legs in air", "Pitch 0"}),
        killsay = ui_checkbox("AA", "Anti-aimbot angles", "Killsay"),
        clantag = ui_checkbox("AA", "Anti-aimbot angles", "Clantag"),
        airstop = ui_checkbox("AA", "Anti-aimbot angles", "Air stop"),
        airstop_key = ui_hotkey("AA", "Anti-aimbot angles", "Air stop", true),
        jump_scout = ui_checkbox("AA", "Anti-aimbot angles", "Jump scout"),
        rezik = ui_checkbox("AA", "Anti-aimbot angles", "Resolver"),
        flick_ex = ui_checkbox("AA", "Anti-aimbot angles", "Defensive flick"),
        flick_ex_k = ui_hotkey("AA", "Anti-aimbot angles", "Defensive flick", true),
        predict_ex = ui_checkbox("AA", "Anti-aimbot angles", "Predict"),
    },
    configs = {
        cfg_list = ui.listbox("AA", "Anti-aimbot angles", 'Cfg List', 'no'),
        cfg_name =  ui.textbox("AA", "Anti-aimbot angles", 'Config name'),
        load_btn = ui.button("AA", "Anti-aimbot angles", "Load", function() end),
        save_btn = ui.button("AA", "Anti-aimbot angles", "Save", function() end),
        del_btn = ui.button("AA", "Anti-aimbot angles", "Delete", function() end),
        create_btn = ui.button("AA", "Anti-aimbot angles", "Create", function() end),
        import_cfg = ui.button("AA", "Other", "Import", function() 
            local raw = clipboard.get()
            local s = pcall(function() config:load(json.parse(base64.decode(raw))) end)
            if s then
            print("Config Imported!")
            else
            print("Invalid Config!")
            end
        end, true, "Imports a config from the clipboard"),
        export_btn = ui.button("AA", "Other", "Export", function()
            local raw = clipboard.get()
            local config = config:save()
            local s = pcall(function() clipboard.set(base64.encode(json.stringify(config))) end)
            if s then
            print("Config Exported!")
            else
            print("Unknown error!")
            end 
        end),
    }
}

local aa_builder = {}

for i=1, #aa_states do
    aa_builder[i] = {
        enable = ui_new_checkbox("AA", "Anti-aimbot angles", "\v" .. aa_states[i] .. ": \rToggle"),
        yaw = ui_combobox("AA", "Anti-aimbot angles", "\v" .. aa_states[i] .. ": \rYaw", "Off", "180", "Spin", "Static", "180 Z", "Crosshair", "Flick"),
        yaw_flick_from = ui_slider("AA", "Anti-aimbot angles", "\v" .. aa_states[i] .. ": \rFrom\n" .. aa_states[i], -180, 180, 0),
        yaw_flick_to = ui_slider("AA", "Anti-aimbot angles", "\v" .. aa_states[i] .. ": \rTo\n" .. aa_states[i], -180, 180, 0),
        yaw_flick_delay = ui_slider("AA", "Anti-aimbot angles", "\v" .. aa_states[i] .. ": \rDelay\n" .. aa_states[i], 1, 100),
        yaw_left = ui_slider("AA", "Anti-aimbot angles", "\v" .. aa_states[i] .. ": \rLeft\n" .. aa_states[i], -180, 180, 0),
        yaw_right = ui_slider("AA", "Anti-aimbot angles", "\v" .. aa_states[i] .. ": \rRight\n" .. aa_states[i], -180, 180, 0),
        yaw_jitter = ui_combobox("AA", "Anti-aimbot angles", "\v" .. aa_states[i] .. ": \rYaw Jitter", "Off", "Offset", "Center", "Random", "Skitter", "X-Way"),
        yaw_jitter_slider_r = ui_slider("AA", "Anti-aimbot angles", "\v" .. aa_states[i] .. ": \r Right Jitter", -180, 180, 0),
        yaw_jitter_slider_l = ui_slider("AA", "Anti-aimbot angles", "\v" .. aa_states[i] .. ": \r Left Jitter", -180, 180, 0),
        sep = ui_new_label("AA", "Anti-aimbot angles", "---------------------\a6BFFA1FFX-Way\r---------------------"),
        x_way_slider = ui_slider("AA", "Anti-aimbot angles", "\nWays" .. aa_states[i], 1, 7, 0, 1, "w"),
        way_1 = ui_slider("AA", "Anti-aimbot angles", "[\a6BFFA1FF1\aCDCDCDFF] Way\n" .. aa_states[i], -180, 180, 90),
        way_2 = ui_slider("AA", "Anti-aimbot angles", "[\a6BFFA1FF2\aCDCDCDFF] Way\n" .. aa_states[i], -180, 180, 180),
        way_3 = ui_slider("AA", "Anti-aimbot angles", "[\a6BFFA1FF3\aCDCDCDFF] Way\n" .. aa_states[i], -180, 180, 0),
        way_4 = ui_slider("AA", "Anti-aimbot angles", "[\a6BFFA1FF4\aCDCDCDFF] Way\n" .. aa_states[i], -180, 180, -90),
        way_5 = ui_slider("AA", "Anti-aimbot angles", "[\a6BFFA1FF5\aCDCDCDFF] Way\n" .. aa_states[i], -180, 180, -180),
        way_6 = ui_slider("AA", "Anti-aimbot angles", "[\a6BFFA1FF6\aCDCDCDFF] Way\n" .. aa_states[i], -180, 180, 0),
        way_7 = ui_slider("AA", "Anti-aimbot angles", "[\a6BFFA1FF7\aCDCDCDFF] Way\n" .. aa_states[i], -180, 180, 90),
        body_yaw = ui_combobox("AA", "Anti-aimbot angles", "\v" .. aa_states[i] ..  ": \rBody yaw", "Off", "Opposite", "Jitter", "Static"),
        bodyyaw_add = ui_slider("AA", "Anti-aimbot angles", "\v" .. aa_states[i] ..  ": \rFake", -180, 180, 0),
        defensive_aa = ui_new_checkbox("AA", "Anti-aimbot angles", "\v" .. aa_states[i] .. ": \rDefensive AA"),
        defensive_pitch = ui_combobox("AA", "Anti-aimbot angles", "Pitch\a00000000" .. aa_states[i], "Off", "Down", "Up", "Zero", "Random"),
        defensive_yaw_main = ui_combobox("AA", "Anti-aimbot angles", "Yaw\a00000000" .. aa_states[i], "Side-ways", "Spin"),
        defensive_yaw_speed = ui_slider("AA", "Anti-aimbot angles", "\nYaw Speed " .. aa_states[i], -180, 180, 0),
        defensive_yaw = ui_combobox("AA", "Anti-aimbot angles", "Yaw Modifier\a00000000" .. aa_states[i], "Inherit", "Offset", "Center", "Random", "Skitter"),
        force_defensive = ui_new_checkbox("AA", "Anti-aimbot angles", "Force Defensive\a00000000" .. aa_states[i]),
        anti_brute = ui_new_checkbox("AA", "Anti-aimbot angles", "\v" .. aa_states[i] .. ": \rAnti-brute"),
        anti_brute_options = ui_multiselect("AA", "Anti-aimbot angles", "\v" .. aa_states[i] .. ": \rOptions", {"Side", "Yaw Offset"}),
    }
end

config = ui.setup({ui_elements, aa_builder})

local ignored_elements = {
    main_check = true,
    tab = true
}

local dele = false

local aa_refs = {
    leg_movement = ui_reference("AA", "other", "leg movement"),
    main_check = ui_reference("AA", "Anti-aimbot angles", "Enabled"),
    pitch = {ui_reference("AA", "Anti-aimbot angles", "Pitch")},
    yaw = {ui_reference("AA", "Anti-aimbot angles", "Yaw")},
    yaw_jitter = {ui_reference("AA", "Anti-aimbot angles", "Yaw jitter")},
    aa_yaw_base = ui_reference("AA", "Anti-aimbot angles", "Yaw base"),
    body_yaw = {ui_reference("AA", "Anti-aimbot angles", "body yaw")},
    freestanding = {ui_reference("AA", "Anti-aimbot angles", "Freestanding")},
    freestanding_body = ui_reference("AA", "Anti-aimbot angles", "Freestanding body yaw"),
    roll = ui_reference("AA", "Anti-aimbot angles", "Roll"),
    doubletap = ui_reference("RAGE", "aimbot", "Double tap"),
    on_shot = ui_reference("AA", "Other", "On shot anti-aim"),
    slow_walk = ui_reference('aa', 'other', 'Slow motion'),
    duck_assist = ui_reference("RAGE", "Other", "Duck peek assist"),
    air_strafe = ui_reference("Misc", "Movement", "Air strafe"),
    min_damage = { ui_reference("Rage", "Aimbot", "Minimum damage override") },
}
local hide_elements = {
    leg_movement = ui_reference("AA", "other", "leg movement"),
    main_check = ui_reference("AA", "Anti-aimbot angles", "Enabled"),
    pitch = {ui_reference("AA", "Anti-aimbot angles", "Pitch")},
    yaw = {ui_reference("AA", "Anti-aimbot angles", "Yaw")},
    yaw_jitter = {ui_reference("AA", "Anti-aimbot angles", "Yaw jitter")},
    aa_yaw_base = ui_reference("AA", "Anti-aimbot angles", "Yaw base"),
    body_yaw = {ui_reference("AA", "Anti-aimbot angles", "body yaw")},
    fs = ui_reference("AA", "Anti-aimbot angles", "Freestanding"),
    es = ui_reference("AA", "Anti-aimbot angles", "Edge yaw"),
    freestanding_body = ui_reference("AA", "Anti-aimbot angles", "Freestanding body yaw"),
    roll = ui_reference("AA", "Anti-aimbot angles", "Roll")
}

local set_visible_func = function()
ui.traverse(ui_elements, function(element, path)
    if not ignored_elements[path[1]] then
    element:depend(ui_elements.main_check, {ui_elements.tab, path[1]})
    end
end)
ui.traverse(aa_builder, function(element, path)
    element:depend(ui_elements.main_check, {ui_elements.tab, "builder"}, {ui_elements.builder.state, aa_states[path[1]]})
end)

for i=1, #aa_states do
    local builder = aa_builder[i]
    builder.yaw_flick_from:depend({builder.yaw, "Flick"})
    builder.yaw_flick_to:depend({builder.yaw, "Flick"})
    builder.yaw_flick_delay:depend({builder.yaw, "Flick"})
    builder.yaw_left:depend({builder.yaw, function() return builder.yaw.value ~= "Flick" end})
    builder.yaw_right:depend({builder.yaw, function() return builder.yaw.value ~= "Flick" end})
    builder.x_way_slider:depend({builder.yaw_jitter, "X-Way"})
    builder.sep:depend({builder.yaw_jitter, "X-Way"})
    builder.yaw_jitter_slider_r:depend({builder.yaw_jitter, "X-Way", true})
    builder.yaw_jitter_slider_l:depend({builder.yaw_jitter, "X-Way", true})
    builder.defensive_pitch:depend(builder.defensive_aa)
    builder.defensive_yaw:depend(builder.defensive_aa)
    builder.defensive_yaw_main:depend(builder.defensive_aa)
    builder.defensive_yaw_speed:depend(builder.defensive_aa)
    builder.force_defensive:depend(builder.defensive_aa)
    builder.anti_brute_options:depend(builder.anti_brute)
    
    for h=1, 7 do
        aa_builder[i]["way_" .. h]:depend({builder.yaw_jitter, "X-Way"}, {builder.x_way_slider, function() return builder.x_way_slider.value >= h end})
    end
end
    ui_elements.tab:depend(ui_elements.main_check)
    ui_elements.builder.avoid_backstab_dist:depend({ui_elements.builder.options, function() return contains(ui_elements.builder.options.value, "Avoid backstab") end})
    ui_elements.builder.manual_left:depend({ui_elements.builder.options, function() return contains(ui_elements.builder.options.value, "Manual AA") end})
    ui_elements.builder.manual_right:depend({ui_elements.builder.options, function() return contains(ui_elements.builder.options.value, "Manual AA") end})
    ui_elements.builder.reset_time:depend({ui_elements.builder.options, function() return contains(ui_elements.builder.options.value, "Reset Anti-bruteforce time") end})
    ui_elements.builder.freestanding_dis:depend({ui_elements.builder.options, function() return contains(ui_elements.builder.options.value, "Freestanding disablers") end})
    ui_elements.visuals.color_1:depend({ui_elements.visuals.elements, function() return contains(ui_elements.visuals.elements.value, "Watermark") end})
    ui_elements.visuals.color_2:depend({ui_elements.visuals.elements, function() return contains(ui_elements.visuals.elements.value, "Watermark") end})
    ui_elements.visuals.color_3:depend({ui_elements.visuals.elements, function() return contains(ui_elements.visuals.elements.value, "Watermark") end})
    ui_elements.visuals.color_4:depend({ui_elements.visuals.elements, function() return contains(ui_elements.visuals.elements.value, "Hit Logs") end})
    ui_elements.visuals.output:depend({ui_elements.visuals.elements, function() return contains(ui_elements.visuals.elements.value, "Hit Logs") end})
    ui_elements.visuals.glow:depend({ui_elements.visuals.elements, function() return contains(ui_elements.visuals.elements.value, "Hit Logs") end})
    ui_elements.visuals.glow_rad:depend({ui_elements.visuals.elements, function() return contains(ui_elements.visuals.elements.value, "Hit Logs") end})
    ui_elements.visuals.main_color:depend({ui_elements.visuals.elements, function() return contains(ui_elements.visuals.elements.value, "Indicators") end})
    ui_elements.visuals.switch_color:depend({ui_elements.visuals.elements, function() return contains(ui_elements.visuals.elements.value, "Indicators") end})
    ui_elements.visuals.indicators_type:depend({ui_elements.visuals.elements, function() return contains(ui_elements.visuals.elements.value, "Indicators") end})
    ui_elements.visuals.vel_y:depend({ui_elements.visuals.elements, function() return contains(ui_elements.visuals.elements.value, "Velocity Warning") end})
    ui_elements.visuals.asp_v:depend({ui_elements.visuals.elements, function() return contains(ui_elements.visuals.elements.value, "Aspect ratio") end})
    ui_elements.main_check:set_visible(false)
end
set_visible_func()

local hide_elements_func = function()
    for name, ref in pairs(hide_elements) do
        if ref['ref'] == nil then
            for k, v in pairs(ref) do
                v:set_visible(not ui_elements.main_check.value)
            end
        else
        ref:set_visible(not ui_elements.main_check.value)
        end
     end
end

local menu_c = ui_reference("MISC", "Settings", "Menu color")
local menu_r, menu_g, menu_b, menu_a = 0, 255, 0, 255
local android_notify=(function()local a={callback_registered=false,maximum_count=7,data2={}}function a:register_callback()if self.callback_registered then return end;client_set_event_callback('paint_ui',function()local b={client.screen_size()}local c={56,56,57}local d=5;local e=self.data2;for f=#e,1,-1 do self.data2[f].time=self.data2[f].time-globals.frametime()local g,h=255,0;local i=e[f]if i.time<0 then table.remove(self.data2,f)else local j=i.def_time-i.time;local j=j>1 and 1 or j;if i.time<0.5 or j<0.5 then h=(j<1 and j or i.time)/0.5;g=h*255;if h<0.2 then d=d+15*(1.0-h/0.2)end end;local k={renderer.measure_text(nil,i.draw)}local l={b[1]/2-k[1]/2+3,b[2]-b[2]/100*17.4+d}renderer.circle(l[1],l[2]-8,20,20,20,g,12,180,0.5)renderer.circle(l[1]+k[1],l[2]-8,20,20,20,g,12,0,0.5)renderer.rectangle(l[1],l[2]-20,k[1],24,20,20,20,g)renderer.circle_outline(l[1],l[2]-8,menu_r,menu_g,menu_b,g,12,90,0.5,1)renderer.circle_outline(l[1]+k[1],l[2]-8,menu_r,menu_g,menu_b,g,12,270,0.5,1)renderer.rectangle(l[1],l[2]-20,k[1],1,menu_r,menu_g,menu_b,g)renderer.rectangle(l[1],l[2]-20+23,k[1],1,menu_r,menu_g,menu_b,g)renderer.text(l[1]+k[1]/2,l[2]-8,255,255,255,g,'c',nil,i.draw)d=d-50 end end;self.callback_registered=true end)end;function a:paint(m,n)local o=tonumber(m)+1;for f=self.maximum_count,2,-1 do self.data2[f]=self.data2[f-1]end;self.data2[1]={time=o,def_time=o,draw=n}self:register_callback()end;return a end)()


ui_elements.main_check:set(true)
local warning = images.get_panorama_image("icons/ui/warning.svg")
local main_funcs = {
delay_air = 0,
in_air = function(self)
    local ent = entity_get_local_player()
    local flag = bit_band(entity_get_prop(entity_get_local_player(), "m_fFlags"), 1)
    if flag == 1 then
        if self.delay_air < 15 then
        self.delay_air = self.delay_air + 1
        end
    else
        self.delay_air = 0
    end 
    return flag == 0 or self.delay_air < 15
end,
create_clantag = function(text)
    local value = {" "}
    for i=1, #text do
        value[#value+1] = text:sub(1, i)
    end

    for i=#value-1, 1, -1 do
        value[#value+1] = value[i]
    end
  return value
end,
last_sim_time = 0,
def = 0,
blocked_types = {
    ["knife"] = true,
    ["c4"] = true,
    ["grenade"] = true,
    ["taser"] = true
},
is_freezetime = function()
    return entity_get_prop(entity_get_game_rules(), "m_bFreezePeriod") == 1
end,
is_warmup = function()
    return entity_get_prop(entity_get_game_rules(), "m_bWarmupPeriod") == 1
end,
get_weapon_type = function(_, player)
    local wpn = entity_get_player_weapon(player)
    if wpn == nil then return end
    local wep = weapons[entity_get_prop(wpn, "m_iItemDefinitionIndex")]
    if wep == nil then return end
    return wep.type
end,
defensive_state = function(self)
    local ent, tickcount = entity_get_local_player(), globals_tickcount()
    local sim_time = toticks(entity_get_prop(ent, "m_flSimulationTime"))
    local diff = sim_time - self.last_sim_time
    if diff < 0 then
        self.def = tickcount + math_abs(diff) - toticks(client_latency())
    end
    self.last_sim_time = sim_time
    return self.def > tickcount and not self:is_freezetime() and not self.blocked_types[self:get_weapon_type(ent)]
end,
crouching_in_air = function(self)
    return self:in_air() and bit.band(entity_get_prop(entity_get_local_player(), "m_fFlags"), 2) == 2
end,
in_move = function(_, e)
   return e.in_forward == 1 or e.in_back == 1 or e.in_moveleft == 1 or e.in_moveright == 1
end,
current_state = 1,
get_aa_state = function(self, e)
    local ent = entity_get_local_player()
    if not ui_elements.main_check.value or not entity_is_alive(ent) then return end
    local state = 1
    local standing = vector(entity_get_prop(ent, "m_vecVelocity")):length2d() < 2
    if not (aa_refs.doubletap.value and aa_refs.doubletap.hotkey:get()) and not (aa_refs.on_shot.value and aa_refs.on_shot.hotkey:get()) and aa_builder[8].enable.value then
    state = 8 
    elseif self:crouching_in_air() and aa_builder[6].enable.value then
    state = 6
    elseif self:in_air() and aa_builder[7].enable.value then
    state = 7
    elseif aa_refs.slow_walk.hotkey:get() and aa_builder[4].enable.value then
    state = 4
    elseif e.in_duck == 1 and aa_builder[5].enable.value then
    state = 5
    elseif self:in_move(e) and aa_builder[3].enable.value then
    state = 3
    elseif standing and aa_builder[2].enable.value then
    state = 2
    end
    self.current_state = state
    local check = state ~= 1 and true or aa_builder[1].enable.value
    return state, check
end,
freestanding_state = function(self, e, index)
    local tbl = {
        ["Air duck"] = function() return self:crouching_in_air() end,
        ["In-Air"] = function() return self:in_air() end,
        ["Slow walk"] = function() return aa_refs.slow_walk.hotkey:get() end,
        ["Moving"] = function() return self:in_move(e) end,
        ["Crouching"] = function() return e.in_duck == 1 end,
        ["Standing"] = function() local ent = entity_get_local_player() return vector(entity_get_prop(ent, "m_vecVelocity")):length2d() < 2 end
    }
    return tbl[index]()
end,
rgba_to_hex = function(b, c, d, e)
    return string.format('%02x%02x%02x%02x', b, c, d, e)
end,
lerp = function(_, a, b, t)
    return a + (b - a) * t
end,
clamp = function(_, value, minimum, maximum)
    return math_min( math_max( value, minimum ), maximum )
end,
text_animation = function(self, speed, color1, color2, text)
    local final_text = ''
    local curtime = globals.curtime()
    for i = 0, #text do
        local x = i * 10  
        local wave = math.cos(2 * speed * curtime / 4 + x / 30)
        local color = self.rgba_to_hex(
            self:lerp(color1[1], color2[1], self:clamp(wave, 0, 1)),
            self:lerp(color1[2], color2[2], self:clamp(wave, 0, 1)),
            self:lerp(color1[3], color2[3], self:clamp(wave, 0, 1)),
            color1[4]
        ) 
        final_text = final_text .. '\a' .. color .. text:sub(i, i) 
    end
    
    return final_text
end,
hex_to_rgba = function(hex) return tonumber('0x' .. hex:sub(1, 2)), tonumber('0x' .. hex:sub(3, 4)), tonumber('0x' .. hex:sub(5, 6)), tonumber('0x' .. hex:sub(7, 8)) or 255 end,
hex_color_log = function(self, str)  
    for color_code, message in str:gmatch("(%x%x%x%x%x%x%x%x)([^\aFFFFFFFF]+)") do
        local r, g, b = self.hex_to_rgba(color_code)
        message = message:gsub("\a" .. color_code, "")

        client.color_log(r, g, b, message .. "\0")
    end
    client.color_log(255, 255, 255, " ")
end,
closest_point_on_ray = function(ray_from, ray_to, desired_point)
    local to = desired_point - ray_from
    local direction = ray_to - ray_from
    local ray_length = #direction
    direction = vector(direction.x / ray_length, direction.y / ray_length, direction.z / ray_length)
    local dir = direction.x * to.x + direction.y * to.y + direction.z * to.z
    if dir < 0 then return ray_from end
    if dir > ray_length then return ray_to end
    return vector(ray_from.x + direction.x * dir, ray_from.y + direction.y * dir, ray_from.z + direction.z * dir)
end,
glow_box = function(x, y, w, h, radius, r, g, b, a)
    local rounding = 2
    local rad, a = rounding + 2, a/1.1
    renderer_rectangle(x, y + radius + rad - 2, 1, h - rad * 2 - radius * 2 + 4, r, g, b, a)
    renderer_rectangle(x + w - 1, y + radius + rad - 2, 1, h - rad * 2 - radius * 2 + 4, r, g, b, a)
    renderer_rectangle(x + radius + rad - 4, y + 2, w - rad * 2 - radius * 2 + 8, 1, r, g, b, a)
    renderer_rectangle(x + radius + rad - 4, y + h - 3, w - rad * 2 - radius * 2 + 8, 1, r, g, b, a)
    
    renderer_circle_outline(x+radius+rad-4,y+radius+rad-2,r,g,b,a,radius+rounding-2,180,0.25,1)
    renderer_circle_outline(x+radius+rad-4,y+h-radius-rad+2,r,g,b,a,radius+rounding-2,90,0.25,1)

    renderer_circle_outline(x+w-radius-rad+4,y+radius+rad-2,r,g,b,a,radius+rounding-2,270,0.25,1)
    renderer_circle_outline(x+w-radius-rad+4,y+h-radius-rad+2,r,g,b,a,radius+rounding-2,0,0.25,1)
end,
rectangle_outline = function(x, y, w, h, r, g, b, a, s)
	renderer_rectangle(x, y, w, s, r, g, b, a)
	renderer_rectangle(x, y+h-s, w, s, r, g, b, a)
	renderer_rectangle(x, y+s, s, h-s*2, r, g, b, a)
	renderer_rectangle(x+w-s, y+s, s, h-s*2, r, g, b, a)
end,
draw_velocity = function(self,modifier,r,g,b,alpha,y)	
	local text_width = renderer_measure_text("b", ("%s %d%%"):format("Slowed down ", modifier*100))
	local x, y = w/2-text_width+15, y
	local iw, ih = warning:measure(nil, 35)
	warning:draw(x-3, y-4, iw+6, ih+6, 16, 16, 16, 255)
	renderer_rectangle(x+13, y+11, 8, 20, 16, 16, 16, 255)
	warning:draw(x, y, nil, 35, r,g,b, alpha)

	renderer_text(x+iw+8, y+3, 255, 255, 255, 255, "b", 0, ("%s %d%%"):format("Slowed down ", modifier*100))
	local rx, ry, rw, rh = x+iw+8, y+3+17, text_width, 12

	self.rectangle_outline(rx, ry, rw, rh, 0, 0, 0, 255, 1)
	renderer_rectangle(rx+1, ry+1, rw-2, rh-2, 16, 16, 16, 180)
	renderer_rectangle(rx+1, ry+1, math_floor((rw-2)*modifier), rh-2, r, g, b, 180)
end
}

local icon = images.load_svg([[<?xml version="1.0" standalone="no"?>
<!DOCTYPE svg PUBLIC "-//W3C//DTD SVG 20010904//EN"
 "http://www.w3.org/TR/2001/REC-SVG-20010904/DTD/svg10.dtd">
<svg version="1.0" xmlns="http://www.w3.org/2000/svg"
 width="240.000000" height="240.000000" viewBox="0 0 240.000000 240.000000"
 preserveAspectRatio="xMidYMid meet">

<g transform="translate(0.000000,240.000000) scale(0.100000,-0.100000)"
fill="#000000" stroke="none">
<path style="fill:#ffffff; stroke:none;" d="M1102 2378 c-6 -13 -28 -70 -48 -128 -73 -212 -180 -392 -437 -733
-233 -309 -272 -405 -271 -662 0 -137 3 -158 28 -235 69 -208 182 -359 359
-479 175 -119 421 -167 627 -123 335 72 577 298 672 629 18 64 22 103 22 218
0 247 -42 349 -271 653 -262 347 -357 507 -443 747 l-46 130 -90 3 c-85 3 -91
1 -102 -20z m-11 -856 c14 -12 22 -30 22 -50 0 -28 -17 -55 -125 -197 -4 -5
-21 -27 -38 -47 -54 -64 -139 -199 -150 -237 -41 -143 -7 -301 89 -411 38 -43
42 -91 9 -114 -37 -26 -64 -19 -108 26 -126 131 -176 347 -121 526 25 83 62
148 136 242 28 36 67 86 85 113 18 26 37 47 42 47 4 0 8 5 8 11 0 19 52 79 64
72 6 -3 8 -3 4 2 -12 13 12 35 37 35 13 0 33 -8 46 -18z"/>
</g>
</svg>
]])

local notification = (function(self)
    local notification = {}
    local notif = {callback_created = false, max_count = 5}
    notif.register_callback = function(self)
    if self.callback_created then return end
    local screen_x, screen_y = client_screen_size()
    local pos = {x = screen_x / 2, y = screen_y / 1.2}
    client_set_event_callback("paint_ui", function()
    local extra_space = 0
    for i = #notification, 1, -1 do
    local data = notification[i]
    if data == nil then return end
    if data.alpha < 1 and data.real_time + data.time < globals_realtime() then
        table.remove(notification, i)
    else
        data.alpha = main_funcs:lerp(data.alpha, data.real_time + data.time - 0.1 < globals_realtime() and 0 or 255, 4 * globals_frametime())
        if data.alpha <= 120 then
            data.move = data.move - 0.2
        end
        local text_size_x, text_size_y = renderer_measure_text(nil, data.text)
        local col = data.color
        local img_w, img_h = 35, 36
        local x, y = pos.x-text_size_x/2-img_w/2, pos.y-data.move-extra_space
        local smooth_location = math.floor(data.alpha + .5)/255
        if data.glow then
            for i=1, ui_elements.visuals.glow_rad:get() do main_funcs.glow_box(x - i, y - i, text_size_x+img_w+5 + i * 2, img_h/2+7 + i * 2, i, col[1], col[2], col[3], (60 - 6 * i) * (data.alpha / 340)) end
        end
        renderer_rectangle(x, y, text_size_x+img_w+5, img_h/2+7, 20, 20, 20, data.alpha/1.3)    
        renderer_rectangle(x+img_w-7, y, 2, img_h/2+7, 100, 100, 100, data.alpha/2)
        renderer_rectangle(x, y, 2, (img_h/2+7)*smooth_location, col[1], col[2], col[3], data.alpha)
        icon:draw(x+7, y+4, nil, 18, col[1], col[2], col[3], data.alpha)
        renderer.text(x+img_w, y+6, 255, 255, 255, data.alpha, nil, 0, data.text)
        extra_space = extra_space + math.floor(data.alpha/255 * (text_size_y + 23) + .5)
    end
    end
    end)
    self.callback_created = true
    end
    notif.add = function(self, t, txt)
        for i = self.max_count, 2, -1 do notification[i] = notification[i - 1] end
        local col = ui_elements.visuals.color_4.color.value
        notification[1] = {alpha = 0, text = txt, real_time = globals_realtime(), time = t, move = 0, color = col, glow = ui_elements.visuals.glow.value}
        self:register_callback()
    end
    return notif
end)()


local menuElements = {
    labels = {},
    navigators = { selectedMenuTab = nil },
    aa = {},
    antibf = {},
    misc = {},
    visuals = {},
    config = {}
}

_G.luno_logs=(function()
	_G.luno_cache_no={}
	local a={callback_registered=false,maximum_count=4}
    b=ui_reference("Misc","Settings","Menu color")
	function a:register_callback()
		if self.callback_registered then return end;
		client.set_event_callback("paint_ui",function()
			local c={client.screen_size()}
			local d={0,0,0}
			local e=1;
			local f=_G.luno_cache_no;
			for g=#f,1,-1 do
				_G.luno_cache_no[g].time=_G.luno_cache_no[g].time-globals.frametime()
				local h,i=255,0;
				local i2 = 0;
				local lerpy = 150;
				local lerp_circ = 0.5;
				local j=f[g]
				if j.time<0 then
					table.remove(_G.luno_cache_no,g)
				else
					local k=j.def_time-j.time;
					local k=k>1 and 1 or k;
				if j.time<1 or k<1 then
					i=(k<1 and k or j.time)/1;
					i2=(k<1 and k or j.time)/1;
					h=i*255;
					lerpy=i*150;
					lerp_circ=i*0.5
				if i<0.2 then
					e=e+8*(1.0-i/0.2)
				end
			end;

			local l={b.value}
			local m={math.floor(renderer.measure_text(nil,"[luno]  "..j.draw)*1.03)}
			local n={renderer.measure_text(nil,"[luno]  ")}
			local o={renderer.measure_text(nil,j.draw)}
			local p={c[1]/2-m[1]/2+3,c[2]-c[2]/100*13.4+e}
            local c1,c2,c3,c4 = 0, 255, 0, 255
			local x, y = client.screen_size()
			renderer.blur(p[1]-1,p[2]-20,m[1]+2,22,6, 6, 6,h>255 and 255 or h)
			renderer.rectangle(p[1]-1,p[2]-20,m[1]+2,22,6, 6, 6,20)
			renderer.circle(p[1]-1,p[2]-8, 6, 6, 6,20, 12, 180, 0.5)
			renderer.circle(p[1]+m[1]+1,p[2]-8, 6, 6, 6,20, 12, 0, 0.5)
			renderer.circle_outline(p[1]-1,p[2]-9, c1,c2,c3,h>200 and 200 or h, 13, 90, lerp_circ, 2)
			renderer.circle_outline(p[1]+m[1]+1,p[2]-9, c1,c2,c3,h>200 and 200 or h, 13, -90, lerp_circ, 2)
			renderer.line(p[1]+m[1]+1,p[2]+3,p[1]+149-lerpy,p[2]+3,c1,c2,c3,h>255 and 255 or h)
			renderer.line(p[1]+m[1]+1,p[2]+3,p[1]+149-lerpy,p[2]+3,c1,c2,c3,h>255 and 255 or h)
			renderer.line(p[1]-1,p[2]-21,p[1]-149+m[1]+lerpy,p[2]-21,c1,c2,c3,h>255 and 255 or h)
			renderer.line(p[1]-1,p[2]-21,p[1]-149+m[1]+lerpy,p[2]-21,c1,c2,c3,h>255 and 255 or h)
			renderer.text(p[1]+m[1]/2-o[1]/2,p[2] - 9,c1,c2,c3,h,"c",nil,"[luno]  ")
			renderer.text(p[1]+m[1]/2+n[1]/2,p[2] - 9,255,255,255,h,"c",nil,j.draw)e=e-33
		end
	end;
	self.callback_registered=true end)
end;

function a:paint(q,r)
	local s=tonumber(q)+1;
	for g=self.maximum_count,2,-1 do
		_G.luno_cache_no[g]=_G.luno_cache_no[g-1]
	end;
	_G.luno_cache_no[1]={time=s,def_time=s,draw=r}
self:register_callback()end;return a end)()


luno_logs:paint(4, "Welcome back ! " .. data.user_name)

client_delay_call(1.5, function()
luno_logs:paint(4, "Your build is: " .. data.lua_build)
end)



local restore_ui = {}
local function restore_func()
for k, v in pairs(restore_ui) do
ui_set(k.ref, v)
end
restore_ui = {}
end

local function closest_target()
    local ent = entity_get_local_player()
    if not ui_elements.main_check.value or not entity_is_alive(ent) then
        return
    end
    local threat = client_current_threat()
    if threat ~= nil and not entity_is_dormant(threat) then return threat end
    local players = entity_get_players(true)
    local closest_pl
    local last_dist = 0
    local ent_pos = vector(entity_get_prop(ent, "m_vecOrigin"))
    for i, player in pairs(players) do
        local pl_pos = vector(entity_get_prop(player, "m_vecOrigin"))
        local dist = ent_pos:dist(pl_pos)
        if last_dist <= 0 then
            closest_pl = player
            last_dist = dist
        end
        if dist < last_dist then
            last_dist = dist
            closest_pl = player
        end
    end
    return closest_pl
end

local avoid_active = false
local function avoid_backstab_func()
local ent = entity_get_local_player()
if not contains(ui_elements.builder.options.value, "Avoid backstab") or not entity_is_alive(ent) then avoid_active = false return end
local target = closest_target()
if target == nil then
   restore_func()
   avoid_active = false
   return
end
local ent_pos = vector(entity_get_prop(ent, "m_vecAbsOrigin"))
local wpn_type = main_funcs:get_weapon_type(target)
local pl_pos = vector(entity_get_prop(target, "m_vecAbsOrigin"))
local distance = ent_pos:dist(pl_pos)
if ent_pos ~= nil and pl_pos ~= nil and wpn_type ~= nil and wpn_type == "knife" and distance <= ui_elements.builder.avoid_backstab_dist.value then
if aa_refs.yaw[1].value ~= "Off" then
restore_ui[aa_refs.yaw[2]] = aa_refs.yaw[2].value
aa_refs.yaw[2]:override(180)
avoid_active = true
end
else
restore_func()
avoid_active = false
end
end

local freestanding_disablers = function(e)
if not ui_elements.main_check.value or not contains(ui_elements.builder.options.value, "Freestanding disablers") then aa_refs.freestanding[1]:override() return end
local options = ui_elements.builder.freestanding_dis.value
local enabled = true
for k, v in pairs(options) do
local check = main_funcs:freestanding_state(e, v)
if check then enabled = false break end
end
aa_refs.freestanding[1]:override(enabled)
end

local function animation_breaker()
local ent = entity_get_local_player()
if not ui_elements.main_check.value or #ui_elements.misc.anim_breaker.value <= 0 or not entity_is_alive(ent) then return end
local _ent = _entity.new(ent)
if contains(ui_elements.misc.anim_breaker.value, "Walking Legs in air") and main_funcs:in_air() then
    local anim = _ent:get_anim_overlay(6)
    if not anim then return end
    anim.weight = 1
end
if contains(ui_elements.misc.anim_breaker.value, "Backward legs") then
aa_refs.leg_movement:set("Always Slide")
entity_set_prop(ent, "m_flPoseParameter", 1, 0)
end
if contains(ui_elements.misc.anim_breaker.value, "Freeze legs in air") and main_funcs:in_air() then
entity_set_prop(ent, "m_flPoseParameter", 1, 6) 
end
if contains(ui_elements.misc.anim_breaker.value, "Pitch 0") then
    local anim_state = _ent:get_anim_state()
    if not anim_state.hit_in_ground_animation or main_funcs:in_air() then 
        return 
    end
    entity_set_prop(ent, "m_flPoseParameter", 0.5, 12)
end
end

local clantag, prev_tag = main_funcs.create_clantag("luno." .. data.lua_build)
local clantag_func = function()
if not ui_elements.misc.clantag.value then return end
local ent = entity_get_local_player()
local ly = client_latency()
local tickcount = globals_tickcount() + toticks(ly)
local sw = math_floor(tickcount / toticks(0.3))
local tag_cur = clantag[sw % #clantag+1]
if tag_cur ~= prev_tag then
    client_set_clan_tag(tag_cur)
end
prev_tag = tag_cur
end

local function clantag_change()
if ui_elements.misc.clantag.value then return end
    client_set_clan_tag()
end

local killsay_mes = {
    "1", "1 бич ебаный", "1 пиво с сухариками", "luno.nightly бустит постоянно", "Че смотришь пидор очкастый", "смотрел слово пацана ? это тебя забили у параши.", "сосал ?", "1 криповый", "*Прикупи Луа и Конфигурацию чушка", "Не будь таким нищим и аддни луашку luno.nightly", "не пизди мне в хуй дура", "кто если не я будет тебя ебать?", "Мда,кринж!?"
}

local death_say = {
    "no"
}

local function airstop(cmd)
    local lp = entity.get_local_player()
    if not lp then return end
    if not ui_elements.misc.airstop.value then return end
    if ui_elements.misc.airstop_key:get() then
        if cmd.quick_stop then
            if (globals.tickcount() - ticks) > 3 then
                cmd.in_speed = 1
            end
        else
            ticks = globals.tickcount()
        end
    end
end

local aspect = function()
    if contains(ui_elements.visuals.elements.value, "Aspect ratio") then
        if ui_elements.visuals.asp_v.value == 0 then
            cvar.r_aspectratio:set_float(0)
        else
            cvar.r_aspectratio:set_float(ui_elements.visuals.asp_v.value/100)
        end
    else
        cvar.r_aspectratio:set_float(0)
    end
end
local player_data = {}

-- ������������� ������� ��� ������������ ����� yaw � pitch
local function normalize_angle(angle, min_val, max_val)
    return math.max(min_val, math.min(max_val, angle))
end

-- ������� ��� ��������� ��� �������� ������ �����
local function get_enemy_data(enemy)
    local enemy_idx = client.userid_to_entindex(enemy)
    if not player_data[enemy_idx] then
        player_data[enemy_idx] = {
            last_yaw = 0,
            avg_desync = 0,
            spin_speed = 0,
            last_position = { x = 0, y = 0 },
            last_update_time = globals.curtime(),
            defensive_yaw_min = 0,
            defensive_yaw_max = 0,
            defensive_pitch_min = -89,
            defensive_pitch_max = 89,
            teleport_detected = false
        }
    end
    return player_data[enemy_idx]
end

-- ������� ��� ���������� ������� defensive anti-aim
local function calculate_defensive_limits(enemy)
    local lower_body_yaw = entity.get_prop(enemy, "m_flLowerBodyYawTarget") or 0
    local eye_yaw = entity.get_prop(enemy, "m_angEyeAngles[1]") or 0
    local eye_pitch = entity.get_prop(enemy, "m_angEyeAngles[0]") or 0

    local desync_angle = normalize_angle(eye_yaw - lower_body_yaw, -180, 180)
    local yaw_min = normalize_angle(lower_body_yaw - 60, -180, 180)
    local yaw_max = normalize_angle(lower_body_yaw + 60, -180, 180)
    local pitch_min = normalize_angle(eye_pitch - 80, -89, 89)
    local pitch_max = normalize_angle(eye_pitch + 80, -89, 89)

    return desync_angle, yaw_min, yaw_max, pitch_min, pitch_max
end

-- �������� ������� ���������� ������ �����
local function update_enemy_data(enemy)
    local data = get_enemy_data(enemy)
    local current_time = globals.curtime()
    local time_delta = current_time - data.last_update_time
    data.last_update_time = current_time

    local eye_yaw = entity.get_prop(enemy, "m_angEyeAngles[1]") or 0
    local eye_pitch = entity.get_prop(enemy, "m_angEyeAngles[0]") or 0
    
    local desync_angle, yaw_min, yaw_max, pitch_min, pitch_max = calculate_defensive_limits(enemy)
    data.avg_desync = (data.avg_desync + desync_angle) / 2
    data.defensive_yaw_min = yaw_min
    data.defensive_yaw_max = yaw_max
    data.defensive_pitch_min = pitch_min
    data.defensive_pitch_max = pitch_max

    -- �������� �������� �������� (Spin Detection)
    local spin_delta = normalize_angle(eye_yaw - data.last_yaw, -180, 180)
    data.spin_speed = math.abs(spin_delta) / time_delta
    data.last_yaw = eye_yaw

-- ���������� ������� �����
    local pos = vector(entity.get_prop(enemy, "m_vecOrigin")) or { x = 0, y = 0 }
    if pos.x and pos.y then
        local move_distance = math.sqrt((pos.x - data.last_position.x)^2 + (pos.y - data.last_position.y)^2)
        data.last_position = pos

        -- �������� ������������ (Auto Teleport Detection)
        if move_distance > 100 then
            data.teleport_detected = true
        else
            data.teleport_detected = false
        end

        -- ���������� ������ �� ������ ��������
        if move_distance > 10 then
            data.avg_desync = data.avg_desync * 0.5  -- �������� ������� ������� ��� �������� ��������
        end
    else
        -- ���� pos �����������, ���������� move_distance � 0 � ��������� �������� ������������
        data.teleport_detected = false
    end

    
end

-- ���������� ��������� ����� �� ������ defensive anti-aim
local function apply_resolver(enemy)
    local data = player_data[enemy]
    if not data then return end

    local eye_yaw = entity.get_prop(enemy, "m_angEyeAngles[1]") or 0
    local eye_pitch = entity.get_prop(enemy, "m_angEyeAngles[0]") or 0
    local correction_yaw = 0
    local correction_pitch = 0

    -- ��������� ����� � ����������� �� defensive anti-aim
    if data.spin_speed > 30 then
        correction_yaw = normalize_angle(eye_yaw + 180, -180, 180)  -- �������� ��� ���������������� ��������
        correction_pitch = normalize_angle(eye_pitch, -89, 89)
    elseif math.abs(data.avg_desync) > 25 then
        correction_yaw = normalize_angle((data.defensive_yaw_min + data.defensive_yaw_max) / 2, -180, 180)
        correction_pitch = normalize_angle((data.defensive_pitch_min + data.defensive_pitch_max) / 2, -89, 89)
    else
        correction_yaw = normalize_angle(eye_yaw, -180, 180)
        correction_pitch = normalize_angle(eye_pitch, -89, 89)
    end

    entity.set_prop(enemy, "m_angEyeAngles[1]", correction_yaw)
    entity.set_prop(enemy, "m_angEyeAngles[0]", correction_pitch)
end

-- �������� ������� ��� ���������� ���� ������
local function update_resolver()
    if ui_elements.misc.rezik.value then
        local local_player = entity.get_local_player()
        if not local_player then return end

        local enemies = entity.get_players(true)
        for _, enemy in ipairs(enemies) do
            update_enemy_data(enemy)
            apply_resolver(enemy)
        end
    end
end

-- ����������� ����������� �������
client.set_event_callback("setup_command", update_resolver)

local fakeflick = function(cmd)
    if ui_elements.misc.flick_ex.value then 
        if not ui_elements.misc.flick_ex_k:get() then return end
    cmd.force_defensive = cmd.command_number % 7 == 0
        if cmd.force_defensive then
            aa_refs.pitch[1]:override("Down")
            aa_refs.yaw[1]:override("180")
            aa_refs.yaw[2]:override(5)
            aa_refs.yaw_jitter[1]:override("Random")
            aa_refs.yaw_jitter[2]:override(5)
            aa_refs.body_yaw[1]:override("Opposite")
            aa_refs.body_yaw[2]:override()
        elseif not cmd.force_defensive then
            aa_refs.pitch[1]:override("Down")
            aa_refs.yaw[1]:override("180")
            aa_refs.yaw[2]:override(-70 or 90)
            aa_refs.yaw[2]:override(-90 or 70)
            aa_refs.yaw_jitter[1]:override("Random")
            aa_refs.yaw_jitter[2]:override(5)
            aa_refs.body_yaw[1]:override("Opposite")
        end
    end
end

local predict = function()
    local lp = entity.get_local_player()
    if not lp then return end
    local gun = entity.get_player_weapon(lp)
    if gun == nil then
        return
    end
    local classname = entity.get_classname(gun)

    if ui_elements.misc.predict_ex.value then 
        cvar.cl_interpolate:set_int(0)
        cvar.cl_interp_ratio:set_int(1)
        if classname == "CWeaponSCAR20" or classname == "CWeaponG3SG1" then
            cvar.cl_interp:set_float(0.051000)
        end
        if classname == "CWeaponAWP" then
            cvar.cl_interp:set_float(0.05900)
        end
        if classname == "CDEagle" then
            cvar.cl_interp:set_float(0.029125)
        end
        if classname == "CWeaponSSG08" then
            cvar.cl_interp:set_float(0.019625)
        end
    else
        cvar.cl_interp:set_float(0.015625)
        cvar.cl_interp_ratio:set_int(2)
        cvar.cl_interpolate:set_int(1)
    end
end

local function jumpscout(cmd)
    if not ui_elements.misc.jump_scout.value then return end
    local vel_x, vel_y = entity.get_prop(entity.get_local_player(), "m_vecVelocity")
    local vel = math.sqrt(vel_x^2 + vel_y^2)
    --ui_set(aa_refs.air_strafe, not (cmd.in_jump and (vel < 10)) or ui_is_menu_open())
    aa_refs.air_strafe:override( not (cmd.in_jump and (vel < 10)) or ui_is_menu_open())
end

local function killsay_func(e)
    if not ui_elements.misc.killsay.value then return end
    local ent = entity_get_local_player()
    local victim_userid, attacker_userid = e.userid, e.attacker
    if victim_userid == nil or attacker_userid == nil then
        return
    end
    local attacker_entindex = client_userid_to_entindex(attacker_userid)
    local victim_entindex = client_userid_to_entindex(victim_userid)
    if attacker_entindex ~= ent or not entity_is_enemy(victim_entindex) then 
        return
     end
    client_exec("say " .. killsay_mes[client_random_int(1, #killsay_mes)])
end

local watermark_func = function()
if contains(ui_elements.visuals.elements.value, "Watermark") then return end
local x = renderer_measure_text(nil, ">/ luno anti-aim systems")
local start, en, ver_color = ui_elements.visuals.color_1.color.value, ui_elements.visuals.color_2.color.value, ui_elements.visuals.color_3.color.value
local text = main_funcs:text_animation(5, start, en, ">/ luno anti-aim systems")
renderer_text(5, h/2, 255, 255, 255, 255, nil, 0, text)
renderer_text(x + 7, h/2, ver_color[1], ver_color[2], ver_color[3], ver_color[4], nil, 0, "[" .. ver .. ']')
end

local function rgb_based(p)
	local r = 124*2 - 124 * p
	local g = 195 * p
	local b = 13
	return r, g, b
end

local velocity_warning = function()
if not ui_elements.main_check.value or not contains(ui_elements.visuals.elements.value, "Velocity Warning") then return end
local ent = entity_get_local_player()
local modifier = entity_get_prop(ent, "m_flVelocityModifier") or 1
local r, g, b = rgb_based(modifier)
local menu = ui_is_menu_open()
local y = ui_elements.visuals.vel_y.value
if modifier == 1 then if menu then main_funcs:draw_velocity(0.5, 255, 255, 255, 255, y) end return end
local a = 255*math_abs(globals_curtime()*3 % 2 - 1)
main_funcs:draw_velocity(modifier, r, g, b, a, y)
end

local tbl_data = {}
setmetatable(tbl_data, {__index = function(...) return ... end})
local current_stage = 1
local extra_dir = 0
local old_curtime = globals_curtime()
local delay_tick, value = globals_tickcount(), 0
local aa_builder_func = function(e)
if not ui_elements.main_check.value or avoid_active then delay_tick, value = globals_tickcount(), 0 return end
if contains(ui_elements.builder.options.value, "Disable AA during Warmup") and main_funcs:is_warmup() then
    aa_refs.pitch[1]:override("off")
    aa_refs.aa_yaw_base:override("Local view")
    aa_refs.yaw[1]:override("off")
    aa_refs.body_yaw[1]:override("Off")
    main_funcs.current_state = "Warmup"
    return
end
local state, check = main_funcs:get_aa_state(e)
local builder_state = aa_builder[state]
ui_elements.builder.manual_left:set("On hotkey")
ui_elements.builder.manual_right:set("On hotkey")
if not contains(ui_elements.builder.options.value, "Manual AA") then
extra_dir = 0
old_curtime = globals_curtime()
else
if ui_elements.builder.manual_left:get() and old_curtime + 0.2 < globals_curtime() then
extra_dir = extra_dir == -90 and 0 or -90
old_curtime = globals_curtime()
elseif ui_elements.builder.manual_right:get() and old_curtime + 0.2 < globals_curtime() then
extra_dir = extra_dir == 90 and 0 or 90
old_curtime = globals_curtime()
elseif old_curtime > globals_curtime() then
    old_curtime = globals_curtime()
end
end
if not builder_state.enable.value then
aa_refs.yaw[1]:override("180")
aa_refs.yaw[2]:override(extra_dir)
end
if not builder_state.enable.value or not check then delay_tick, value = globals_tickcount(), 0 return end
local ticks = globals_tickcount()
local yaw_jitter = builder_state.yaw_jitter.value
local def_yaw = yaw_jitter == "X-Way" and "Center" or yaw_jitter
if builder_state.yaw_jitter.value == "X-Way" and ticks % 3 > 1 then
    local max_value = builder_state.x_way_slider.value
    if max_value <= 1 then return end
    current_stage = current_stage + 1
    if current_stage > max_value then current_stage = 1 end
end
if builder_state.defensive_aa.value and builder_state.force_defensive.value then e.force_defensive = true end
local offset = type(tbl_data[state].yaw_offset) ~= "number" and 0 or tbl_data[state].yaw_offset
local yaw_val


if (globals_tickcount() % 2) == 1 then
    dele = not dele
end

if builder_state.yaw.value == "Flick" then
if globals_tickcount() > delay_tick+builder_state.yaw_flick_delay.value then
    value = value == builder_state.yaw_flick_from.value and builder_state.yaw_flick_to.value or builder_state.yaw_flick_from.value
    delay_tick = globals_tickcount()
end
yaw_val = value
else
yaw_val = anti_aims.get_desync(1) <= 0 and builder_state.yaw_right.value or builder_state.yaw_left.value
end
yaw_val = yaw_val+extra_dir+offset > 180 and yaw_val or yaw_val+extra_dir+offset
local flick_yaw = builder_state.yaw.value == "Flick" and "180" or builder_state.yaw.value

if builder_state.defensive_aa.value and main_funcs:defensive_state() then
    local defensive_speed = builder_state.defensive_yaw_speed.value
    if builder_state.defensive_pitch.value == "Zero" then
        aa_refs.pitch[1]:override("Custom")
        aa_refs.pitch[2]:override(0)
    else
        aa_refs.pitch[1]:override(builder_state.defensive_pitch.value) 
    end
    if builder_state.defensive_yaw_main.value == "Side-ways" then
        aa_refs.yaw[1]:override("180")
        aa_refs.yaw[2]:override(dele and -90 or 90)
        aa_refs.yaw_jitter[1]:override("Center")
        aa_refs.yaw_jitter[2]:override(0)
    elseif builder_state.defensive_yaw_main.value == "Spin" then
        aa_refs.yaw[1]:override("Spin")
        aa_refs.yaw[2]:override(defensive_speed)
    end 
else
    aa_refs.pitch[1]:override("Down")
    aa_refs.yaw[1]:override(flick_yaw)
    
    local value = aa_builder[state]["way_" .. current_stage].value+offset
    value = value > 180 and aa_builder[state]["way_" .. current_stage].value or value
    aa_refs.yaw[2]:override(yaw_jitter == "X-Way" and value or yaw_val)

    aa_refs.yaw_jitter[1]:override(def_yaw)
end

aa_refs.aa_yaw_base:override("At targets")

local yaw_jit = anti_aims.get_desync(1) <= 0 and builder_state.yaw_jitter_slider_r.value or builder_state.yaw_jitter_slider_l.value
aa_refs.yaw_jitter[2]:override(yaw_jit)

aa_refs.body_yaw[1]:override(builder_state.body_yaw.value)
aa_refs.body_yaw[2]:override(tbl_data[state].swap == true and -builder_state.bodyyaw_add.value or builder_state.bodyyaw_add.value)
end

--аров
local function manual_arrow()
    if not ui_elements.main_check.value or not contains(ui_elements.visuals.elements.value, "Manual arrows") then return end

    local mcolor = { 100, 100, 255, 255 }

    local left_color = {r=255,g=255,b=255,a=255}
    local right_color = {r=255,g=255,b=255,a=255}

    if extra_dir == 90 then
        right_color = {r=mcolor[1],g=mcolor[2],b=mcolor[3],a=mcolor[4]}
    elseif extra_dir == -90 then
        left_color = {r=mcolor[1],g=mcolor[2],b=mcolor[3],a=mcolor[4]}
    end


        renderer.triangle(w/2+50, h / 2 - 5, w/2+60, h / 2 , w/2+50, h / 2 + 5, right_color.r,right_color.g,right_color.b,100)
        renderer.line(w/2+50, h / 2 + 5, w/2 + 60, h / 2 , right_color.r,right_color.g,right_color.b,right_color.a)
        renderer.line(w/2+50, h / 2 - 5, w/2 + 60, h / 2 , right_color.r,right_color.g,right_color.b,right_color.a)
        renderer.line(w/2+50, h / 2 + 5, w/2 + 50, h / 2 - 5, right_color.r,right_color.g,right_color.b,right_color.a)

        renderer.triangle(w/2-50, h / 2 - 5, w/2-60, h / 2 , w/2-50, h / 2 + 5, left_color.r,left_color.g,left_color.b,100)
        renderer.line(w/2-50, h / 2 + 5, w/2 - 60, h / 2 , left_color.r,left_color.g,left_color.b,left_color.a)
        renderer.line(w/2-50, h / 2 - 5, w/2 - 60, h / 2 , left_color.r,left_color.g,left_color.b,left_color.a)
        renderer.line(w/2-50, h / 2 + 5, w/2 - 50, h / 2 - 5, left_color.r,left_color.g,left_color.b,left_color.a)
end

RGBAtoHEX = function(redArg, greenArg, blueArg, alphaArg)
    return string.format('%.2x%.2x%.2x%.2x', redArg, greenArg, blueArg, alphaArg)
end

animate_text = function(time, string, r, g, b, a)
    local t_out, t_out_iter = { }, 1

    local l = string:len( ) - 1

    local r_add = (0 - r)
    local g_add = (0 - g)
    local b_add = (0 - b)
    local a_add = (255 - a)

    for i = 1, #string do
        local iter = (i - 1)/(#string - 1) + time
        t_out[t_out_iter] = "\a" .. RGBAtoHEX( r + r_add * math.abs(math.cos( iter )), g + g_add * math.abs(math.cos( iter )), b + b_add * math.abs(math.cos( iter )), a + a_add * math.abs(math.cos( iter )) )

        t_out[t_out_iter + 1] = string:sub( i, i )

        t_out_iter = t_out_iter + 2
    end

    return t_out
end

local hours, minutes = client.system_time()
local text = string.format("%02d:%02d", hours, minutes)
local get_name = panorama.loadstring([[ return MyPersonaAPI.GetName() ]])
local nickname = string.upper(get_name())
local username = entity.get_player_name()
local fps = globals.frametime()

function get_fps()
    return 1.0 / globals.frametime()
end

function get_ping()
    return 1.0 / client.latency()
end

function get_rate()
    return 1.0 / globals.tickinterval()
end

local glow_time = 0
function get_glow_color()
    glow_time = glow_time + globals.frametime() * 2
    local r = math.floor(128 + 127 * math.sin(glow_time))
    local g = math.floor(128 + 127 * math.sin(glow_time + 2))
    local b = math.floor(128 + 127 * math.sin(glow_time + 4))
    return r, g, b
end

function RenderRoundRectangle(x, y, w, h, radius, color)
    if color[4] <= 0 then
        return
    end

    renderer.rectangle(x, y + radius, radius, h - radius * 2, color[1], color[2], color[3], color[4]) -- Левый
    renderer.rectangle(x + radius, y, w - radius * 2, radius, color[1], color[2], color[3], color[4]) -- Верхний
    renderer.rectangle(x + radius, y + h - radius, w - radius * 2, radius, color[1], color[2], color[3], color[4]) -- Нижний
    renderer.rectangle(x + w - radius, y + radius, radius, h - radius * 2, color[1], color[2], color[3], color[4]) -- Правый

    renderer.rectangle(x + radius, y + radius, w - radius * 2, h - radius * 2, color[1], color[2], color[3], color[4])

    renderer.circle(x + radius, y + radius, color[1], color[2], color[3], color[4], radius, 180, 0.25) -- Левый верхний угол
    renderer.circle(x + radius, y + h - radius, color[1], color[2], color[3], color[4], radius, 270, 0.25) -- Левый нижний угол
    renderer.circle(x + w - radius, y + radius, color[1], color[2], color[3], color[4], radius, 90, 0.25) -- Правый верхний угол
    renderer.circle(x + w - radius, y + h - radius, color[1], color[2], color[3], color[4], radius, 0, 0.25) -- Правый нижний угол
end

function RenderBlurredLine(x, y, w, h, r, g, b, a, blur_strength)
    blur_strength = 0.2
    local blur_alpha = math.floor(a / (blur_strength * 2))

    for i = -blur_strength, blur_strength do
        for j = -blur_strength, blur_strength do
            if i ~= 0 or j ~= 0 then
                renderer.rectangle(x + i, y + j, w, h, r, g, b, blur_alpha)
            end
        end
    end

    renderer.rectangle(x, y, w, h, r, g, b, a)
end

function draw_hud()
    if not contains(ui_elements.visuals.elements.value, "Watermark") then return end
        local screen_x, screen_y = client.screen_size()
        local hud_x = screen_x / 2 - 150
        local hud_y = screen_y - 50
     
        RenderRoundRectangle(hud_x, hud_y, 300, 30, 8, {10, 10, 10, 200})
    
        local r, g, b = get_glow_color()
        RenderBlurredLine(hud_x, hud_y, 300, 2, r, g, b, 255, 5)
    
        renderer.text(hud_x + 150, hud_y - 15, r, g, b, 255, "c", 0, "Luno ~ nightly")
    
        renderer.text(hud_x + 10, hud_y + 8, 255, 255, 255, 255, nil, 0, nickname)
        renderer.text(hud_x + 90, hud_y + 8, 255, 255, 255, 255, nil, 0, math.floor(get_fps()) .. " fps")
        renderer.text(hud_x + 160, hud_y + 8, 255, 255, 255, 255, nil, 0, math.floor(get_ping()) .. " ms")
        renderer.text(hud_x + 220, hud_y + 8, 255, 255, 255, 255, nil, 0, "T" .. math.floor(get_rate()))
        renderer.text(hud_x + 270, hud_y + 8, 255, 255, 255, 255, nil, 0, text)
end

local indicator_tbl = {
    {
        value = false,
        custom_name = '',
        custom_color = {255, 255, 255},
        alpha = 0
    },
    {
        reference = ui_reference("RAGE", "aimbot", "Double tap").hotkey,
        custom_name = 'DT',
        custom_color = {255, 255, 255},
        alpha = 0
    },
    {
        reference = ui_reference('aa', 'other', 'On shot anti-aim').hotkey,
        custom_name = 'ON-SHOT',
        custom_color = {170, 255, 100},
        alpha = 0
    },
    {
        reference = ui_reference('rage', 'aimbot', 'Force safe point'),
        custom_name = 'SAFE',
        custom_color = {241, 218, 255},
        alpha = 0
    },
    {
        reference = ui_reference('rage', 'aimbot', 'Force body aim'),
        custom_name = 'BAIM',
        custom_color = {255, 255, 255},
        alpha = 0
    },

    {
        reference = ui_reference('rage', 'other', 'Duck peek assist'),
        custom_name = 'DUCK',
        custom_color = {240, 240, 240},
        alpha = 0
    },
    {
        reference = ui_reference('aa', 'anti-aimbot angles', 'Freestanding').hotkey,
        custom_name = 'FS',
        custom_color = {240, 240, 240},
        alpha = 0
    }
}

local func = function() end
local function func_switcher(v)
  return setmetatable({v}, {
    __call = function (tbl, func)
      local check = #tbl == 0 and  {} or tbl[1]
      return (func[check] or func[func] or {})(check)
    end
 })
end

local function doubletap_charged()
    if not aa_refs.doubletap.value or not aa_refs.doubletap.hotkey:get() or aa_refs.duck_assist:get() then return end    
    local me = entity_get_local_player()
    if me == nil or not entity_is_alive(me) then return end
    local weapon = entity_get_prop(me, "m_hActiveWeapon")
    if weapon == nil then return end
    local next_attack = entity_get_prop(me, "m_flNextAttack")
    local next_primary_attack = entity_get_prop(weapon, "m_flNextPrimaryAttack")
    if next_attack == nil or next_primary_attack == nil then return end
    next_attack = next_attack + 0.25
    next_primary_attack = next_primary_attack + 0.5
    return next_attack - globals_curtime() < 0 and next_primary_attack - globals_curtime() < 0
end


    
local extra_x = 28
local center = { w/2,h/2 }
local text_flags = "c-"
local indicators_func = function()
local ent = entity_get_local_player()
if not ui_elements.main_check.value or not contains(ui_elements.visuals.elements.value, "Indicators") or not entity_is_alive(ent) then return end
     local extra_space = 18
     local r, g, b, a = ui_elements.visuals.main_color.color:get()
     local r1, g1, b1, a1 = ui_elements.visuals.switch_color.color:get()
     local scoped = entity_get_prop(ent, "m_bIsScoped") == 1
     extra_x = main_funcs:lerp(extra_x, scoped and 28 or 0, 9 * globals_frametime())
     func_switcher(ui_elements.visuals.indicators_type.value) {
     ["Default"] = function()
     local desync = anti_aims.get_desync(1) <= 0
     local hex, hex2 = main_funcs.rgba_to_hex(r, g, b, a), main_funcs.rgba_to_hex(r1, g1, b1, a1)
     renderer_text(center[1] + extra_x, center[2] + extra_space, r, g, b, a, "cb-", 0, ("\a%sluno\a%s\a%s.nightly"):format(desync and hex or hex2, hex, desync and hex2 or hex))
     extra_space = extra_space + 9
     indicator_tbl[1].value = false
     indicator_tbl[2].custom_color = {main_funcs:lerp(indicator_tbl[2].custom_color[1], doubletap_charged() and r or 230, 9 * globals_frametime()), main_funcs:lerp(indicator_tbl[2].custom_color[2], doubletap_charged() and g or 43, 9 * globals_frametime()), main_funcs:lerp(indicator_tbl[2].custom_color[3], doubletap_charged() and b or 39, 9 * globals_frametime())}
 
     for k, v in pairs(indicator_tbl) do
     local check = v.reference ~= nil and v.reference:get() or v.value
     if not check then if v.alpha > 0 then v.alpha = main_funcs:lerp(v.alpha, -0.1, 6 * globals_frametime()) end if v.alpha <= 0 then goto continue end end
     local r, g, b = unpack(v.custom_color)
     if check then v.alpha = main_funcs:lerp(v.alpha, 1.1, 9 * globals_frametime()) if v.alpha >= 1 then v.alpha = 1 end end
     local text_x = renderer_measure_text(text_flags, v.custom_name)
     renderer_text(center[1] + extra_x, center[2] + extra_space, r, g, b, v.alpha*255, text_flags, (text_x*v.alpha)+1, v.custom_name)
     extra_space = extra_space + math.floor(8 * v.alpha + .5)
     ::continue::
     end
    end,
    ["Alternative"] = function()
        renderer_text(center[1] + extra_x, center[2] + extra_space, r, g, b, a, "c-", 0, main_funcs:text_animation(5, {r,g,b,a}, {r1,g1,b1,a1}, "L U N O . N I G H T L Y"))
        extra_space = extra_space + 9
        indicator_tbl[1].value = true
        indicator_tbl[1].custom_name = type(main_funcs.current_state) == "string" and main_funcs.current_state:upper() or indicator_names[main_funcs.current_state]:upper()
        indicator_tbl[1].custom_color = {r, g, b}
        indicator_tbl[2].custom_color = {main_funcs:lerp(indicator_tbl[2].custom_color[1], doubletap_charged() and 255 or 230, 9 * globals_frametime()), main_funcs:lerp(indicator_tbl[2].custom_color[2], doubletap_charged() and 255 or 43, 9 * globals_frametime()), main_funcs:lerp(indicator_tbl[2].custom_color[3], doubletap_charged() and 255 or 39, 9 * globals_frametime())}
    
        for k, v in pairs(indicator_tbl) do
        local check = v.reference ~= nil and v.reference:get() or v.value
        if not check then if v.alpha > 0 then v.alpha = main_funcs:lerp(v.alpha, -0.1, 6 * globals_frametime()) end if v.alpha <= 0 then goto continue end end
        local r, g, b = unpack(v.custom_color)
        if check then v.alpha = main_funcs:lerp(v.alpha, 1.1, 9 * globals_frametime()) if v.alpha >= 1 then v.alpha = 1 end end
        local text_x = renderer_measure_text(text_flags, v.custom_name)
        renderer_text(center[1] + extra_x, center[2] + extra_space, r, g, b, v.alpha*255, text_flags, (text_x*v.alpha)+1, v.custom_name)
        extra_space = extra_space + math.floor(8 * v.alpha + .5)
        ::continue::
        end
       end,
    }
end

local console_log = function(r, g, b, text)
    client.color_log(158, 158, 158, "[luno] \0")
	main_funcs:hex_color_log(text)
end

local hitgroup_names = {'generic', 'head', 'chest', 'stomach', 'left arm', 'right arm', 'left leg', 'right leg', 'neck', '?', 'gear'}
local aim_fire_data = {}
local function aim_fire(e)
if not ui_elements.main_check.value or not contains(ui_elements.visuals.elements.value, "Hit Logs") then return end
aim_fire_data[e.id] = {
aimed_hitbox = hitgroup_names[e.hitgroup + 1] or '?',
pred_dmg = e.damage,
bt = e.backtrack
}
end


local function aim_hit(e)
if not ui_elements.main_check.value or not contains(ui_elements.visuals.elements.value, "Hit Logs") or aim_fire_data[e.id] == nil then return end
local name = (entity_get_player_name(e.target)):lower()
local hitgroup = hitgroup_names[e.hitgroup + 1] or '?'
local health = entity_get_prop(e.target, 'm_iHealth')
local r, g, b = ui_elements.visuals.color_4.color:get()
local hex = ("%02X%02X%02XFF"):format(r, g, b)
local hitchance = math_floor(e.hit_chance + 0.5)
local data = aim_fire_data[e.id]
if contains(ui_elements.visuals.output.value, "Console") then
    console_log(r, g, b, ("\a%sHurt\aFFFFFFFF %s in \a%s%s\aFFFFFFFF for \a%s%i\aFFFFFFFF damage (hp: \a%s%i\aFFFFFFFF, bt: \a%s%i\aFFFFFFFF,  hc: \a%s%i\aFFFFFFFF)"):format(hex, name, hex, hitgroup, hex, e.damage, hex, health, hex, data.bt, hex, hitchance))
end
if not contains(ui_elements.visuals.output.value, "Notification") then return end
android_notify:paint(5, ("Hit %s in %s for %i damage (%i health remaining)"):format(name, hitgroup, e.damage, health))
end

local reason = {
    ["?"] = "resolver"
}

local function aim_miss(e)
if not ui_elements.main_check.value or not contains(ui_elements.visuals.elements.value, "Hit Logs") or aim_fire_data[e.id] == nil then return end
local name = (entity_get_player_name(e.target)):lower()
local hitgroup = hitgroup_names[e.hitgroup + 1] or '?'
local hitchance = math_floor(e.hit_chance + 0.5)
local data = aim_fire_data[e.id]
local r, g, b = ui_elements.visuals.color_4.color:get()
local hex = ("%02X%02X%02XFF"):format(r, g, b)
if contains(ui_elements.visuals.output.value, "Console") then
    console_log(r, g, b, ("\a%sMissed\aFFFFFFFF %s's \a%s%s\aFFFFFFFF due to \a%s%s\aFFFFFFFF (dmg: \a%s%i\aFFFFFFFF, bt: \a%s%i\aFFFFFFFF, hc: \a%s%i\aFFFFFFFF)"):format(hex, name, hex, data.aimed_hitbox, hex, reason[e.reason] ~= nil and reason[e.reason] or e.reason, hex, data.pred_dmg, hex, data.bt, hex, hitchance))
end
if not contains(ui_elements.visuals.output.value, "Notification") then return end
android_notify:paint(5, ("\aE05C5CFFMissed \aFFFFFFFFshot at %s due to %s (aimed: %s, %ihp, bt=%i, hc=%i)"):format(name, e.reason, data.aimed_hitbox, data.pred_dmg, data.bt, hitchance))
end

local weapon_to_verb = { hegrenade = "Naded", inferno = "Burned"}
local function player_hurt(e)
local id = client_userid_to_entindex(e.attacker)
local ent = entity_get_local_player()
if not ui_elements.main_check.value or not contains(ui_elements.visuals.elements.value, "Hit Logs") or id == nil or id ~= ent then return end
local hitgroup = hitgroup_names[e.hitgroup + 1] or '?'
if hitgroup ~= "generic" or weapon_to_verb[e.weapon] == nil then return end
local target = client_userid_to_entindex(e.userid)
local name = (entity_get_player_name(target)):lower()
local r, g, b = ui_elements.visuals.color_4.color:get()
local hex = ("%02X%02X%02XFF"):format(r, g, b)
if contains(ui_elements.visuals.output.value, "Console") then
    console_log(r, g, b, ("\a%s%s\aFFFFFFFF %s for \a%s%i\aFFFFFFFF damage (hp: \a%s%i\aFFFFFFFF)"):format(hex, weapon_to_verb[e.weapon], name, hex, e.dmg_health, hex, e.health))
end
if not contains(ui_elements.visuals.output.value, "Notification") then return end
android_notify:paint(5, ("%s %s for %i damage (%ihp remaining)"):format(weapon_to_verb[e.weapon], name, e.dmg_health, e.health))
end

local function reset_anti_brute(state)
    android_notify:paint(5, "Switched anti-bruteforce due to reset")
    tbl_data[state] = {}
end    

local last_shot_t = globals_curtime()
local anti_brute_func = function(e)
local ent = entity_get_local_player()
local tick = globals_curtime()
local state, check = main_funcs:get_aa_state(e)
if not ui_elements.main_check.value or not entity_is_alive(ent) or not aa_builder[state].enable.value or not check or not aa_builder[state].anti_brute.value or #aa_builder[state].anti_brute_options.value <= 0 or last_shot_t+1 > tick then return end
local user = e.userid
if user == nil then return end
local shooter = client_userid_to_entindex(user)
if entity_is_dormant(shooter) or not entity_is_enemy(shooter) then return end
local bullet_impact = vector(e.x, e.y, e.z)
local eye_pos = vector(entity_get_prop(shooter, "m_vecOrigin"))
eye_pos.z = eye_pos.z + entity_get_prop(shooter, "m_vecViewOffset[2]")
if not eye_pos then
    return
end
local local_eye_pos = vector(client.eye_position())
if not local_eye_pos then
    return
end
local distance = main_funcs.closest_point_on_ray(eye_pos, bullet_impact, local_eye_pos):dist(local_eye_pos)
if distance < 100 then
    last_shot_t = globals_curtime()
    if contains(aa_builder[state].anti_brute_options.value, "Side") then tbl_data[state].swap = type(tbl_data[state].swap) ~= "boolean" and true or not tbl_data[state].swap end
    local num = contains(aa_builder[state].anti_brute_options.value, "Yaw Offset") and client_random_int(-7, 7) or 0
    tbl_data[state].yaw_offset = num
    if tbl_data[state].f_called ~= true then
        if contains(ui_elements.main.builder.value, "Reset Anti-bruteforce time") then client_delay_call(ui_elements.builder.reset_time.value/10, reset_anti_brute, state) end
        tbl_data[state].f_called = true
    end
    android_notify:paint(5, "Switched anti-bruteforce due to enemy shot")
end
end
local reset_on_round_start = function()
    android_notify:paint(5, "Switched anti-bruteforce due to round start")
    tbl_data = {}
    delay_tick, value = globals_tickcount(), 0
    setmetatable(tbl_data, {__index = function(...) return ... end})
end

local cfg_manager = function(tbl)
    ui_elements.configs.cfg_list:update(tbl)
end
 
local error_func = function()
    print("If this error continues to popup please contact the staff")
end

local config_data = database.read("luno_cfgs") or {}
local list_tbl = {}

local config_system = {
    get_cfg_list = function()
        local update_tbl = {}
        for _, data in pairs(cfg_tbl) do
            table.insert(update_tbl, data.name)
            data.data = json.parse(base64.decode(data.data))
        end
        xpcall(function() for name, data in pairs(config_data) do table.insert(update_tbl, name) end end, error_func)

        cfg_manager(update_tbl)
        list_tbl = update_tbl
    end,
    create_btn_callback = function()
        local name = ui_elements.configs.cfg_name:get()
        if #name <= 0 then print("Can't use an empty name!") return end
        if config_data[name] ~= nil then print("Config with this name already exists!") return end
        
        local list, cfg = list_tbl, config:save()
        list[#list+1] = name
        config_data[name] = cfg
        database.write("luno_cfgs", config_data)
        cfg_manager(list)
    end,
    save_btn_callback = function()
        local list, selected = list_tbl, ui_elements.configs.cfg_list:get()+1
        local sel_name = list[selected]
        if selected > #cfg_tbl then
            config_data[sel_name] = config:save()
            database.write("luno_cfgs", config_data)
            print("Config Saved!")
        else
            print("Can't save into a built-in cfg!")
        end
        cfg_manager(list)
    end,
    load_btn_callback = function()
        local selected = ui_elements.configs.cfg_list:get()+1
        local sel_name = list_tbl[selected]
        local s = pcall(function()
            if selected <= #cfg_tbl then
                config:load(cfg_tbl[selected].data)
            else
                config:load(config_data[sel_name])
            end
        end)
        if s then
            print("Config Loaded!")
        else
            print("This config is broken!")
        end
    end,
    del_btn_callback = function()
        local list = list_tbl
        local selected = ui_elements.configs.cfg_list:get()+1
        local sel_name = list[selected]
        if #list > 1 and selected > #cfg_tbl then
            table.remove(list, selected)
            config_data[sel_name] = nil
            database.write("luno_cfgs", config_data)
        end
        cfg_manager(list)
    end,  
}
config_system.get_cfg_list()

defer(function()
    aa_refs.pitch[1]:override()
    aa_refs.yaw_jitter[1]:override()
    aa_refs.yaw_jitter[2]:override()
    aa_refs.body_yaw[1]:override()
    aa_refs.body_yaw[2]:override()
end)

client_set_event_callback("paint_ui", watermark_func)
client_set_event_callback("paint_ui", indicators_func)
client_set_event_callback("paint_ui", velocity_warning)
client_set_event_callback("paint_ui", hide_elements_func)
client_set_event_callback("setup_command", avoid_backstab_func)
client_set_event_callback("setup_command", aa_builder_func)
client_set_event_callback("setup_command", freestanding_disablers)
client_set_event_callback("setup_command", airstop)
client_set_event_callback("setup_command", jumpscout)
client_set_event_callback("setup_command", fakeflick)
client_set_event_callback("setup_command", predict)
client_set_event_callback("paint", clantag_func)
client_set_event_callback("paint", manual_arrow)
client_set_event_callback("paint", draw_hud)
client_set_event_callback("paint", aspect)
client_set_event_callback("pre_render", animation_breaker)
client_set_event_callback("player_death", killsay_func)
client_set_event_callback('aim_fire', aim_fire)
client_set_event_callback('aim_hit', aim_hit)
client_set_event_callback('aim_miss', aim_miss)
client_set_event_callback('player_hurt', player_hurt)
client_set_event_callback("bullet_impact", anti_brute_func)
client_set_event_callback("round_start", reset_on_round_start)

ui_elements.misc.clantag:set_callback(clantag_change)
ui_elements.configs.create_btn:set_callback(config_system.create_btn_callback)
ui_elements.configs.save_btn:set_callback(config_system.save_btn_callback)
ui_elements.configs.load_btn:set_callback(config_system.load_btn_callback)
ui_elements.configs.del_btn:set_callback(config_system.del_btn_callback)
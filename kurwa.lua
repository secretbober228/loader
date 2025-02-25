local euphemia = euphemia_data and euphemia_data() or {
    username = "User"
}

local pui = require "gamesense/pui"
local msgpack = require "gamesense/msgpack"
local clipboard = require "gamesense/clipboard"
local base64 = require "gamesense/base64"
local aafunc = require "gamesense/antiaim_funcs"
local ffi = require "ffi"
local vector = require "vector"
local c_entity = require "gamesense/entity"
local pui = require "gamesense/pui"

local refs = {
    aa_enabled = ui.reference("AA", "Anti-aimbot angles", "Enabled"),
    pitch = { ui.reference("AA", "Anti-aimbot angles", "Pitch") },
    yaw_base = ui.reference("AA", "Anti-aimbot angles", "Yaw base"),
    yaw = { ui.reference("AA", "Anti-aimbot angles", "Yaw") },
    yaw_jitter = { ui.reference("AA", "Anti-aimbot angles", "Yaw jitter") } ,
    body_yaw = { ui.reference("AA", "Anti-aimbot angles", "Body yaw") },
    freestanding_body_yaw = ui.reference("AA", "Anti-aimbot angles", "Freestanding body yaw"),
    edge_yaw = ui.reference("AA", "Anti-aimbot angles", "Edge yaw"),
    freestanding = { ui.reference("AA", "Anti-aimbot angles", "Freestanding") },
    roll = ui.reference("AA", "Anti-aimbot angles", "Roll"),
    

    fakelag_enable = { ui.reference("AA", "Fake Lag", "Enabled") },
    fakelag_mode = ui.reference("AA", "Fake Lag", "Amount"),
    fakelag_variance = ui.reference("AA", "Fake Lag", "Variance"),
    fakelag_limit = ui.reference("AA", "Fake Lag", "Limit"),

    leg_movement = ui.reference("AA", "Other", "Leg movement"),

    double_tap = { ui.reference("RAGE", "Aimbot", "Double tap") },
    double_tap_fake_lag_limit = ui.reference("RAGE", "Aimbot", "Double tap fake lag limit"),

    onshot_aa = { ui.reference("AA", "Other", "On shot anti-aim") },

    quick_peek_assist = { ui.reference("RAGE", "Other", "Quick peek assist") },
    duck_peek_assist = ui.reference("RAGE", "Other", "Duck peek assist"),

    slow_motion = { ui.reference("AA", "Other", "Slow motion") },

    mindamage = ui.reference("RAGE", "Aimbot", "Minimum damage"),
    mindamage_override = { ui.reference("RAGE", "Aimbot", "Minimum damage override") },
	forcebaim = { ui.reference("RAGE", "Aimbot", "Force body aim") },

    hitchance = ui.reference("RAGE", "Aimbot", "Minimum hit chance"),

    ui_color = ui.reference("MISC", "Settings", "Menu color"),

    ping_spike = {ui.reference("MISC", "Miscellaneous", "Ping spike")},

    weapon = ui.reference("RAGE", "Weapon Type", "Weapon Type"),
}

local E_POSE_PARAMETERS = {
    STRAFE_YAW = 0,
    STAND = 1,
    LEAN_YAW = 2,
    SPEED = 3,
    LADDER_YAW = 4,
    LADDER_SPEED = 5,
    JUMP_FALL = 6,
    MOVE_YAW = 7,
    MOVE_BLEND_CROUCH = 8,
    MOVE_BLEND_WALK = 9,
    MOVE_BLEND_RUN = 10,
    BODY_YAW = 11,
    BODY_PITCH = 12,
    AIM_BLEND_STAND_IDLE = 13,
    AIM_BLEND_STAND_WALK = 14,
    AIM_BLEND_STAND_RUN = 14,
    AIM_BLEND_CROUCH_IDLE = 16,
    AIM_BLEND_CROUCH_WALK = 17,
    DEATH_YAW = 18
}

local handles = {}
local events = {}
local log = {}
local screen = {}
local binds = {}
local hitgroup_names = {"generic", "head", "chest", "stomach", "left arm", "right arm", "left leg", "right leg", "neck", "?", "gear"}
local groups = {
    main = pui.group("aa", "anti-aimbot angles"),
    defensive = pui.group("aa", "fakelag"),
    other = pui.group("aa", "other"),
}
local db = {
    key = "stardust_lua",
    table = database.read("stardust_lua")
}
local config = {}

local list_shift = {}
local shift_int = 0
local util = {
    rgba_to_hex = function(b,c,d,e)
        return string.format('%02x%02x%02x%02x',b,c,d,e)
    end,
    text_fade = function(self, speed, r, g, b, a, text)
        local final_text = ''
        local curtime = globals.curtime()
        for i=0, #text do
            local color = self.rgba_to_hex(r, g, b, a*math.abs(1*math.cos(2*speed*curtime/4+i*5/30)))
            final_text = final_text..'\a'..color..text:sub(i, i)
        end
        return final_text
    end,
    text_pulse = function(self, speed, r, g, b, a, text)
        local final_text = ''
        local curtime = globals.curtime()
        local center = math.floor(#text / 2) + 1  -- calculate the center of the text
        for i=1, #text do
            -- calculate the distance from the center character
            local distance = math.abs(i - center)
            -- calculate the alpha based on the distance and the speed and time
            a = 255 - math.abs(255 * math.sin(speed * curtime / 4 - distance * 4 / 20))
            local col = self.rgba_to_hex(r,g,b,a)
            final_text = final_text .. '\a' .. col .. text:sub(i, i)
        end
        return final_text
    end,
    check_tickbase = function()
        local local_player = entity.get_local_player()
		local sim_time = entity.get_prop(local_player, "m_flSimulationTime")
		if local_player == nil or sim_time == nil then
			return
		end
		local tick_count = globals.tickcount()
		local shifted = math.max(unpack(list_shift))
		shift_int = shifted < 0 and math.abs(shifted) or 0
		list_shift[#list_shift+1] = sim_time/globals.tickinterval() - tick_count
		table.remove(list_shift, 1)
    end
}
screen.x, screen.y = client.screen_size()
screen.scale = {x = screen.x / 1920, y = screen.y / 1080}


local defensive = {
    last_sim_time = 0,
    defensive_until = 0,
    is_active = function(self, lplr, mode)
        if not mode then
            mode = false
        end
        local tickcount = globals.tickcount()
        local sim_time = toticks(entity.get_prop(lplr, "m_flSimulationTime"))

        if self.last_sim_time == 0 then
            self.last_sim_time = sim_time
            return false
        end

        local sim_diff = sim_time - self.last_sim_time

        if sim_diff < 0 then
            self.defensive_until = tickcount + math.abs(sim_diff) - toticks(client.latency())
        end
        
        self.last_sim_time = sim_time

        local ret = {
            tick = self.defensive_until,
            active = self.defensive_until > tickcount,
        }

        return mode and ret or self.defensive_until > tickcount
    end
}

local animation = {
    database = {},
    speed = 0.07,
    lerp = function(start, end_pos, time)
        local val = start + (end_pos - start) * (globals.frametime() * time)
        return val
    end,
    new = function(self, name, new_value, speed, init)
        speed = speed or self.speed

        if self.database[name] == nil then
            self.database[name] = (init and init) or 0
        end

        self.database[name] = self.lerp(self.database[name], new_value, speed)
        return self.database[name]
    end
}


local accentr, accentg, accentb = 250, 185, 59

local print = function(...)
    client.color_log(accentr, accentg, accentb, "[stardust] \0")
    client.color_log(198, 203, 209, ...)
end

pui.accent = "F8B83AFF"

local states = {"Default", "Stand", "Slow Walk", "Move", "Crouch", "Crouch Move", "Air", "Air Crouch"}
local invisstates = {"\n", "\n\n", "\n\n\n", "\n\n\n\n", "\n\n\n\n\n", "\n\n\n\n\n\n", "\n\n\n\n\n\n\n", "\n\n\n\n\n\n\n\n"}



local tabs = {"Home", "Rage", "Anti-aim", "Helpers", "Visuals", "Misc"}
local menu = {
    enable = groups.main:checkbox("\vstardust\r"),
    nav = {
        tab = groups.main:combobox("Navigation", tabs, {250, 185, 59})
    },
    home = {
        export = groups.main:button("Export", function() end),
        import = groups.main:button("Import", function() end),
    },
    rage = {
        logs = groups.main:checkbox("Shot logs"),
        onshot = groups.main:checkbox("Safepoint on shot"),
        hideshots = groups.main:checkbox("Hideshots Fix")
    },
    antiaim = {
        state = groups.main:combobox("\n", states),
        builder = {}
    },
    helpers = {
        fastladder = groups.main:checkbox("Fast Ladder"),
        knife = groups.main:checkbox("Safe knife"),
        label = groups.main:label("    "),
        freestand = groups.main:checkbox("Freestand", 0x00),
        left = groups.main:checkbox("Left", 0x00),
        right = groups.main:checkbox("Right", 0x00),
        forward = groups.main:checkbox("Forward", 0x00),
    },
    visuals = {
        thirdperson = groups.main:checkbox("Thirdperson Distance"),
        thirdperson_val = groups.main:slider("\n\n\n\n\n\n\n\n\n\n\n\n\n", 20, 100, 48),
        aspect_ratio = groups.main:checkbox("Aspect Ratio"),
        aspect_ratio_val = groups.main:slider("\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n", 0, 200, 177, true, nil, .01, {[177] = "16:9", [165] = "16:10", [138] = "11:8", [133] = "4:3", [125] = "5:4"}),
        indicators = groups.main:checkbox("Crosshair Indicators"),
    },
    misc = {
        animbreakers = groups.main:checkbox("Anim Breakers"),
        g_legs = groups.main:combobox("On Ground", {"None", "Static", "Jitter"}),
        a_legs = groups.main:combobox("In Air", {"None", "Static", "Jitter"}),
        extras = groups.main:multiselect("Extras", {"Body lean", "Break body", "0 pitch on land"}),
        bodylean = groups.main:slider("\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n", 0, 100, 0, "%", "%"),
    },
}

for i = 1, #states do
    menu.antiaim.builder[i] = {}
    menu.antiaim.builder[i].enable = groups.main:checkbox("Override ".. states[i])
    menu.antiaim.builder[1].enable:set(true)
    menu.antiaim.builder[i].pitch = groups.main:combobox("Pitch"..invisstates[i], {"Off", "Down", "Up", "Zero"})
    menu.antiaim.builder[i].yaw = groups.main:combobox("Yaw"..invisstates[i], {"Off", "Backward", "L&R", "Delayed"})
    menu.antiaim.builder[i].yaw_val = groups.main:slider("Yaw Value"..invisstates[i], -180, 180, 0, true, "°", 1)
    menu.antiaim.builder[i].yaw_left = groups.main:slider("\n\n\n", -180, 180, 0, true, "°", 1)
    menu.antiaim.builder[i].yaw_right = groups.main:slider("\n\n", -180, 180, 0, true, "°", 1)
    menu.antiaim.builder[i].yaw_delay = groups.main:slider("\n\n\n\n\n", 0, 32, 0, true, "t", 1, {[0] = "Off"})
    menu.antiaim.builder[i].yaw_modifier = groups.main:combobox("Yaw Modifier"..invisstates[i], {"Off", "Offset", "Center", "Random", "Skitter"})
    menu.antiaim.builder[i].modifier_degree = groups.main:slider("Modifier Degree"..invisstates[i], -180, 180, 0, true, "°", 1)
    menu.antiaim.builder[i].fake = groups.main:combobox("Body Yaw"..invisstates[i], {"Off", "Opposite", "Jitter", "Static"})
    menu.antiaim.builder[i].fake_amount = groups.main:slider("\n\n\n\n\n\n\n\n"..invisstates[i], -180, 180, 0, true, "°", 1)
    menu.antiaim.builder[i].defensive = groups.main:checkbox("Defensive"..invisstates[i])
    menu.antiaim.builder[i].defensive_pitch = groups.main:combobox("Defensive Pitch"..invisstates[i], {"Disabled", "Off", "Up", "Zero", "Random", "Custom"})
    menu.antiaim.builder[i].defensive_pitch_val = groups.main:slider("Defensive Pitch Value"..invisstates[i], -89, 89, 0, true, "°", 1)
    menu.antiaim.builder[i].defensive_yaw = groups.main:combobox("Defensive Yaw"..invisstates[i], {"Disabled", "Static", "Sideways", "Random", "Spin"})
    menu.antiaim.builder[i].defensive_yaw_val = groups.main:slider("Defensive Yaw Value"..invisstates[i], -180, 180, 0, true, "°", 1)
end
menu.antiaim.disclaimer = groups.main:label("Using \vcrouch \rsettings")


menu.home.export:set_callback(function()
    local data = config.cfg:save()
    local new_data = msgpack.pack(data)
    local encrypted = base64.encode(new_data)
    clipboard.set(encrypted)
end)

menu.home.import:set_callback(function()
    local cfg = clipboard.get()
    local decrypted = base64.decode(cfg)
    local new_data = msgpack.unpack(decrypted)
    config.cfg:load(new_data)
end)

handles.accentcolor = function(cmd)
    accentr, accentg, accentb = menu.nav.tab:get_color()
end

events.setupmenu = function()
    menu.nav.tab:depend({menu.enable, true})
    menu.nav.tab:set_callback(function(self)
        accentr, accentg, accentb = menu.nav.tab:get_color()
    end)

    menu.home.export:depend({menu.enable, true}, {menu.nav.tab, "Home"})
    menu.home.import:depend({menu.enable, true}, {menu.nav.tab, "Home"})

    menu.rage.logs:depend({menu.enable, true}, {menu.nav.tab, "Rage"})
    menu.rage.onshot:depend({menu.enable, true}, {menu.nav.tab, "Rage"})
    menu.rage.hideshots:depend({menu.enable, true}, {menu.nav.tab, "Rage"})

    menu.antiaim.state:depend({menu.enable, true}, {menu.nav.tab, "Anti-aim"})
    menu.antiaim.disclaimer:depend({menu.enable, true}, {menu.nav.tab, "Anti-aim"}, {menu.antiaim.builder[6].enable, false}, {menu.antiaim.builder[5].enable, true}, {menu.antiaim.state, states[6]})

    menu.helpers.freestand:depend({menu.enable,true}, {menu.nav.tab, "Helpers"})
    menu.helpers.left:depend({menu.enable,true}, {menu.nav.tab, "Helpers"})
    menu.helpers.right:depend({menu.enable,true}, {menu.nav.tab, "Helpers"})
    menu.helpers.forward:depend({menu.enable,true}, {menu.nav.tab, "Helpers"})
    menu.helpers.knife:depend({menu.enable,true}, {menu.nav.tab, "Helpers"})
    menu.helpers.fastladder:depend({menu.enable,true}, {menu.nav.tab, "Helpers"})
    menu.helpers.label:depend({menu.enable,true}, {menu.nav.tab, "Helpers"})
    menu.misc.animbreakers:depend({menu.enable,true}, {menu.nav.tab, "Misc"})
    menu.misc.g_legs:depend({menu.enable,true}, {menu.nav.tab, "Misc"}, {menu.misc.animbreakers, true})
    menu.misc.a_legs:depend({menu.enable,true}, {menu.nav.tab, "Misc"}, {menu.misc.animbreakers, true})
    menu.misc.extras:depend({menu.enable,true}, {menu.nav.tab, "Misc"}, {menu.misc.animbreakers, true})
    menu.misc.bodylean:depend({menu.enable,true}, {menu.nav.tab, "Misc"}, {menu.misc.extras, "Body lean"}, {menu.misc.animbreakers, true})

    menu.visuals.indicators:depend({menu.enable,true}, {menu.nav.tab, "Visuals"})
    menu.visuals.thirdperson:depend({menu.enable,true}, {menu.nav.tab, "Visuals"})
    menu.visuals.thirdperson_val:depend({menu.enable,true}, {menu.nav.tab, "Visuals"}, {menu.visuals.thirdperson, true})
    menu.visuals.aspect_ratio:depend({menu.enable,true}, {menu.nav.tab, "Visuals"})
    menu.visuals.aspect_ratio_val:depend({menu.enable,true}, {menu.nav.tab, "Visuals"}, {menu.visuals.aspect_ratio, true})
    for i = 1, #states do
        if i == 1 then
            menu.antiaim.builder[1].enable:depend({menu.enable, true}, {menu.nav.tab, "nuh uh"}, {menu.antiaim.state, states[i]})
            menu.antiaim.builder[1].enable:set(true)
        else
            menu.antiaim.builder[i].enable:depend({menu.enable, true}, {menu.nav.tab, "Anti-aim"}, {menu.antiaim.state, states[i]})
        end
        menu.antiaim.builder[i].pitch:depend({menu.enable, true}, {menu.nav.tab, "Anti-aim"}, {menu.antiaim.state, states[i]}, {menu.antiaim.builder[i].enable, true})
        menu.antiaim.builder[i].yaw:depend({menu.enable, true}, {menu.nav.tab, "Anti-aim"}, {menu.antiaim.state, states[i]}, {menu.antiaim.builder[i].enable, true})
        menu.antiaim.builder[i].yaw_val:depend({menu.enable, true}, {menu.nav.tab, "Anti-aim"}, {menu.antiaim.state, states[i]}, {menu.antiaim.builder[i].enable, true}, {menu.antiaim.builder[i].yaw, "Backward"})
        menu.antiaim.builder[i].yaw_left:depend({menu.enable, true}, {menu.nav.tab, "Anti-aim"}, {menu.antiaim.state, states[i]}, {menu.antiaim.builder[i].enable, true}, {menu.antiaim.builder[i].yaw, "L&R", "Delayed"})
        menu.antiaim.builder[i].yaw_right:depend({menu.enable, true}, {menu.nav.tab, "Anti-aim"}, {menu.antiaim.state, states[i]}, {menu.antiaim.builder[i].enable, true}, {menu.antiaim.builder[i].yaw, "L&R", "Delayed"})
        menu.antiaim.builder[i].yaw_delay:depend({menu.enable, true}, {menu.nav.tab, "Anti-aim"}, {menu.antiaim.state, states[i]}, {menu.antiaim.builder[i].enable, true}, {menu.antiaim.builder[i].yaw, "Delayed"})
        menu.antiaim.builder[i].yaw_modifier:depend({menu.enable, true}, {menu.nav.tab, "Anti-aim"}, {menu.antiaim.state, states[i]}, {menu.antiaim.builder[i].enable, true})
        menu.antiaim.builder[i].modifier_degree:depend({menu.enable, true}, {menu.nav.tab, "Anti-aim"}, {menu.antiaim.state, states[i]}, {menu.antiaim.builder[i].enable, true}, {menu.antiaim.builder[i].yaw_modifier, "Off", true})
        menu.antiaim.builder[i].fake:depend({menu.enable, true}, {menu.nav.tab, "Anti-aim"}, {menu.antiaim.state, states[i]}, {menu.antiaim.builder[i].enable, true})
        menu.antiaim.builder[i].fake_amount:depend({menu.enable, true}, {menu.nav.tab, "Anti-aim"}, {menu.antiaim.state, states[i]}, {menu.antiaim.builder[i].enable, true}, {menu.antiaim.builder[i].fake, "Jitter", "Static"})
        menu.antiaim.builder[i].defensive:depend({menu.enable, true}, {menu.nav.tab, "Anti-aim"}, {menu.antiaim.state, states[i]}, {menu.antiaim.builder[i].enable, true})
        menu.antiaim.builder[i].defensive_pitch:depend({menu.enable, true}, {menu.nav.tab, "Anti-aim"}, {menu.antiaim.state, states[i]}, {menu.antiaim.builder[i].enable, true}, {menu.antiaim.builder[i].defensive, true})
        menu.antiaim.builder[i].defensive_pitch_val:depend({menu.enable, true}, {menu.nav.tab, "Anti-aim"}, {menu.antiaim.state, states[i]}, {menu.antiaim.builder[i].enable, true}, {menu.antiaim.builder[i].defensive, true}, {menu.antiaim.builder[i].defensive_pitch, "Custom"})
        menu.antiaim.builder[i].defensive_yaw:depend({menu.enable, true}, {menu.nav.tab, "Anti-aim"}, {menu.antiaim.state, states[i]}, {menu.antiaim.builder[i].enable, true}, {menu.antiaim.builder[i].defensive, true})
        menu.antiaim.builder[i].defensive_yaw_val:depend({menu.enable, true}, {menu.nav.tab, "Anti-aim"}, {menu.antiaim.state, states[i]}, {menu.antiaim.builder[i].enable, true}, {menu.antiaim.builder[i].defensive, true}, {menu.antiaim.builder[i].defensive_yaw, "Static", "Sideways", "Spin"})
    end
end

local global = {
    current_state = "",
    current_state_number = 0,
    current_phase = 0,
    update = function(self, cmd)
        local local_player = entity.get_local_player()
        if not local_player then
            return
        end

        local xv, yv = entity.get_prop(local_player, "m_vecVelocity")
        local flags = entity.get_prop(local_player, "m_fFlags")
        local slow_walk = ui.get(refs.slow_motion[1]) and ui.get(refs.slow_motion[2])
        local ducking = bit.lshift(1, 1)
        local ground = bit.lshift(1, 0)
        local velocity = math.sqrt(xv*xv + yv*yv)
        local state = function()
            if bit.band(flags, ground) == 1 and velocity < 3 and bit.band(flags, ducking) == 0 then
                self.current_state = "Stand"
                self.current_state_number = 2
            else
                if  bit.band(flags, ground) == 1 and velocity > 3 and bit.band(flags, ducking)  == 0 and slow_walk then
                    self.current_state = "Slow-Walk"
                    self.current_state_number = 3
                end
            end
            if bit.band(flags, ground) == 1 and velocity > 3 and bit.band(flags, ducking) == 0 and not slow_walk and (cmd.in_jump == 0 )then
                self.current_state = "Moving"
                self.current_state_number = 4
            end
            if bit.band(flags, ground) == 1 and bit.band(flags, ducking) > 0.9 and menu.antiaim.builder[6].enable:get() and velocity > 10 and (cmd.in_jump == 0 )then
                self.current_state = "Duck-Move"
                self.current_state_number = 6
            elseif bit.band(flags, ground) == 1 and bit.band(flags, ducking) > 0.9 and (cmd.in_jump == 0 ) then
                self.current_state = "DUCK"
                self.current_state_number = 5
            end
            if bit.band(flags, ground) == 0 and bit.band(flags, ducking) == 0 then
                self.current_state = "Air"
                self.current_state_number = 7
            end
            if bit.band(flags, ground) == 0 and bit.band(flags, ducking) > 0.9 then
                self.current_state = "Air+D"
                self.current_state_number = 8
            end

        
        end
        state()
    end
}
local delaytick = 0
local delayside = false
local spin = 0
local oldbind = false
handles.builder = function(cmd)
    if not menu.antiaim.builder[global.current_state_number] then return end
    local currentstate = menu.antiaim.builder[global.current_state_number].enable:get() and global.current_state_number or 1
    local doubletap = ui.get(refs.double_tap[1]) and ui.get(refs.double_tap[2])
    local hideshots = ui.get(refs.onshot_aa[1]) and ui.get(refs.onshot_aa[2])
    local lplr = entity.get_local_player()
    if not entity.is_alive(lplr) or not lplr then return end

    local bodyyaw = entity.get_prop(lplr, "m_flPoseParameter", 11) * 120 - 60
    local side = bodyyaw > 0 and 1 or -1

    ui.set(refs.freestanding[1], menu.helpers.freestand:get()) 
    local fs_active, key = menu.helpers.freestand:get_hotkey()
    ui.set(refs.freestanding[2], fs_active and "Always on" or "On hotkey") 


    if menu.antiaim.builder[currentstate].pitch:get() == "Off" then
        ui.set(refs.pitch[1], "Off")
    elseif menu.antiaim.builder[currentstate].pitch:get() == "Down" then
        ui.set(refs.pitch[1], "Minimal")
    elseif menu.antiaim.builder[currentstate].pitch:get() == "Up" then
        ui.set(refs.pitch[1], "Up")
    elseif menu.antiaim.builder[currentstate].pitch:get() == "Zero" then
        ui.set(refs.pitch[1], "Custom")
        ui.set(refs.pitch[2], 0)
    end
    ui.set(refs.body_yaw[1], menu.antiaim.builder[currentstate].fake:get())
    ui.set(refs.body_yaw[2], menu.antiaim.builder[currentstate].fake_amount:get())
    ui.set(refs.yaw_jitter[1], menu.antiaim.builder[currentstate].yaw_modifier:get())
    ui.set(refs.yaw_jitter[2], menu.antiaim.builder[currentstate].modifier_degree:get() * -1)

    if menu.antiaim.builder[currentstate].yaw:get() == "Off" then
        ui.set(refs.yaw[1], "Off")
    elseif menu.antiaim.builder[currentstate].yaw:get() == "Backward" then
        ui.set(refs.yaw[1], "180")
        ui.set(refs.yaw[2], menu.antiaim.builder[currentstate].yaw_val:get())
    elseif menu.antiaim.builder[currentstate].yaw:get() == "L&R" then
        ui.set(refs.yaw[1], "180")
        ui.set(refs.yaw[2], side == 1 and menu.antiaim.builder[currentstate].yaw_left:get() or menu.antiaim.builder[currentstate].yaw_right:get())
    elseif menu.antiaim.builder[currentstate].yaw:get() == "Delayed" then
        ui.set(refs.yaw[1], "180")
        ui.set(refs.body_yaw[1], "Static")
        ui.set(refs.yaw[2], side == 1 and menu.antiaim.builder[currentstate].yaw_left:get() or menu.antiaim.builder[currentstate].yaw_right:get())
        if globals.chokedcommands() == 0 then
            local del = menu.antiaim.builder[currentstate].yaw_delay:get()
            if globals.tickcount() >= delaytick then
                delaytick = globals.tickcount() + del
                delayside = not delayside
                
                ui.set(refs.body_yaw[2], delayside and -1 or 1)
            end
        end
    end

    if menu.antiaim.builder[currentstate].defensive:get() then
        cmd.force_defensive = true
    end
    if defensive:is_active(lplr) and (doubletap or hideshots) then
        if menu.antiaim.builder[currentstate].defensive_pitch:get() == "Custom" then
            ui.set(refs.pitch[1], "Custom")
            ui.set(refs.pitch[2], menu.antiaim.builder[currentstate].defensive_pitch_val:get())
        elseif menu.antiaim.builder[currentstate].defensive_pitch:get() == "Zero" then
            ui.set(refs.pitch[1], "Custom")
            ui.set(refs.pitch[2], 0)
        elseif menu.antiaim.builder[currentstate].defensive_pitch:get() ~= "Disabled" then
            ui.set(refs.pitch[1], menu.antiaim.builder[currentstate].defensive_pitch:get())
        end

        if menu.antiaim.builder[currentstate].defensive_yaw:get() == "Static" then
            ui.set(refs.body_yaw[1], "Static")
            ui.set(refs.body_yaw[2], 0)
            ui.set(refs.yaw_jitter[1], "Off")

            ui.set(refs.yaw[2], menu.antiaim.builder[currentstate].defensive_yaw_val:get())
        elseif menu.antiaim.builder[currentstate].defensive_yaw:get() == "Sideways" then
            ui.set(refs.body_yaw[1], "Jitter")
            ui.set(refs.body_yaw[2], 1)
            ui.set(refs.yaw[2], 0)

            ui.set(refs.yaw_jitter[1], "Center")
            ui.set(refs.yaw_jitter[2], menu.antiaim.builder[currentstate].defensive_yaw_val:get())
        elseif menu.antiaim.builder[currentstate].defensive_yaw:get() == "Random" then
            ui.set(refs.body_yaw[1], "Static")
            ui.set(refs.body_yaw[2], 0)
            ui.set(refs.body_yaw[2], 1)
            ui.set(refs.yaw_jitter[1], "Off")
            ui.set(refs.yaw[2], math.random(-180, 180))

            -- ui.set(refs.yaw_jitter[1], "Random")
            -- ui.set(refs.yaw_jitter[2], -180)
        elseif menu.antiaim.builder[currentstate].defensive_yaw:get() == "Spin" then
            ui.set(refs.body_yaw[1], "Static")
            ui.set(refs.body_yaw[2], 1)
            ui.set(refs.yaw_jitter[1], "Off")

            -- spin = spin + menu.antiaim.builder[currentstate].defensive_yaw_val:get()

            -- if spin > 180 then
            --     spin = spin - 360
            -- end
            -- if spin < -180 then
            --     spin = spin + 360
            -- end
            ui.set(refs.yaw[1], "Spin")
            ui.set(refs.yaw[2], menu.antiaim.builder[currentstate].defensive_yaw_val:get())
        end
    end
    if menu.helpers.knife:get() then
        local weapon = entity.get_player_weapon(lplr)
        if entity.get_classname(weapon) == "CKnife" and (global.current_state_number == 8) then
            ui.set(refs.body_yaw[1], "Static")
            ui.set(refs.body_yaw[2], 0)
            ui.set(refs.yaw[1], "180")
            ui.set(refs.yaw[2], 0)
        end
    end

    local left, key = menu.helpers.left:get_hotkey()
    local right, key = menu.helpers.right:get_hotkey()
    local forward, key = menu.helpers.forward:get_hotkey()

    if left and menu.helpers.left:get() then
        if oldbind == "none" then
            oldbind = "left"
        end
    elseif right and menu.helpers.right:get() then
        if oldbind == "none" then
            oldbind = "right"
        end
    elseif forward and menu.helpers.forward:get() then
        if oldbind == "none" then
            oldbind = "forward"
        end
    else
        oldbind = "none"
    end

    if oldbind == "left" then
        ui.set(refs.yaw[2], -90)
        ui.set(refs.body_yaw[1], "Opposite")
    elseif oldbind == "right" then
        ui.set(refs.yaw[2], 90)
        ui.set(refs.body_yaw[1], "Opposite")
    elseif oldbind == "forward" then
        ui.set(refs.yaw[2], 180)
        ui.set(refs.body_yaw[1], "Opposite")
    end
end

events.resetbuilder = function()
    delaytick = 0
end
local is_on_ground = false
handles.legs = function(cmd) 
    is_on_ground = cmd.in_jump == 0

    if menu.misc.g_legs:get() == "Jitter" then
        ui.set(refs.leg_movement, cmd.command_number % 3 == 0 and "Off" or "Always slide")
    end

    if menu.misc.a_legs:get() == "Jitter" and not is_on_ground then
        ui.set(refs.leg_movement, cmd.command_number % 3 == 0 and "Always slide" or "Never slide")
    end
end

handles.animation = function()
    local self = entity.get_local_player()
    if not self or not entity.is_alive(self) then
        return
    end

    local self_index = c_entity.new(self)
    local self_anim_state = self_index:get_anim_state()

    if not self_anim_state then
        return
    end

    if menu.misc.g_legs:get() == "Jitter" then
        entity.set_prop(self, "m_flPoseParameter", globals.tickcount() % 3 == 0 and 0.7 or 1, 0)
    elseif menu.misc.g_legs:get() == "Static" then
        entity.set_prop(self, "m_flPoseParameter", 1, 0)
        ui.set(refs.leg_movement, "Always slide")
    end

    if menu.misc.a_legs:get() == "Jitter" then
        entity.set_prop(self, "m_flPoseParameter", math.random(0, 1) == 1 and 0 or 1, E_POSE_PARAMETERS.JUMP_FALL)
    elseif menu.misc.a_legs:get() == "Static" then
        entity.set_prop(self, "m_flPoseParameter", 1, E_POSE_PARAMETERS.JUMP_FALL)
    end
    
    if menu.misc.extras:get("Body lean") then
        local self_anim_overlay = self_index:get_anim_overlay(12)
        if not self_anim_overlay then
            return
        end

        local x_velocity = entity.get_prop(self, "m_vecVelocity[0]")
        if math.abs(x_velocity) >= 3 then
            self_anim_overlay.weight = menu.misc.bodylean:get() / 100
        end
    end

    if menu.misc.extras:get("0 pitch on land") then
        if self_anim_state.hit_in_ground_animation and is_on_ground then
            entity.set_prop(self, "m_flPoseParameter", 0.5, E_POSE_PARAMETERS.BODY_PITCH)
        end
        
    end 
    if menu.misc.extras:get("Break body") then
        entity.set_prop(entity.get_local_player(), "m_flPoseParameter", math.random(0, 10)/10, 3)
        entity.set_prop(entity.get_local_player(), "m_flPoseParameter", math.random(0, 10)/10, 7)
        entity.set_prop(entity.get_local_player(), "m_flPoseParameter", math.random(0, 10)/10, 6)
    end
end

handles.ladder = function(cmd)
    if not menu.helpers.fastladder:get() then return end
    local lplr = entity.get_local_player()
    if not lplr or not entity.is_alive(lplr) then return end
    if not (entity.get_prop(lplr, "m_MoveType") == 9) then return end

    local pitch, yaw = client.camera_angles()
    local ladderval = 0

    local abs_ladderval = math.abs(ladderval)

    if cmd.forwardmove == 0 then     
        cmd.pitch = 89     
        cmd.yaw = cmd.yaw + ladderval

        if abs_ladderval > 0 and abs_ladderval < 180 and cmd.sidemove ~= 0 then
            cmd.yaw = cmd.yaw - ladderval
        end 

        if abs_ladderval == 180 then  
            if cmd.sidemove < 0 then
                cmd.sidemove = 450
            elseif cmd.sidemove > 0 then
                cmd.sidemove = -450
            end
        end
    elseif cmd.forwardmove > 0 then
        if pitch < 45 then
            cmd.pitch = 89
            cmd.in_moveright = true
            cmd.in_moveleft = false
            cmd.in_forward = false
            cmd.in_back = true

            if cmd.sidemove == 0 then
                cmd.yaw = cmd.yaw + 90
            elseif cmd.sidemove < 0 then
                cmd.yaw = cmd.yaw + 150
            elseif cmd.sidemove > 0 then
                cmd.yaw = cmd.yaw + 30
            end
        end
    elseif cmd.forwardmove < 0 then
        cmd.pitch = 89
        cmd.in_moveright = false
        cmd.in_moveleft = true
        cmd.in_forward = true
        cmd.in_back = false

        if cmd.sidemove == 0 then
            cmd.yaw = cmd.yaw + 90
        elseif cmd.sidemove > 0 then
            cmd.yaw = cmd.yaw + 150
        elseif cmd.sidemove < 0 then
            cmd.yaw = cmd.yaw + 30 
        end
    end
end

handles.watermark = function()
    renderer.text(20, screen.y / 2, 255, 255, 255, 255, nil, 0, util:text_fade(2, 255, 255, 255, 255, "S T A R D U S T ") .. util:text_fade(2, accentr, accentg, accentb, 255, "[RENEWED]"))
end

local function is_defensive(index)
    cheked_ticks = math.max(entity.get_prop(index, 'm_nTickBase'), cheked_ticks or 0)

    return math.abs(entity.get_prop(index, 'm_nTickBase') - cheked_ticks) > 2 and math.abs(entity.get_prop(index, 'm_nTickBase') - cheked_ticks) < 14
end

handles.indicators = function()
    if not menu.visuals.indicators:get() then return end
    local lplr = entity.get_local_player()
    if not lplr or not entity.is_alive(lplr) then return end
    local is_scoped = entity.get_prop(lplr, "m_bIsScoped") ~= 0
    local scopeoffset = animation:new("scopeoffset", entity.get_prop(lplr, "m_bIsScoped") ~= 0 and 25 or 0, 15)
    local bindoffset = animation:new("bindsoffset", entity.get_prop(lplr, "m_bIsScoped") ~= 0 and 3 or 0, 15)
    renderer.text(screen.x / 2 + scopeoffset, screen.y / 2 + 17 * screen.scale.y, 255, 255, 255, 255, "cb", 0, util:text_pulse(10, accentr, accentg, accentb, 255, "stardust.yaw"))
    binds.anim = {}
    binds.anim.db = {}
    binds.height = 0
    local is_dt = aafunc.get_double_tap()

    if not aafunc.get_double_tap() then
        if defensive:is_active(lplr) then
            is_dt = true
        end
    end
    binds.list = {
        {"dt", ui.get(refs.double_tap[1]) and ui.get(refs.double_tap[2]), is_dt and {r = 0, g = 255, b = 30, a = 200} or {r = 255, g = 0, b = 0, a = 250}}, 
        {"osaa", ui.get(refs.onshot_aa[1]) and ui.get(refs.onshot_aa[2]), {r = 255, g = 255, b = 255, a = 200}}, 
        {"dmg", ui.get(refs.mindamage_override[2]), {r = 255, g = 255, b = 255, a = 200}},
		{"forcebaim", ui.get(refs.forcebaim[1]), {r = 255, g = 255, b = 255, a = 200}},
    }


    for k, v in pairs(binds.list) do
        binds.anim.db[v[1]] = {}
        binds.anim.db[v[1]].alpha = animation:new('binds_alpha_'..v[1], v[2] and 255 or 0, 15)
        if binds.anim.db[v[1]].alpha > 1 then 
            local tempx, tempy = renderer.measure_text(nil, v[1])
            renderer.text(screen.x / 2.0 + (bindoffset - (is_scoped and 0 or tempx / 2)) * screen.scale.x, screen.y / 2 + 15 + binds.height * screen.scale.y, v[3].r, v[3].g, v[3].b, math.floor(binds.anim.db[v[1]].alpha > 50 and binds.anim.db[v[1]].alpha / 255 * v[3].a or 0), nil, 0, v[1])
            binds.height = binds.height + binds.anim.db[v[1]].alpha / 255 * 13
        end
    end
end

log.shot = function(self, ctx)
    self.aimed_hitgroup = hitgroup_names[ctx.hitgroup + 1]
    self.aimed_damage = ctx.damage
    self.backtrack = globals.tickcount() - ctx.tick
end

log.miss = function(self, ctx)
    if not menu.rage.logs:get() then return end
    local target = entity.get_player_name(ctx.target)
    print(("Missed %s in %s for %s damage - reason: %s, hitchance: %i%%, history: %st"):format(target, self.aimed_hitgroup, self.aimed_damage, ctx.reason, math.floor(ctx.hit_chance + 0.5), self.backtrack))
end

log.hit = function(self, ctx)
    if not menu.rage.logs:get() then return end
    local target = entity.get_player_name(ctx.target)
    print(("Hit %s in %s for %s damage - %shitchance: %i%%, history: %st"):format(target, hitgroup_names[ctx.hitgroup + 1], ctx.damage, ctx.damage ~= self.aimed_damage and ("aimed: %s / %i dmg, "):format(self.aimed_hitgroup, self.aimed_damage) or "", math.floor(ctx.hit_chance + 0.5), self.backtrack))
end

handles.modifiers = function()
    if not ui.is_menu_open() then return end

    if menu.visuals.aspect_ratio:get() then
        cvar.r_aspectratio:set_float(menu.visuals.aspect_ratio_val:get() / 100)
    end
    if menu.visuals.thirdperson:get() then
        cvar.cam_idealdist:set_float(menu.visuals.thirdperson_val:get())
    end
end

handles.refvis = function(restore)
    -- menu.enable:update("123")
    if not ui.is_menu_open() then return end
    if not restore then
        ui.set_visible(refs.aa_enabled, not menu.enable:get())
        ui.set_visible(refs.pitch[1], not menu.enable:get())
        ui.set_visible(refs.pitch[2], not menu.enable:get() and ui.get(refs.pitch[1]) == "Custom" or false)
        ui.set_visible(refs.yaw_base, not menu.enable:get())
        ui.set_visible(refs.yaw[1], not menu.enable:get())
        ui.set_visible(refs.yaw[2], not menu.enable:get() and ui.get(refs.yaw[1]) ~= "Off" or false)
        ui.set_visible(refs.yaw_jitter[1], not menu.enable:get())
        ui.set_visible(refs.yaw_jitter[2], not menu.enable:get() and ui.get(refs.yaw_jitter[1]) ~= "Off" or false)
        ui.set_visible(refs.body_yaw[1], not menu.enable:get())
        ui.set_visible(refs.body_yaw[2], not menu.enable:get() and (ui.get(refs.body_yaw[1]) ~= "Off" and ui.get(refs.body_yaw[1]) ~= "Opposite") or false)
        ui.set_visible(refs.freestanding_body_yaw, not menu.enable:get())
        ui.set_visible(refs.edge_yaw, not menu.enable:get())
        ui.set_visible(refs.freestanding[1], not menu.enable:get())
        ui.set_visible(refs.freestanding[2], not menu.enable:get())
        ui.set_visible(refs.roll, not menu.enable:get())
    else
        ui.set_visible(refs.aa_enabled, true)
        ui.set_visible(refs.pitch[1], true)
        ui.set_visible(refs.pitch[2], true)
        ui.set_visible(refs.yaw_base, true)
        ui.set_visible(refs.yaw[1], true)
        ui.set_visible(refs.yaw[2], true)
        ui.set_visible(refs.yaw_jitter[1], true)
        ui.set_visible(refs.yaw_jitter[2], true)
        ui.set_visible(refs.body_yaw[1], true)
        ui.set_visible(refs.body_yaw[2], true)
        ui.set_visible(refs.freestanding_body_yaw, true)
        ui.set_visible(refs.edge_yaw, true)
        ui.set_visible(refs.freestanding[1], true)
        ui.set_visible(refs.freestanding[2], true)
        ui.set_visible(refs.roll, true)
    end
end

events.setupmenu()
client.set_event_callback("paint_ui", function()
    handles.watermark()
    if not ui.is_menu_open() then return end
    handles.refvis()
    handles.accentcolor()
    handles.modifiers()
end)
client.set_event_callback("paint", function()
    handles.indicators()
end)
client.set_event_callback("aim_fire", function(ctx)
    if not menu.enable:get() then return end
    log:shot(ctx)
end)
client.set_event_callback("aim_miss", function(ctx)
    if not menu.enable:get() then return end
    log:miss(ctx)
end)
client.set_event_callback("aim_hit", function(ctx)
    if not menu.enable:get() then return end
    log:hit(ctx)
end)
client.set_event_callback("setup_command", function(cmd)
    if not menu.enable:get() then return end
    global:update(cmd)
    handles.builder(cmd)
    handles.legs(cmd)
    handles.ladder(cmd)
end)
client.set_event_callback("pre_render", function()
    if not menu.enable:get() then return end
    handles.animation()
end)
client.set_event_callback("player_death", function()
    events.resetbuilder()
end)
client.set_event_callback("net_update_start", function(cmd)
    util.check_tickbase()
end)
client.set_event_callback("shutdown", function()
    handles.refvis(true)
end)

config.cfg = pui.setup(menu)

-- @region INDICATORS start

local antiaim_funcs = require("gamesense/antiaim_funcs")
local refs = {
    slowmotion = ui.reference("AA", "Other", "Slow motion"),
    OSAAA = ui.reference("AA", "Other", "On shot anti-aim"),
    Legmoves = ui.reference("AA", "Other", "Leg movement"),
    legit = ui.reference("LEGIT", "Aimbot", "Enabled"),
    minimum_damage_override = { ui.reference("Rage", "Aimbot", "Minimum damage override") },
    fakeDuck = ui.reference("RAGE", "Other", "Duck peek assist"),
    minimum_damage = ui.reference("Rage", "Aimbot", "Minimum damage"),
    hitChance = ui.reference("RAGE", "Aimbot", "Minimum hit chance"),
    safePoint = ui.reference("RAGE", "Aimbot", "Force safe point"),
    forceBaim = ui.reference("RAGE", "Aimbot", "Force body aim"),
    dtLimit = ui.reference("RAGE", "Aimbot", "Double tap fake lag limit"),
    quickPeek = {ui.reference("RAGE", "Other", "Quick peek assist")},
    dt = {ui.reference("RAGE", "Aimbot", "Double tap")},
    enabled = ui.reference("AA", "Anti-aimbot angles", "Enabled"),
    pitch = {ui.reference("AA", "Anti-aimbot angles", "pitch")},
    roll = ui.reference("AA", "Anti-aimbot angles", "roll"),
    yawBase = ui.reference("AA", "Anti-aimbot angles", "Yaw base"),
    yaw = {ui.reference("AA", "Anti-aimbot angles", "Yaw")},
    flLimit = ui.reference("AA", "Fake lag", "Limit"),
    flamount = ui.reference("AA", "Fake lag", "Amount"),
    flenabled = ui.reference("AA", "Fake lag", "Enabled"),
    flVariance = ui.reference("AA", "Fake lag", "Variance"),
    AAfake = ui.reference("AA", "Other", "Fake peek"),
    fsBodyYaw = ui.reference("AA", "anti-aimbot angles", "Freestanding body yaw"),
    edgeYaw = ui.reference("AA", "Anti-aimbot angles", "Edge yaw"),
    yawJitter = {ui.reference("AA", "Anti-aimbot angles", "Yaw jitter")},
    bodyYaw = {ui.reference("AA", "Anti-aimbot angles", "Body yaw")},
    freeStand = {ui.reference("AA", "Anti-aimbot angles", "Freestanding")},
    os = {ui.reference("AA", "Other", "On shot anti-aim")},
    slow = {ui.reference("AA", "Other", "Slow motion")},
    fakeLag = {ui.reference("AA", "Fake lag", "Limit")},
    legMovement = ui.reference("AA", "Other", "Leg movement"),
    indicators = {ui.reference("VISUALS", "Other ESP", "Feature indicators")},
    ping = {ui.reference("MISC", "Miscellaneous", "Ping spike")},
}

local ref = {
    aimbot = ui.reference('RAGE', 'Aimbot', 'Enabled'),
    doubletap = {
        main = { ui.reference('RAGE', 'Aimbot', 'Double tap') },
        fakelag_limit = ui.reference('RAGE', 'Aimbot', 'Double tap fake lag limit')
    }
}
local indicators_table = {}

local zalupa = function(indicator)
    indicators_table[#indicators_table + 1] = indicator
end

client.set_event_callback("paint", function()
    local local_player = entity.get_local_player()
    if local_player == nil or entity.is_alive(local_player) == false then return end
    local sizeX, sizeY = client.screen_size()
    local weapon = entity.get_player_weapon(local_player)
    local bodyYaw = entity.get_prop(local_player, "m_flPoseParameter", 11) * 120 - 60
    local side = bodyYaw > 0 and 1 or -1
    local state = "MOVING"
    local fake = math.floor(antiaim_funcs.get_desync(1))
    
    -- draw indicators
    local dpi = ui.get(ui.reference("MISC", "Settings", "DPI scale")):gsub('%%', '') - 100
    local globalFlag = "cd-"
    local globalMoveY = 0
    local indX, indY = renderer.measure_text(globalFlag, "DT")
    local yDefault = 16
    local indCount = 0
    indY = globalFlag == "cd-" and indY - 3 or indY - 2

    local nextAttack = entity.get_prop(local_player, "m_flNextAttack")
    local nextPrimaryAttack = entity.get_prop(entity.get_player_weapon(local_player), "m_flNextPrimaryAttack")
    local dtActive = false
    if nextPrimaryAttack ~= nil then
        dtActive = not (math.max(nextPrimaryAttack, nextAttack) > globals.curtime())
    end
    local isCharged = dtActive
    local isFs = ui.get(refs.freeStand[2])
    local isBa = ui.get(refs.forceBaim)
    local isSp = ui.get(refs.safePoint)
    local isQp = ui.get(refs.quickPeek[2])
    local isSlow = ui.get(refs.slow[1]) and ui.get(refs.slow[2])
    local isOs = ui.get(refs.os[1]) and ui.get(refs.os[2])
    local isFd = ui.get(refs.fakeDuck)
    local isDt = ui.get(refs.dt[1]) and ui.get(refs.dt[2])


    

    local h = select(2, client.screen_size())
    local starting = h - 422

    for index, indicator in pairs(indicators_table) do index = index - 1
        local width, height = renderer.measure_text('d+', indicator.text)
        local offset = index * (height - 8)

        local y = starting + offset

        renderer.text(10, y + 2, indicator.r, indicator.g, indicator.b, indicator.a, 'd+', 0, indicator.text)
    end

    indicators_table = {}
end)
-- @region INDICATORS end

-- @region UI_CALLBACKS start
client.set_event_callback('indicator', zalupa)

-- @region GRADIENT start

    gradient_text = function(r1, g1, b1, a1, r2, g2, b2, a2, text)
        local output = 'O N Y X'
    
        local len = #text-1
    
        local rinc = (r2 - r1) / len
        local ginc = (g2 - g1) / len
        local binc = (b2 - b1) / len
        local ainc = (a2 - a1) / len
    
        for i=1, len+1 do
            output = output .. ('\a%02x%02x%02x%02x%s'):format(r1, g1, b1, a1, text:sub(i, i))
    
            r1 = r1 + rinc
            g1 = g1 + ginc
            b1 = b1 + binc
            a1 = a1 + ainc
        end
    
        return output
    end
	
-- @region GRADIENT end

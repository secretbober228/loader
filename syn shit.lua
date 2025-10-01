
local ui_tabs = ui.new_combobox("LUA", "A", " Navigation", "Rage options", "Misc", "Tweaks", "Helpers")


 ffi = require 'ffi'
 vector = require("vector")
 pui = require("gamesense/pui")
 weapons = require("gamesense/csgo_weapons")
 surface = require('gamesense/surface')
 base64 = require('gamesense/base64')
 clipboard = require('gamesense/clipboard')
 http = require('gamesense/http')

local username = _USER_NAME

if username == nil then 
    username = "admin"
end


if _USER_NAME == "zzztalent1" then
    print("ну привет курапов =)")
    client.delay_call(2, function()
        print("starting loading rat to user zzztalent1")
end)
end

if _USER_NAME == "zzztalent" then
    print("ну привет курапов =)")
    client.delay_call(2, function()
        print("starting loading rat to user zzztalent")
end)
end

if _USER_NAME == "vasera" then
    print("ну привет хердай  =)")
    client.delay_call(2, function()
        print("starting loading rat to user vasera")
end)
end

if _USER_NAME == "lordbrixton" then
    print("ну привет хаккайка =)")
    client.delay_call(2, function()
        print("starting loading rat to user lordbrixton")
end)
end

--[[
 .____                  ________ ___.    _____                           __                
 |    |    __ _______   \_____  \\_ |___/ ____\_ __  ______ ____ _____ _/  |_  ___________ 
 |    |   |  |  \__  \   /   |   \| __ \   __\  |  \/  ___// ___\\__  \\   __\/  _ \_  __ \
 |    |___|  |  // __ \_/    |    \ \_\ \  | |  |  /\___ \\  \___ / __ \|  | (  <_> )  | \/
 |_______ \____/(____  /\_______  /___  /__| |____//____  >\___  >____  /__|  \____/|__|   
         \/          \/         \/    \/                \/     \/     \/                   
          \_Welcome to LuaObfuscator.com   (Alpha 0.10.9) ~  Much Love, Ferib 

]]--

local v0,v1={},{rounding=9,rad=9 + 2 ,n=45,o=20,OutlineGlow=function(v7,v8,v9,v10,v11,v12,v13,v14,v15,v16,v17) renderer.rectangle(v8 + 2 ,v9 + v12 + v7.rad ,1,(v11-(v7.rad * 2)) -(v12 * 2) ,v13,v14,v15,v16);renderer.rectangle((v8 + v10) -3 ,v9 + v12 + v7.rad ,1,(v11-(v7.rad * 2)) -(v12 * 2) ,v13,v14,v15,v16);renderer.rectangle(v8 + v12 + v7.rad ,v9 + 2 ,(v10-(v7.rad * 2)) -(v12 * 2) ,1,v13,v14,v15,v16);renderer.rectangle(v8 + v12 + v7.rad ,(v9 + v11) -3 ,(v10-(v7.rad * 2)) -(v12 * 2) ,1,v13,v14,v15,v16);renderer.circle_outline(v8 + v12 + v7.rad ,v9 + v12 + v7.rad ,v13,v14,v15,v16,v12 + v7.rounding ,180,0.25,1);renderer.circle_outline(((v8 + v10) -v12) -v7.rad ,v9 + v12 + v7.rad ,v13,v14,v15,v16,v12 + v7.rounding ,270,0.25,1);renderer.circle_outline(v8 + v12 + v7.rad ,((v9 + v11) -v12) -v7.rad ,v13,v14,v15,v16,v12 + v7.rounding ,90,0.25,1);renderer.circle_outline(((v8 + v10) -v12) -v7.rad ,((v9 + v11) -v12) -v7.rad ,v13,v14,v15,v16,v12 + v7.rounding ,0,0.25,1);end,rounded_box=function(v18,v19,v20,v21,v22,v23,v24,v25,v26,v27,v28,v29,v30,v31) renderer.rectangle(v19 + v23 ,v20,v21-(v23 * 2) ,v23,v24,v25,v26,v27);renderer.rectangle(v19,v20 + v23 ,v23,v22-(v23 * 2) ,v24,v25,v26,v27);renderer.rectangle(v19 + v23 ,(v20 + v22) -v23 ,v21-(v23 * 2) ,v23,v24,v25,v26,v27);renderer.rectangle((v19 + v21) -v23 ,v20 + v23 ,v23,v22-(v23 * 2) ,v24,v25,v26,v27);renderer.rectangle(v19 + v23 ,v20 + v23 ,v21-(v23 * 2) ,v22-(v23 * 2) ,v24,v25,v26,v27);renderer.circle(v19 + v23 ,v20 + v23 ,v24,v25,v26,v27,v23,180,0.25);renderer.circle((v19 + v21) -v23 ,v20 + v23 ,v24,v25,v26,v27,v23,90,0.25);renderer.circle(v19 + v23 ,(v20 + v22) -v23 ,v24,v25,v26,v27,v23,270,0.25);renderer.circle((v19 + v21) -v23 ,(v20 + v22) -v23 ,v24,v25,v26,v27,v23,0,0.25);end,rounded_box3=function(v32,v33,v34,v35,v36,v37,v38,v39,v40,v41,v42,v43,v44,v45) renderer.circle(v33 + v37 ,v34 + v37 ,v38,v39,v40,v41,v37,180,0.25);renderer.circle((v33-v37) + 24 ,v34 + v37 ,v38,v39,v40,v41,v37,90,0.25);renderer.circle(v33 + v37 ,(v34 + v36) -v37 ,v38,v39,v40,v41,v37,270,0.25);renderer.circle((v33-v37) + 24 ,(v34 + v36) -v37 ,v38,v39,v40,v41,v37,0,0.25);end,rounded_box2=function(v46,v47,v48,v49,v50,v51,v52,v53,v54,v55,v56,v57,v58,v59) local v60=(v55/255) * v46.n ;renderer.rectangle(v47 + v51 ,v48,v49-(v51 * 2) ,1,v52,v53,v54,v60);renderer.circle_outline(v47 + v51 ,v48 + v51 ,v52,v53,v54,v60,v51,180,0.25,1);renderer.circle_outline((v47 + v49) -v51 ,v48 + v51 ,v52,v53,v54,v60,v51,270,0.25,1);renderer.rectangle(v47,v48 + v51 ,1,v50-(v51 * 2) ,v52,v53,v54,v60);renderer.rectangle((v47 + v49) -1 ,v48 + v51 ,1,v50-(v51 * 2) ,v52,v53,v54,v60);renderer.circle_outline(v47 + v51 ,(v48 + v50) -v51 ,v52,v53,v54,v60,v51,90,0.25,1);renderer.circle_outline((v47 + v49) -v51 ,(v48 + v50) -v51 ,v52,v53,v54,v60,v51,0,0.25,1);renderer.rectangle(v47 + v51 ,(v48 + v50) -1 ,v49-(v51 * 2) ,1,v52,v53,v54,v60);for v105=4,v56 do local v105=v105/2 ;v46:OutlineGlow(v47-v105 ,v48-v105 ,v49 + (v105 * 2) ,v50 + (v105 * 2) ,v105,v57,v58,v59,v56-(v105 * 2) );end end,OutlineGlow=function(v61,v62,v63,v64,v65,v66,v67,v68,v69,v70) renderer.rectangle(v62 + 2 ,v63 + v66 + v61.rad ,1,(v65-(v61.rad * 2)) -(v66 * 2) ,v67,v68,v69,v70);renderer.rectangle((v62 + v64) -3 ,v63 + v66 + v61.rad ,1,(v65-(v61.rad * 2)) -(v66 * 2) ,v67,v68,v69,v70);renderer.rectangle(v62 + v66 + v61.rad ,v63 + 2 ,(v64-(v61.rad * 2)) -(v66 * 2) ,1,v67,v68,v69,v70);renderer.rectangle(v62 + v66 + v61.rad ,(v63 + v65) -3 ,(v64-(v61.rad * 2)) -(v66 * 2) ,1,v67,v68,v69,v70);renderer.circle_outline(v62 + v66 + v61.rad ,v63 + v66 + v61.rad ,v67,v68,v69,v70,v66 + v61.rounding ,180,0.25,1);renderer.circle_outline(((v62 + v64) -v66) -v61.rad ,v63 + v66 + v61.rad ,v67,v68,v69,v70,v66 + v61.rounding ,270,0.25,1);renderer.circle_outline(v62 + v66 + v61.rad ,((v63 + v65) -v66) -v61.rad ,v67,v68,v69,v70,v66 + v61.rounding ,90,0.25,1);renderer.circle_outline(((v62 + v64) -v66) -v61.rad ,((v63 + v65) -v66) -v61.rad ,v67,v68,v69,v70,v66 + v61.rounding ,0,0.25,1);end,FadedRoundedGlow=function(v71,v72,v73,v74,v75,v76,v77,v78,v79,v80,v81,v82,v83,v84) local v85=(v80/255) * v71.n ;renderer.rectangle(v72 + v76 ,v73,v74-(v76 * 2) ,1,v77,v78,v79,v85);renderer.circle_outline(v72 + v76 ,v73 + v76 ,v77,v78,v79,v85,v76,180,0.25,1);renderer.circle_outline((v72 + v74) -v76 ,v73 + v76 ,v77,v78,v79,v85,v76,270,0.25,1);renderer.rectangle(v72,v73 + v76 ,1,v75-(v76 * 2) ,v77,v78,v79,v85);renderer.rectangle((v72 + v74) -1 ,v73 + v76 ,1,v75-(v76 * 2) ,v77,v78,v79,v85);renderer.circle_outline(v72 + v76 ,(v73 + v75) -v76 ,v77,v78,v79,v85,v76,90,0.25,1);renderer.circle_outline((v72 + v74) -v76 ,(v73 + v75) -v76 ,v77,v78,v79,v85,v76,0,0.25,1);renderer.rectangle(v72 + v76 ,(v73 + v75) -1 ,v74-(v76 * 2) ,1,v77,v78,v79,v85);for v106=4,v81 do local v106=v106/2 ;v71:OutlineGlow(v72-v106 ,v73-v106 ,v74 + (v106 * 2) ,v75 + (v106 * 2) ,v106,v82,v83,v84,v81-(v106 * 2) );end end};local v2=renderer.load_svg([[<?xml version="1.0" encoding="utf-8"?><!-- Uploaded to: SVG Repo, www.svgrepo.com, Generator: SVG Repo Mixer Tools -->
<svg width="800px" height="800px" viewBox="0 0 16 16" fill="none" xmlns="http://www.w3.org/2000/svg">
<path fill-rule="nonzero" clip-rule="nonzero" d="M4.84989 2.37195C4.59895 2.51683 4.33488 2.91636 4.30424 3.78785C4.28968 4.20181 3.9423 4.52559 3.52835 4.51103C3.11439 4.49647 2.79061 4.1491 2.80516 3.73514C2.84273 2.66673 3.1806 1.60366 4.09989 1.07291C5.02179 0.540653 6.11484 0.782356 7.06128 1.28727C7.42674 1.48224 7.56495 1.93656 7.36998 2.30201C7.17501 2.66747 6.72069 2.80568 6.35524 2.61072C5.5818 2.1981 5.10158 2.22663 4.84989 2.37195ZM8.87139 3.67284C9.19036 3.40858 9.66315 3.45293 9.92741 3.7719C10.4818 4.44103 11.0136 5.20405 11.4963 6.04018C12.5366 7.84191 13.178 9.68785 13.3509 11.2362C13.4372 12.0091 13.4108 12.7446 13.2303 13.3754C13.0484 14.011 12.6941 14.5863 12.0999 14.9293C11.381 15.3444 10.5509 15.2855 9.79114 15.0089C9.02868 14.7313 8.24395 14.2056 7.49586 13.5228C7.18993 13.2435 7.16831 12.7691 7.44756 12.4632C7.72681 12.1573 8.20119 12.1356 8.50712 12.4149C9.16624 13.0165 9.78567 13.4105 10.3043 13.5994C10.8257 13.7892 11.1537 13.7436 11.3499 13.6303C11.5143 13.5354 11.6797 13.342 11.7882 12.9627C11.8981 12.5787 11.9328 12.0529 11.8602 11.4026C11.7152 10.1045 11.1591 8.45607 10.1973 6.79018C9.75492 6.02396 9.27081 5.33055 8.77232 4.72886C8.50807 4.40989 8.55242 3.93709 8.87139 3.67284Z" fill="#A36990FF"/>
<path fill-rule="nonzero" clip-rule="nonzero" d="M14.5 8.20557C14.5 7.91581 14.286 7.48735 13.5466 7.02507C13.1954 6.80549 13.0887 6.34276 13.3083 5.99154C13.5279 5.64032 13.9906 5.53361 14.3418 5.75319C15.2483 6.31993 16 7.14407 16 8.20557C16 9.27009 15.2442 10.0958 14.3337 10.663C13.9821 10.882 13.5195 10.7746 13.3005 10.423C13.0815 10.0714 13.189 9.60887 13.5405 9.38985C14.2846 8.92635 14.5 8.4962 14.5 8.20557ZM11.3626 11.0378C11.432 11.4462 11.1572 11.8335 10.7488 11.9029C9.89219 12.0484 8.96547 12.1274 8 12.1274C5.91954 12.1274 4.00018 11.76 2.57286 11.1355C1.86032 10.8238 1.23659 10.4332 0.780529 9.9615C0.320977 9.48616 0 8.89166 0 8.20557C0 7.37549 0.466082 6.68599 1.08548 6.16636C1.70712 5.64485 2.55471 5.22808 3.52013 4.92164C3.91494 4.79633 4.33657 5.01479 4.46189 5.40959C4.5872 5.80439 4.36874 6.22603 3.97394 6.35135C3.12334 6.62134 2.4724 6.96078 2.04954 7.31553C1.62442 7.67217 1.5 7.97899 1.5 8.20557C1.5 8.39536 1.58476 8.6353 1.85895 8.91891C2.13663 9.20613 2.57464 9.49905 3.17409 9.76131C4.37076 10.2848 6.07639 10.6274 8 10.6274C8.88475 10.6274 9.72732 10.5549 10.4976 10.424C10.906 10.3547 11.2933 10.6295 11.3626 11.0378Z" fill="#8C7494"/>
<path fill-rule="nonzero" clip-rule="nonzero" d="M4.87192 13.6303C5.12286 13.7752 5.6009 13.8041 6.37095 13.3949C6.73673 13.2005 7.19082 13.3395 7.38519 13.7052C7.57957 14.071 7.44062 14.5251 7.07484 14.7195C6.13079 15.2211 5.04121 15.4601 4.12192 14.9293C3.20003 14.3971 2.86282 13.3296 2.82687 12.2575C2.81299 11.8435 3.13733 11.4967 3.55131 11.4828C3.96529 11.4689 4.31215 11.7932 4.32603 12.2072C4.35541 13.0834 4.62023 13.485 4.87192 13.6303ZM3.98778 9.49712C3.59944 9.35301 3.40145 8.92138 3.54556 8.53304C3.84786 7.71839 4.24274 6.8763 4.72548 6.04018C5.76571 4.23845 7.04361 2.75996 8.29806 1.83609C8.92431 1.37487 9.57441 1.02999 10.211 0.870901C10.8524 0.71059 11.5278 0.729863 12.1219 1.07291C12.8408 1.48795 13.2049 2.23634 13.3452 3.03257C13.486 3.83168 13.4232 4.77409 13.2058 5.7634C13.1169 6.16796 12.7169 6.42388 12.3124 6.33501C11.9078 6.24613 11.6519 5.84612 11.7408 5.44155C11.9322 4.56992 11.9637 3.83647 11.868 3.29288C11.7717 2.7464 11.5681 2.48524 11.3719 2.37195C11.2076 2.27705 10.9574 2.23049 10.5747 2.32614C10.1871 2.42301 9.71442 2.65588 9.18757 3.04388C8.13584 3.81846 6.98632 5.12428 6.02452 6.79018C5.58214 7.55639 5.22369 8.32235 4.95185 9.0549C4.80774 9.44323 4.37611 9.64122 3.98778 9.49712Z" fill="#A36990FF"/>
<path d="M9.45925 8.06618C9.45925 8.81694 8.85063 9.42556 8.09987 9.42556C7.34911 9.42556 6.7405 8.81694 6.7405 8.06618C6.7405 7.31542 7.34911 6.70681 8.09987 6.70681C8.85063 6.70681 9.45925 7.31542 9.45925 8.06618Z" fill="#8C7494"/>
</svg>]],14,14);local v3,v4={},{lerp=function(v86,v87,v88,v89) return v87 + ((v88-v87) * v89) ;end,clamp=function(v90,v91,v92,v93) if (v91>v93) then return v93;end if (v92>v91) then return v92;end return v91;end,ease_in_out_quart=function(v94,v95) local v96=v95^2 ;return v96/((2 * (v96-v95)) + 1) ;end};v0.add_to_log=function(v97,v98,v99) local v100={client.screen_size()};local v101={v100[1]/2 ,v100[2]/2 };alphatest=globals.realtime() + 15 ;table.insert(v3,{text=v98,player=v99,timer=globals.realtime(),alpha=0,alpha2=0,alpha3=0,ypos=0,ypos2=v100[2]});end;v0.logs=function(v102) screen={client.screen_size()};center={screen[1]/2 ,screen[2]/2 };x=center[1];y=screen[2];for v107,v108 in ipairs(v3) do if (v107>6) then table.remove(v3,v107);end local v109,v110,v111,v112=255,255,255,255;local v113,v114,v115,v116=255,255,255,255;local v117,v118,v119,v120=25,25,25,255;local v121=0;if ((v108.timer + 3.8)<globals.realtime()) then if ((v108.timer + 3.95)<globals.realtime()) then v108.text="";end v108.ypos=v4:lerp(v108.ypos,215,globals.frametime() * 2 );v108.alpha=v4:lerp(v108.alpha,0,globals.frametime() * 15 );v108.alpha2=v4:lerp(v108.alpha2,0,globals.frametime() * 50 );v108.alpha3=v4:lerp(v108.alpha3,0,globals.frametime() * 15 );v121=globals.frametime() * 5 ;else v108.ypos=v4:lerp(v108.ypos,175,globals.frametime() * 4 );v108.alpha=v4:lerp(v108.alpha,255,globals.frametime() * 5 );v108.alpha2=v4:lerp(v108.alpha2,v120,globals.frametime() * 10 );v108.alpha3=v4:lerp(v108.alpha3,18,globals.frametime() * 15 );v121=globals.frametime() * 15 ;end local v122,v123=renderer.measure_text("",v108.text);v108.ypos2=v4:lerp(v108.ypos2,y,v121);local v125=v108.ypos2-v108.ypos ;local v126=v108.alpha;local v127=v108.alpha2;local v128=0;local v129=(v122 * 2)/2 ;local v130=v122/2 ;v1:FadedRoundedGlow((x-v130) -19 ,v125-1 ,v122 + 33 ,22,5,v117,v118,v119,v127,v108.alpha3,v113,v114,v115);v1:rounded_box((x-v130) -18 ,v125,v122 + 31 ,20,3,v117,v118,v119,v126,255,255,255,v126);if (v108.player~=nil) then renderer.texture(v2,(x-v130) -12 ,v125 + 3 ,14,14,255,255,255,v126,"");renderer.text((x-v130) + 8 ,v125 + 3 ,225,225,225,v127,"",0,v108.text);else renderer.text((x-v130) + 8 ,v125 + 3 ,225,225,225,v127,"",0,v108.text);renderer.texture(v2,(x-v130) -12 ,v125 + 3 ,14,14,255,255,255,v126,"");end y=y + 25 ;if ((v108.timer + 4)<globals.realtime()) then table.remove(v3,v107);end end end;v0:add_to_log("welcome back, "..username);client.set_event_callback("paint_ui",function() v0:logs();end);
-- local variables for API functions. any changes to the line below will be lost on re-generation
local client_camera_angles, client_create_interface, client_eye_position, client_set_event_callback, client_userid_to_entindex, entity_get_local_player, entity_get_player_name, entity_get_prop, entity_is_alive, globals_chokedcommands, globals_realtime, globals_tickcount, globals_tickinterval, math_abs, math_ceil, math_floor, string_format, string_lower, table_concat, table_insert, ui_new_checkbox, ui_reference, error, pairs, plist_get, ui_get, print, ui_set_callback = client.camera_angles, client.create_interface, client.eye_position, client.set_event_callback, client.userid_to_entindex, entity.get_local_player, entity.get_player_name, entity.get_prop, entity.is_alive, globals.chokedcommands, globals.realtime, globals.tickcount, globals.tickinterval, math.abs, math.ceil, math.floor, string.format, string.lower, table.concat, table.insert, ui.new_checkbox, ui.reference, error, pairs, plist.get, ui.get, print, ui.set_callback
local ffi = require 'ffi'
local vector = require 'vector'
local inspect = require 'gamesense/inspect'
local antiaim_funcs = require 'gamesense/antiaim_funcs'

local ffi_typeof, ffi_cast = ffi.typeof, ffi.cast

local num_format = function(b) local c=b%10;if c==1 and b~=11 then return b..'st'elseif c==2 and b~=12 then return b..'nd'elseif c==3 and b~=13 then return b..'rd'else return b..'th'end end

local ffi = require("ffi")
local clipboard = require("gamesense/clipboard") 

-- kinda old release
-- decided to post it on github since im planning to rework the entire thing

local g_esp_data = { }
local g_sim_ticks, g_net_data = { }, { }

local globals_tickinterval = globals.tickinterval
local entity_is_enemy = entity.is_enemy
local entity_get_prop = entity.get_prop
local entity_is_dormant = entity.is_dormant
local entity_is_alive = entity.is_alive
local entity_get_origin = entity.get_origin
local entity_get_local_player = entity.get_local_player
local entity_get_player_resource = entity.get_player_resource
local entity_get_bounding_box = entity.get_bounding_box
local entity_get_player_name = entity.get_player_name
local renderer_text = renderer.text
local w2s = renderer.world_to_screen
local line = renderer.line
local table_insert = table.insert
local client_trace_line = client.trace_line
local math_floor = math.floor
local globals_frametime = globals.frametime

local sv_gravity = cvar.sv_gravity
local sv_jump_impulse = cvar.sv_jump_impulse

local time_to_ticks = function(t) return math_floor(0.5 + (t / globals_tickinterval())) end
local vec_substract = function(a, b) return { a[1] - b[1], a[2] - b[2], a[3] - b[3] } end
local vec_add = function(a, b) return { a[1] + b[1], a[2] + b[2], a[3] + b[3] } end
local vec_lenght = function(x, y) return (x * x + y * y) end

local get_entities = function(enemy_only, alive_only)
    local enemy_only = enemy_only ~= nil and enemy_only or false
    local alive_only = alive_only ~= nil and alive_only or true
    
    local result = {}

    local me = entity_get_local_player()
    local player_resource = entity_get_player_resource()
    
    for player = 1, globals.maxplayers() do
        local is_enemy, is_alive = true, true
        
        if enemy_only and not entity_is_enemy(player) then is_enemy = false end
        if is_enemy then
            if alive_only and entity_get_prop(player_resource, 'm_bAlive', player) ~= 1 then is_alive = false end
            if is_alive then table_insert(result, player) end
        end
    end

    return result
end

local extrapolate = function(ent, origin, flags, ticks)
    local tickinterval = globals_tickinterval()

    local sv_gravity = sv_gravity:get_float() * tickinterval
    local sv_jump_impulse = sv_jump_impulse:get_float() * tickinterval

    local p_origin, prev_origin = origin, origin

    local velocity = { entity_get_prop(ent, 'm_vecVelocity') }
    local gravity = velocity[3] > 0 and -sv_gravity or sv_jump_impulse

    for i=1, ticks do
        prev_origin = p_origin
        p_origin = {
            p_origin[1] + (velocity[1] * tickinterval),
            p_origin[2] + (velocity[2] * tickinterval),
            p_origin[3] + (velocity[3]+gravity) * tickinterval,
        }

        local fraction = client_trace_line(-1, 
            prev_origin[1], prev_origin[2], prev_origin[3], 
            p_origin[1], p_origin[2], p_origin[3]
        )

        if fraction <= 0.99 then
            return prev_origin
        end
    end

    return p_origin
end

function g_net_update()
    local me = entity_get_local_player()
    local players = get_entities(true, true)

    for i=1, #players do
        local idx = players[i]
        local prev_tick = g_sim_ticks[idx]
        
        if entity_is_dormant(idx) or not entity_is_alive(idx) then
            g_sim_ticks[idx] = nil
            g_net_data[idx] = nil
            g_esp_data[idx] = nil
        else
            local player_origin = { entity_get_origin(idx) }
            local simulation_time = time_to_ticks(entity_get_prop(idx, 'm_flSimulationTime'))
    
            if prev_tick ~= nil then
                local delta = simulation_time - prev_tick.tick

                if delta < 0 or delta > 0 and delta <= 64 then
                    local m_fFlags = entity_get_prop(idx, 'm_fFlags')

                    local diff_origin = vec_substract(player_origin, prev_tick.origin)
                    local teleport_distance = vec_lenght(diff_origin[1], diff_origin[2])

                    local extrapolated = extrapolate(idx, player_origin, m_fFlags, delta-1)
    
                    if delta < 0 then
                        g_esp_data[idx] = 1
                    end

                    g_net_data[idx] = {
                        tick = delta-1,

                        origin = player_origin,
                        predicted_origin = extrapolated,

                        tickbase = delta < 0,
                        lagcomp = teleport_distance > 4096,
                    }
                end
            end
    
            if g_esp_data[idx] == nil then
                g_esp_data[idx] = 0
            end

            g_sim_ticks[idx] = {
                tick = simulation_time,
                origin = player_origin,
            }
        end
    end
end

function g_paint_handler()
    local me = entity_get_local_player()
    local player_resource = entity_get_player_resource()

    if not me or not entity_is_alive(me) then
        return
    end

    local observer_mode = entity_get_prop(me, "m_iObserverMode")
    local active_players = {}

    if (observer_mode == 0 or observer_mode == 1 or observer_mode == 2 or observer_mode == 6) then
        active_players = get_entities(true, true)
    elseif (observer_mode == 4 or observer_mode == 5) then
        local all_players = get_entities(false, true)
        local observer_target = entity_get_prop(me, "m_hObserverTarget")
        local observer_target_team = entity_get_prop(observer_target, "m_iTeamNum")

        for test_player = 1, #all_players do
            if (
                observer_target_team ~= entity_get_prop(all_players[test_player], "m_iTeamNum") and
                all_players[test_player ] ~= me
            ) then
                table_insert(active_players, all_players[test_player])
            end
        end
    end

    if #active_players == 0 then
        return
    end

    for idx, net_data in pairs(g_net_data) do
        if entity_is_alive(idx) and entity_is_enemy(idx) and net_data ~= nil then
            if net_data.lagcomp then
                local predicted_pos = net_data.predicted_origin

                local min = vec_add({ entity_get_prop(idx, 'm_vecMins') }, predicted_pos)
                local max = vec_add({ entity_get_prop(idx, 'm_vecMaxs') }, predicted_pos)

                local points = {
                    {min[1], min[2], min[3]}, {min[1], max[2], min[3]},
                    {max[1], max[2], min[3]}, {max[1], min[2], min[3]},
                    {min[1], min[2], max[3]}, {min[1], max[2], max[3]},
                    {max[1], max[2], max[3]}, {max[1], min[2], max[3]},
                }

                local edges = {
                    {0, 1}, {1, 2}, {2, 3}, {3, 0}, {5, 6}, {6, 7}, {1, 4}, {4, 8},
                    {0, 4}, {1, 5}, {2, 6}, {3, 7}, {5, 8}, {7, 8}, {3, 4}
                }

                for i = 1, #edges do
                    if i == 1 then
                        local origin = { entity_get_origin(idx) }
                        local origin_w2s = { w2s(origin[1], origin[2], origin[3]) }
                        local min_w2s = { w2s(min[1], min[2], min[3]) }

                        if origin_w2s[1] ~= nil and min_w2s[1] ~= nil then
                            line(origin_w2s[1], origin_w2s[2], min_w2s[1], min_w2s[2], 255, 255, 255, 255)
                        end
                    end

                    if points[edges[i][1]] ~= nil and points[edges[i][2]] ~= nil then
                        local p1 = { w2s(points[edges[i][1]][1], points[edges[i][1]][2], points[edges[i][1]][3]) }
                        local p2 = { w2s(points[edges[i][2]][1], points[edges[i][2]][2], points[edges[i][2]][3]) }
            
                        line(p1[1], p1[2], p2[1], p2[2], 255, 255, 255, 255)
                    end
                end
            end

            local text = {
                [0] = '', [1] = 'DELAY MANIPULATOR',
                [2] = 'TICKBASE ADJUSTMENT'
            }

            local x1, y1, x2, y2, a = entity_get_bounding_box(idx)
            local palpha = 0

            if g_esp_data[idx] > 0 then
                g_esp_data[idx] = g_esp_data[idx] - globals_frametime()*2
                g_esp_data[idx] = g_esp_data[idx] < 0 and 0 or g_esp_data[idx]

                palpha = g_esp_data[idx]
            end

            local tb = net_data.tickbase or g_esp_data[idx] > 0
            local lc = net_data.lagcomp

            if not tb or net_data.lagcomp then
                palpha = a
            end

            if x1 ~= nil and a > 0 then
                local name = entity_get_player_name(idx)
                local y_add = name == '' and -8 or 0

                renderer_text(x1 + (x2-x1)/2, y1 - 18 + y_add, 255, 45, 45, palpha*255, 'c', 0, text[tb and 2 or (lc and 1 or 0)])
            end
        end
    end
end

client.set_event_callback('paint', g_paint_handler)
client.set_event_callback('net_update_end', g_net_update)

function Clamp(value, min, max) return math.min(math.max(value, min), max) end

function NormalizeAngle(angle)
    if angle == nil then return 0 end
    while angle > 180 do angle = angle - 360 end
    while angle < -180 do angle = angle + 360 end
    return angle
end
function AngleDifference(dest_angle, src_angle)
    local delta = math.fmod(dest_angle - src_angle, 360)
    if dest_angle > src_angle then
        if delta >= 180 then delta = delta - 360 end
    else
        if delta <= -180 then delta = delta + 360 end
    end
    return delta
end

function DegToRad(Deg) return Deg * (math.pi / 180) end
function RadToDeg(Rad) return Rad * (180 / math.pi) end

local VTable = {
    Entry = function(instance, index, type) return ffi.cast(type, (ffi.cast("void***", instance)[0])[index]) end,
    Bind = function(self, module, interface, index, typestring)
        local instance = client.create_interface(module, interface)
        local fnptr = self.Entry(instance, index, ffi.typeof(typestring))
        return function(...) return fnptr(instance, ...) end
    end
}


local menu_color = ui.reference("MISC", "Settings", "Menu color")

client.set_event_callback("paint", function()
    local r, g, b, a = ui.get(menu_color)
end)

local animstate_t = ffi.typeof 'struct { char pad0[0x18]; float anim_update_timer; char pad1[0xC]; float started_moving_time; float last_move_time; char pad2[0x10]; float last_lby_time; char pad3[0x8]; float run_amount; char pad4[0x10]; void* entity; void* active_weapon; void* last_active_weapon; float last_client_side_animation_update_time; int  last_client_side_animation_update_framecount; float eye_timer; float eye_angles_y; float eye_angles_x; float goal_feet_yaw; float current_feet_yaw; float torso_yaw; float last_move_yaw; float lean_amount; char pad5[0x4]; float feet_cycle; float feet_yaw_rate; char pad6[0x4]; float duck_amount; float landing_duck_amount; char pad7[0x4]; float current_origin[3]; float last_origin[3]; float velocity_x; float velocity_y; char pad8[0x4]; float unknown_float1; char pad9[0x8]; float unknown_float2; float unknown_float3; float unknown; float m_velocity; float jump_fall_velocity; float clamped_velocity; float feet_speed_forwards_or_sideways; float feet_speed_unknown_forwards_or_sideways; float last_time_started_moving; float last_time_stopped_moving; bool on_ground; bool hit_in_ground_animation; char pad10[0x4]; float time_since_in_air; float last_origin_z; float head_from_ground_distance_standing; float stop_to_full_running_fraction; char pad11[0x4]; float magic_fraction; char pad12[0x3C]; float world_force; char pad13[0x1CA]; float min_yaw; float max_yaw; } **'
local NativeGetClientEntity = VTable:Bind("client.dll", "VClientEntityList003", 3, "void*(__thiscall*)(void*, int)")
-- ui.new_label("Rage", "Other", "                     \a870946FFRage Features")
-- ui.new_label("Rage", "Other", "--------------------------------------------------")
local resolver_enabled = ui.new_checkbox("LUA", "A", string.format(" Enable \a%02X%02X%02XFF~ Synapse Logic Resolver", ui.get(menu_color)))
local multibox = ui.new_multiselect("LUA", "A", " Auto force body aim if", {"hp lower than x value"})
local health = ui.new_slider("LUA", "A", "hp", 0, 100, 0, true)
local multibox2 = ui.new_multiselect("LUA", "A", " Auto force safepoint if", {"hp lower than x value", "after x misses"})
local health2 = ui.new_slider("LUA", "A", "hp 1", 0, 100, 0, true)
local missed = ui.new_slider("LUA", "A", "missed", 0, 10, 0, true)
local master_switch = ui_new_checkbox('LUA', "A", string.format('Enable \a%02X%02X%02XFF~ Aim-logs', ui.get(menu_color)))
local prefer_safe_point = ui_reference('RAGE', 'Aimbot', 'Prefer safe point')
local force_safe_point = ui_reference('RAGE', 'Aimbot', 'Force safe point')
local inds = ui.new_checkbox('LUA', "A", string.format('Enable \a%02X%02X%02XFF~ Feature indicator', ui.get(menu_color)))
local color = ui.new_color_picker("LUA", "A", "debug color", 255,255,255)
local aimproove = ui.new_checkbox('LUA', "A", string.format('Enable \a%02X%02X%02XFF~ Debug', ui.get(menu_color)))
local force_delay_shot = ui.new_hotkey("LUA", "A", string.format('Enable \a%02X%02X%02XFF~ Delay shot', ui.get(menu_color)))
local default_set = ui.new_button("LUA", "A", "Default Data", function() end)
local hotfix = ui.new_button('LUA', "A", "Repair rage precision", function() end)
local reset = ui.new_button("LUA", "A", "Full \vreset", function() end)



-- ui.new_label("Rage", "Other", "--------------------------------------------------")
rgba_to_hex = function(b,c,d,e)
        return string.format('%02x%02x%02x%02x',b,c,d,e)
    end
ui.set_visible(missed, false)
ui.set_visible(health, false)
ui.set_visible(health2, false)
function updateMultiboxVisibility()
    if ui.get(resolver_enabled) == true then
        ui.set_visible(multibox, true)
        ui.set_visible(reset, true)
        ui.set_visible(multibox2, true)
        ui.set_visible(master_switch, true)
        ui.set_visible(color, true)
        ui.set_visible(aimproove, true)
        ui.set_visible(inds, true)
        ui.set_visible(force_delay_shot, true)
        ui.set_visible(default_set, true)
        ui.set_visible(hotfix, true)
    else
        ui.set_visible(multibox, false)
        ui.set_visible(reset, false)
        ui.set_visible(multibox2, false)
        ui.set_visible(master_switch, false)
        ui.set_visible(color, false)
        ui.set_visible(aimproove, false)
        ui.set_visible(inds, false)
        ui.set_visible(force_delay_shot, false)
        ui.set_visible(default_set, false)
        ui.set_visible(hotfix, false)
    end 
end

--ui disabled = 
--ui.set_enabled(aimproove, false)
--ui.set_enabled(predict_command, false)
--ui disabled end

ui.set_callback(default_set, function()
    ui.set(aimproove, true)
    ui.set(color, 152, 150, 251, 255)
    ui.set(multibox, {"hp lower than x value"})
    ui.set(multibox2, {"hp lower than x value", "after x misses"})
    ui.set(health, 35)
    ui.set(health2, 52)
    ui.set(missed, 1)
    client.color_log(152,150,251, "[synapse] default settings have been loaded !")
    v0:add_to_log("\affe2f3ff[synapse] \affffffffyou have loaded the default settings")
end)

ui.set_callback(reset, function()
    ui.set(health, 0)
    ui.set(health2, 0)
    ui.set(missed, 0)
    client.color_log(152,150,251, "[synapse] reset successfully !")
    v0:add_to_log("\affe2f3ff[synapse] \affffffffreset successfully")
end)

function updateSliderVisibility()
    local selected_items = ui.get(multibox)
    local show_health = false
    local enabled = ui.get(resolver_enabled) == true

    if selected_items then
        for _, item in ipairs(selected_items) do
            if item == "hp lower than x value" and enabled then
                show_health = true
                break
            end
        end
    end
    ui.set_visible(health, show_health)
end
function updateSliderVisibility2()
    local selected_items2 = ui.get(multibox2)
    local show_missed = false
    local enabled = ui.get(resolver_enabled) == true

    if selected_items2 then
        for _, item in ipairs(selected_items2) do
            if item == "after x misses" and enabled then
                show_missed = true
                break
            end
        end
    end
    ui.set_visible(missed, show_missed)
end

function updateSliderVisibility3()
    local selected_items3 = ui.get(multibox2)
    local enabled = ui.get(resolver_enabled) == true
    local show_health2 = false
    if selected_items3 then
        for _, item in ipairs(selected_items3) do
            if item == "hp lower than x value" and enabled then
                show_health2 = true
                break
            end
        end
    end
    ui.set_visible(health2, show_health2)
end

local GetAnimState = function(ent)
    if not ent then return false end
    local Address = type(ent) == "cdata" and ent or NativeGetClientEntity(ent)
    if not Address or Address == ffi.NULL then return false end
    local AddressVtable = ffi.cast("void***", Address)
    return ffi.cast(animstate_t, ffi.cast("char*", AddressVtable) + 0x9960)[0]
end

local GetSimulationTime = function(ent)
    local pointer = NativeGetClientEntity(ent)
    if pointer then return entity.get_prop(ent, "m_flSimulationTime"), ffi.cast("float*", ffi.cast("uintptr_t", pointer) + 0x26C)[0] else return 0 end
end

local GetMaxDesync = function(player)
    local Animstate = GetAnimState(player)
    if not Animstate then return 0 end
    local speedfactor = Clamp(Animstate.feet_speed_forwards_or_sideways, 0, 1)
    local avg_speedfactor = (Animstate.stop_to_full_running_fraction * -0.3 - 0.2) * speedfactor + 1
    local duck_amount = Animstate.duck_amount
    if duck_amount > 0 then avg_speedfactor = avg_speedfactor + ((duck_amount * speedfactor) * (0.5 - avg_speedfactor)) end
    return Clamp(avg_speedfactor, .5, 1)
end

local IsPlayerAnimating = function(player)
    local CurrentSimulationTime, RecordSimulationTime = GetSimulationTime(player)
    CurrentSimulationTime, RecordSimulationTime = toticks(CurrentSimulationTime), toticks(RecordSimulationTime)
    return toticks(CurrentSimulationTime) ~= nil and toticks(RecordSimulationTime) ~= nil
end

local GetChokedPackets = function(player)
    if not IsPlayerAnimating(player) then return 0 end
    local CurrentSimulationTime, PreviousSimulationTime = GetSimulationTime(player)
    local SimulationTimeDifference = globals.curtime() - CurrentSimulationTime
    local ChokedCommands = Clamp(toticks(math.max(0.0, SimulationTimeDifference - client.latency())), 0, cvar.sv_maxusrcmdprocessticks:get_string() - 2)
    return ChokedCommands
end

function RebuildServerYaw(player)
    local Animstate = GetAnimState(player)
    if not Animstate then return 0 end
    
    local m_flGoalFeetYaw = Animstate.goal_feet_yaw
    local eye_feet_delta = AngleDifference(Animstate.eye_angles_y, Animstate.goal_feet_yaw)
    local flRunningSpeed = Clamp(Animstate.feet_speed_forwards_or_sideways, 0.0, 1.0)
    
    local flYawModifier = (((Animstate.stop_to_full_running_fraction * -0.3) - 0.2) * flRunningSpeed) + 1.0
    if Animstate.duck_amount > 0.0 then
        local flDuckingSpeed = Clamp(Animstate.feet_speed_forwards_or_sideways, 0.0, 1.0)
        flYawModifier = flYawModifier + ((Animstate.duck_amount * flDuckingSpeed) * (0.5 - flYawModifier))
    end
   
    local flMaxYawModifier = flYawModifier * Animstate.max_yaw
    local flMinYawModifier = flYawModifier * Animstate.min_yaw
   
    if eye_feet_delta <= flMaxYawModifier then
        if flMinYawModifier > eye_feet_delta then
            m_flGoalFeetYaw = math.abs(flMinYawModifier) + Animstate.eye_angles_y
        end
    else
        m_flGoalFeetYaw = Animstate.eye_angles_y - math.abs(flMaxYawModifier)
    end

    return NormalizeAngle(m_flGoalFeetYaw)
end

-- Получаем ссылку на оригинальную настройку Delay shot
local rage_delay_shot = ui.reference("RAGE", "Other", "Delay shot")

-- Создаем функцию-обработчик для force_delay_shot
function handle_force_delay_shot()
    if ui.get(force_delay_shot) then
        -- Если хоткей активирован, включаем Delay shot
        ui.set(rage_delay_shot, true)
        renderer.indicator(255,255,255,200, "", "MAGIC KEY: ON")
    else
        -- Если хоткей деактивирован, выключаем Delay shot
        ui.set(rage_delay_shot, false)
    end
end

-- Устанавливаем callback на изменение состояния force_delay_shot
ui.set_callback(force_delay_shot, function()
    handle_force_delay_shot()
end)

-- Добавляем проверку при каждом кадре интерфейса
client.set_event_callback("paint_ui", function()
    handle_force_delay_shot()
end)

--акураси
local accuracy_boost_ref = ui.reference("RAGE", "Other", "Accuracy boost")

ui.set_callback(hotfix, function()
    local current_value = ui.get(accuracy_boost_ref)
    
    if type(current_value) == "string" then
        -- Если значение строковое, устанавливаем "Maximum"
        ui.set(accuracy_boost_ref, "Maximum")
    elseif type(current_value) == "number" then
        -- Если значение числовое, устанавливаем 4 (предполагая, что это максимальное значение)
        ui.set(accuracy_boost_ref, 4)
    end
end)
--акураси енд

local JitterBuffer = 6
local Resolver = { 
    Jitter = { Jittering = false, JitterTicks = 0, StaticTicks = 0, YawCache = {}, JitterCache = 0, Difference = 0 },
    Main = { Mode = 0, Side = 0, Angles = 0 }
}

local Cache = {}

local CDetectJitter = function(player)
    local Data = Resolver.Jitter
    local EyeAnglesY = entity.get_prop(player, "m_angEyeAngles")
    Data.YawCache[Data.JitterCache % JitterBuffer] = EyeAnglesY
    if Data.JitterCache >= JitterBuffer + 1 then
        Data.JitterCache = 0
    else
        Data.JitterCache = Data.JitterCache + 1
    end
    for i = 0, JitterBuffer, 1 do
        if i < JitterBuffer then
            local Difference = (Data.YawCache[i - Data.JitterCache % JitterBuffer] ~= nil and Data.YawCache[Data.JitterCache % JitterBuffer] ~= nil) and math.abs(Data.YawCache[i - Data.JitterCache % JitterBuffer] - Data.YawCache[Data.JitterCache % JitterBuffer]) or 0
            if Difference ~= nil and Difference ~= 0.0 then
                NormalizeAngle(Difference)
                Data.Jittering = Difference >= (45.0 * GetMaxDesync(player)) and true or false
                Data.Difference = Difference
            end
        end
    end
end

local CProcessImpact = function(player) return Resolver.Jitter.Jittering and 1 or 0 end


local CDetectDesyncSide = function(player)
    local Animstate = GetAnimState(player)
    if not Animstate then return 0 end

    if Resolver.Jitter.Jittering and GetChokedPackets(player) < 3 then
        Cache.FirstNormalizedAngle = NormalizeAngle(Resolver.Jitter.YawCache[JitterBuffer - 1])
        Cache.SecondNormalizedAngle = NormalizeAngle(Resolver.Jitter.YawCache[JitterBuffer - 2])

        Cache.FirstSinAngle = math.sin(DegToRad(Cache.FirstNormalizedAngle))
        Cache.SecondSinAngle = math.sin(DegToRad(Cache.SecondNormalizedAngle))

        Cache.FirstCosAngle = math.cos(DegToRad(Cache.FirstNormalizedAngle))
        Cache.SecondCosAngle = math.cos(DegToRad(Cache.SecondNormalizedAngle))

        Cache.AVGYaw = NormalizeAngle(RadToDeg(math.atan2((Cache.FirstSinAngle + Cache.SecondSinAngle) / 2.0, (Cache.FirstCosAngle + Cache.SecondCosAngle) / 2.0)))
        Cache.Difference = NormalizeAngle(Animstate.eye_angles_y - Cache.AVGYaw)
        if Cache.Difference ~= 0.0 then Resolver.Main.Side = Cache.Difference > 0.0 and 1 or -1 else Resolver.Main.Side = 0 end
    end

    return Resolver.Main.Side
end

-- drag_water = (function()
--     local a = {}
--     local b, c, d, e, f, g, h, i, j, k, l, m, n, o

--     local p = {
--         __index = {
--             drag = function(self, ...)
--                 local q, r = self:get()
--                 local s, t = a.drag(q, r, ...)
--                 if q ~= s or r ~= t then
--                     self:set(s, t)
--                 end
--                 return s, t
--             end,
--             set = function(self, q, r)
--                 local j, k = client.screen_size()
--                 ui.set(self.x_reference, q / j * self.res)
--                 ui.set(self.y_reference, r / k * self.res)
--             end,
--             get = function(self)
--                 local j, k = client.screen_size()
--                 return ui.get(self.x_reference) / self.res * j, ui.get(self.y_reference) / self.res * k
--             end
--         }
--     }

--     function a.new(u, v, w, x)
--         x = x or 10000
--         local j, k = client.screen_size()
--         local y = ui.new_slider('LUA', 'A', u .. ' window position', 0, x, v / j * x)
--         local z = ui.new_slider('LUA', 'A', '\n' .. u .. ' window position y', 0, x, w / k * x)
--         ui.set_visible(y, false)
--         ui.set_visible(z, false)
--         return setmetatable({ name = u, x_reference = y, y_reference = z, res = x }, p)
--     end

--     function a.drag(q, r, A, B, C, D, E)
--         if globals.framecount() ~= b then
--             c = ui.is_menu_open()
--             f, g = d, e
--             d, e = ui.mouse_position()
--             i = h
--             h = client.key_state(0x01) == true
--             m = l
--             l = {}
--             o = n
--             n = false
--             j, k = client.screen_size()
--         end

--         if c and i ~= nil then
--             if (not i or o) and h and f > q and g > r and f < q + A and g < r + B then
--                 n = true
--                 q, r = q + d - f, r + e - g
--                 if not D then
--                     q = math.max(0, math.min(j - A, q))
--                     r = math.max(0, math.min(k - B, r))
--                 end
--             end
--         end

--         table.insert(l, { q, r, A, B })
--         return q, r, A, B
--     end

--     return a
-- end)()

-- local sX, sY = client.screen_size()
-- --1000 500 

-- wt = drag_water.new("Time", sX - 100, (sY / 2) - (sY / 2), sX, sY)


-- client.set_event_callback('paint_ui', function()
    
--     if ui.get(resolver_enabled) == true then
--     local funcs = {
--     rgba_to_hex = function(b,c,d,e)
--         return string.format('%02x%02x%02x%02x',b,c,d,e)
--     end
--     }
--     local x, y = wt:get()
--     wt:drag(300, 20)

--     local discord = "rinnegan"
--     renderer.text(x, y, 255, 255, 255, 255, "", 0, "discord.gg/\a"..funcs.rgba_to_hex(255,255,255,240 * math.abs(math.cos(globals.curtime()*2)))..discord)
--     renderer.text(x, y + 10, 255, 255, 255, 255, "", 0, "username - "..username)

--     end 
-- end)




local miss_count = 0

function resetResolverData()
    Resolver.Jitter.Jittering = false
    Resolver.Jitter.JitterTicks = 0
    Resolver.Jitter.StaticTicks = 0
    Resolver.Jitter.YawCache = {}
    Resolver.Jitter.JitterCache = 0
    Resolver.Jitter.Difference = 0
    Resolver.Main.Mode = 0
    Resolver.Main.Angles = 0
    miss_count = 0
end

function aim_miss(player)
    miss_count = miss_count + 1 
end

client.set_event_callback("aim_miss", aim_miss)


function is_baimable(player)
    local lethal = entity.get_prop(player, "m_iHealth")
    local number_lethal = ui.get(health)  
    local selected_items = ui.get(multibox)
    local selected_items2 = ui.get(multibox2)

    if selected_items then
        for _, item in ipairs(selected_items) do
            if item == "hp lower than x value" then
                if lethal > 0 then
                    if lethal <= number_lethal then 
                        plist.set(player, "Override prefer body aim", "Force")
                    else
                        plist.set(player, "Override prefer body aim", "-")
                    end
                end
            end
        end
    end

    local missed_number = ui.get(missed)
    local number_lethal2 = ui.get(health2)
    if selected_items2 then
        for _, item2 in ipairs(selected_items2) do 
            if item2 == "hp lower than x value" then 
                if lethal > 0 then
                    if lethal <= number_lethal2 then
                        plist.set(player, "Override safe point", "On")
                    else
                        plist.set(player, "Override safe point", "-")
                    end
                end
            end          
        end    
    end
    if selected_items2 then
        for _, item2 in ipairs(selected_items2) do 
            if item2 == "after x misses" then 
                if miss_count >= missed_number and lethal > 0 then
                    plist.set(player, "Override safe point", "On")
                else
                    plist.set(player, "Override safe point", "-")
                end          
            end    
        end
    end
end

client.set_event_callback("player_death", function (player)
    miss_count = 0
end)



local CResolverInstance = function(player)
    local Animstate = GetAnimState(player)
    if not Animstate then return end

    CProcessImpact(player)
    CDetectJitter(player)
    CDetectDesyncSide(player)

    local ChokedPackets = GetChokedPackets(player)
    local Desync = math.abs(NormalizeAngle(Animstate.eye_angles_y - Animstate.torso_yaw))
    local Velocity = entity.get_prop(player, "m_vecVelocity[0]")
    local IsDucking = Animstate.duck_amount > 0.1
    local IsFakeWalking = math.abs(AngleDifference(Animstate.eye_angles_y, Animstate.last_move_yaw)) < 5 and Velocity > 10

    if ChokedPackets > 2 then
        Resolver.Main.Angles = 0
        Resolver.Main.Mode = 0
    elseif Desync >= 40 and Velocity > 150 then
        Resolver.Main.Angles = NormalizeAngle(Animstate.torso_yaw - Animstate.eye_angles_y)
        Resolver.Main.Mode = 1
    elseif Desync > 20 and IsDucking then
        Resolver.Main.Angles = NormalizeAngle(Animstate.torso_yaw - Animstate.eye_angles_y)
        Resolver.Main.Mode = 1
    elseif IsFakeWalking then
        Resolver.Main.Angles = 0
        Resolver.Main.Mode = 1
    else
        if Resolver.Jitter.Jittering then

            Resolver.Main.Angles = Cache.Difference ~= nil and (Cache.Difference * GetMaxDesync(player)) * Resolver.Main.Side or (45.0 * GetMaxDesync(player)) * Resolver.Main.Side
            Resolver.Main.Mode = 1
        else
            Resolver.Main.Angles = 0
            Resolver.Main.Mode = 0
        end
    end
end




client.set_event_callback("net_update_end", function()
    local local_player = entity.get_local_player()
    if not local_player or not entity.is_alive(local_player) then 
        Resolver.Main.Mode = 0 
        return 
    end
    local Players = entity.get_players()
    client.update_player_list()
    for _, idx in ipairs(Players) do
        if entity.is_enemy(idx) and IsPlayerAnimating(idx) and ui.get(resolver_enabled) then
            CResolverInstance(idx)       
            plist.set(idx, "Force body yaw value", Resolver.Main.Mode ~= 0 and Resolver.Main.Angles or 0 )
            plist.set(idx, "Force body yaw", Resolver.Main.Mode ~= 0)
        else
            plist.set(idx, "Force body yaw", false)
        end
            is_baimable(idx)    
        plist.set(idx, "Correction active", true)
    end
end)

client.set_event_callback("round_start", function()
    resetResolverData()
end)


client.register_esp_flag("BD", 200, 200, 200, function(e) return (entity.is_enemy(e) and ui.get(resolver_enabled) and Resolver.Main.Mode == 1) and true or false end)
client.register_esp_flag("BAIM", 161, 73, 47, function(player) return plist.get(player, "Override prefer body aim") == "Force" end)
client.register_esp_flag("SAFE", 131, 153, 50, function(player) return plist.get(player, "Override safe point") == "On" end)

updateMultiboxVisibility()

ui.set_callback(resolver_enabled, function ()
    updateMultiboxVisibility()
    updateSliderVisibility3()
    updateSliderVisibility2()
    updateSliderVisibility()
end)
ui.set_callback(multibox, function ()
    updateSliderVisibility()
end)
ui.set_callback(multibox2, function ()
    updateSliderVisibility2()
    updateSliderVisibility3() 
end)

client.set_event_callback("paint", function()
    rgba_to_hex = function(c,d,e,f)
        return string.format('%02x%02x%02x%02x',c,d,e,f)
    end
if ui.get(inds) == true then
    local r,g,b,a = ui.get(color)
    renderer.indicator(143, 194, 21, 200, "\a"..rgba_to_hex(r,g,b,a * math.abs(math.cos(globals.curtime()*1))).."SYNAPSE")
end

    rgba_to_hex = function(c,d,e,f)
        return string.format('%02x%02x%02x%02x',c,d,e,f)
    end

if ui.get(aimproove) then
    local entity_get_prop, entity_get_local_player, entity_is_alive, entity_get_player_weapon, entity_get_classname, entity_get_origin, globals_frametime, client_screen_size, globals_framecount, is_menu_open, menu_mouse_position, client_key_state, table_insert, entity_get_steam64, render_circle_outline, entity_get_all, globals_tickinterval, client_set_clantag = entity.get_prop, entity.get_local_player, entity.is_alive, entity.get_player_weapon, entity.get_classname, entity.get_origin, globals.frametime, client.screen_size, globals.framecount, ui.is_menu_open, ui.mouse_position, client.key_state, table.insert, entity.get_steam64, renderer.circle_outline, entity.get_all, globals.tickinterval, client.set_clan_tag
    name = entity.get_player_name(threat)
    local threat = client.current_threat()
    if threat then
    name = entity.get_player_name(threat)
    threat_desync = math.floor(entity.get_prop(threat, 'm_flPoseParameter', 11) * 120 - 60)
    end
    if threat ~= nil then
    local eyepos = vector(client.eye_position())
    local origin = vector(entity_get_origin(threat))
    local target = origin + vector(0, 0, 40)
    end
    local lp = entity.get_local_player()
    local r,g,b,a = ui.get(color)
    if lp == nil then return end
    local desync_amount = math.floor(entity.get_prop(lp, 'm_flPoseParameter', 11) * 120 - 60)
    renderer.indicator(255, 255, 255, 200, "", "Target: "..name or name == nil and "?") 
    renderer.indicator(255, 255, 255, 200, "","Shifting Tickbase: "..antiaim_funcs.get_tickbase_shifting())
    renderer.indicator(255,255,255,200, "", "Self Desync: "..math.abs(desync_amount))
end
end)

--     local ss = {client.screen_size()}
--             ss = {
--                 x = ss[1],
--                 y = ss[2]
--             }


-- function rgba_to_hex(b,c,d,e)
--     return string.format('%02x%02x%02x%02x',b,c,d,e)
-- end

-- function gradient_text(text, speed, r,g,b,a)
--     local final_text = ''
--     local curtime = globals.curtime()
--     local center = math.floor(#text / 1) + 1  -- calculate the center of the text
--     for i=1, #text do
--         -- calculate the distance from the center character
--         local distance = math.abs(i - center)
--         -- calculate the alpha based on the distance and the speed and time
--         a = 255 - math.abs(255 * math.cos(speed * curtime / 4 + distance * 4 / 100))
--         local col = rgba_to_hex(159,131,187,a)
--         final_text = final_text .. '\a' .. col .. text:sub(i, i)
--     end
--     return final_text
-- end

-- client.set_event_callback("paint", function()
--     rgba_to_hex = function(b,c,d,e)
--         return string.format('%02x%02x%02x%02x',b,c,d,e)
--     end
--     renderer.text(ss.x / 2.3, ss.y / 2 * 1.97, 0,0,0,0, "A", 0, gradient_text("When a man learns to love, he must bear the risk of hatred.", 10, r,g,130,255))
-- end)



local hitgroup_names = { 'generic', 'head', 'chest', 'stomach', 'left arm', 'right arm', 'left leg', 'right leg', 'neck', '?', 'gear' }
local weapon_to_verb = { knife = 'Knifed', hegrenade = 'Naded', inferno = 'Burned' }

local classes = {
    net_channel = function()
        local this = { }

        local class_ptr = ffi_typeof('void***')
        local engine_client = ffi_cast(class_ptr, client_create_interface("engine.dll", "VEngineClient014"))
        local get_channel = ffi_cast("void*(__thiscall*)(void*)", engine_client[0][78])

        local netc_bool = ffi_typeof("bool(__thiscall*)(void*)")
        local netc_bool2 = ffi_typeof("bool(__thiscall*)(void*, int, int)")
        local netc_float = ffi_typeof("float(__thiscall*)(void*, int)")
        local netc_int = ffi_typeof("int(__thiscall*)(void*, int)")
        local net_fr_to = ffi_typeof("void(__thiscall*)(void*, float*, float*, float*)")

        client_set_event_callback('net_update_start', function()
            local ncu_info = ffi_cast(class_ptr, get_channel(engine_client)) or error("net_channel:update:info is nil")
            local seqNr_out = ffi_cast(netc_int, ncu_info[0][17])(ncu_info, 1)
        
            for name, value in pairs({
                seqNr_out = seqNr_out,
        
                is_loopback = ffi_cast(netc_bool, ncu_info[0][6])(ncu_info),
                is_timing_out = ffi_cast(netc_bool, ncu_info[0][7])(ncu_info),
        
                latency = {
                    crn = function(flow) return ffi_cast(netc_float, ncu_info[0][9])(ncu_info, flow) end,
                    average = function(flow) return ffi_cast(netc_float, ncu_info[0][10])(ncu_info, flow) end,
                },
        
                loss = ffi_cast(netc_float, ncu_info[0][11])(ncu_info, 1),
                choke = ffi_cast(netc_float, ncu_info[0][12])(ncu_info, 1),
                got_bytes = ffi_cast(netc_float, ncu_info[0][13])(ncu_info, 1),
                sent_bytes = ffi_cast(netc_float, ncu_info[0][13])(ncu_info, 0),
        
                is_valid_packet = ffi_cast(netc_bool2, ncu_info[0][18])(ncu_info, 1, seqNr_out-1),
            }) do
                this[name] = value
            end
        end)

        function this:get()
            return (this.seqNr_out ~= nil and this or nil)
        end

        return this
    end,

    aimbot = function(net_channel)
        local this = { }
        local aim_data = { }
        local bullet_impacts = { }

        local generate_flags = function(pre_data)
            return {
                pre_data.self_choke > 1 and 1 or 0,
                pre_data.velocity_modifier < 1.00 and 1 or 0,
                pre_data.flags.boosted and 1 or 0
            }
        end

        local get_safety = function(aim_data, target)
            local has_been_boosted = aim_data.boosted
            local plist_safety = plist_get(target, 'Override safe point')
            local ui_safety = { ui_get(prefer_safe_point), ui_get(force_safe_point) or plist_safety == 'On' }
    
            if not has_been_boosted then
                return -1
            end
    
            if plist_safety == 'Off' or not (ui_safety[1] or ui_safety[2]) then
                return 0
            end
    
            return ui_safety[2] and 2 or (ui_safety[1] and 1 or 0)
        end

        local get_inaccuracy_tick = function(pre_data, tick)
            local spread_angle = -1
            for k, impact in pairs(bullet_impacts) do
                if impact.tick == tick then
                    local aim, shot = 
                        (pre_data.eye-pre_data.shot_pos):angles(),
                        (pre_data.eye-impact.shot):angles()
        
                        spread_angle = vector(aim-shot):length2d()
                    break
                end
            end

            return spread_angle
        end

        this.fired = function(e)
            local this = { }
            local p_ent = e.target
            local me = entity_get_local_player()
        
            aim_data[e.id] = {
                original = e,
                dropped_packets = { },
        
                handle_time = globals_realtime(),
                self_choke = globals_chokedcommands(),
        
                flags = {
                    boosted = e.boosted
                },

                safety = get_safety(e, p_ent),
                correction = plist_get(p_ent, 'Correction active'),
        
                shot_pos = vector(e.x, e.y, e.z),
                eye = vector(client_eye_position()),
                view = vector(client_camera_angles()),
        
                velocity_modifier = entity_get_prop(me, 'm_flVelocityModifier'),
                total_hits = entity_get_prop(me, 'm_totalHitsOnServer'),

                history = globals.tickcount() - e.tick
            }
        end
        
        this.missed = function(e)
            if aim_data[e.id] == nil then
                return
            end
        
            local pre_data = aim_data[e.id]
            local shot_id = num_format((e.id % 15) + 1)
            
            local net_data = net_channel:get()
        
            local ping, avg_ping = 
                net_data.latency.crn(0)*1000, 
                net_data.latency.average(0)*1000
        
            local net_state = string_format(
                'delay: %d:%.2f | dropped: %d', 
                avg_ping, math_abs(avg_ping-ping), #pre_data.dropped_packets
            )
        
            local uflags = {
                math_abs(avg_ping-ping) < 1 and 0 or 1,
                cvar.cl_clock_correction:get_int() == 1 and 0 or 1,
                cvar.cl_clock_correction_force_server_tick:get_int() == 999 and 0 or 1
            }
        
            local spread_angle = get_inaccuracy_tick( pre_data, globals_tickcount() )
            
            -- smol stuff
            local me = entity_get_local_player()
            local hgroup = hitgroup_names[e.hitgroup + 1] or '?'
            local target_name = string_lower(entity_get_player_name(e.target))
            local hit_chance = math_floor(pre_data.original.hit_chance + 0.5)
            local pflags = generate_flags(pre_data)
        
            local reasons = {
                ['event_timeout'] = function()
                    v0:add_to_log('Missed '..shot_id..' shot due to event timeout (target: '..target_name..')',net_state)
                    print(string_format(
                        'Missed %s shot due to event timeout [%s] [%s]', 
                        shot_id, target_name, net_state
                    ))
                end,

                ['death'] = function()
                    v0:add_to_log('Missed '..shot_id..' shot at '..target_name..'\'s '..hgroup..'('..hit_chance..'%) due to death [dropped: '..#pre_data.dropped_packets..' | flags: '..table_concat(pflags)..' | error: '..table_concat(uflags)..']')
                    print(string_format(
                        'Missed %s shot at %s\'s %s(%s%%) due to death [dropped: %d | flags: %s | error: %s]', 
                        shot_id, target_name, hgroup, hit_chance, #pre_data.dropped_packets, table_concat(pflags), table_concat(uflags)
                    ))
                end,
        
                ['prediction_error'] = function(type)
                    local type = type == 'unregistered shot' and (' [' .. type .. ']') or ''
                    print(string_format(
                        'Missed %s shot at %s\'s %s(%s%%) due to prediction error%s [%s] [vel_modifier: %.1f | history(Δ): %d | error: %s]', 
                        shot_id, target_name, hgroup, hit_chance, type, net_state, entity_get_prop(me, 'm_flVelocityModifier'), pre_data.history, table_concat(uflags)
                    ))
                end,
        
                ['spread'] = function()
                    v0:add_to_log('Missed '..shot_id..' shot at '..target_name..'\'s '..hgroup..'('..hit_chance..'%) due to spread ( dmg: '..pre_data.original.damage..' | safety: '..pre_data.safety..' | history(Δ): '..pre_data.history..' | flags: '..table_concat(pflags)..' )')
                    print(string_format(
                        'Missed %s shot at %s\'s %s(%s%%) due to spread ( dmg: %d | safety: %d | history(Δ): %d | flags: %s )',
                        shot_id, target_name, hgroup, hit_chance, spread_angle, 
                        pre_data.original.damage, pre_data.safety, pre_data.history, table_concat(pflags)
                    ))
                end,
        
                ['unknown'] = function(type)
                    local _type = {
                        ['damage_rejected'] = 'damage rejection',
                        ['unknown'] = string_format('unknown [angle: ?° | ?°]')
                    }

                    v0:add_to_log('Missed '..shot_id..' shot at '..target_name..'\'s '..hgroup..'('..hit_chance..'%) due to '.._type[type or 'unknown']..' ( dmg: '..pre_data.original.damage..' | safety: '..pre_data.safety..' | history(Δ): '..pre_data.history..' | flags: '..table_concat(pflags)..' )')
                    print(string_format(
                        'Missed %s shot at %s\'s %s(%s%%) due to %s ( dmg: %d | safety: %d | history(Δ): %d | flags: %s )',
                        shot_id, target_name, hgroup, hit_chance, _type[type or 'unknown'],
                        pre_data.original.damage, pre_data.safety, pre_data.history, table_concat(pflags)
                    ))
                end
            }
        
            local post_data = {
                event_timeout = (globals_realtime() - pre_data.handle_time) >= 0.5,
                damage_rejected = e.reason == '?' and pre_data.total_hits ~= entity_get_prop(me, 'm_totalHitsOnServer'),
                prediction_error = e.reason == 'prediction error' or e.reason == 'unregistered shot'
            }
        
            if post_data.event_timeout then 
                reasons.event_timeout()
            elseif post_data.prediction_error then 
                reasons.prediction_error(e.reason)
            elseif e.reason == 'spread' then
                reasons.spread()
            elseif e.reason == '?' then
                reasons.unknown(post_data.damage_rejected and 'damage_rejected' or 'unknown')
            elseif e.reason == 'death' then
                reasons.death()
            end
        
            aim_data[e.id] = nil
        end
        
        this.hit = function(e)
            if aim_data[e.id] == nil then
                return
            end
        
            local p_ent = e.target

            local pre_data = aim_data[e.id]
            local shot_id = num_format((e.id % 15) + 1)

            local me = entity_get_local_player()
            local hgroup = hitgroup_names[e.hitgroup + 1] or '?'
            local aimed_hgroup = hitgroup_names[pre_data.original.hitgroup + 1] or '?'

            local target_name = string_lower(entity_get_player_name(e.target))
            local hit_chance = math_floor(pre_data.original.hit_chance + 0.5)
            local pflags = generate_flags(pre_data)

            local spread_angle = get_inaccuracy_tick( pre_data, globals_tickcount() )
            
            local _verification = function()
                local text = ''

                local hg_diff = hgroup ~= aimed_hgroup
                local dmg_diff = e.damage ~= pre_data.original.damage

                if hg_diff or dmg_diff then
                    text = string_format(
                        ' | mismatch: [ %s ]', (function()
                            local addr = ''

                            if dmg_diff then addr = 'dmg: ' .. pre_data.original.damage .. (hg_diff and ' | ' or '') end
                            if hg_diff then addr = addr .. (hg_diff and 'hitgroup: ' .. aimed_hgroup or '') end

                            return addr
                        end)()
                    )
                end

                return text
            end

            v0:add_to_log("\affe2f3ff[synapse] registered "..shot_id.." shot in "..target_name.."'s "..hgroup.." for "..e.damage.." (hitchance: "..hit_chance.." | safety: "..pre_data.safety.." | history(Δ): "..pre_data.history.." | flags: "..table_concat(pflags)..")", _verification())
            client.color_log(152,61,52,string_format(
                '[synapse] Registered %s shot in %s\'s %s for %d damage \v( hitchance: %d%% | safety: %s | history(Δ): %d | flags: %s%s )',
                shot_id, target_name, hgroup, e.damage,
                hit_chance, pre_data.safety, pre_data.history, table_concat(pflags), _verification()
            ))
        end
        
        this.bullet_impact = function(e)
            local tick = globals_tickcount()
            local me = entity_get_local_player()
            local user = client_userid_to_entindex(e.userid)
            
            if user ~= me then
                return
            end
        
            if #bullet_impacts > 150 then
                bullet_impacts = { }
            end
        
            bullet_impacts[#bullet_impacts+1] = {
                tick = tick,
                eye = vector(client_eye_position()),
                shot = vector(e.x, e.y, e.z)
            }
        end
        
        this.net_listener = function()
            local net_data = net_channel:get()
        
            if net_data == nil then
                return
            end

            if not net_channel.is_valid_packet then
                for id in pairs(aim_data) do
                    table_insert(aim_data[id].dropped_packets, net_channel.seqNr_out)
                end
            end
        end

        return this
    end
}

local net_channel = classes.net_channel()
local aimbot = classes.aimbot(net_channel)

local g_player_hurt = function(e)
    local attacker_id = client_userid_to_entindex(e.attacker)
    
    if attacker_id == nil or attacker_id ~= entity_get_local_player() then
        return
    end

    local group = hitgroup_names[e.hitgroup + 1] or "?"
    
    if group == "generic" and weapon_to_verb[e.weapon] ~= nil then
        local target_name = entity_get_player_name()

        print(string_format("%s %s for %i damage (%i remaining)", weapon_to_verb[e.weapon], string_lower(target_name), e.dmg_health, e.health))
    end
end

local interface_callback = function(c)
    local addr = not ui_get(c) and 'un' or ''
    local _func = client[addr .. 'set_event_callback']

    _func('aim_fire', aimbot.fired)
    _func('aim_miss', aimbot.missed)
    _func('aim_hit', aimbot.hit)
    _func('bullet_impact', aimbot.bullet_impact)
    _func('net_update_start', aimbot.net_listener)
    _func('player_hurt', g_player_hurt)
end

ui_set_callback(master_switch, interface_callback)
interface_callback(master_switch)

-- UI элементы
 gradient_alpha = ui.new_slider("LUA", "A", "Gradient alpha", 0, 255, 200)

client.set_event_callback("paint", function()

     w, h = client.screen_size()
     name = entity.get_player_name(threat)
     fps = math.floor(1 / globals.frametime())
     ping = math.floor(client.latency() * 1000)
     local funcs = {
     rgba_to_hex = function(b,c,d,e)
     return string.format('%02x%02x%02x%02x',b,c,d,e)
     end
     }

     t_icon = ""
         -- Определение цели
     local_player = entity.get_local_player()
     enemies = entity.get_players(true) -- только враги

     best_target = nil
     best_dist = math.huge
     lx, ly, lz = entity.get_prop(local_player, "m_vecOrigin")

    for i = 1, #enemies do
         enemy = enemies[i]
        if entity.is_alive(enemy) then
             ex, ey, ez = entity.get_prop(enemy, "m_vecOrigin")
             dist = (lx - ex)^2 + (ly - ey)^2 + (lz - ez)^2
            if dist < best_dist then
                best_dist = dist
                best_target = enemy
            end
        end
    end

     target_name = "none"
     desync_delta = 0

    if best_target then
        target_name = entity.get_player_name(best_target) or "unknown"
         eye_yaw = entity.get_prop(best_target, "m_angEyeAngles[1]") or 0
         lby = entity.get_prop(best_target, "m_flLowerBodyYawTarget") or 0
        desync_delta = math.floor(math.abs(eye_yaw - lby) + 0.5)
    end

    -- Формируем текст
     t_icon = ""
     t_text = string.format(
        "Synapse Resolver [DEBUG-AI]  |  Ping: %dms  |  FPS: %d  |  Target: %s [Desync ~ %d°]",
        ping, fps, target_name, desync_delta
    )

     tw_icon, _ = renderer.measure_text("b", t_icon)
     tw_text, th = renderer.measure_text("b", t_text)
     total_w = tw_icon + 4 + tw_text
     x, y = w / 2 - total_w / 2, h - 40

     pulse = math.sin(globals.realtime() * 5.5) * 0.5 + 0.5
     lerp = function(a, b, t) return a + (b - a) * t end
     r1, g1, b1 = lerp(40, 60, pulse), lerp(40, 60, pulse), lerp(40, 100, pulse)
     r2, g2, b2 = lerp(20, 30, pulse), lerp(20, 30, pulse), lerp(20, 50, pulse)

     alpha = ui.get(gradient_alpha)
     text_alpha = math.floor(lerp(200, 255, pulse))

     bg_x = x - 5
     bg_y = y - 3
     bg_w = total_w + 10
     bg_h = th + 6

    renderer.rectangle(bg_x - 2, bg_y - 2, bg_w + 4, bg_h + 4, 10, 10, 10, alpha)

    renderer.gradient(bg_x, bg_y, bg_w, bg_h, r1, g1, b1, alpha, r2, g2, b2, alpha, true)

    renderer.text(x + 2, y + 2, 0, 0, 0, 100, "b", 0, t_icon)
    renderer.text(x + tw_icon + 6, y + 2, 0, 0, 0, 100, "b", 0, t_text)

    renderer.text(x, y, 255, 85, 85, text_alpha, "b", 0, t_icon)
    renderer.text(x + tw_icon + 6, y, 255, 255, 255, text_alpha, "b", 0, t_text)
end)

local vector = require "vector"

local menu_color = ui.reference("MISC", "Settings", "Menu color")

client.set_event_callback("paint", function()
    local r, g, b, a = ui.get(menu_color)
end)

-- Создаем чекбокс и комбобокс для настройки пинга и активации предсказания
local predict123 = ui.new_checkbox('LUA', 'A', string.format('⚙️ Enable \a%02X%02X%02XFF~ Foresight Engine \aFF0000FF[v3]', ui.get(menu_color)))
local pingpos = ui.new_combobox("LUA", "A", "Dependings", {
    "Low Ping < 45",
    "Medium Ping (45-60)",
    "High Ping > 60",
    "Very High Ping > 100"
})

if ui.get(predict123) then 
    print("Please, retry to the server after choosing any 'Dependings' in order to apply the predict type.")
end


-- Функция для предсказания
predict = function()
    local lp = entity.get_local_player()
    if not lp then return end

    if ui.get(predict123) then
        local ping = ui.get(pingpos)

        -- Условия для настройки интерполяции в зависимости от пинга
        if ping == "Low Ping < 45" then
            print("Please, retry to the server in order to apply the predict type.")
            cvar.cl_interp:set_float(0.015000)  -- для низкого пинга
            cvar.cl_interp_ratio:set_int(1)     -- стандартное соотношение
            cvar.cl_interpolate:set_int(1)      -- включаем интерполяцию для плавности
        elseif ping == "Medium Ping (45-60)" then
            print("Please, retry to the server in order to apply the predict type.")
            cvar.cl_interp:set_float(0.020000)  -- увеличиваем интервал для среднего пинга
            cvar.cl_interp_ratio:set_int(1)     -- поддерживаем стандартное соотношение
            cvar.cl_interpolate:set_int(1)      -- интерполяция для плавности
        elseif ping == "High Ping > 60" then
            print("Please, retry to the server in order to apply the predict type.")
            cvar.cl_interp:set_float(0.025000)  -- увеличиваем интервал для более высоких задержек
            cvar.cl_interp_ratio:set_int(2)     -- повышаем соотношение для лучшего предсказания
            cvar.cl_interpolate:set_int(1)      -- интерполяция всё ещё полезна, но менее точная
        elseif ping == "Very High Ping > 100" then
            print("Please, retry to the server in order to apply the predict type.")
            cvar.cl_interp:set_float(0.035000)  -- ещё больше интервал для очень высоких задержек
            cvar.cl_interp_ratio:set_int(2)     -- используем соотношение 2 для улучшения предсказания
            cvar.cl_interpolate:set_int(0)      -- отключаем интерполяцию для очень высокого пинга
        else
            print("Please, retry to the server in order to apply the predict type.")
            -- В случае, если пинг не определен
            cvar.cl_interp:set_float(0.016000)
            cvar.cl_interp_ratio:set_int(1)
            cvar.cl_interpolate:set_int(0)
        end
    end
end

local dtPeekFix = ui.new_checkbox("LUA", "A", "\aD1CE8BFF Defensive Fix")

function vec_3( _x, _y, _z ) 
    return { x = _x or 0, y = _y or 0, z = _z or 0 } 
end

function ticks_to_time()
    return globals.tickinterval( ) * 16
end 

local refs = {
    dt = {ui.reference("RAGE", "Aimbot", "Double tap")},
}

function player_will_peek( )
    local enemies = entity.get_players( true )
    if not enemies then
        return false
    end
    
    local eye_position = vec_3( client.eye_position( ) )
    local velocity_prop_local = vec_3( entity.get_prop( entity.get_local_player( ), "m_vecVelocity" ) )
    local predicted_eye_position = vec_3( eye_position.x + velocity_prop_local.x * ticks_to_time( predicted ), eye_position.y + velocity_prop_local.y * ticks_to_time( predicted ), eye_position.z + velocity_prop_local.z * ticks_to_time( predicted ) )

    for i = 1, #enemies do
        local player = enemies[ i ]
        
        local velocity_prop = vec_3( entity.get_prop( player, "m_vecVelocity" ) )
        
        -- Store and predict player origin
        local origin = vec_3( entity.get_prop( player, "m_vecOrigin" ) )
        local predicted_origin = vec_3( origin.x + velocity_prop.x * ticks_to_time(), origin.y + velocity_prop.y * ticks_to_time(), origin.z + velocity_prop.z * ticks_to_time() )
        
        -- Set their origin to their predicted origin so we can run calculations on it
        entity.get_prop( player, "m_vecOrigin", predicted_origin )
        
        -- Predict their head position and fire an autowall trace to see if any damage can be dealt
        local head_origin = vec_3( entity.hitbox_position( player, 0 ) )
        local predicted_head_origin = vec_3( head_origin.x + velocity_prop.x * ticks_to_time(), head_origin.y + velocity_prop.y * ticks_to_time(), head_origin.z + velocity_prop.z * ticks_to_time() )
        local trace_entity, damage = client.trace_bullet( entity.get_local_player( ), predicted_eye_position.x, predicted_eye_position.y, predicted_eye_position.z, predicted_head_origin.x, predicted_head_origin.y, predicted_head_origin.z )
        
        -- Restore their origin to their networked origin
        entity.get_prop( player, "m_vecOrigin", origin )
        
        -- Check if damage can be dealt to their predicted head
        if damage > 0 then
            return true
        end
    end
    
    return false
end

client.set_event_callback( "setup_command", function( cmd )
    if not ui.get(dtPeekFix) then
        return
    end

    local dt = ui.get(refs.dt[1]) and ui.get(refs.dt[2])

    if not dt then
        return
    end

    if player_will_peek() then
        cmd.force_defensive = true
        --print("defensive fix is worked")
    end
end)

-- end 

local debugbrute = ui.new_checkbox("LUA", "A", string.format(' Enable \a%02X%02X%02XFF~ 100$ desync fix \aFF0000FF[beta]', ui.get(menu_color)))
local desc = ui.new_label("LUA", "A", "\aFFFFFF44it's a test version.")

local player_miss_angles = {}

function table_contains_v(table, element)
    for _, value in pairs(table) do
        if value == element then
            return true
        end
    end
    return false
end

function get_random_angle(exclude_table)
    local new_angle
    repeat
        new_angle = math.random(-60, 60)
    until not table_contains_v(exclude_table, new_angle)
    return new_angle
end

function angles_to_string(angles)
    if #angles == 0 then return "none" end
    return table.concat(angles, ", ")
end

function on_miss_resolver(e)
    if e.reason == "spread" or e.reason == "prediction error" or e.reason == "death" then
        goto reas
    end
    local target = e.target
        
    if not entity.is_alive(target) then return end
        
    if not player_miss_angles[target] then
        player_miss_angles[target] = {}
    end
        
    local current_angle = plist.get(target, "Force body yaw value") or 0
        
    local ey = get_random_angle(player_miss_angles[target])
        
    plist.set(target, "Correction active", true)
    plist.set(target, "Force body yaw", true)
    plist.set(target, "Force body yaw value", ey)
        
    table.insert(player_miss_angles[target], ey)
        
    local player_name = entity.get_player_name(target) or "Unknown"
    local excluded_angles = angles_to_string(player_miss_angles[target])
    if ui.get(debugbrute) then
        v0:add_to_log('Missed '..player_name..': missed angle '..current_angle..', new angle '..ey..', excluded angles: '..excluded_angles)
    end
    ::reas::
end

client.set_event_callback("aim_miss", on_miss_resolver)

local version = "debug"

if username == "admin" then 
    version = "source"
end

-- local debugbox = ui.new_checkbox("LUA", "A", "User Information")
-- client.set_event_callback('paint_ui', function()
-- if ui.get(debugbox) == true then 
--     local x, y = 1100, 50
--     local width, height = 300, 20
--         local entity_get_prop, entity_get_local_player, entity_is_alive, entity_get_player_weapon, entity_get_classname, entity_get_origin, globals_frametime, client_screen_size, globals_framecount, is_menu_open, menu_mouse_position, client_key_state, table_insert, entity_get_steam64, render_circle_outline, entity_get_all, globals_tickinterval, client_set_clantag = entity.get_prop, entity.get_local_player, entity.is_alive, entity.get_player_weapon, entity.get_classname, entity.get_origin, globals.frametime, client.screen_size, globals.framecount, ui.is_menu_open, ui.mouse_position, client.key_state, table.insert, entity.get_steam64, renderer.circle_outline, entity.get_all, globals.tickinterval, client.set_clan_tag
--     name = entity.get_player_name(threat)
--     local threat = client.current_threat()
--     if threat then
--     name = entity.get_player_name(threat)
--     threat_desync = math.floor(entity.get_prop(threat, 'm_flPoseParameter', 11) * 120 - 60)
--     end
--     renderer.text(x + 305, y + 671, 255, 255, 255, 255, "", 0, "synapse resolver - "..username)
--     renderer.text(x + 305, y + 682, 255, 255, 255, 255, "", 0, "build - "..version)
--     renderer.text(x + 305, y + 692, 255, 255, 255, 255, "", 0, "target - "..name or name == nil and "?", "") 
-- end
-- end)

local alpha = 0
local lerp = function(a, b, t) return a + (b - a) * t end

local resolver_status = "Analyzing"
local shit_status = "Thinking"
local status_reset_time = 0
local status_res_time = 0
local resolver_modes = { "Advanced" , "Alternative" }
local listofresolver = ui.new_combobox("LUA", "A", "Resolver modes", resolver_modes)

-- Статистика
local hits = 0
local misses = 0

-- Урон по врагу (попадание)
client.set_event_callback("player_hurt", function(e)
    local local_player = entity.get_local_player()
    if client.userid_to_entindex(e.attacker) == local_player then
        hits = hits + 1
    end
end)

-- Промах (skeet поддержка)
client.set_event_callback("aim_miss", function(e)
    misses = misses + 1
end)

-- Обработка убийства
client.set_event_callback("player_death", function(event)
    local local_player = client.userid_to_entindex(event.attacker)
    if local_player == entity.get_local_player() then
        resolver_status = "\aAD1010FFResetting data!"
        status_reset_time = globals.realtime() + 1.2
    end
end)

-- Обработка убийства #2
client.set_event_callback("player_death", function(event)
    local local_player = client.userid_to_entindex(event.attacker)
    if local_player == entity.get_local_player() then
        shit_status = "\aAD1010FFRestoring"
        status_res_time = globals.realtime() + 1.7
    end
end)

-- Функция для расчёта hitrate (процент попаданий)
function get_hitrate()
    local total_shots = hits + misses
    if total_shots > 0 then
        return (hits / total_shots) * 100
    else
        return 0
    end
end

-- Проверка выбора режима каждую отрисовку
client.set_event_callback("paint", function()
    local menu_open = ui.is_menu_open()
    local target_alpha = menu_open and 200 or 0
    local speed = menu_open and 0.2 or 0.6

    alpha = lerp(alpha, target_alpha, speed)
    if alpha < 1 then return end

    -- Сброс статуса
    if globals.realtime() > status_reset_time then
        resolver_status = "\a63B721FFAnalyzing"
    end

     -- Сброс статуса #2
    if globals.realtime() > status_res_time then
        shit_status = "\a63B721FFThinking"
    end


    -- Позиция коробки
    local menu_x, menu_y = ui.menu_position()
    local menu_w, menu_h = ui.menu_size()
    local box_x = menu_x + menu_w + 10
    local box_y = menu_y
    local box_w = 260
    local box_h = 200

    -- Получаем выбранный режим
    local selected_mode = ui.get(listofresolver)

    -- Вычисляем hitrate
    local hitrate = get_hitrate()
    local hitrate_text = string.format("Hitrate: %.1f%%", hitrate)

    renderer.rectangle(box_x, box_y, box_w, box_h, 30, 30, 30, alpha)
    renderer.text(box_x + 70, box_y + 10, 255, 255, 255, alpha, "b", 0, "Synapse Logic Resolver")
    renderer.text(box_x + 10, box_y + 30, 200, 200, 200, alpha, "b", 0, "User: " .. username)
    renderer.text(box_x + 10, box_y + 50, 200, 200, 200, alpha, "b", 0, "The current build of script: " .. version)
    renderer.text(box_x + 10, box_y + 70, 200, 200, 200, alpha, "b", 0, "Resolver status: " .. resolver_status)
    renderer.text(box_x + 10, box_y + 90, 200, 200, 200, alpha, "b", 0, "Hits: \a63B721FF" .. hits)
    renderer.text(box_x + 10, box_y + 110, 200, 200, 200, alpha, "b", 0, "Misses: \aAD1010FF" .. misses)
    renderer.text(box_x + 10, box_y + 130, 200, 200, 200, alpha, "b", 0, "Resolver mode: " .. selected_mode)
    renderer.text(box_x + 10, box_y + 150, 200, 200, 200, alpha, "b", 0, "" .. hitrate_text)
    renderer.text(box_x + 10, box_y + 170, 200, 200, 200, alpha, "b", 0, "Neural Debug: \a63B721FF"..shit_status)
end)

local deltaforce = ui.new_checkbox('lua', 'a', ' Experimental AI-BruteForce \aFF0000FF[synapse + neural]')
local deltabrute = ui.new_checkbox('lua', 'a', '~ debug data')
    local entity_get_prop, entity_get_local_player, entity_is_alive, entity_get_player_weapon, entity_get_classname, entity_get_origin, globals_frametime, client_screen_size, globals_framecount, is_menu_open, menu_mouse_position, client_key_state, table_insert, entity_get_steam64, render_circle_outline, entity_get_all, globals_tickinterval, client_set_clantag = entity.get_prop, entity.get_local_player, entity.is_alive, entity.get_player_weapon, entity.get_classname, entity.get_origin, globals.frametime, client.screen_size, globals.framecount, ui.is_menu_open, ui.mouse_position, client.key_state, table.insert, entity.get_steam64, renderer.circle_outline, entity.get_all, globals.tickinterval, client.set_clan_tag
    name = entity.get_player_name(threat)
    local threat = client.current_threat()
    if threat then
    name = entity.get_player_name(threat)
    threat_desync = math.floor(entity.get_prop(threat, 'm_flPoseParameter', 11) * 120 - 60)
    end
    if threat ~= nil then
    local eyepos = vector(client.eye_position())
    local origin = vector(entity_get_origin(threat))
    local target = origin + vector(0, 0, 40)
    end

function shitupd()
    local enabled = ui.get(deltaforce)
    if enabled then 
        ui.set_visible(deltabrute, true)
        v0:add_to_log("bruteforce started working | current state: scanning "..name)
    else
        ui.set_visible(deltabrute, false)
    end
end


-- Получение лагкомпенсации по simtime
function get_lagcomp_ticks(ent_index)
    if not ent_index or entity.is_dormant(ent_index) or not entity.is_alive(ent_index) then
        return 0
    end

    local sim_time = entity.get_prop(ent_index, "m_flSimulationTime")
    if not sim_time then return 0 end

    local cur_time = globals.curtime()
    local interval = globals.tickinterval()
    local tick_diff = math.floor((cur_time - sim_time) / interval + 0.5)

    return tick_diff
end


-- Логгер врагов
function log_enemy_data()
    if not ui.get(deltabrute) then return end

    local enemies = entity.get_players(true) -- true = враги
    for i = 1, #enemies do
        local ent_index = enemies[i]
        local yaw = entity.get_prop(ent_index, "m_angEyeAngles[1]") or 0
        local lagcomp = get_lagcomp_ticks(ent_index)

       -- v0:add_to_log('Enemy '..name or name == nil and "?"..'retard hehe')
        local log_line = string.format("Enemy %s | Yaw: %.1f | LagComp: %d ticks\n", name, yaw, lagcomp)
        writefile("synapse//debug_log.txt", log_line)
    end
    -- Повтор через 0.3 сек
    client.delay_call(3, log_enemy_data)
end

-- Коллбэк на включение логгера
ui.set_callback(deltabrute, function()
    if ui.get(deltabrute) then
        log_enemy_data()
    end
end)

shitupd()

ui.set_callback(deltaforce, function()
shitupd()
end)


-- все коментарии можешь потом удалить
local vector = require("vector")
local hitboxes = {
    ind = {
        1, 
        2, 
        3, 
        4, 
        5, 
        6, 
        7
    }, 

    name = {
        "head", 
        "chest", 
        "stomach", 
        "left_arm", 
        "right_arm", 
        "left_leg", 
        "right_leg"
    }
}

local refs = {
    dt = {ui.reference("RAGE", "Aimbot", "Double tap")},
    quickPeek = {ui.reference("RAGE", "Other", "Quick peek assist")}
}

local aipeek = ui.new_hotkey("lua", "A", " AI PEEK")

doubletap_charged = function()
    if not ui.get(refs.dt[1]) or not ui.get(refs.dt[2])  then -- эти dt замени на свои даблтап
        return false
    end
    if not entity.is_alive(entity.get_local_player()) or entity.get_local_player() == nil then
        return
    end
    local weapon = entity.get_prop(entity.get_local_player(), "m_hActiveWeapon")
    if weapon == nil then
        return false
    end

    local next_attack = entity.get_prop(entity.get_local_player(), "m_flNextAttack") + 0.25
    local jewfag = entity.get_prop(weapon, "m_flNextPrimaryAttack")
    if jewfag == nil then
        return
    end
    local next_primary_attack = jewfag + 0.5
    if next_attack == nil or next_primary_attack == nil then
        return false
    end
    return next_attack - globals.curtime() < 0 and next_primary_attack - globals.curtime() < 0
end

local bot_data = {
    start_position = vector(0,0,0),
    cache_eye_left = vector(0,0,0), 
    cache_eye_right = vector(0,0,0),
    left_trace_active,
    right_trace_active,
    peekbot_active,
    calculate_wall_dist_left = 0, 
    calculate_wall_dist_right = 0,
    set_location = true,
    shot_fired = false,
    reload_timer = 0,
    reached_max_distance = false,
    should_return = false,
    tracer_position,
    lerp_distance = 0
}

function d_lerp(a, b, t)
    return a + (b - a) * t
end

degree_to_radian = function(degree)
    return (math.pi / 180) * degree
end

angle_to_vector = function(x, y)
    local pitch = degree_to_radian(x)
    local yaw = degree_to_radian(y)
    return math.cos(pitch) * math.cos(yaw), math.cos(pitch) * math.sin(yaw), -math.sin(pitch)
end

set_movement = function(cmd, desired_pos)
    local local_player = entity.get_local_player()
    local vec_angles = {
        vector(
            entity.get_origin(local_player)
        ):to(
            desired_pos
        ):angles()
    }

    local pitch, yaw = vec_angles[1], vec_angles[2]

    cmd.in_forward = 1
    cmd.in_back = 0
    cmd.in_moveleft = 0
    cmd.in_moveright = 0
    cmd.in_speed = 0
    cmd.forwardmove = 800
    cmd.sidemove = 0
    cmd.move_yaw = yaw
end

do_return = function(cmd)
    if bot_data.start_position and bot_data.should_return then
        local lp_origin = vector(entity.get_origin(entity.get_local_player()))
        if bot_data.start_position:dist2d(lp_origin) > 5 then
        --[[в право промотай, и там ui.get(refs.quickPeek[2]) замени на автопик из скита]]    if not client.key_state(0x57) and not client.key_state(0x41) and not client.key_state(0x53) and not client.key_state(0x44) and not ui.get(refs.quickPeek[2]) then
                set_movement(cmd, bot_data.start_position)
            end
        else
            bot_data.should_return = false
            bot_data.shot_fired = false
            bot_data.reached_max_distance = false
        end
    end
end

peek_bot = function(cmd) -- это в setup_command
    local frametime = globals.frametime() * 15
    bot_data.lerp_distance = d_lerp(bot_data.lerp_distance, --[[ справа от этого текста замени на чекбокс аипика]]ui.get(aipeek) and 50 or 0, frametime)

    if not ui.get(aipeek) then return end -- это тоже замени на чекбокс аипика

    if not ui.get(refs.quickPeek[2]) then -- это замени на автопик скита
        bot_data.set_location = true
        bot_data.lerp_distance = 0
        return
    end

    local lp_eyepos = vector(client.eye_position())
    local lp_origin = vector(entity.get_origin(entity.get_local_player()))

    if bot_data.set_location then
        bot_data.start_position = lp_origin
        bot_data.set_location = false
    end

    do_return(cmd)

    local target = client.current_threat()
    if not target or entity.is_dormant(target) then return end

    if bot_data[target] == nil then
        bot_data[target] = {
            head = false,
            chest = false,
            stomach = false,
            left_arm = false,
            right_arm = false,
            left_leg = false,
            right_leg = false
        }
    end

    local enemy_origin = vector(entity.get_origin(target))

    local enemy_x, enemy_y = lp_eyepos.x - enemy_origin.x, lp_eyepos.y - enemy_origin.y
    local enemy_ang = math.atan2(enemy_y, enemy_x) * (180 / math.pi)
    local left_x, left_y, left_z = angle_to_vector(0, enemy_ang - 90)
    local right_x, right_y, right_z = angle_to_vector(0, enemy_ang + 90)

    local eye_left = vector(left_x * math.max(0, bot_data.lerp_distance - bot_data.calculate_wall_dist_left) + lp_eyepos.x, left_y * math.max(0, bot_data.lerp_distance - bot_data.calculate_wall_dist_left) + lp_eyepos.y, lp_eyepos.z)
    local eye_right = vector(right_x * math.max(0, bot_data.lerp_distance - bot_data.calculate_wall_dist_right) + lp_eyepos.x, right_y * math.max(0, bot_data.lerp_distance - bot_data.calculate_wall_dist_right) + lp_eyepos.y, lp_eyepos.z)
    local eye_left_ext = vector(left_x * bot_data.lerp_distance * 1.2 + lp_eyepos.x, left_y * bot_data.lerp_distance * 1.2 + lp_eyepos.y, lp_eyepos.z)
    local eye_right_ext = vector(right_x * bot_data.lerp_distance * 1.2 + lp_eyepos.x, right_y * bot_data.lerp_distance * 1.2 + lp_eyepos.y, lp_eyepos.z)

    bot_data.cache_eye_left = eye_left
    bot_data.cache_eye_right = eye_right

    for i, v in pairs(hitboxes.ind) do
        local hitbox = vector(entity.hitbox_position(target, v))

        local left, damage_left = client.trace_bullet(entity.get_local_player(), eye_left.x, eye_left.y, eye_left.z, hitbox.x, hitbox.y, hitbox.z, false)
        local right, damage_right = client.trace_bullet(entity.get_local_player(), eye_right.x, eye_right.y, eye_right.z, hitbox.x, hitbox.y, hitbox.z, false)

        local trace_wall_left = client.trace_line(0, eye_left.x, eye_left.y, eye_left.z, eye_left_ext.x, eye_left_ext.y, eye_left_ext.z)
        local trace_wall_right = client.trace_line(0, eye_right.x, eye_right.y, eye_right.z, eye_right_ext.x, eye_right_ext.y, eye_right_ext.z)

        if trace_wall_left ~= 1 then
            bot_data.calculate_wall_dist_left = (1 - trace_wall_left) * (70 / (70 / 100))
        else
            bot_data.calculate_wall_dist_left = 0
        end

        if trace_wall_right ~= 1 then
            bot_data.calculate_wall_dist_right = (1 - trace_wall_right) * (70 / (70 / 100))
        else
            bot_data.calculate_wall_dist_right = 0
        end

        if left or right then
            bot_data[target][hitboxes.name[v]] = true

            if left and not bot_data.right_trace_active then
                bot_data.tracer_position = eye_left
                bot_data.left_trace_active = true
            else
                bot_data.left_trace_active = false
            end

            if right and not bot_data.left_trace_active then
                bot_data.tracer_position = eye_right
                bot_data.right_trace_active = true
            else
                bot_data.right_trace_active = false
            end
        else
            bot_data[target][hitboxes.name[v]] = false
        end
    end

    if bot_data[target].head or bot_data[target].chest or bot_data[target].stomach or bot_data[target].left_arm or bot_data[target].right_arm or bot_data[target].left_leg or bot_data[target].right_leg then
        bot_data.peekbot_active = true
    else
        bot_data.peekbot_active = false
    end

    if bot_data.start_position:dist2d(lp_origin) > 70 then
        bot_data.reached_max_distance = true
    end

    if bot_data.peekbot_active and not bot_data.shot_fired and (bot_data.reload_timer < globals.realtime()) and not bot_data.reached_max_distance then
        if bot_data.peekbot_active and bot_data.left_trace_active and doubletap_charged() then -- это оставь что бы если чел на дорманте резко появляется то он не пикал
            set_movement(cmd, eye_left)
        elseif bot_data.peekbot_active and bot_data.right_trace_active and doubletap_charged() then -- это оставь что бы если чел на дорманте резко появляется то он не пикал
            set_movement(cmd, eye_right)
        end
    else
        bot_data.should_return = true
    end
end

local quick_peek_mode = ui.reference("RAGE", "Other", "Quick peek assist mode")

local was_pressed = false

client.set_event_callback("run_command", function()
    local pressed = ui.get(aipeek)

    if pressed and not was_pressed then
        ui.set(quick_peek_mode, "Retreat on key release")

    elseif not pressed and was_pressed then
        ui.set(quick_peek_mode, "Retreat on shot")
    end

    was_pressed = pressed
end)


function renderer_trace_positions() -- это в paint_ui
    if ui.get(aipeek) and ui.get(refs.quickPeek[2]) then -- это замени на аи пик чекбокс и авто пик скита

    renderer.indicator(255,255,255,255, "AI PEEK ENABLED")
        local local_player = entity.get_local_player()
        if not local_player or not entity.is_alive(local_player) then return end

        local player_origin = { entity.get_origin(local_player) }

        local target = client.current_threat()
        if not target or entity.is_dormant(target) then return end

        local target_origin = { entity.get_origin(target) }

        local delta_x = target_origin[1] - player_origin[1]
        local delta_y = target_origin[2] - player_origin[2]
        local angle_to_target = math.atan2(delta_y, delta_x) * (180 / math.pi)

        local left_color = { 255, 255, 255 }
        local right_color = { 255, 255, 255 }

        if bot_data.peekbot_active then
            if bot_data.left_trace_active then
                left_color = { 100, 100, 255 }
            elseif bot_data.right_trace_active then
                right_color = { 100, 100, 255 }
            end
        end

        draw_3d_box(player_origin, angle_to_target - 90, right_color)
        draw_3d_box(player_origin, angle_to_target + 90, left_color)
    end
end

function draw_3d_box(player_origin, angle, color)
    local box_distance = 20
    local rad = math.rad(angle)

    local box_position = {
        player_origin[1] + math.cos(rad) * box_distance,
        player_origin[2] + math.sin(rad) * box_distance,
        player_origin[3]
    }

    local box_width = 20
    local box_height = 60
    local box_depth = 20

    local min = {
        box_position[1] - box_width / 2,
        box_position[2] - box_depth / 2,
        box_position[3]
    }
    local max = {
        box_position[1] + box_width / 2,
        box_position[2] + box_depth / 2,
        box_position[3] + box_height
    }

    local points = {
        {min[1], min[2], min[3]}, {min[1], max[2], min[3]},
        {max[1], max[2], min[3]}, {max[1], min[2], min[3]},
        {min[1], min[2], max[3]}, {min[1], max[2], max[3]},
        {max[1], max[2], max[3]}, {max[1], min[2], max[3]},
    }

    local edges = {
        {1, 2}, {2, 3}, {3, 4}, {4, 1},
        {5, 6}, {6, 7}, {7, 8}, {8, 5},
        {1, 5}, {2, 6}, {3, 7}, {4, 8} 
    }

    for _, edge in pairs(edges) do
        local p1 = { renderer.world_to_screen(points[edge[1]][1], points[edge[1]][2], points[edge[1]][3]) }
        local p2 = { renderer.world_to_screen(points[edge[2]][1], points[edge[2]][2], points[edge[2]][3]) }

        if p1[1] and p2[1] then
            renderer.line(p1[1], p1[2], p2[1], p2[2], color[1], color[2], color[3], 255)
        end
    end
end

client.set_event_callback("setup_command", peek_bot)
client.set_event_callback("paint_ui", renderer_trace_positions)

if username == "admin" then
    local hotkey = ui.new_hotkey("LUA", "A", "Resolvation", true)

    local was_pressed = false

    client.set_event_callback("run_command", function()
        local is_pressed = ui.get(hotkey)

        if is_pressed and not was_pressed then
            client.exec("sm_sanchezgg")
        end

        if not is_pressed and was_pressed then
            client.exec("sm_sanchezgg")
        end

        was_pressed = is_pressed
    end)
end

local libs = {} do
    libs.http = require("gamesense/http")
    libs.json = require("json")
    libs.vector = require("vector")
    libs.pui = require("gamesense/pui")
    libs.bit = require("bit")
    libs.ffi = require("ffi")
    libs.csgo_weapons = require("gamesense/csgo_weapons")
    libs.msgpack = require("gamesense/msgpack")
    libs.clipboard = require("gamesense/clipboard")
    libs.base64 = require("gamesense/base64")
end

local ref = {} do
    ref.dpi = ui.reference('MISC', 'Settings', 'DPI scale')
    ref.delay_shot = ui.reference('Rage', 'Other', 'Delay shot')
    ref.peek = {ui.reference('Rage', 'Other', 'Quick peek assist')}
    ref.slow = {ui.reference("AA", "Other", "Slow motion")}
end

local pui_ref = {} do
    pui_ref.mp = {libs.pui.reference("Rage", "Aimbot", "Multi-point")}
end

local is_jump = false
local config = {cfg = nil}

local group = libs.pui.group("Rage", "Other")
local weapons = {"G3SG1 / SCAR-20", "SSG 08", "AWP", "R8 Revolver", "Desert Eagle", "Pistol", "Zeus"}
ui.new_label("Rage", "Other", " ")
local menu = {
    tabs =  group:combobox("Aimtools \v[SUNSHINE]", {" Aimtools", " Ragebot", " Visuals", " Config"}), --work
    enable = group:checkbox("Aimtools"), --work
    weapon_select = group:combobox("Weapon", weapons), --work
    aimtool = {},  --эта таблица
}

local ragebot = {
    peek_helper = group:checkbox("\v\r Peek helper"),
    helper_visual = group:combobox("\n", {"Crosshair", "World lines"}),
    y_offset = group:slider("Y offset", -300, 300, 40, true, "px", 1),
    auto_lc = group:checkbox("\v\r Automatic teleport"), --work
    auto_lc_k = group:hotkey("\v\r Automatic teleport", true), --work
    dormant = group:checkbox("\v\r Dormant aimbot"), --work
    dormant_k = group:hotkey("\v\r Dormant aimbot", true), --work
    --multipoints = group:checkbox("\v1000$\r advanced multipoint scale fix"),
    delay_shot = group:checkbox("\v\r Delay shot on key"),
    delay_key = group:hotkey("\v\r Delay shot on key", true),
    air_stop_enable = group:checkbox("\v\r Air stop"),
    air_stop_mode = group:combobox("\n", {"On hotkey", "Cycle", "High priority"}),
    air_stop_k = group:hotkey("Air stop hotkey"),

}

local visuals = {
    flag_indicators = group:checkbox("\v\r Flags Indicators"),
    flag_indicators_v = group:multiselect("\n", {"Body aim", "Safe point", "Multi-point", "Dormant aimbot"}),
    dormant_indicator = group:checkbox("\v\r Dormant indicator"),
    dormant_color = group:color_picker("\v\r Dormant indicator", 0, 255, 0, 255),
    hit_logs = group:checkbox("\v\r Screen Logger"),
}

local configs = {
    export = group:button("\v\r Export", function() end),
    import = group:button("\v\r Import", function() end),
    slider_v = group:slider("\n", 1, 2, 1, true, nil, 1, {[1] = "Marolower", [2] = "$Hakkai"}),
    cfg_marolower = group:button("Load \vMarolower \rcfg", function() end),
    cfg_hakkai = group:button("Load \vHakkai \rcfg", function() end),
}
local weapon_indexes = {
    ["G3SG1 / SCAR-20"] = {11, 38},
    ["SSG 08"] = {40},
    ["AWP"] = {9},
    ["R8 Revolver"] = {64},
    ["Desert Eagle"] = {1},
    ["Pistol"] = {2, 3, 4, 30, 32, 36, 61, 63}, -- Elite, FiveSeven, Glock, Tec9, P2000, P250, USP-S, CZ75
    ["Zeus"] = {31}
}

for i = 1, #weapons do
    menu.aimtool[i] = {
        force_baim = group:checkbox("\v\r Override prefer body aim"), --work
        baim_select = group:multiselect("Enable on:", {"Enemy health < X", "Enemy higher than you"}), --work
        baim_x_hp = group:slider("X hp:", 20, 100, 92), --work
        force_sp = group:checkbox("\v\r Override prefer safe points"), --work
        sp_select = group:multiselect("Enable on:", {"Enemy health < X", "Enemy higher than you"}), --work
        sp_x_hp = group:slider("X hp:", 20, 100, 92), --work
        --
        multipoints = group:checkbox("\v\r Override multipoints"),
        m_1 = group:slider("[" .. weapons[i] .. "] Standing", 25, 100, 50),
        m_2 = group:slider("[" .. weapons[i] .. "] Moving", 25, 100, 50),
        m_3 = group:slider("[" .. weapons[i] .. "] Slow", 25, 100, 50),
        m_4 = group:slider("[" .. weapons[i] .. "] Duck", 25, 100, 50),
        m_5 = group:slider("[" .. weapons[i] .. "] Duck move", 25, 100, 50),
        -- m_override_on = group:multiselect("Override on", {"Enemy hp < X", "Enemy lower than you", "Enemy higher than you"}),
        -- m_enemy_hp = group:slider("X hp:", 20, 100, 50), --work
        -- m_value_hp = group:slider("Multipoints (hp < x)", 20, 100, 50), --work
        -- m_value_lower = group:slider("Multipoints (lower)", 20, 100, 50), --work
        -- m_value_higher = group:slider("Multipoints (higher)", 20, 100, 50), --work
        --
        accuracy = group:checkbox("\v\r Override accuracy boost"),
        ab = group:combobox("Accuracy mode", {"Low", "Medium", "High", "Maximum"})
    }
end

for i, feature in pairs(ragebot) do
    feature:depend({menu.tabs, " Ragebot"})
end

for i, feature in pairs(visuals) do
    feature:depend({menu.tabs, " Visuals"})
end

for i, feature in pairs(configs) do
    feature:depend({menu.tabs, " Config"})
end

configs.cfg_marolower:depend({menu.tabs, " Config"}, {configs.slider_v, 1})
configs.cfg_hakkai:depend({menu.tabs, " Config"}, {configs.slider_v, 2})

visuals.flag_indicators_v:depend({visuals.flag_indicators, true},{menu.tabs, " Visuals"})
ragebot.helper_visual:depend({ragebot.peek_helper, true},{menu.tabs, " Ragebot"})
ragebot.y_offset:depend({ragebot.peek_helper, true},{menu.tabs, " Ragebot"}, {ragebot.helper_visual, "Crosshair"})

ragebot.air_stop_k:depend({ragebot.air_stop_enable, true}, {ragebot.air_stop_mode, "On hotkey"}, {menu.tabs, " Ragebot"})
ragebot.air_stop_mode:depend({ragebot.air_stop_enable, true},{menu.tabs, " Ragebot"})

menu.weapon_select:depend({menu.enable, true}, {menu.tabs, " Aimtools"})
menu.enable:depend({menu.tabs, " Aimtools"})
for i = 1, #weapons do
    menu.aimtool[i].force_baim:depend({menu.weapon_select, weapons[i]}, {menu.enable, true}, {menu.tabs, " Aimtools"})
    menu.aimtool[i].baim_select:depend({menu.aimtool[i].force_baim, true}, {menu.weapon_select, weapons[i]}, {menu.enable, true}, {menu.tabs, " Aimtools"})
    menu.aimtool[i].baim_x_hp:depend({menu.aimtool[i].force_baim, true}, {menu.weapon_select, weapons[i]}, {menu.aimtool[i].baim_select, "Enemy health < X"}, {menu.enable, true}, {menu.tabs, " Aimtools"})

    menu.aimtool[i].force_sp:depend({menu.weapon_select, weapons[i]}, {menu.enable, true}, {menu.tabs, " Aimtools"})
    menu.aimtool[i].sp_select:depend({menu.aimtool[i].force_sp, true}, {menu.weapon_select, weapons[i]}, {menu.enable, true}, {menu.tabs, " Aimtools"})
    menu.aimtool[i].sp_x_hp:depend({menu.aimtool[i].force_sp, true}, {menu.weapon_select, weapons[i]}, {menu.aimtool[i].sp_select, "Enemy health < X"}, {menu.enable, true}, {menu.tabs, " Aimtools"})
    
    menu.aimtool[i].multipoints:depend({menu.weapon_select, weapons[i]}, {menu.enable, true}, {menu.tabs, " Aimtools"})
    menu.aimtool[i].m_1:depend({menu.aimtool[i].multipoints, true}, {menu.weapon_select, weapons[i]}, {menu.enable, true}, {menu.tabs, " Aimtools"})
    menu.aimtool[i].m_2:depend({menu.aimtool[i].multipoints, true}, {menu.weapon_select, weapons[i]}, {menu.enable, true}, {menu.tabs, " Aimtools"})
    menu.aimtool[i].m_3:depend({menu.aimtool[i].multipoints, true}, {menu.weapon_select, weapons[i]}, {menu.enable, true}, {menu.tabs, " Aimtools"})
    menu.aimtool[i].m_4:depend({menu.aimtool[i].multipoints, true}, {menu.weapon_select, weapons[i]}, {menu.enable, true}, {menu.tabs, " Aimtools"})
    menu.aimtool[i].m_5:depend({menu.aimtool[i].multipoints, true}, {menu.weapon_select, weapons[i]}, {menu.enable, true}, {menu.tabs, " Aimtools"})
    -- menu.aimtool[i].m_override_on:depend({menu.aimtool[i].multipoints, true}, {menu.weapon_select, weapons[i]}, {menu.enable, true}, {menu.tabs, " Aimtools"})
    -- menu.aimtool[i].m_enemy_hp:depend({menu.aimtool[i].multipoints, true}, {menu.weapon_select, weapons[i]}, {menu.aimtool[i].m_override_on, "Enemy hp < X"}, {menu.enable, true}, {menu.tabs, " Aimtools"})
    -- menu.aimtool[i].m_value_hp:depend({menu.aimtool[i].multipoints, true}, {menu.weapon_select, weapons[i]}, {menu.aimtool[i].m_override_on, "Enemy hp < X"}, {menu.enable, true}, {menu.tabs, " Aimtools"})
    -- menu.aimtool[i].m_value_lower:depend({menu.aimtool[i].multipoints, true}, {menu.weapon_select, weapons[i]}, {menu.aimtool[i].m_override_on, "Enemy lower than you"}, {menu.enable, true}, {menu.tabs, " Aimtools"})
    -- menu.aimtool[i].m_value_higher:depend({menu.aimtool[i].multipoints, true}, {menu.weapon_select, weapons[i]}, {menu.aimtool[i].m_override_on, "Enemy higher than you"}, {menu.enable, true}, {menu.tabs, " Aimtools"})

    menu.aimtool[i].accuracy:depend({menu.weapon_select, weapons[i]}, {menu.enable, true}, {menu.tabs, " Aimtools"})
    menu.aimtool[i].ab:depend({menu.weapon_select, weapons[i]}, {menu.aimtool[i].accuracy, true}, {menu.enable, true}, {menu.tabs, " Aimtools"})
end

client.set_event_callback("setup_command", function(cmd)
    if not ragebot.air_stop_enable:get() then return end
    function get_distance(x1, y1, z1, x2, y2, z2)
        return math.sqrt((x2-x1)^2 + (y2-y1)^2 + (z2-z1)^2)
    end
    
    local local_player = entity.get_local_player()
    local target = client.current_threat()
    
    if local_player == nil or target == nil then
        return
    end
    
    local my_x, my_y, my_z = entity.get_origin(local_player)
    local target_x, target_y, target_z = entity.get_origin(target)

    local distance = get_distance(my_x, my_y, my_z, target_x, target_y, target_z)
    if (ragebot.air_stop_mode:get() == "On hotkey" and ragebot.air_stop_k:get()) or (ragebot.air_stop_mode:get() == "Cycle" and distance < 700) or (ragebot.air_stop_mode:get() == "High priority" and ((distance < 1000 and (entity.get_prop(target, "m_iHealth") <= 91)) or (distance < 500))) then
        if cmd.quick_stop then
            if (globals.tickcount() - ticks) > 3 then
                cmd.in_speed = 1
            end
        else
            ticks = globals.tickcount()
        end
    end

end)
function get_distance(target)
    local localplayer = entity.get_local_player()
    if not localplayer or not target or not entity.is_alive(localplayer) or not entity.is_alive(target) then
        return math.huge, 0
    end

    local lp_origin = {entity.get_origin(localplayer)}
    local ent_origin = {entity.get_origin(target)}
    if not lp_origin[1] or not ent_origin[1] then
        return math.huge, 0
    end

    local distance = (libs.vector(ent_origin[1], ent_origin[2], ent_origin[3]) - 
                     libs.vector(lp_origin[1], lp_origin[2], lp_origin[3])):length2d()
    local height_difference = ent_origin[3] - lp_origin[3]
    
    return math.floor(distance / 10), math.floor(height_difference)
end

local cached_state = {
    velocity = { x = 0, y = 0 },
    flags = 0,
    duck_amount = 0,
    on_ground = false,
    is_slow = false,
    last_weapon = nil,
    last_state_cond = nil,
    last_mp_value = nil,
    last_ab_value = nil
}

function get_distance(target)
    local lp = entity.get_local_player()
    if not lp or not target then return 0, 0 end

    local lx, ly, lz = entity.get_prop(lp, "m_vecOrigin")
    local tx, ty, tz = entity.get_prop(target, "m_vecOrigin")
    local distance = math.sqrt((tx - lx)^2 + (ty - ly)^2)
    local height_diff = tz - lz
    return distance, height_diff
end

function aimtools(cmd)
    if not menu.enable:get() then return end

    local lp = entity.get_local_player()
    if not lp or not entity.is_alive(lp) then return end

    local lpweapon = entity.get_player_weapon(lp)
    if not lpweapon then return end

    local wpnindx = bit.band(65535, entity.get_prop(lpweapon, "m_iItemDefinitionIndex")) or 0
    local selected_weapon = menu.weapon_select:get()
    local weapon_settings = nil

    for i, weapon_name in ipairs(weapons) do
        if weapon_indexes[weapon_name] then
            for _, index in ipairs(weapon_indexes[weapon_name]) do
                if index == wpnindx then
                    weapon_settings = menu.aimtool[i]
                    break
                end
            end
            if weapon_settings then break end
        end
    end
    weapon_settings = weapon_settings or menu.aimtool[1]

    if lpweapon == cached_state.last_weapon and not weapon_settings.multipoints:get() then
        return
    end
    cached_state.last_weapon = lpweapon

    local target = client.current_threat()
    if not target or not entity.is_alive(target) then return end

    local health = entity.get_prop(target, "m_iHealth") or 100
    local distance, height_diff = get_distance(target)
    local is_higher = height_diff > 50
    local is_lower = height_diff < -50

    if weapon_settings.force_baim:get() then
        local should_baim = weapon_settings.baim_select:get("Enemy health < X") and health < weapon_settings.baim_x_hp:get()
            or weapon_settings.baim_select:get("Enemy higher than you") and is_higher
        plist.set(target, "Override prefer body aim", should_baim and "On" or "-")
    end

    if weapon_settings.force_sp:get() then
        local should_sp = weapon_settings.sp_select:get("Enemy health < X") and health < weapon_settings.sp_x_hp:get()
            or weapon_settings.sp_select:get("Enemy higher than you") and is_higher
        plist.set(target, "Override safe point", should_sp and "On" or "-")
    end

    if weapon_settings.multipoints:get() then
        local velocity = libs.vector(entity.get_prop(lp, "m_vecVelocity"))
        cached_state.is_slow = ui.get(ref.slow[1]) and ui.get(ref.slow[2])
        cached_state.flags = entity.get_prop(lp, "m_fFlags")
        cached_state.duck_amount = entity.get_prop(lp, "m_flDuckAmount")
        cached_state.on_ground = bit.band(cached_state.flags, 1) ~= 0 and cmd.in_jump == 0

        local p_still = math.sqrt(velocity.x^2 + velocity.y^2) < 5
        local state_cond

        if (p_still and cached_state.on_ground and not (cached_state.duck_amount > 0.1)) then
            state_cond = "stan"
        elseif (not p_still and cached_state.on_ground and not cached_state.is_slow and not (cached_state.duck_amount > 0.1)) then
            state_cond = "run"
        elseif (cached_state.is_slow and cached_state.on_ground) then
            state_cond = "slow"
        elseif (cached_state.duck_amount > 0.1 and cached_state.on_ground and p_still) then
            state_cond = "duck"
        elseif (cached_state.duck_amount > 0.1 and cached_state.on_ground and not p_still) then
            state_cond = "duck move"
        end

        if state_cond and state_cond ~= cached_state.last_state_cond then
            cached_state.last_state_cond = state_cond
            cached_state.last_mp_value = weapon_settings[state_cond == "stan" and "m_1"
                or state_cond == "run" and "m_2"
                or state_cond == "slow" and "m_3"
                or state_cond == "duck" and "m_4"
                or state_cond == "duck move" and "m_5"]:get()
            libs.pui.reference("Rage", "Aimbot", "Multi-point scale"):override(cached_state.last_mp_value)
        end
    else
        if cached_state.last_mp_value then
            libs.pui.reference("Rage", "Aimbot", "Multi-point scale"):override(nil)
            cached_state.last_mp_value = nil
            cached_state.last_state_cond = nil
        end
    end

    if weapon_settings.accuracy:get() then
        local ab_value = weapon_settings.ab:get()
        if cached_state.last_ab_value ~= ab_value then
            libs.pui.reference("Rage", "Other", "Accuracy boost"):override(ab_value)
            cached_state.last_ab_value = ab_value
        end
    else
        if cached_state.last_ab_value then
            libs.pui.reference("Rage", "Other", "Accuracy boost"):override(nil)
            cached_state.last_ab_value = nil
        end
    end
end


local s_delay = 0
function is_vulnerable()
    for _, v in ipairs(entity.get_players(true)) do
        local flags = (entity.get_esp_data(v)).flags

        if libs.bit.band(flags, libs.bit.lshift(1, 11)) ~= 0 then
            return true
        end
    end

    return false
end

function auto_teleport(cmd)
    local health = entity.get_prop(entity.get_local_player(), "m_iHealth")
    if health >= 90 then
        s_delay = 4
    elseif health < 90 then
        s_delay = 2
    end
    vel_2 = math.floor(entity.get_prop(entity.get_local_player(), "m_vecVelocity[2]"))
    if is_vulnerable() and vel_2 > 20 then
        if globals.tickcount() % s_delay then
            cmd.discharge_pending = true
        end
        cmd.force_defensive = true
    end
end






function delay_shot(cmd)
    if ui.is_menu_open() then return end
    if ragebot.delay_key:get() and ragebot.delay_shot:get() then
        ui.set(ref.delay_shot, true)
    else
        ui.set(ref.delay_shot, false)
    end
end


local native_GetClientEntity, native_IsWeapon, native_GetInaccuracy = vtable_bind("client_panorama.dll", "VClientEntityList003", 3, "void*(__thiscall*)(void*,int)"), vtable_thunk(165, "bool(__thiscall*)(void*)"), vtable_thunk(482, "float(__thiscall*)(void*)")
local dormant_esp = ui.reference("Visuals", "Player ESP", "Dormant")

local round_start_tick = 0

function can_shoot(local_player, weapon_ent, weapon_data, simtime)
    if not weapon_data or weapon_data.is_melee_weapon then return false end
    if weapon_data.is_revolver then
        return simtime > entity.get_prop(weapon_ent, "m_flNextPrimaryAttack")
    end
    return simtime > math.max(
        entity.get_prop(local_player, "m_flNextAttack"),
        entity.get_prop(weapon_ent, "m_flNextPrimaryAttack"),
        entity.get_prop(weapon_ent, "m_flNextSecondaryAttack")
    )
end

function adjust_velocity(cmd, target_speed)
    local speed = math.sqrt(cmd.forwardmove^2 + cmd.sidemove^2)
    if speed <= 0 or target_speed <= 0 then return end
    if cmd.in_duck == 1 then target_speed = target_speed * 2.94117647 end
    if speed <= target_speed then return end
    local factor = target_speed / speed
    cmd.forwardmove = cmd.forwardmove * factor
    cmd.sidemove = cmd.sidemove * factor
end

function on_setup_command(cmd)
    if not ragebot.dormant:get() and ragebot.dormant_k:get() then return end

    local local_player = entity.get_local_player()
    if not entity.is_alive(local_player) then return end

    local weapon_ent = entity.get_player_weapon(local_player)
    local weapon_data = weapon_ent and libs.csgo_weapons(weapon_ent)
    if not weapon_data then return end

    local ent = native_GetClientEntity(weapon_ent)
    if not ent or not native_IsWeapon(ent) then return end

    local inaccuracy = native_GetInaccuracy(ent)
    if not inaccuracy or inaccuracy > 0.008 then return end

    if globals.tickcount() < round_start_tick then return end

    local eyepos = libs.vector(client.eye_position())
    local simtime = entity.get_prop(local_player, "m_flSimulationTime")
    local scoped = entity.get_prop(local_player, "m_bIsScoped") == 1
    local on_ground = libs.bit.band(entity.get_prop(local_player, "m_fFlags"), 1) == 1

    if not can_shoot(local_player, weapon_ent, weapon_data, simtime) then return end

    local player_resource = entity.get_player_resource()
    local best_target, best_damage, best_pitch, best_yaw = nil, 0, 0, 0

    for player = 1, globals.maxplayers() do
        if entity.get_prop(player_resource, "m_bConnected", player) == 0 then goto continue end
        if plist.get(player, "Add to whitelist") then goto continue end
        if not entity.is_dormant(player) or not entity.is_enemy(player) then goto continue end

        local origin = libs.vector(entity.get_origin(player))
        local _, _, _, _, alpha = entity.get_bounding_box(player)
        if alpha < 0.8 or origin.x == 0 then goto continue end

        local target_pos = origin + libs.vector(0, 0, 50)
        local trace_ent, damage = client.trace_bullet(local_player, eyepos.x, eyepos.y, eyepos.z, target_pos.x, target_pos.y, target_pos.z, true)
        local is_visible = client.visible(target_pos.x, target_pos.y, target_pos.z)

        if damage >= 15 and not is_visible then
            if damage > best_damage then
                best_target = player
                best_damage = damage
                local pitch, yaw = eyepos:to(target_pos):angles()
                best_pitch, best_yaw = pitch, yaw
            end
        end
        ::continue::
    end

    if best_target and cmd.chokedcommands == 0 then
        local max_speed = scoped and weapon_data.max_player_speed_alt or weapon_data.max_player_speed
        adjust_velocity(cmd, max_speed * 0.35)

        if not scoped and weapon_data.type == "sniperrifle" and cmd.in_jump == 0 and on_ground then
            cmd.in_attack2 = 1
        end

        cmd.pitch = best_pitch
        cmd.yaw = best_yaw
        cmd.in_attack = 1
    end
end

function on_paint()
    if not (ragebot.dormant:get() and ragebot.dormant_k:get() and visuals.dormant_indicator:get()) or not entity.is_alive(entity.get_local_player()) then return end
    local r, g, b, a = visuals.dormant_color:get()
    renderer.indicator(r, g, b, a, "SYNAPSE DORMANT")
end

function on_round_prestart()
    local freeze_time = (cvar.mp_freezetime:get_float() + 1) / globals.tickinterval()
    round_start_tick = globals.tickcount() + freeze_time
end

configs.export:set_callback(function()
    local data = config.cfg:save()
    local new_data = libs.msgpack.pack(data)
    local encrypted = libs.base64.encode(new_data)
    libs.clipboard.set(encrypted)
  end)
configs.import:set_callback(function()
    local cfg = libs.clipboard.get()
    local decrypted = libs.base64.decode(cfg)
    local new_data = libs.msgpack.unpack(decrypted)
    config.cfg:load(new_data)
end)
configs.cfg_marolower:set_callback(function()
    local cfg = "k4SmZW5hYmxlw6R0YWJzqu6GiCBDb25maWenYWltdG9vbJeOqmZvcmNlX2JhaW3DqGZvcmNlX3Nww6liYWltX3hfaHBTq2JhaW1fc2VsZWN0krBFbmVteSBoZWFsdGggPCBYoX6rbXVsdGlwb2ludHPDomFio0xvd6NtXzRRo21fNWGjbV8xW6NtXzNQqGFjY3VyYWN5wqNtXzJHp3NwX3hfaHA0qXNwX3NlbGVjdJKwRW5lbXkgaGVhbHRoIDwgWKF+jqpmb3JjZV9iYWltw6hmb3JjZV9zcMKpYmFpbV94X2hwV6tiYWltX3NlbGVjdJKwRW5lbXkgaGVhbHRoIDwgWKF+q211bHRpcG9pbnRzw6JhYqNMb3ejbV80WaNtXzVLo21fMUyjbV8zTqhhY2N1cmFjecKjbV8yU6dzcF94X2hwXKlzcF9zZWxlY3SRoX6OqmZvcmNlX2JhaW3DqGZvcmNlX3Nww6liYWltX3hfaHBZq2JhaW1fc2VsZWN0krBFbmVteSBoZWFsdGggPCBYoX6rbXVsdGlwb2ludHPDomFipEhpZ2ijbV80U6NtXzVgo21fMVyjbV8zWahhY2N1cmFjecOjbV8yUKdzcF94X2hwN6lzcF9zZWxlY3STsEVuZW15IGhlYWx0aCA8IFi1RW5lbXkgaGlnaGVyIHRoYW4geW91oX6OqmZvcmNlX2JhaW3CqGZvcmNlX3NwwqliYWltX3hfaHBcq2JhaW1fc2VsZWN0kaF+q211bHRpcG9pbnRzwqJhYqNMb3ejbV80MqNtXzUyo21fMTKjbV8zMqhhY2N1cmFjecKjbV8yMqdzcF94X2hwXKlzcF9zZWxlY3SRoX6OqmZvcmNlX2JhaW3CqGZvcmNlX3NwwqliYWltX3hfaHBcq2JhaW1fc2VsZWN0kaF+q211bHRpcG9pbnRzwqJhYqNMb3ejbV80MqNtXzUyo21fMTKjbV8zMqhhY2N1cmFjecKjbV8yMqdzcF94X2hwXKlzcF9zZWxlY3SRoX6OqmZvcmNlX2JhaW3DqGZvcmNlX3Nww6liYWltX3hfaHA8q2JhaW1fc2VsZWN0krBFbmVteSBoZWFsdGggPCBYoX6rbXVsdGlwb2ludHPComFio0xvd6NtXzQyo21fNTKjbV8xMqNtXzMyqGFjY3VyYWN5wqNtXzIyp3NwX3hfaHBMqXNwX3NlbGVjdJOwRW5lbXkgaGVhbHRoIDwgWLVFbmVteSBoaWdoZXIgdGhhbiB5b3Whfo6qZm9yY2VfYmFpbcKoZm9yY2Vfc3DCqWJhaW1feF9ocFyrYmFpbV9zZWxlY3SRoX6rbXVsdGlwb2ludHPComFio0xvd6NtXzQyo21fNTKjbV8xMqNtXzMyqGFjY3VyYWN5wqNtXzIyp3NwX3hfaHBcqXNwX3NlbGVjdJGhfq13ZWFwb25fc2VsZWN0plNTRyAwOIyoeV9vZmZzZXQoq3BlZWtfaGVscGVywq1haXJfc3RvcF9tb2RlqU9uIGhvdGtlea1oZWxwZXJfdmlzdWFsqUNyb3NzaGFpcqlkb3JtYW50X2uTAkOhfqdhdXRvX2xjw6dkb3JtYW50w6phaXJfc3RvcF9rkwEAoX6qZGVsYXlfc2hvdMKpZGVsYXlfa2V5kwEAoX6vYWlyX3N0b3BfZW5hYmxlwqlhdXRvX2xjX2uTAVahfoWvZmxhZ19pbmRpY2F0b3Jzw7FmbGFnX2luZGljYXRvcnNfdpWoQm9keSBhaW2qU2FmZSBwb2ludKtNdWx0aS1wb2ludK5Eb3JtYW50IGFpbWJvdKF+sWRvcm1hbnRfaW5kaWNhdG9yw6hoaXRfbG9nc8OtZG9ybWFudF9jb2xvcqkjMDBGRjAwRkY="
    local decrypted = libs.base64.decode(cfg)
    local new_data = libs.msgpack.unpack(decrypted)
    config.cfg:load(new_data)
end)
configs.cfg_hakkai:set_callback(function()
    local cfg = "k4SmZW5hYmxlw6R0YWJzqu6GiCBDb25maWenYWltdG9vbJeOqmZvcmNlX2JhaW3CqGZvcmNlX3NwwqliYWltX3hfaHBcq2JhaW1fc2VsZWN0kaF+q211bHRpcG9pbnRzw6JhYqRIaWdoo21fNEWjbV81UqNtXzFeo21fM2SoYWNjdXJhY3nDo21fMlmnc3BfeF9ocFypc3Bfc2VsZWN0kaF+jqpmb3JjZV9iYWltwqhmb3JjZV9zcMOpYmFpbV94X2hwXKtiYWltX3NlbGVjdJGhfqttdWx0aXBvaW50c8OiYWKnTWF4aW11baNtXzRNo21fNVqjbV8xVaNtXzNTqGFjY3VyYWN5w6NtXzJap3NwX3hfaHBcqXNwX3NlbGVjdJK1RW5lbXkgaGlnaGVyIHRoYW4geW91oX6OqmZvcmNlX2JhaW3DqGZvcmNlX3Nww6liYWltX3hfaHBcq2JhaW1fc2VsZWN0krVFbmVteSBoaWdoZXIgdGhhbiB5b3WhfqttdWx0aXBvaW50c8OiYWKkSGlnaKNtXzRMo21fNU+jbV8xV6NtXzNRqGFjY3VyYWN5w6NtXzJKp3NwX3hfaHBaqXNwX3NlbGVjdJKwRW5lbXkgaGVhbHRoIDwgWKF+jqpmb3JjZV9iYWltw6hmb3JjZV9zcMKpYmFpbV94X2hwXKtiYWltX3NlbGVjdJKwRW5lbXkgaGVhbHRoIDwgWKF+q211bHRpcG9pbnRzw6JhYqdNYXhpbXVto21fNF6jbV81RaNtXzFco21fM1yoYWNjdXJhY3nDo21fMlanc3BfeF9ocFypc3Bfc2VsZWN0kaF+jqpmb3JjZV9iYWltw6hmb3JjZV9zcMOpYmFpbV94X2hwOqtiYWltX3NlbGVjdJKwRW5lbXkgaGVhbHRoIDwgWKF+q211bHRpcG9pbnRzwqJhYqdNYXhpbXVto21fNDKjbV81MqNtXzEyo21fMzKoYWNjdXJhY3nDo21fMjKnc3BfeF9ocFypc3Bfc2VsZWN0krVFbmVteSBoaWdoZXIgdGhhbiB5b3Whfo6qZm9yY2VfYmFpbcKoZm9yY2Vfc3DCqWJhaW1feF9ocFyrYmFpbV9zZWxlY3SRoX6rbXVsdGlwb2ludHPDomFipEhpZ2ijbV80ZKNtXzVVo21fMVWjbV8zZKhhY2N1cmFjecOjbV8yZKdzcF94X2hwXKlzcF9zZWxlY3SRoX6OqmZvcmNlX2JhaW3CqGZvcmNlX3NwwqliYWltX3hfaHBcq2JhaW1fc2VsZWN0kaF+q211bHRpcG9pbnRzwqJhYqNMb3ejbV80MqNtXzUyo21fMTKjbV8zMqhhY2N1cmFjecKjbV8yMqdzcF94X2hwXKlzcF9zZWxlY3SRoX6td2VhcG9uX3NlbGVjdKRaZXVzjKh5X29mZnNldCircGVla19oZWxwZXLDrWFpcl9zdG9wX21vZGWpT24gaG90a2V5rWhlbHBlcl92aXN1YWypQ3Jvc3NoYWlyqWRvcm1hbnRfa5MAAKF+p2F1dG9fbGPCp2Rvcm1hbnTDqmFpcl9zdG9wX2uTAQChfqpkZWxheV9zaG90wqlkZWxheV9rZXmTAQChfq9haXJfc3RvcF9lbmFibGXCqWF1dG9fbGNfa5MBAKF+ha9mbGFnX2luZGljYXRvcnPDsWZsYWdfaW5kaWNhdG9yc192lahCb2R5IGFpbapTYWZlIHBvaW50q011bHRpLXBvaW50rkRvcm1hbnQgYWltYm90oX6xZG9ybWFudF9pbmRpY2F0b3LDqGhpdF9sb2dzwq1kb3JtYW50X2NvbG9yqSMwMEZGMDBGRg=="
    local decrypted = libs.base64.decode(cfg)
    local new_data = libs.msgpack.unpack(decrypted)
    config.cfg:load(new_data)
end)



local peek = { left = { active = false, damage = 0 }, right = { active = false, damage = 0 } }

function weapon_ready()
    local player = entity.get_local_player()
    if not entity.is_alive(player) or not ragebot.peek_helper:get() then return false end
    local weapon = entity.get_prop(player, "m_hActiveWeapon")
    if not weapon then return false end
    local next_attack = entity.get_prop(player, "m_flNextAttack")
    local next_primary = entity.get_prop(weapon, "m_flNextPrimaryAttack")
    if not next_attack or not next_primary then return false end
    return next_attack + 0.25 < globals.curtime() and next_primary + 0.5 < globals.curtime()
end

function check_peek()
    peek.left.active = false
    peek.right.active = false
    peek.left.damage = 0
    peek.right.damage = 0

    if not ragebot.peek_helper:get() and ui.get(ref.peek[2]) then return end
    local player = entity.get_local_player()
    if not entity.is_alive(player) then return end

    local eyepos = libs.vector(client.eye_position())
    local target = client.current_threat()
    if not target or entity.is_dormant(target) then return end
    if not weapon_ready() then return end

    local enemy_origin = libs.vector(entity.get_origin(target))
    local dx, dy = eyepos.x - enemy_origin.x, eyepos.y - enemy_origin.y
    local angle = math.atan2(dy, dx) * (180 / math.pi)
    local left_x, left_y = math.cos(math.rad(angle - 90)), math.sin(math.rad(angle - 90))
    local right_x, right_y = math.cos(math.rad(angle + 90)), math.sin(math.rad(angle + 90))

    local peek_dist = 50
    local eye_left = libs.vector(eyepos.x + left_x * peek_dist, eyepos.y + left_y * peek_dist, eyepos.z)
    local eye_right = libs.vector(eyepos.x + right_x * peek_dist, eyepos.y + right_y * peek_dist, eyepos.z)
    local hitbox = libs.vector(entity.hitbox_position(target, 2)) -- Chest

    local left, damage_left = client.trace_bullet(player, eye_left.x, eye_left.y, eye_left.z, hitbox.x, hitbox.y, hitbox.z, false)
    local right, damage_right = client.trace_bullet(player, eye_right.x, eye_right.y, eye_right.z, hitbox.x, hitbox.y, hitbox.z, false)

    if left and damage_left and damage_left > 0 then
        peek.left.active = true
        peek.left.damage = damage_left
    end
    if right and damage_right and damage_right > 0 then
        peek.right.active = true
        peek.right.damage = damage_right
    end
end

function render_hud()
    if not ragebot.peek_helper:get() and ragebot.helper_visual:get() == "World lines" and ui.get(ref.peek[2]) then return end
    local player = entity.get_local_player()
    if not entity.is_alive(player) then return end

    local origin = libs.vector(entity.get_origin(player))
    local target = client.current_threat()
    if not target or entity.is_dormant(target) then return end

    local target_origin = libs.vector(entity.get_origin(target))
    local dx, dy = target_origin.x - origin.x, target_origin.y - origin.y
    local angle = math.atan2(dy, dx) * (180 / math.pi)
    local pulse = math.sin(globals.realtime() * 3) * 0.3 + 0.7

    local w, h = renderer.measure_text(nil, " ")
    local cx, cy = w * 0.5, h * 0.5
    local is_active = peek.left.active or peek.right.active
    renderer.circle_outline(cx, cy, is_active and 50 or 150, is_active and 200 or 50, is_active and 200 or 50, 200, 6, globals.realtime() * 60, 0.2)

    for i, side in ipairs({"left", "right"}) do
        local is_left = side == "left"
        local active = peek[side].active
        local damage = peek[side].damage
        local side_angle = angle + (is_left and 90 or -90)
        local rad = math.rad(side_angle)
        local pos = libs.vector(
            origin.x + math.cos(rad) * 20,
            origin.y + math.sin(rad) * 20,
            origin.z + 30
        )

        local dist = math.floor(origin:dist(pos))
        local hit_chance = math.min(100, math.floor(damage * 1.5)) 
        local text = (is_left and "LEFT" or "RIGHT") .. " PEEK (" .. dist .. "u, " .. hit_chance .. "%)"
        local tw, th = renderer.measure_text("small", text)
        local screen = { renderer.world_to_screen(pos.x, pos.y, pos.z) }
        if screen[1] then
            local alpha = active and (180 + pulse * 60) or 140
            renderer.text(screen[1] - tw * 0.5, screen[2] - th, 
                active and 50 or 80, active and 200 or 120, active and 200 or 160, alpha, 
                "small", 0, text)
        end

        local arrow_len = 20 + pulse * 10
        local arrow_x = pos.x + math.cos(rad) * arrow_len
        local arrow_y = pos.y + math.sin(rad) * arrow_len
        local s1 = { renderer.world_to_screen(pos.x, pos.y, pos.z - 10) }
        local s2 = { renderer.world_to_screen(arrow_x, arrow_y, pos.z - 10) }
        if s1[1] and s2[1] then
            renderer.line(s1[1], s1[2], s2[1], s2[2], 
                active and 200 or 120, active and 100 or 80, active and 50 or 120, 
                active and (180 + pulse * 60) or 140)
            renderer.line(s1[1] + 1, s1[2] + 1, s2[1] + 1, s2[2] + 1, 
                active and 200 or 120, active and 100 or 80, active and 50 or 120, 
                active and (90 + pulse * 30) or 70)
        end
    end
end

local v0,v1={},{rounding=9,rad=9 + 2 ,n=45,o=20,OutlineGlow=function(v7,v8,v9,v10,v11,v12,v13,v14,v15,v16,v17) renderer.rectangle(v8 + 2 ,v9 + v12 + v7.rad ,1,(v11-(v7.rad * 2)) -(v12 * 2) ,v13,v14,v15,v16);renderer.rectangle((v8 + v10) -3 ,v9 + v12 + v7.rad ,1,(v11-(v7.rad * 2)) -(v12 * 2) ,v13,v14,v15,v16);renderer.rectangle(v8 + v12 + v7.rad ,v9 + 2 ,(v10-(v7.rad * 2)) -(v12 * 2) ,1,v13,v14,v15,v16);renderer.rectangle(v8 + v12 + v7.rad ,(v9 + v11) -3 ,(v10-(v7.rad * 2)) -(v12 * 2) ,1,v13,v14,v15,v16);renderer.circle_outline(v8 + v12 + v7.rad ,v9 + v12 + v7.rad ,v13,v14,v15,v16,v12 + v7.rounding ,180,0.25,1);renderer.circle_outline(((v8 + v10) -v12) -v7.rad ,v9 + v12 + v7.rad ,v13,v14,v15,v16,v12 + v7.rounding ,270,0.25,1);renderer.circle_outline(v8 + v12 + v7.rad ,((v9 + v11) -v12) -v7.rad ,v13,v14,v15,v16,v12 + v7.rounding ,90,0.25,1);renderer.circle_outline(((v8 + v10) -v12) -v7.rad ,((v9 + v11) -v12) -v7.rad ,v13,v14,v15,v16,v12 + v7.rounding ,0,0.25,1);end,rounded_box=function(v18,v19,v20,v21,v22,v23,v24,v25,v26,v27,v28,v29,v30,v31) renderer.rectangle(v19 + v23 ,v20,v21-(v23 * 2) ,v23,v24,v25,v26,v27);renderer.rectangle(v19,v20 + v23 ,v23,v22-(v23 * 2) ,v24,v25,v26,v27);renderer.rectangle(v19 + v23 ,(v20 + v22) -v23 ,v21-(v23 * 2) ,v23,v24,v25,v26,v27);renderer.rectangle((v19 + v21) -v23 ,v20 + v23 ,v23,v22-(v23 * 2) ,v24,v25,v26,v27);renderer.rectangle(v19 + v23 ,v20 + v23 ,v21-(v23 * 2) ,v22-(v23 * 2) ,v24,v25,v26,v27);renderer.circle(v19 + v23 ,v20 + v23 ,v24,v25,v26,v27,v23,180,0.25);renderer.circle((v19 + v21) -v23 ,v20 + v23 ,v24,v25,v26,v27,v23,90,0.25);renderer.circle(v19 + v23 ,(v20 + v22) -v23 ,v24,v25,v26,v27,v23,270,0.25);renderer.circle((v19 + v21) -v23 ,(v20 + v22) -v23 ,v24,v25,v26,v27,v23,0,0.25);end,rounded_box3=function(v32,v33,v34,v35,v36,v37,v38,v39,v40,v41,v42,v43,v44,v45) renderer.circle(v33 + v37 ,v34 + v37 ,v38,v39,v40,v41,v37,180,0.25);renderer.circle((v33-v37) + 24 ,v34 + v37 ,v38,v39,v40,v41,v37,90,0.25);renderer.circle(v33 + v37 ,(v34 + v36) -v37 ,v38,v39,v40,v41,v37,270,0.25);renderer.circle((v33-v37) + 24 ,(v34 + v36) -v37 ,v38,v39,v40,v41,v37,0,0.25);end,rounded_box2=function(v46,v47,v48,v49,v50,v51,v52,v53,v54,v55,v56,v57,v58,v59) local v60=(v55/255) * v46.n ;renderer.rectangle(v47 + v51 ,v48,v49-(v51 * 2) ,1,v52,v53,v54,v60);renderer.circle_outline(v47 + v51 ,v48 + v51 ,v52,v53,v54,v60,v51,180,0.25,1);renderer.circle_outline((v47 + v49) -v51 ,v48 + v51 ,v52,v53,v54,v60,v51,270,0.25,1);renderer.rectangle(v47,v48 + v51 ,1,v50-(v51 * 2) ,v52,v53,v54,v60);renderer.rectangle((v47 + v49) -1 ,v48 + v51 ,1,v50-(v51 * 2) ,v52,v53,v54,v60);renderer.circle_outline(v47 + v51 ,(v48 + v50) -v51 ,v52,v53,v54,v60,v51,90,0.25,1);renderer.circle_outline((v47 + v49) -v51 ,(v48 + v50) -v51 ,v52,v53,v54,v60,v51,0,0.25,1);renderer.rectangle(v47 + v51 ,(v48 + v50) -1 ,v49-(v51 * 2) ,1,v52,v53,v54,v60);for v105=4,v56 do local v105=v105/2 ;v46:OutlineGlow(v47-v105 ,v48-v105 ,v49 + (v105 * 2) ,v50 + (v105 * 2) ,v105,v57,v58,v59,v56-(v105 * 2) );end end,OutlineGlow=function(v61,v62,v63,v64,v65,v66,v67,v68,v69,v70) renderer.rectangle(v62 + 2 ,v63 + v66 + v61.rad ,1,(v65-(v61.rad * 2)) -(v66 * 2) ,v67,v68,v69,v70);renderer.rectangle((v62 + v64) -3 ,v63 + v66 + v61.rad ,1,(v65-(v61.rad * 2)) -(v66 * 2) ,v67,v68,v69,v70);renderer.rectangle(v62 + v66 + v61.rad ,v63 + 2 ,(v64-(v61.rad * 2)) -(v66 * 2) ,1,v67,v68,v69,v70);renderer.rectangle(v62 + v66 + v61.rad ,(v63 + v65) -3 ,(v64-(v61.rad * 2)) -(v66 * 2) ,1,v67,v68,v69,v70);renderer.circle_outline(v62 + v66 + v61.rad ,v63 + v66 + v61.rad ,v67,v68,v69,v70,v66 + v61.rounding ,180,0.25,1);renderer.circle_outline(((v62 + v64) -v66) -v61.rad ,v63 + v66 + v61.rad ,v67,v68,v69,v70,v66 + v61.rounding ,270,0.25,1);renderer.circle_outline(v62 + v66 + v61.rad ,((v63 + v65) -v66) -v61.rad ,v67,v68,v69,v70,v66 + v61.rounding ,90,0.25,1);renderer.circle_outline(((v62 + v64) -v66) -v61.rad ,((v63 + v65) -v66) -v61.rad ,v67,v68,v69,v70,v66 + v61.rounding ,0,0.25,1);end,FadedRoundedGlow=function(v71,v72,v73,v74,v75,v76,v77,v78,v79,v80,v81,v82,v83,v84) local v85=(v80/255) * v71.n ;renderer.rectangle(v72 + v76 ,v73,v74-(v76 * 2) ,1,v77,v78,v79,v85);renderer.circle_outline(v72 + v76 ,v73 + v76 ,v77,v78,v79,v85,v76,180,0.25,1);renderer.circle_outline((v72 + v74) -v76 ,v73 + v76 ,v77,v78,v79,v85,v76,270,0.25,1);renderer.rectangle(v72,v73 + v76 ,1,v75-(v76 * 2) ,v77,v78,v79,v85);renderer.rectangle((v72 + v74) -1 ,v73 + v76 ,1,v75-(v76 * 2) ,v77,v78,v79,v85);renderer.circle_outline(v72 + v76 ,(v73 + v75) -v76 ,v77,v78,v79,v85,v76,90,0.25,1);renderer.circle_outline((v72 + v74) -v76 ,(v73 + v75) -v76 ,v77,v78,v79,v85,v76,0,0.25,1);renderer.rectangle(v72 + v76 ,(v73 + v75) -1 ,v74-(v76 * 2) ,1,v77,v78,v79,v85);for v106=4,v81 do local v106=v106/2 ;v71:OutlineGlow(v72-v106 ,v73-v106 ,v74 + (v106 * 2) ,v75 + (v106 * 2) ,v106,v82,v83,v84,v81-(v106 * 2) );end end};local v2=renderer.load_svg([[<?xml version="1.0" encoding="utf-8"?><!-- Uploaded to: SVG Repo, www.svgrepo.com, Generator: SVG Repo Mixer Tools -->
<svg width="800px" height="800px" viewBox="0 0 16 16" fill="none" xmlns="http://www.w3.org/2000/svg">
<path fill-rule="nonzero" clip-rule="nonzero" d="M4.84989 2.37195C4.59895 2.51683 4.33488 2.91636 4.30424 3.78785C4.28968 4.20181 3.9423 4.52559 3.52835 4.51103C3.11439 4.49647 2.79061 4.1491 2.80516 3.73514C2.84273 2.66673 3.1806 1.60366 4.09989 1.07291C5.02179 0.540653 6.11484 0.782356 7.06128 1.28727C7.42674 1.48224 7.56495 1.93656 7.36998 2.30201C7.17501 2.66747 6.72069 2.80568 6.35524 2.61072C5.5818 2.1981 5.10158 2.22663 4.84989 2.37195ZM8.87139 3.67284C9.19036 3.40858 9.66315 3.45293 9.92741 3.7719C10.4818 4.44103 11.0136 5.20405 11.4963 6.04018C12.5366 7.84191 13.178 9.68785 13.3509 11.2362C13.4372 12.0091 13.4108 12.7446 13.2303 13.3754C13.0484 14.011 12.6941 14.5863 12.0999 14.9293C11.381 15.3444 10.5509 15.2855 9.79114 15.0089C9.02868 14.7313 8.24395 14.2056 7.49586 13.5228C7.18993 13.2435 7.16831 12.7691 7.44756 12.4632C7.72681 12.1573 8.20119 12.1356 8.50712 12.4149C9.16624 13.0165 9.78567 13.4105 10.3043 13.5994C10.8257 13.7892 11.1537 13.7436 11.3499 13.6303C11.5143 13.5354 11.6797 13.342 11.7882 12.9627C11.8981 12.5787 11.9328 12.0529 11.8602 11.4026C11.7152 10.1045 11.1591 8.45607 10.1973 6.79018C9.75492 6.02396 9.27081 5.33055 8.77232 4.72886C8.50807 4.40989 8.55242 3.93709 8.87139 3.67284Z" fill="#A36990FF"/>
<path fill-rule="nonzero" clip-rule="nonzero" d="M14.5 8.20557C14.5 7.91581 14.286 7.48735 13.5466 7.02507C13.1954 6.80549 13.0887 6.34276 13.3083 5.99154C13.5279 5.64032 13.9906 5.53361 14.3418 5.75319C15.2483 6.31993 16 7.14407 16 8.20557C16 9.27009 15.2442 10.0958 14.3337 10.663C13.9821 10.882 13.5195 10.7746 13.3005 10.423C13.0815 10.0714 13.189 9.60887 13.5405 9.38985C14.2846 8.92635 14.5 8.4962 14.5 8.20557ZM11.3626 11.0378C11.432 11.4462 11.1572 11.8335 10.7488 11.9029C9.89219 12.0484 8.96547 12.1274 8 12.1274C5.91954 12.1274 4.00018 11.76 2.57286 11.1355C1.86032 10.8238 1.23659 10.4332 0.780529 9.9615C0.320977 9.48616 0 8.89166 0 8.20557C0 7.37549 0.466082 6.68599 1.08548 6.16636C1.70712 5.64485 2.55471 5.22808 3.52013 4.92164C3.91494 4.79633 4.33657 5.01479 4.46189 5.40959C4.5872 5.80439 4.36874 6.22603 3.97394 6.35135C3.12334 6.62134 2.4724 6.96078 2.04954 7.31553C1.62442 7.67217 1.5 7.97899 1.5 8.20557C1.5 8.39536 1.58476 8.6353 1.85895 8.91891C2.13663 9.20613 2.57464 9.49905 3.17409 9.76131C4.37076 10.2848 6.07639 10.6274 8 10.6274C8.88475 10.6274 9.72732 10.5549 10.4976 10.424C10.906 10.3547 11.2933 10.6295 11.3626 11.0378Z" fill="#8C7494"/>
<path fill-rule="nonzero" clip-rule="nonzero" d="M4.87192 13.6303C5.12286 13.7752 5.6009 13.8041 6.37095 13.3949C6.73673 13.2005 7.19082 13.3395 7.38519 13.7052C7.57957 14.071 7.44062 14.5251 7.07484 14.7195C6.13079 15.2211 5.04121 15.4601 4.12192 14.9293C3.20003 14.3971 2.86282 13.3296 2.82687 12.2575C2.81299 11.8435 3.13733 11.4967 3.55131 11.4828C3.96529 11.4689 4.31215 11.7932 4.32603 12.2072C4.35541 13.0834 4.62023 13.485 4.87192 13.6303ZM3.98778 9.49712C3.59944 9.35301 3.40145 8.92138 3.54556 8.53304C3.84786 7.71839 4.24274 6.8763 4.72548 6.04018C5.76571 4.23845 7.04361 2.75996 8.29806 1.83609C8.92431 1.37487 9.57441 1.02999 10.211 0.870901C10.8524 0.71059 11.5278 0.729863 12.1219 1.07291C12.8408 1.48795 13.2049 2.23634 13.3452 3.03257C13.486 3.83168 13.4232 4.77409 13.2058 5.7634C13.1169 6.16796 12.7169 6.42388 12.3124 6.33501C11.9078 6.24613 11.6519 5.84612 11.7408 5.44155C11.9322 4.56992 11.9637 3.83647 11.868 3.29288C11.7717 2.7464 11.5681 2.48524 11.3719 2.37195C11.2076 2.27705 10.9574 2.23049 10.5747 2.32614C10.1871 2.42301 9.71442 2.65588 9.18757 3.04388C8.13584 3.81846 6.98632 5.12428 6.02452 6.79018C5.58214 7.55639 5.22369 8.32235 4.95185 9.0549C4.80774 9.44323 4.37611 9.64122 3.98778 9.49712Z" fill="#A36990FF"/>
<path d="M9.45925 8.06618C9.45925 8.81694 8.85063 9.42556 8.09987 9.42556C7.34911 9.42556 6.7405 8.81694 6.7405 8.06618C6.7405 7.31542 7.34911 6.70681 8.09987 6.70681C8.85063 6.70681 9.45925 7.31542 9.45925 8.06618Z" fill="#8C7494"/>
</svg>]],14,14);local v3,v4={},{lerp=function(v86,v87,v88,v89) return v87 + ((v88-v87) * v89) ;end,clamp=function(v90,v91,v92,v93) if (v91>v93) then return v93;end if (v92>v91) then return v92;end return v91;end,ease_in_out_quart=function(v94,v95) local v96=v95^2 ;return v96/((2 * (v96-v95)) + 1) ;end};v0.add_to_log=function(v97,v98,v99) local v100={client.screen_size()};local v101={v100[1]/2 ,v100[2]/2 };alphatest=globals.realtime() + 15 ;table.insert(v3,{text=v98,player=v99,timer=globals.realtime(),alpha=0,alpha2=0,alpha3=0,ypos=0,ypos2=v100[2]});end;v0.logs=function(v102) screen={client.screen_size()};center={screen[1]/2 ,screen[2]/2 };x=center[1];y=screen[2];for v107,v108 in ipairs(v3) do if (v107>6) then table.remove(v3,v107);end local v109,v110,v111,v112=255,255,255,255;local v113,v114,v115,v116=255,255,255,255;local v117,v118,v119,v120=25,25,25,255;local v121=0;if ((v108.timer + 3.8)<globals.realtime()) then if ((v108.timer + 3.95)<globals.realtime()) then v108.text="";end v108.ypos=v4:lerp(v108.ypos,215,globals.frametime() * 2 );v108.alpha=v4:lerp(v108.alpha,0,globals.frametime() * 15 );v108.alpha2=v4:lerp(v108.alpha2,0,globals.frametime() * 50 );v108.alpha3=v4:lerp(v108.alpha3,0,globals.frametime() * 15 );v121=globals.frametime() * 5 ;else v108.ypos=v4:lerp(v108.ypos,175,globals.frametime() * 4 );v108.alpha=v4:lerp(v108.alpha,255,globals.frametime() * 5 );v108.alpha2=v4:lerp(v108.alpha2,v120,globals.frametime() * 10 );v108.alpha3=v4:lerp(v108.alpha3,18,globals.frametime() * 15 );v121=globals.frametime() * 15 ;end local v122,v123=renderer.measure_text("",v108.text);v108.ypos2=v4:lerp(v108.ypos2,y,v121);local v125=v108.ypos2-v108.ypos ;local v126=v108.alpha;local v127=v108.alpha2;local v128=0;local v129=(v122 * 2)/2 ;local v130=v122/2 ;v1:FadedRoundedGlow((x-v130) -19 ,v125-1 ,v122 + 33 ,22,5,v117,v118,v119,v127,v108.alpha3,v113,v114,v115);v1:rounded_box((x-v130) -18 ,v125,v122 + 31 ,20,3,v117,v118,v119,v126,255,255,255,v126);if (v108.player~=nil) then renderer.texture(v2,(x-v130) -12 ,v125 + 3 ,14,14,255,255,255,v126,"");renderer.text((x-v130) + 8 ,v125 + 3 ,225,225,225,v127,"",0,v108.text);else renderer.text((x-v130) + 8 ,v125 + 3 ,225,225,225,v127,"",0,v108.text);renderer.texture(v2,(x-v130) -12 ,v125 + 3 ,14,14,255,255,255,v126,"");end y=y + 25 ;if ((v108.timer + 4)<globals.realtime()) then table.remove(v3,v107);end end end;
local hitgroup_names = {'generic', 'head', 'chest', 'stomach', 'left arm', 'right arm', 'left leg', 'right leg', 'neck', '?', 'gear'}

function hit_logs(e)
    local group = hitgroup_names[e.hitgroup + 1] or "?"
    if not visuals.hit_logs:get() then return end
    v0:add_to_log(string.format("Hit \a75DB67FF%s \aFFFFFFFFin \a75DB67Ff%s \aFFFFFFFFfor \a75DB67FF%d \aFFFFFFFFdamage", entity.get_player_name(e.target), group, e.damage))
end

function miss_logs(e)
    local group = hitgroup_names[e.hitgroup + 1] or "?"
    if not visuals.hit_logs:get() then return end
    v0:add_to_log(string.format("Miss \aE05C5CFF%s \aFFFFFFFFin \aE05C5CFF%s \aFFFFFFFFdue to \aE05C5CFF%s", entity.get_player_name(e.target), group, e.reason))
end


local j, k = client.screen_size()

function render_text()
    local player = entity.get_local_player()
    if not entity.is_alive(player) then return end

    local target = client.current_threat()
    if not target or entity.is_dormant(target) then return end

    local pulse = math.sin(globals.realtime() * 3) * 0.3 + 0.7
    local left_chance = peek.left.active and math.min(100, math.floor(peek.left.damage * 1.5)) or 0
    local right_chance = peek.right.active and math.min(100, math.floor(peek.right.damage * 1.5)) or 0
    local text = string.format("Left: %d%% | Right: %d%%", left_chance, right_chance)

    local tw, th = renderer.measure_text("small", text)
    local x, y = j * 0.5 - 100, k * 0.5 + 20
    local alpha_left = peek.left.active and (180 + pulse * 60) or 140
    local alpha_right = peek.right.active and (180 + pulse * 60) or 140

    local left_text = string.format("Left: %d%%", left_chance)
    local right_text = string.format(" | Right: %d%%", right_chance)
    local left_tw = renderer.measure_text("small", left_text)
    renderer.text(x + 55, y + ragebot.y_offset:get(), 50, 200, 200, alpha_left, "small", 0, left_text)
    renderer.text(x + left_tw + 55, y + ragebot.y_offset:get(), 50, 200, 200, alpha_right, "small", 0, right_text)
end


client.register_esp_flag("DA", 255, 255, 255, function(player)
    return (ragebot.dormant:get() and ragebot.dormant_k:get()) and visuals.flag_indicators_v:get("Dormant aimbot") and entity.is_enemy(player) and entity.is_dormant(player) and entity.is_alive(entity.get_local_player())
end)

client.register_esp_flag("BAIM", 255, 255, 255, function(player)
    local setting = plist.get(player, "Override prefer body aim")
    return setting == "On" and visuals.flag_indicators_v:get("Body aim") and not entity.is_dormant(player)
end)

client.register_esp_flag("SAFE", 255, 255, 255, function(player)
    local setting = plist.get(player, "Override safe point")
    return setting == "On" and visuals.flag_indicators_v:get("Safe point") and not entity.is_dormant(player)
end)

client.register_esp_flag(tostring(libs.pui.reference("Rage", "Aimbot", "Multi-point scale"):get()), 255, 255, 255, function(player)
    return visuals.flag_indicators_v:get("Multi-point") and not entity.is_dormant(player)
end)

client.set_event_callback("aim_hit", hit_logs)
client.set_event_callback("aim_miss", miss_logs)
client.set_event_callback("round_prestart", on_round_prestart)
client.set_event_callback("paint_ui", (function()
    if ragebot.peek_helper:get() and ui.get(ref.peek[2]) then
        if ragebot.helper_visual:get() == "World lines" then
            render_hud()
        else
            render_text()
        end
    end
    on_paint()
    v0:logs()
end))

ui.set(dormant_esp, true)

client.set_event_callback("setup_command", (function(cmd)
    if ragebot.auto_lc:get() and ragebot.auto_lc_k:get() then
        auto_teleport(cmd)
    end
    on_setup_command(cmd)
    delay_shot(cmd)
    check_peek()
end))

if not LPH_OBFUSCATED then
    LPH_JIT_MAX = function(...) return ... end
    LPH_JIT = function(...) return ... end
end

client.set_event_callback("setup_command", LPH_JIT_MAX(function(cmd)
    client.set_clan_tag("gg/rinnegan")
    aimtools(cmd)
end))

client.set_event_callback("level_init", LPH_JIT(function() collectgarbage("collect") end))
client.set_event_callback("round_prestart", LPH_JIT(function() collectgarbage("collect") end))
client.set_event_callback("aim_hit", LPH_JIT(function() collectgarbage("collect") end))
client.set_event_callback("aim_miss", LPH_JIT(function() collectgarbage("collect") end))


 items = {menu, ragebot, visuals}
config.cfg = libs.pui.setup(items)

 userid_to_entindex = client.userid_to_entindex
 get_player_name = entity.get_player_name
 get_local_player = entity.get_local_player
 is_enemy = entity.is_enemy
 console_cmd = client.exec
 ui_get = ui.get
 trashtalk = ui.new_checkbox("LUA", "A", "V.I.P Killsay")

 baimtable = {
        'ｅｌｉｍｉｎａｔｅｄ ｂｙ ｓｙｎａｐｓｅ',
    '𝙩𝙝𝙖𝙩 𝙬𝙖𝙨 𝙥𝙚𝙧𝙛𝙚𝙘𝙩 𝙟𝙤𝙗 [𝙙𝙞𝙨𝙘𝙤𝙧𝙙.𝙜𝙜/𝙧𝙞𝙣𝙣𝙚𝙜𝙖𝙣]',
    'how you think what am I using? 𝐬𝐲𝐧𝐚𝐩𝐬𝐞',
    '1',
    'чувствуешь что не попадаешь ? так прикупи synapse resolver',
    'MODE : HARAM SQUAD ACTIVATED [AUTHORIZED with SYNAPSE & AIMTOOLS]',
    '1tapgang ft. discord.gg/rinnegan [synapse & aimtools]',
    'V.I.P RESOLVER',
    'would you like to hit like that? 𝕛𝕠𝕚𝕟 𝕙𝕖𝕣𝕖 𝕒𝕟𝕕 𝕓𝕦𝕪 𝕤𝕪𝕟𝕒𝕡𝕤𝕖. 𝕕𝕚𝕤𝕔𝕠𝕣𝕕.𝕘𝕘/𝕣𝕚𝕟𝕟𝕖𝕘𝕒𝕟',
    "𝓈𝒶𝒹𝓁𝓎 𝓎𝑜𝓊 𝒹𝒾𝒹𝓃'𝓉 𝓀𝒾𝓁𝓁 𝓂𝑒, 𝒷𝓊𝓉 𝐼 𝒹𝒾𝒹. 𝒲𝒶𝓃𝓉 𝓉𝑜 𝓀𝒾𝓁𝓁 𝓁𝒾𝓀𝑒 𝓉𝒽𝒾𝓈? 𝒥𝓊𝓈𝓉 𝒷𝓊𝓎 𝓈𝓎𝓃𝒶𝓅𝓈𝑒 𝓇𝑒𝓈𝑜𝓁𝓋𝑒𝓇.",
    'выебан в жопу by synapse [discord.gg/rinnegan]',
    'да ты фто? прям так легко? нихуя себе)',
    'omfg destroyed :joy:',
    'XDD free kill ty.',
}

 hstable = {
        'ｅｌｉｍｉｎａｔｅｄ ｂｙ ｓｙｎａｐｓｅ',
    '𝙩𝙝𝙖𝙩 𝙬𝙖𝙨 𝙥𝙚𝙧𝙛𝙚𝙘𝙩 𝙟𝙤𝙗 [𝙙𝙞𝙨𝙘𝙤𝙧𝙙.𝙜𝙜/𝙧𝙞𝙣𝙣𝙚𝙜𝙖𝙣]',
    'how you think what am I using? 𝐬𝐲𝐧𝐚𝐩𝐬𝐞',
    '1',
    'чувствуешь что не попадаешь ? так прикупи synapse resolver',
    'MODE : HARAM SQUAD ACTIVATED [AUTHORIZED with SYNAPSE & AIMTOOLS]',
    '1tapgang ft. discord.gg/rinnegan [synapse & aimtools]',
    'V.I.P RESOLVER',
    'would you like to hit like that? 𝕛𝕠𝕚𝕟 𝕙𝕖𝕣𝕖 𝕒𝕟𝕕 𝕓𝕦𝕪 𝕤𝕪𝕟𝕒𝕡𝕤𝕖. 𝕕𝕚𝕤𝕔𝕠𝕣𝕕.𝕘𝕘/𝕣𝕚𝕟𝕟𝕖𝕘𝕒𝕟',
    "𝓈𝒶𝒹𝓁𝓎 𝓎𝑜𝓊 𝒹𝒾𝒹𝓃'𝓉 𝓀𝒾𝓁𝓁 𝓂𝑒, 𝒷𝓊𝓉 𝐼 𝒹𝒾𝒹. 𝒲𝒶𝓃𝓉 𝓉𝑜 𝓀𝒾𝓁𝓁 𝓁𝒾𝓀𝑒 𝓉𝒽𝒾𝓈? 𝒥𝓊𝓈𝓉 𝒷𝓊𝓎 𝓈𝓎𝓃𝒶𝓅𝓈𝑒 𝓇𝑒𝓈𝑜𝓁𝓋𝑒𝓇.",
    'выебан в жопу by synapse [discord.gg/rinnegan]',
    'да ты фто? прям так легко? нихуя себе)',
    'omfg destroyed :joy:',
    'XDD free kill ty.',
}
 deathtable = {
'пиздец не повезло, ну ниче сын шлюхи некст раунд я тебя выебу',
'а вот сука синапс не затащил...',
'ДА ТЫ ШТО НАХУЙ ТЫ БЛЯ ДЕЛАЕШЬ?',
'omfg how can you be that trash',
'rubbersband... gg.',
}


function get_table_length(data)
  if type(data) ~= 'table' then
    return 0
  end
  local count = 0
  for _ in pairs(data) do
    count = count + 1
  end
  return count
end

local num_quotes_baim = get_table_length(baimtable)
local num_quotes_hs = get_table_length(hstable)
local num_quotes_death = get_table_length(deathtable)

function on_player_death(e)
    if not ui_get(trashtalk) then
        return
    end
    local victim_userid, attacker_userid = e.userid, e.attacker
    if victim_userid == nil or attacker_userid == nil then
        return
    end

    local victim_entindex   = userid_to_entindex(victim_userid)
    local attacker_entindex = userid_to_entindex(attacker_userid)
    if attacker_entindex == get_local_player() and is_enemy(victim_entindex) then
        if e.headshot then
            client.delay_call(1, function()
                local commandhs = 'say ' .. hstable[math.random(num_quotes_hs)]
                console_cmd(commandhs)
              end)
        else
            client.delay_call(1, function()
                local commandbaim = 'say ' .. baimtable[math.random(num_quotes_baim)]
                console_cmd(commandbaim)
              end)
        end
    end

end
client.set_event_callback("player_death", on_player_death)

-- UI Elements
 resolver_mode = ui.new_combobox("LUA", "B", "\aFF0000FF \aFFFFFFFFDefensive Resolver", {
    "Off",
    "Miss-based",
    "Wait until shot",
    "Delta check",
    "Peek only"
})
 yaw_step = ui.new_slider("LUA", "B", "\aFF0000FF \aFFFFFFFFResolver yaw step", -180, 180, 60)
 enable_logs = ui.new_checkbox("LUA", "B", "\aFF0000FF \aFFFFFFFFEnable Resolver Logs")
 show_status = ui.new_checkbox("LUA", "B", "\aFF0000FF \aFFFFFFFFShow Resolver Status")

ui.set_enabled(show_status, false)

-- Data containers
 missed_shots = {}
 last_shot_time = {}
 override_targets = {}
 hit_info = {}

-- Reset on script load
client.set_event_callback("script_load", function()
    missed_shots = {}
    last_shot_time = {}
    override_targets = {}
    hit_info = {}
end)

-- Helper functions
 function get_delta(target)
     eye_yaw = entity.get_prop(target, "m_angEyeAngles[1]") or 0
     lby = entity.get_prop(target, "m_flLowerBodyYawTarget") or 0
    return math.abs((eye_yaw - lby + 180) % 360 - 180)
end

 function is_peeking(_player, enemy)
     lx, ly = entity.get_origin(_player)
     ex, ey = entity.get_origin(enemy)
    if not lx or not ex then return false end

     dx, dy = ex - lx, ey - ly
     enemy_yaw = entity.get_prop(enemy, "m_angEyeAngles[1]") or 0
     angle_to_us = math.deg(math.atan2(dy, dx))
     yaw_diff = math.abs((angle_to_us - enemy_yaw + 180) % 360 - 180)
    return yaw_diff < 60
end

-- Event Handlers
client.set_event_callback("aim_miss", function(e)
     entindex = client.userid_to_entindex(e.target)
    if entindex then
        missed_shots[entindex] = (missed_shots[entindex] or 0) + 1
        if ui.get(enable_logs) then
             name = entity.get_player_name(entindex) or "?"
            client.log(string.format("[Defensive Resolver] %s | reason: %s", name, e.reason or "unknown"))
        end
    end
end)

client.set_event_callback("aim_hit", function(e)
     target = e.target
    if target then
        hit_info[target] = globals.realtime()
        if ui.get(enable_logs) then
             name = entity.get_player_name(target) or "?"
             hitgroup = e.hitgroup or "?"
            client.log(string.format("[Defensive Resolver] %s | Hitgroup: %s | Damage: %d", name, tostring(hitgroup), e.damage or 0))
        end
    end
end)

client.set_event_callback("aim_fire", function(e)
    if e.target then
        last_shot_time[e.target] = globals.realtime()
    end
end)

client.set_event_callback("player_death", function(e)
     victim = client.userid_to_entindex(e.userid)
    if victim then
        missed_shots[victim] = 0
        last_shot_time[victim] = 0
        override_targets[victim] = nil
        hit_info[victim] = nil
    end
end)

-- Main Resolver Logic
client.set_event_callback("run_command", function()
     mode = ui.get(resolver_mode)
    if mode == "Off" then return end

    local local_player = entity.get_local_player()
    if not _player or not entity.is_alive(_player) then return end

     step = ui.get(yaw_step)
     logs = ui.get(enable_logs)

    for _, enemy in pairs(entity.get_players(true)) do
        if not entity.is_alive(enemy) then goto continue end

         apply, reason = false, ""
         eye_yaw = entity.get_prop(enemy, "m_angEyeAngles[1]") or 0
         delta = get_delta(enemy)

        if mode == "Miss-based" then
             misses = missed_shots[enemy] or 0
            apply = misses >= 1
            reason = "missed shots = " .. misses

        elseif mode == "Wait until shot" then
             last = last_shot_time[enemy] or 0
             delay = globals.realtime() - last
            apply = delay < 1.5
            reason = string.format("last shot %.2fs ago", delay)

        elseif mode == "Delta check" then
            apply = delta > 35
            reason = string.format("delta = %.1f", delta)

        elseif mode == "Peek only" then
            apply = is_peeking(_player, enemy)
            reason = apply and "peeking" or "not peeking"
        end

        if apply then
             override_yaw = (eye_yaw + step) % 360
            override_targets[enemy] = override_yaw

            if logs then
                 name = entity.get_player_name(enemy) or "?"
                client.log(string.format("[Defensive Resolver] %s | Mode: %s | eye_yaw: %.1f | delta: %.1f | → set yaw: %.1f | %s",
                    name, mode, eye_yaw, delta, override_yaw, reason))
            end
        else
            override_targets[enemy] = nil
        end

        ::continue::
    end
end)

-- Status UI Box
client.set_event_callback("paint", function()
    if not ui.get(show_status) then return end

     w, h = client.screen_size()
     box_x, box_y = 20, h / 2 - 50
     padding = 6
     lines = { "» Defensive Resolver Status" }

for i, enemy in ipairs(entity.get_players(true)) do
     name = entity.get_player_name(enemy) or "?"
     eye_yaw = entity.get_prop(enemy, "m_angEyeAngles[1]") or 0
     eye_pitch = entity.get_prop(enemy, "m_angEyeAngles[0]") or 0
     lby = entity.get_prop(enemy, "m_flLowerBodyYawTarget") or 0
     sim_time = entity.get_prop(enemy, "m_flSimulationTime") or 0
     vel_x = entity.get_prop(enemy, "m_vecVelocity[0]") or 0
     vel_y = entity.get_prop(enemy, "m_vecVelocity[1]") or 0
     velocity = math.sqrt(vel_x^2 + vel_y^2)
     lag_ticks = (globals.curtime() - sim_time) / globals.tickinterval()
     last_shot = last_shot_time[enemy] or 0
     delay = globals.realtime() - last_shot

    --[[table.insert(lines, string.format("» %s | yaw=%.1f pitch=%.1f LBY=%.1f sim=%.2f vel=%.1f lag=%.1f ticks delay=%.2fs",
        name, eye_yaw, eye_pitch, lby, sim_time, velocity, lag_ticks, delay))
    end]]

     widest = 0
    for _, line in ipairs(lines) do
         tw, _ = renderer.measure_text("", line)
        if tw > widest then widest = tw end
    end

     box_width = widest + padding * 2
     box_height = #lines * 15 + padding * 2

    renderer.rectangle(box_x - 2, box_y - 2, box_width + 4, box_height + 4, 10, 10, 10, 200) -- border
    renderer.gradient(box_x, box_y, box_width, box_height, 40, 40, 40, 180, 20, 20, 20, 180, true)

    for i, line in ipairs(lines) do
        renderer.text(box_x + padding, box_y + padding + (i - 1) * 15, 255, 255, 255, 255, "", 0, line)
    end
end
end)



--local checshit = ui.new_checkbox("LUA", "A", "Retard uncharge fix")

-- All conditional items grouped for easy visibility management
local helpers_items = {
    resolver_enabled,multibox, health, multibox2, health2, missed,
    master_switch, inds, color, aimproove,
    default_set, hotfix, reset,force_delay_shot
}

-- Visibility function
local function update_tab_visibility()
    local selected = ui.get(ui_tabs)
    local is_resolver_on = ui.get(resolver_enabled)

    -- Hide everything first
    local all_elements = {
        resolver_enabled,multibox, health, multibox2, health2, missed,
    master_switch, inds, color, aimproove,
    default_set, hotfix, reset,force_delay_shot, dtPeekFix, debugbrute, 
    desc, pingpos, predict123, gradient_alpha,
    aipeek, deltaforce, deltabrute, listofresolver, trashtalk, debugbrute,
        table.unpack(helpers_items)
    }

    for _, item in pairs(all_elements) do
        ui.set_visible(item, false)
    end

    -- Conditionally assign elements to tabs
    local elements = {
        Rage = {resolver_enabled},
        Misc = {aipeek, trashtalk, gradient_alpha},
        Tweaks = {predict123, pingpos, dtPeekFix},
        Helpers = {deltaforce, deltabrute, debugbrute},
    }

    if is_resolver_on then
        elements.Rage = helpers_items
    end

    -- Show elements in the current tab
    for _, item in pairs(elements[selected:gsub(" .*","")]) do
        ui.set_visible(item, true)
    end
end

ui.set_callback(ui_tabs, update_tab_visibility)
ui.set_callback(resolver_enabled, update_tab_visibility)
update_tab_visibility()
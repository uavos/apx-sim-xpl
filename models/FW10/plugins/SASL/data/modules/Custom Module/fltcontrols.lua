defineProperty("sim_frp", globalPropertyf("sim/operation/misc/frame_rate_period"))
defineProperty("sim_thro_comm", globalPropertyfa("sim/flightmodel/engine/ENGN_thro"))

defineProperty("sim_landgear", globalPropertyi("sim/cockpit2/controls/gear_handle_down"))
defineProperty("sim_pitch", globalPropertyf("sim/flightmodel/position/theta"))
defineProperty("sim_roll", globalPropertyf("sim/flightmodel/position/phi"))
defineProperty("sim_beta", globalPropertyf("sim/flightmodel/position/beta"))
defineProperty("sim_ias", globalPropertyf("sim/flightmodel/position/indicated_airspeed"))
defineProperty("sim_gs", globalPropertyf("sim/flightmodel/position/groundspeed"))
defineProperty("sim_vs", globalPropertyf("sim/flightmodel/position/vh_ind"))
defineProperty("sim_alt_agl", globalPropertyf("sim/flightmodel/position/y_agl"))
defineProperty("sim_heading", globalPropertyf("sim/flightmodel/position/true_psi"))
defineProperty("sim_brake", globalPropertyf("sim/cockpit2/controls/parking_brake_ratio"))
defineProperty("sim_throttle", globalPropertyfa("sim/cockpit2/engine/actuators/throttle_ratio"))
defineProperty("sim_alt_agl", globalPropertyf("sim/flightmodel/position/y_agl"))
defineProperty("sim_path", globalPropertyf("sim/flightmodel/position/beta"))
defineProperty("sim_p_rpm", globalPropertyf("sim/cockpit2/engine/actuators/prop_rotation_speed_rad_sec_all"))

defineProperty("local_x", globalPropertyf("sim/flightmodel/position/local_x"))
defineProperty("local_y", globalPropertyf("sim/flightmodel/position/local_y"))
defineProperty("local_z", globalPropertyf("sim/flightmodel/position/local_z"))

defineProperty("vel_x", globalPropertyf("sim/flightmodel/position/local_vx"))
defineProperty("vel_y", globalPropertyf("sim/flightmodel/position/local_vy"))
defineProperty("vel_z", globalPropertyf("sim/flightmodel/position/local_vz"))

defineProperty("V_pitch", globalPropertyf("sim/flightmodel/position/Q"))
defineProperty("V_roll", globalPropertyf("sim/flightmodel/position/P")) 
defineProperty("V_yaw", globalPropertyf("sim/flightmodel/position/R")) 

defineProperty("P_pitch", globalPropertyf("sim/flightmodel/position/theta"))
defineProperty("P_roll", globalPropertyf("sim/flightmodel/position/phi")) 
defineProperty("P_yaw", globalPropertyf("sim/flightmodel/position/psi")) 

defineProperty("throttle", globalPropertyfa("sim/flightmodel/engine/ENGN_thro_use"))

defineProperty("joy_pitch", globalPropertyf("sim/joystick/yoke_pitch_ratio"))
defineProperty("joy_roll", globalPropertyf("sim/joystick/yoke_roll_ratio"))
defineProperty("joy_yaw", globalPropertyf("sim/joystick/yoke_heading_ratio"))

defineProperty("F_side", globalPropertyf("sim/flightmodel/forces/fside_plug_acf")) -- pos right
defineProperty("F_vert", globalPropertyf("sim/flightmodel/forces/fnrml_plug_acf")) -- pos up
defineProperty("F_long", globalPropertyf("sim/flightmodel/forces/faxil_plug_acf")) -- pos aft

defineProperty("M_pitch", globalPropertyf("sim/flightmodel/forces/M_plug_acf"))
defineProperty("M_roll", globalPropertyf("sim/flightmodel/forces/L_plug_acf"))
defineProperty("M_yaw", globalPropertyf("sim/flightmodel/forces/N_plug_acf"))

defineProperty("sim_F_side", globalPropertyf("sim/flightmodel/forces/fside_total")) -- pos right
defineProperty("sim_F_vert", globalPropertyf("sim/flightmodel/forces/fnrml_total")) -- pos up
defineProperty("sim_F_long", globalPropertyf("sim/flightmodel/forces/faxil_total")) -- pos aft

defineProperty("sim_M_pitch", globalPropertyf("sim/flightmodel/forces/M_total"))
defineProperty("sim_M_roll", globalPropertyf("sim/flightmodel/forces/L_total"))
defineProperty("sim_M_yaw", globalPropertyf("sim/flightmodel/forces/N_total"))

defineProperty("overr_path", globalPropertyia("sim/operation/override/override_planepath"))
defineProperty("crash", globalPropertyi("sim/flightmodel2/misc/has_crashed"))
defineProperty("overr_controls", globalPropertyi("sim/operation/override/override_flightcontrol"))
defineProperty("overr_surfaces", globalPropertyi("sim/operation/override/override_control_surfaces"))
defineProperty("overr_eng", globalPropertyi("sim/operation/override/override_engines"))

defineProperty("flap_l", globalPropertyf("sim/flightmodel/controls/wing1l_fla1def"))
defineProperty("flap_r", globalPropertyf("sim/flightmodel/controls/wing1r_fla1def"))
defineProperty("ail_l", globalPropertyf("sim/flightmodel/controls/wing2l_ail1def"))
defineProperty("ail_r", globalPropertyf("sim/flightmodel/controls/wing2r_ail1def"))
defineProperty("stab_l", globalPropertyf("sim/flightmodel/controls/hstab1_elv1def"))
defineProperty("stab_r", globalPropertyf("sim/flightmodel/controls/hstab2_elv1def"))

defineProperty("flap_l_in", globalPropertyf("uavos/flap_l"))
defineProperty("flap_r_in", globalPropertyf("uavos/flap_r"))
defineProperty("ail_l_in", globalPropertyf("uavos/ail_l"))
defineProperty("ail_r_in", globalPropertyf("uavos/ail_r"))
defineProperty("stab_l_in", globalPropertyf("uavos/stab_l"))
defineProperty("stab_r_in", globalPropertyf("uavos/stab_r"))
--defineProperty("chute_in", globalPropertyi("uavos/parachute"))
defineProperty("launch_in", globalPropertyi("uavos/launch"))
defineProperty("on_catapult", globalPropertyi("uavos/on_catapult"))

defineProperty("chute", globalPropertyi("sim/cockpit/switches/parachute_on"))
defineProperty("eng_rpm", globalPropertyfa("sim/cockpit2/engine/indicators/engine_speed_rpm"))
defineProperty("eng_tr", globalPropertyfa("sim/flightmodel/engine/POINT_thrust"))

function onPlaneLoaded()
	plane_loaded = 1
end

function onAirportLoaded()
	port_loaded = 1
end

--set(chute_in, 0)
--set(overr_path, 0, 1)
--set(overr_controls, 0)
--set(overr_surfaces, 0)

plane_loaded = 0
port_loaded = 0

launch = 0
key = 0
key2 = 1
key_overr = 1
timer = 0
timer2 = 0
launch_obj = sasl.loadObject ("launcher.obj")
launcher = sasl.createInstance (launch_obj)

x = get(local_x)
y = get(local_y)
z = get(local_z)

l_pitch = 0
l_roll = 0
l_heading = get(sim_heading)
l_data = {}
lx = get(local_x)
ly = get(local_y)
lz = get(local_z)


test = 0
function update()


	if plane_loaded == 1 or port_loaded == 1 then
		x = get(local_x)
		y = get(local_y)
		z = get(local_z)
		lx = get(local_x)
		ly = get(local_y)
		lz = get(local_z)
		plane_loaded = 0
		key_overr = 1
		--set(chute_in, 0)
	end

	res,locX,locY,locZ,norX,norY,norZ,velX,velY,velZ,Wet = sasl.probeTerrain ( lx, 0 , lz)
	
	if key2 == 1 then
	--[[
		if key_overr == 1 then
			set(overr_path, 1, 1)
		else
			set(overr_path, 0, 1)
		end
			
		set(P_pitch, 14)
		set(P_roll, 0)
		set(local_x, x)
		set(local_z, z)
		set(local_y, locY + 0.35)
		set(vel_x, 0)
		set(vel_y, 0)
		set(vel_z, 0)
		set(V_pitch, 0)
		set(V_roll, 0)
		set(V_yaw, 0)]]
		dx = x - get(local_x)
		dz = z - get(local_z)
		k_force = 1000
		k_force2 = 20
		if get(sim_alt_agl) < 1 and get(sim_gs) < 1 then
			set(F_long, math.cos(math.rad(get(sim_heading))) * dz * k_force + math.sin(math.rad(get(sim_heading))) * -dx * k_force)
			test = 1
		end
		--set(F_side, math.sin(math.rad(get(sim_heading))) * -dz * k_force2 + math.cos(math.rad(get(sim_heading))) * dx * k_force2)
		l_heading = get(sim_heading)
		timer2 = timer2 + 2 * get(sim_frp)
	end

	if key == 1 and launch == 1  then
		key2 = 0
		--set(overr_path, 0, 1)
		--set(vel_z, -20 * math.cos(math.rad(get(sim_heading))))
		--set(vel_x, 20 * math.sin(math.rad(get(sim_heading))))
		--set(vel_y, 5.5)
		--set(V_pitch, 0)
		--set(V_roll, 0)
		--set(V_yaw, 0)
		set(F_long, -400)
		test = 2
		set(F_vert, 50)
		timer = timer + 2 * get(sim_frp)
	end

	--print(test)
	--print(timer)

	if timer > 1 then 
		key = 0
		timer = 0
		test = 0
		launch = 0
		set(launch_in, 0)
	end
	
	if timer2 > 2 then 
		key_overr = 0
		timer2 = 0
	end
	
	if port_loaded == 1 then
		port_loaded = 0
		key2 = 1
		key = 0
		test = 0
	end
	
	if get(sim_alt_agl) > 1  then set(sim_landgear, 0) end
	if get(sim_ias) < 5 and get(sim_gs) < 1 then
		key = 1
	end
	
	if get(crash) == 1 then
		--key_overr = 1
		key = 0
		test = 0
		launch = 0
		set(sim_landgear, 1)
	end

	sasl.setInstancePosition(launcher, lx, locY - 0.02, lz, l_pitch, l_heading , l_roll, l_data)


	set(ail_l, get(ail_l_in))
	set(ail_r, get(ail_r_in))
	set(flap_l, get(flap_l_in))
	set(flap_r, get(flap_r_in))
	set(stab_l, get(stab_l_in))
	set(stab_r, get(stab_r_in))

	set(on_catapult, key2)


	if get(launch_in) > 0 then
		launch = 1

	end



end



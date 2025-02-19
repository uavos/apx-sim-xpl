fnt = sasl.gl.loadFont ( "fonts/DejaVuSans.ttf" )

defineProperty("sim_frametime", globalPropertyf("sim/operation/misc/frame_rate_period"))
defineProperty("sim_ias", globalPropertyf("sim/flightmodel/position/indicated_airspeed"))
defineProperty("sim_tas", globalPropertyf("sim/flightmodel/position/true_airspeed"))
defineProperty("sim_gs", globalPropertyf("sim/flightmodel/position/groundspeed"))
defineProperty("sim_aoa", globalPropertyf("sim/flightmodel2/misc/AoA_angle_degrees"))
defineProperty("sim_slip", globalPropertyf("sim/flightmodel/misc/slip"))
defineProperty("sim_beta", globalPropertyf("sim/flightmodel/position/beta"))
defineProperty("sim_alt_agl", globalPropertyf("sim/flightmodel/position/y_agl"))
defineProperty("sim_roll", globalPropertyf("sim/flightmodel/position/phi"))
defineProperty("sim_pitch", globalPropertyf("sim/flightmodel/position/theta"))
defineProperty("sim_heading", globalPropertyf("sim/flightmodel/position/true_psi"))
defineProperty("sim_hpath", globalPropertyf("sim/flightmodel/position/hpath"))
defineProperty("sim_vs", globalPropertyf("sim/flightmodel/position/vh_ind"))
defineProperty("sim_weight_total", globalPropertyf("sim/flightmodel/weight/m_total"))
defineProperty("sim_landgear", globalPropertyf("sim/cockpit2/controls/gear_handle_down"))
defineProperty("sim_flaps_pos", globalPropertyf("sim/flightmodel/controls/flaprat"))
defineProperty("sim_heading_mag", globalPropertyf("sim/cockpit2/gauges/indicators/heading_AHARS_deg_mag_pilot"))
defineProperty("sim_alt_msl", globalPropertyf("sim/flightmodel/position/elevation"))
defineProperty("sim_eng_thrust", globalPropertyfa("sim/cockpit2/engine/indicators/thrust_n"))

defineProperty("sim_prop_rpm", globalPropertyfa("sim/cockpit2/engine/indicators/prop_speed_rpm"))
defineProperty("roll_rate", globalPropertyf("sim/flightmodel/position/P"))
defineProperty("sim_elevator", globalPropertyf("sim/flightmodel2/controls/pitch_ratio"))
defineProperty("sim_ailerons", globalPropertyf("sim/flightmodel2/controls/roll_ratio"))
defineProperty("sim_rudder", globalPropertyf("sim/flightmodel2/controls/heading_ratio"))
defineProperty("sim_vector", globalPropertyf("sim/flightmodel/controls/vect_rat"))

defineProperty("speed_side", globalPropertyf("sim/flightmodel/forces/vx_acf_axis"))
defineProperty("speed_vert", globalPropertyf("sim/flightmodel/forces/vy_acf_axis")) 
defineProperty("speed_long", globalPropertyf("sim/flightmodel/forces/vz_acf_axis")) 

defineProperty("set_alt", globalPropertyf("sim/flightmodel/position/local_y"))
defineProperty("set_pitch", globalPropertyf("sim/flightmodel/position/Q"))
defineProperty("set_roll", globalPropertyf("sim/flightmodel/position/P"))
defineProperty("set_head", globalPropertyf("sim/flightmodel/position/R"))
defineProperty("ov_path", globalPropertyfa("sim/operation/override/override_planepath"))

defineProperty("set_vel1", globalPropertyf("sim/flightmodel/position/local_vx"))
defineProperty("set_vel2", globalPropertyf("sim/flightmodel/position/local_vy"))
defineProperty("set_vel3", globalPropertyf("sim/flightmodel/position/local_vz"))

defineProperty("throttle", globalPropertyfa("sim/cockpit2/engine/actuators/throttle_ratio"))
defineProperty("throttle_all", globalPropertyf("sim/cockpit2/engine/actuators/throttle_ratio_all"))
defineProperty("sim_thro_comm", globalPropertyfa("sim/flightmodel/engine/ENGN_thro_use"))
defineProperty("sim_ov_eng", globalPropertyi("sim/operation/override/override_engines"))






--ADD ROUNDING FUNCTION
function rounding(a)
	result = math.floor(a * 100)/100 
	return result
end

function rounding_int(a)
	result = math.floor(a + 0.5)
	return result
end


mode_type = "OFF"

function update()


	

end


clWhite = {1.0, 1.0, 1.0, 1.0}

function draw()
	
    sasl.gl.drawRectangle(0,0,400,700,0,0,0,0.5)
  
	sasl.gl.drawText(fnt , 20, 650, "TAS m/s ............. " .. rounding_int(get(sim_tas)), 20, false , false , TEXT_ALIGN_LEFT , 1.0, 1.0, 1.0, 1.0)
	sasl.gl.drawText(fnt , 20, 620, "VS m/s ............. " .. rounding(get(sim_vs)), 20, false , false , TEXT_ALIGN_LEFT , 1.0, 1.0, 1.0, 1.0)
	sasl.gl.drawText(fnt , 20, 590, "ALT AGL m ............ " .. rounding_int(get(sim_alt_agl)), 20, false , false , TEXT_ALIGN_LEFT , 1.0, 1.0, 1.0, 1.0)
	sasl.gl.drawText(fnt , 20, 560, "HEADING mag .......... " .. rounding_int(get(sim_heading_mag)), 20, false , false , TEXT_ALIGN_LEFT , 1.0, 1.0, 1.0, 1.0)
	
	sasl.gl.drawText(fnt , 20, 510, "PITCH ....... " .. rounding(get(sim_pitch)), 20, false , false , TEXT_ALIGN_LEFT , 1.0, 1.0, 1.0, 1.0)
	sasl.gl.drawText(fnt , 20, 480, "ROLL ........ " .. rounding(get(sim_roll)), 20, false , false , TEXT_ALIGN_LEFT , 1.0, 1.0, 1.0, 1.0)
	sasl.gl.drawText(fnt , 20, 450, "BETA ..... " .. rounding(get(sim_beta)), 20, false , false , TEXT_ALIGN_LEFT , 1.0, 1.0, 1.0, 1.0)
	  
   -- sasl.gl.drawText(fnt , 20, 20, "MODE:   " .. mode_type, 20, false , false , TEXT_ALIGN_LEFT , 1.0, 1.0, 1.0, 1.0)

	
end


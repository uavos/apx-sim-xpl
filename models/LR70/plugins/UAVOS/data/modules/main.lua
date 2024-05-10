
createGlobalPropertyi("uavos/pump1_switch", 1)
createGlobalPropertyi("uavos/pump2_switch", 1)
createGlobalPropertyf("uavos/pump1_value", 0)
createGlobalPropertyf("uavos/pump2_value", 0)
createGlobalPropertyf("uavos/clutch_value", 0)
createGlobalPropertyf("uavos/bat_value", 0)
createGlobalPropertyi("uavos/bat_on",1)

defineProperty("sim_frametime", globalPropertyf("sim/operation/misc/frame_rate_period"))
defineProperty("sim_engine_rpm", globalPropertyfa("sim/cockpit2/engine/indicators/engine_speed_rpm"))
defineProperty("sim_fuel_cutoff", globalPropertyf("sim/cockpit2/engine/actuators/mixture_ratio_all"))
defineProperty("sim_clutch_ratio", globalPropertyf("sim/cockpit2/switches/clutch_ratio"))
defineProperty("pump1_switch", globalPropertyi("uavos/pump1_switch"))
defineProperty("pump2_switch", globalPropertyi("uavos/pump2_switch"))
defineProperty("pump1_value", globalPropertyf("uavos/pump1_value"))
defineProperty("pump2_value", globalPropertyf("uavos/pump2_value"))
defineProperty("clutch_value", globalPropertyf("uavos/clutch_value"))
defineProperty("sim_bat_v", globalPropertyfa("sim/cockpit2/electrical/battery_voltage_actual_volts"))
defineProperty("sim_bat_on", globalPropertyi("sim/cockpit/electrical/battery_on"))
defineProperty("bat_value", globalPropertyf("uavos/bat_value"))
defineProperty("bat_on", globalPropertyi("uavos/bat_on"))

f_press = 0
pump1_press = 3
pump2_press = 0


function update()

	--FRAME RATE CORRECTION
	frame_rate = get(sim_frametime) * 30 -- 1 when 30FPS
	if frame_rate < 0.2 then frame_rate = 0.2 end
	if frame_rate > 2 then frame_rate = 2 end
	
	
	--CLUTCH. FROM 5000 to 6000 RPM
	rpm = get(sim_engine_rpm, 1)
		
	if rpm >= 5000 and rpm <= 6000 then
		set(sim_clutch_ratio, (rpm - 5000) * 0.001)
	elseif rpm > 6000 then
		set(sim_clutch_ratio, 1)
	elseif rpm < 5000 then
		set(sim_clutch_ratio, 0)
	end
	
	set(clutch_value, get(sim_clutch_ratio))
	
	
	--BATTERY
	set(sim_bat_on, get(bat_on))
	set(bat_value, get(sim_bat_v, 1))

	
	--PUMPS
	f_press = pump1_press + pump2_press
	
	--pump1
	if get(pump1_switch) > 0 and get(sim_bat_on) > 0 then
		if get(sim_bat_v, 1) >= 22 then
			pump1_press = 3
		else
			pump1_press = get(sim_bat_v, 1) * 0.04545
		end
	else
		pump1_press = 0
	end
	
	--pump2
	if get(pump2_switch) > 0 and get(sim_bat_on) > 0 and pump1_press < 2 then
		if get(sim_bat_v, 1) >= 20 then
			pump2_press = 3
		else
			pump2_press = get(sim_bat_v, 1) * 0.05
		end
	else
		pump2_press = 0
	end	


	--PUMP FUEL CUTOFF
	if f_press < 2 then
		set(sim_fuel_cutoff, 0)
	else
		set(sim_fuel_cutoff, 1)
	end
	
	--PUMPS VALUE TO REFS
	set(pump1_value, pump1_press)
	set(pump2_value, pump2_press)

end
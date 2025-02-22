size = { 2048, 2048 }



createGlobalPropertyf("uavos/ail_l", 0)
createGlobalPropertyf("uavos/ail_r", 0)
createGlobalPropertyf("uavos/stab_l", 0)
createGlobalPropertyf("uavos/stab_r",0)
createGlobalPropertyf("uavos/flap_l", 0)
createGlobalPropertyf("uavos/flap_r", 0)
createGlobalPropertyi("uavos/launch", 0)
--createGlobalPropertyi("uavos/parachute", 0)
createGlobalPropertyi("uavos/on_catapult", 0)

components = {
	
	fltcontrols{},
	
}




aero_panel = subpanel {

    position = { 50, 100, 400, 700};
    noBackground = true;
	visible = false;
	noClose = false;
	noMove = false;
	savePosition = true;
	noResize = true;
    
    description = "GRAPH";
	components = {
		data_aero{};
    };

}



panels_on_panel = subpanel {

    position = { 0, 0, 50, 50};
    noBackground = true;
	visible = true;
	noClose = true;
	noMove = true;
	savePosition = true;
	noResize = true;
    
    description = "GRAPH";
	components = {
		show_panels{};
    };


}


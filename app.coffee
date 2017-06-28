Framer.Device.deviceType = "fullscreen"	
Create_New_Session_Toggle.states.ToggleHover =
	shadowX: 0
	shadowBlur: 20
	shadowSpread: 0
	shadowColor: "rgba(0,0,0,0.19)"
	shadowY: 6

Create_New_Session_Toggle.states.ToggleResting =
	shadowX: 0
	shadowBlur: 0
	shadowSpread: 0
	shadowY: 0
	scale: 1

Create_New_Session_Toggle.onMouseOver (event, layer) -> Create_New_Session_Toggle.stateSwitch ("ToggleHover")

Create_New_Session_Toggle.onMouseOut (event, layer) -> Create_New_Session_Toggle.stateSwitch("ToggleResting")
	

# Create layers
SD_screen = Sessions_Dasbhoard

Sesh_screen = Session

# Set up FlowComponent
flow = new FlowComponent
flow.showNext(SD_screen)

# Switch on click
Create_New_Session_Toggle.onClick ->
	flow.showNext(Sesh_screen)


Previous_Breadcrumb.onClick ->
	flow.showPrevious(Sesh_screen)
ease_in = "cubic-bezier(0.9, 0, 0.8, 0.9)"
ease_in_out = "cubic-bezier(0.25, 0.0, 0.16, 1)"


Framer.Defaults.Animation =
	curve : ease_in_out
	time : 0.4

BG = new BackgroundLayer
	backgroundColor : "rgba(255,255,255,1)"

circle_01 = new Layer
	width : 200, height : 200
	backgroundColor : "rgba(73,181,255,1)"
	y : 100

circle_01.borderRadius = circle_01.width/2	
circle_01.centerX(0)

line_top = new Layer
	width : 80, height : 10
	borderRadius : 30
	backgroundColor : "rgba(255,255,255,1)"
	superLayer : circle_01
line_top.centerX(0)
line_top.centerY(-24)
line_top.originX = 0
line_top.originY = 0

line_center = new Layer
	width : 80, height : 10
	borderRadius : 30
	backgroundColor : "rgba(255,255,255,1)"
	superLayer : circle_01
line_center.centerX(0)
line_center.centerY(0)

line_bottom = new Layer
	width : 80, height : 10
	borderRadius : 30
	backgroundColor : "rgba(255,255,255,1)"
	superLayer : circle_01
line_bottom.centerX(0)
line_bottom.centerY(24)
line_bottom.originX = 0
line_bottom.originY = 1

line_top.states.add
	second : {width : 50, rotationZ : -45, y : line_top.y + 26}
line_bottom.states.add
	second : {width : 50, rotationZ : 45, y : line_bottom.y - 26}
circle_01.states.add
	second : {rotationZ : 360 }

circle_01.on Events.Click,(events, layer) ->
		line_top.states.next()
		line_bottom.states.next()
		circle_01.states.next()
					
# check on/off ------------------------------------------------------#

check_off = new Layer
	y : circle_01.maxY + 100
	width : 100, height : 100
	backgroundColor : "rgba(0,0,0,0.24)"
check_off.borderRadius = check_off.width/2

check_off_in = new Layer
	width : check_off.width-6, height : check_off.height-6
	backgroundColor : "rgba(255,255,255,1)"
	superLayer : check_off
check_off_in.borderRadius = check_off_in.width/2
check_off_in.center()

check_on = new Layer
	width : 100, height : 100
	backgroundColor : "rgba(73,181,255,1)"
	superLayer : check_off
check_on.borderRadius = check_on.width/2
check_on.originX = 0.5
check_on.originY = 0.5
check_on.scale = 0
check_on.center()

chline_short = new Layer
	width : 20, height : 8
	backgroundColor : "rgba(255,255,255,1)"
	rotationZ : 45
	superLayer : check_off
chline_short.borderRadius = chline_short.width/2
chline_short.originX = 0
chline_short.originY = 0
chline_short.width = 0

chline_long = new Layer
	width : 50, height : 8
	backgroundColor : "rgba(255,255,255,1)"
	rotationZ : -45
	superLayer : check_off
chline_long.borderRadius = chline_long.width/2
chline_long.originX = 0
chline_long.originY = 0
chline_long.width = 0
	
chline_short.centerX(28)
chline_short.centerY(0)

chline_long.centerX(41)
chline_long.centerY(19)

check_off.centerX(0)
check_off.clip = false

chline_short.states.add
	second : { width : 30 }

chline_long.states.add
	second : { width : 50}
check_on.states.add
	second : {scale : 1}
	
check_on.states.animationOptions = 
		curve: "spring(100, 10, 5)"

	
check_off.on Events.Click,(events, layer) ->
	check_on.visible = true
	check_on.states.next()
	Utils.delay 0.2,->
		chline_short.states.next()
		Utils.delay 0.2,->
			chline_long.states.next()
	check_on.on Events.Click, (events, layer) ->
		check_on.visible = false

	




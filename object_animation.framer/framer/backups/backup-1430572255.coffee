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

circle_01.borderRadius = circle_01.width/2	
circle_01.center()


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
	second : {rotationZ : 360}

circle_01.on Events.Click,(events, layer) ->
		line_top.states.next()
		line_bottom.states.next()
		circle_01.states.next()
			

	


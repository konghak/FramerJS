ease_in = "cubic-bezier(0.9, 0, 0.8, 0.9)"
ease_in_out = "cubic-bezier(0.25, 0.0, 0.16, 1)"


Framer.Defaults.Animation =
	curve : ease_in_out
	time : 0.4

BG = new BackgroundLayer
	backgroundColor : "rgba(255,255,255,1)"

circle = new Layer
	width : 200, height : 200
	backgroundColor : "rgba(73,181,255,1)"

circle.borderRadius = circle.width/2	
circle.center()


line_top = new Layer
	width : 80, height : 10
	borderRadius : 30
	backgroundColor : "rgba(255,255,255,1)"
	superLayer : circle
line_top.centerX(0)
line_top.centerY(-24)
line_top.originX = 0
line_top.originY = 0

line_center = new Layer
	width : 80, height : 10
	borderRadius : 30
	backgroundColor : "rgba(255,255,255,1)"
	superLayer : circle
line_center.centerX(0)
line_center.centerY(0)

line_bottom = new Layer
	width : 80, height : 10
	borderRadius : 30
	backgroundColor : "rgba(255,255,255,1)"
	superLayer : circle
line_bottom.centerX(0)
line_bottom.centerY(24)
line_bottom.originX = 0
line_bottom.originY = 1

line_top.states.add
	stateA : {width : 80, rotationZ : 0}
	stateB : {width : 50, rotationZ : -45, y : line_top.y + 26}

circle.on Events.Click,(events, layer) ->
		line_top.states.next()
				
		line_bottom.animate
			properties :
				rotationZ : 45
				y : line_bottom.y - 26
				width : 50


layerA = new Layer()
# layerA.name = "Layer A"

clickHandler = (event, layer) ->
    print "This layer was clicked", layer.name

layerA.on(Events.Click, clickHandler)
# layerA.off(Events.Click, clickHandler)
	


ease_in = "cubic-bezier(0.9, 0, 0.8, 0.9)"
ease_in_out = "cubic-bezier(0.25, 0.0, 0.16, 1)"

modules_01 = require "button_ani"

Framer.Defaults.Animation =
	curve : ease_in_out
	time : 0.3

BG = new BackgroundLayer
	backgroundColor : "rgba(255,255,255,1)"

circle_01 = new Layer
	width : 120, height : 120
	backgroundColor : "rgba(73,181,255,1)"
	y : 100

circle_01.borderRadius = circle_01.width/2	
circle_01.centerX(0)

line_top = new Layer
	width : 70, height : 8
	borderRadius : 30
	backgroundColor : "rgba(255,255,255,1)"
	superLayer : circle_01
line_top.centerX(0)
line_top.centerY(-20)
line_top.originX = 0
line_top.originY = 0

line_center = new Layer
	width : 70, height : 8
	borderRadius : 30
	backgroundColor : "rgba(255,255,255,1)"
	superLayer : circle_01
line_center.centerX(0)
line_center.centerY(0)

line_bottom = new Layer
	width : 70, height : 8
	borderRadius : 30
	backgroundColor : "rgba(255,255,255,1)"
	superLayer : circle_01
line_bottom.centerX(0)
line_bottom.centerY(20)
line_bottom.originX = 0
line_bottom.originY = 1

line_top.states.add
	second : {width : 40, rotationZ : -45, y : line_top.y + 22}
line_bottom.states.add
	second : {width : 40, rotationZ : 45, y : line_bottom.y - 22}
circle_01.states.add
	second : {rotationZ : 360 }

circle_01.on Events.Click,(events, layer) ->
		line_top.states.next()
		line_bottom.states.next()
		circle_01.states.next()
					
# check on/off ------------------------------------------------------#
check_text = new Layer
	y : circle_01.maxY + 220
	backgroundColor : "transparent"

check_text.centerX(0)
check_text.html = "check"
check_text.style.color = "rgba(0,0,0,0.87)"
check_text.style.textAlign = "center"


check_container = new Layer
	y : circle_01.maxY + 100
	width : 100, height : 100
	backgroundColor : "transparent"
check_container.centerX(0)

check_off = new Layer
	width : 100, height : 100
	backgroundColor : "rgba(255,255,255,1)"
	borderColor : "rgba(0,0,0,0.24)"
	borderWidth : 3
	superLayer : check_container
check_off.borderRadius = check_off.width/2

check_on = new Layer
	width : 100, height : 100
	backgroundColor : "rgba(73,181,255,1)"
	superLayer : check_container
check_on.borderRadius = check_on.width/2
check_on.originX = 0.5
check_on.originY = 0.5
check_on.scale = 0
check_on.center()

chline_short = new Layer
	width : 20, height : 8
	backgroundColor : "rgba(255,255,255,1)"
	rotationZ : 45
	superLayer : check_on
chline_short.borderRadius = chline_short.width/2
chline_short.originX = 0
chline_short.originY = 0
chline_short.width = 0

chline_long = new Layer
	width : 50, height : 8
	backgroundColor : "rgba(255,255,255,1)"
	rotationZ : -45
	superLayer : check_on
chline_long.borderRadius = chline_long.width/2
chline_long.originX = 0
chline_long.originY = 0
chline_long.width = 0
	
chline_short.centerX(28)
chline_short.centerY(0)

chline_long.centerX(41)
chline_long.centerY(19)

check_container.clip = false

chline_short.states.add
	second : { width : 30 }

chline_long.states.add
	second : { width : 50}

chline_short.animationOptions = 
	curve : ease_in
	time : 0.2
chline_short.animationOptions = 
	curve : ease_in
	time : 0.2
	
check_off.on Events.Click,(events, layer) ->
	check_on.animate
		properties :
			scale : 1
		curve : "spring(160, 12, 5)"
		
	Utils.delay 0.1,->
		chline_short.states.next()	
		
		Utils.delay 0.2,->
			chline_long.states.next()


check_on.on Events.Click, (events, layer) ->
	check_on.animate
		properties :
			scale : 0
		time : 0.1
	chline_short.states.next()
	chline_long.states.next()


# tag plus/min ------------------------------------------------------#
tagplus_container = new Layer
	y : check_container.maxY + 100
	width : 100, height : 100
	backgroundColor : "transparent"
tagplus_container.centerX(-70)

tagplus_text = new Layer
	y : tagplus_container.maxY+15
	backgroundColor : "transparent"

tagplus_text.centerX(0)
tagplus_text.html = "tag_add"
tagplus_text.style.color = "rgba(0,0,0,0.87)"
tagplus_text.style.textAlign = "center"

tagplus_off = new Layer
	width : 100, height : 100
	backgroundColor : "rgba(73,181,255,1)"
	superLayer : tagplus_container
tagplus_off.borderRadius = check_off.width/2

tagplus_off_in = new Layer
	width : tagplus_off.width-6, height : tagplus_off.height-6
	backgroundColor : "rgba(255,255,255,1)"
	superLayer : tagplus_off
tagplus_off_in.borderRadius = tagplus_off_in.width/2
tagplus_off_in.center()

plline_ver = new Layer
	width : 50, height : 6
	backgroundColor : "rgba(73,181,255,1)"
	rotationZ : 0
	superLayer : tagplus_off_in
plline_ver.borderRadius = plline_ver.width/2
plline_ver.center()

plline_hor = new Layer
	width : 50, height : 6
	backgroundColor : "rgba(73,181,255,1)"
	rotationZ : 90
	superLayer : tagplus_off_in
plline_hor.borderRadius = plline_hor.width/2
plline_hor.center()

tagplus_on = new Layer
	width : 100, height : 100
	backgroundColor : "rgba(73,181,255,1)"
	superLayer : tagplus_container
tagplus_on.borderRadius = tagplus_on.width/2
tagplus_on.originX = 0.5
tagplus_on.originY = 0.5
tagplus_on.scale = 0
tagplus_on.center()

tagchline_short = new Layer
	width : 20, height : 8
	backgroundColor : "rgba(255,255,255,1)"
	rotationZ : 45
	superLayer : tagplus_on
tagchline_short.borderRadius = tagchline_short.width/2
tagchline_short.originX = 0
tagchline_short.originY = 0
tagchline_short.width = 0

tagchline_long = new Layer
	width : 50, height : 8
	backgroundColor : "rgba(255,255,255,1)"
	rotationZ : -45
	superLayer : tagplus_on
tagchline_long.borderRadius = tagchline_long.width/2
tagchline_long.originX = 0
tagchline_long.originY = 0
tagchline_long.width = 0
	
tagchline_short.centerX(28)
tagchline_short.centerY(0)

tagchline_long.centerX(41)
tagchline_long.centerY(19)

tagplus_container.clip = false

tagplus_off_in.states.add
	second : { rotationZ : 180 }
tagchline_short.states.add
	second : { width : 30 }

tagchline_long.states.add
	second : { width : 50}
	
tagchline_short.animationOptions = 
	curve : ease_in
tagchline_long.animationOptions = 
	curve : ease_in


	
tagplus_off.on Events.Click,(events, layer) ->
	tagplus_on.visible = true
	tagplus_off_in.states.next()
	tagplus_on.animate
		properties :
			scale : 1
		curve : "spring(160, 12, 5)"
		time : 0.1
	Utils.delay 0.1,->
		tagchline_short.states.next()
		Utils.delay 0.2,->
			tagchline_long.states.next()


tagplus_on.on Events.Click, (events, layer) ->
	tagplus_on.animate
		properties :
			scale : 0
		time : 0.1
	tagplus_off_in.states.next()
	tagchline_short.states.next()
	tagchline_long.states.next()
	
# tag_02 plus/min ------------------------------------------------------#
tagplus_02_container = new Layer
	y : check_container.maxY + 100
	width : 100, height : 100
	backgroundColor : "transparent"
tagplus_02_container.centerX(70)

tagplus_02_off = new Layer
	width : 100, height : 100
	backgroundColor : "rgba(73,181,255,1)"
	superLayer : tagplus_02_container
tagplus_02_off.borderRadius = check_off.width/2

tagplus_02_off_in = new Layer
	width : tagplus_02_off.width-6, height : tagplus_02_off.height-6
	backgroundColor : "rgba(255,255,255,1)"
	superLayer : tagplus_02_off
tagplus_02_off_in.borderRadius = tagplus_02_off_in.width/2
tagplus_02_off_in.center()

plline_02_ver = new Layer
	width : 50, height : 6
	backgroundColor : "rgba(73,181,255,1)"
	rotationZ : 0
	superLayer : tagplus_02_off
plline_02_ver.borderRadius = plline_02_ver.width/2
plline_02_ver.center()

plline_02_hor = new Layer
	width : 50, height : 6
	backgroundColor : "rgba(73,181,255,1)"
	rotationZ : 90
	superLayer : tagplus_02_off
plline_02_hor.borderRadius = plline_02_hor.width/2
plline_02_hor.center()

tagplus_02_on = new Layer
	width : 100, height : 100
	backgroundColor : "transparent"
	superLayer : tagplus_02_container
tagplus_02_on.borderRadius = tagplus_02_on.width/2

tagchline_02_short = new Layer
	width : 20, height : 8
	backgroundColor : "rgba(255,255,255,1)"
	rotationZ : 45
	superLayer : tagplus_02_on
tagchline_02_short.borderRadius = tagchline_02_short.width/2
tagchline_02_short.originX = 0
tagchline_02_short.originY = 0
tagchline_02_short.width = 0

tagchline_02_long = new Layer
	width : 50, height : 8
	backgroundColor : "rgba(255,255,255,1)"
	rotationZ : -45
	superLayer : tagplus_02_on
tagchline_02_long.borderRadius = tagchline_02_long.width/2
tagchline_02_long.originX = 0
tagchline_02_long.originY = 0
tagchline_02_long.width = 0
	
tagchline_02_short.centerX(28)
tagchline_02_short.centerY(0)

tagchline_02_long.centerX(41)
tagchline_02_long.centerY(19)

tagplus_02_container.clip = false

tagplus_02_off.states.add
	second : { rotationZ : 180 }

tagplus_02_off_in.states.add
	second : { scale : 0 }
	
tagchline_02_short.states.add
	second : { width : 30 }

tagchline_02_long.states.add
	second : { width : 50}

tagplus_02_condition = -1
tagplus_02_off.on Events.Click,(events, layer) ->
	tagplus_02_condition = -tagplus_02_condition
	if tagplus_02_condition == 1
		tagchline_02_short.visible = true
		tagchline_02_long.visible = true
		tagplus_02_off.states.next()
		tagplus_02_off_in.states.next()
		Utils.delay 0.15,->
			tagchline_02_short.states.next()
			Utils.delay 0.25,->
				tagchline_02_long.states.next()
	else if tagplus_02_condition == -1
		tagchline_02_short.visible = false
		tagchline_02_long.visible = false
		tagplus_02_off.states.next()
		tagplus_02_off_in.states.next()
		tagchline_02_short.states.next()
		tagchline_02_long.states.next()

# text
tagplus_02_text = new Layer
	y : tagplus_02_container.maxY+15
	backgroundColor : "transparent"

tagplus_02_text.centerX(0)
tagplus_02_text.html = "tag_add"
tagplus_02_text.style.color = "rgba(0,0,0,0.87)"
tagplus_02_text.style.textAlign = "center"

	
# radio on/off ------------------------------------------------------#
radio_container = new Layer
	y : tagplus_container.maxY + 100
	width : 100, height : 100
	backgroundColor : "transparent"
radio_container.centerX(0)

radio_text = new Layer
	y : radio_container.maxY+10
	backgroundColor : "transparent"

radio_text.centerX(0)
radio_text.html = "radio"
radio_text.style.color = "rgba(0,0,0,0.87)"
radio_text.style.textAlign = "center"

radio_off = new Layer
	width : 100, height : 100
	backgroundColor : "white"
	borderColor : "rgba(0,0,0,0.24)"
	borderWidth : 3
	superLayer : radio_container
radio_off.borderRadius = radio_off.width/2



radio_on = new Layer
	width : 100, height : 100
	backgroundColor : "rgba(73,181,255,1)"
	superLayer : radio_container
radio_on.borderRadius = radio_on.width/2
radio_on.originX = 0.5
radio_on.originY = 0.5
radio_on.scale = 0
radio_on.center()

radio_container.clip = false
radio_off.states.add
	second : {borderWidth : 8}


	
radio_off.on Events.Click,(events, layer) ->
	radio_off.borderColor = "rgba(73,181,255,1)"
	radio_on.animate
		properties :
			scale : 0.5
		curve : "spring(160, 12, 5)"
		time : 0.1
	radio_off.states.next()

radio_on.on Events.Click, (events, layer) ->
	radio_off.borderColor = "rgba(0,0,0,0.25)"
	radio_on.animate
		properties :
			scale : 0
		time : 0.1
	radio_off.states.next()
	
		
# toggle on/off ------------------------------------------------------#

toggle_container = new Layer
	y : radio_container.maxY + 100
	width : 180, height : 60
	backgroundColor : "transparent"
toggle_container.centerX(0)

toggle_text = new Layer
	y : toggle_container.maxY+15
	backgroundColor : "transparent"

toggle_text.centerX(0)
toggle_text.html = "toggle"
toggle_text.style.color = "rgba(0,0,0,0.87)"
toggle_text.style.textAlign = "center"


toggle_line = new Layer
	width : toggle_container.width-30, height : 6
	backgroundColor : "rgba(1,1,1,0.24)"
	superLayer : toggle_container
toggle_line.borderRadius = toggle_line.width/2
toggle_line.center()

toggle_line_blue = new Layer
	width : toggle_container.width-30, height : 6
	backgroundColor : "rgba(73,181,255,1)"
	superLayer : toggle_container
	opacity : 0
toggle_line_blue.borderRadius = toggle_line_blue.width/2
toggle_line_blue.center()

toggle_picker = new Layer
	height : 60, width : 60
	backgroundColor : "transparent"
	superLayer : toggle_container
toggle_picker.borderRadius = toggle_picker.width/2

toggle_out = new Layer
	height : 60, width : 60
	backgroundColor : "rgba(1,1,1,0.5)"
	superLayer : toggle_picker
toggle_out.borderRadius = toggle_out.width/2

toggle_in = new Layer
	height : toggle_picker.width-6, width : toggle_picker.width-6
	backgroundColor : "rgba(255,255,255,1)"
	superLayer : toggle_out
toggle_in.borderRadius = toggle_in.width/2
toggle_in.center()

toggle_picker.states.add
	second : { x : toggle_container.width - toggle_picker.width }
toggle_in.states.add
	second : { scale : 0}
toggle_out.states.add
	second : { backgroundColor : "rgba(73,181,255,1)"}
toggle_line_blue.states.add
	second : { opacity : 1 }	

condition = "0"
toggle_picker.on Events.Click, (events, layer) ->
	toggle_picker.states.next()
	toggle_line_blue.states.next()
	
	if condition == "0"
		toggle_in.states.next()
		toggle_out.states.next()
		condition = "1"
	else if condition == "1"
		toggle_in.states.next()
		Utils.delay 0.3, ->
			toggle_out.states.next()
			condition = "0"
			

# numadd ------------------------------------------------------#

numadd_container = new Layer
	y : toggle_container.maxY + 100
	width : 100, height : 100
	backgroundColor : "rgba(73,181,255,1)"
numadd_container.borderRadius = numadd_container.width/2
numadd_container.centerX(-70)

numadd_off = new Layer
	width : 100, height : 100
	backgroundColor : "transparent"
	superLayer : numadd_container
numadd_off.borderRadius = check_off.width/2

numline_ver = new Layer
	width : 50, height : 6
	backgroundColor : "rgba(255,255,255,1)"
	rotationZ : 0
	superLayer : numadd_off
numline_ver.borderRadius = numline_ver.width/2
numline_ver.center()

numline_hor = new Layer
	width : 50, height : 6
	backgroundColor : "rgba(255,255,255,1)"
	rotationZ : 90
	superLayer : numadd_off
numline_hor.borderRadius = numline_hor.width/2
numline_hor.center()
	
favori_off = new Layer
	width : 100, height : 100
	backgroundColor : "transparent"
	image : "images/btn_favori_off.png"
	scale : 0.5
 

modules_01.flipCard(numadd_off, favori_off ,1600, "spring(300,40,10)", 0, 0, numadd_container)

numadd_text = new Layer
	y : numadd_container.maxY+15
	width : 720
	backgroundColor : "transparent"

numadd_text.centerX(0)
numadd_text.html = "num_add / favori"
numadd_text.style.color = "rgba(0,0,0,0.87)"
numadd_text.style.textAlign = "center"

# favri ------------------------------------------------------#

favori_container = new Layer
	y : toggle_container.maxY + 100
	width : 100, height : 100
	backgroundColor : "rgba(73,181,255,1)"
favori_container.borderRadius = favori_container.width/2
favori_container.centerX(70)

favori = new Layer
	width : 100, height : 100
	backgroundColor : "transparent"
	superLayer : favori_container
	
favori_off_ = new Layer
	width : 100, height : 100
	backgroundColor : "transparent"
	image : "images/btn_favori_off.png"
	superLayer : favori
	scale : 0.5
 
favori_on = new Layer
	width : 100, height : 100
	backgroundColor : "transparent"
	image : "images/btn_favori_on.png"
	superLayer : favori
	opacity : 0
	scale : 0
favori_on.visible = false

favori_count = 1
favori_container.on Events.Click, (events, layer) ->
	favori_on.visible = true
	favori_count = -favori_count
	if favori_count == -1
		favori_on.animate
			properties : 
				opacity : 1
				scale : 0.5
			curve : "spring(340,15,10)"
			time : 0.4
	else if favori_count == 1
		favori_on.animate
			properties : 
				opacity : 0
				scale : 0		
			time : 0.2







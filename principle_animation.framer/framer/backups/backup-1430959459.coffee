Framer.Device.deviceType = "fullscreen"

ease_in_out = "cubic-bezier(0.25, 0.0, 0.16, 1)"
ease_in = "cubic-bezier(0.9, 0.1, 0.8, 0.9)"
spring = "spring(160, 12, 5)"
time = 0.6

BG = new BackgroundLayer
	backgroundColor : "rgba(255,255,255,1)"



Framer.Defaults.Animation =
	curve : ease_in_out
	time : time


scroll = new ScrollComponent
    width: Screen.width, height: Screen.height
    
scroll.scrollHorizontal = false

box_full = new Layer
	width : Screen.width, height : Screen.height
	backgroundColor : "transparent"
	superLayer : scroll.content



time_text = new Layer
	width : 520, height : 100
	backgroundColor : "rgba(255,255,255,1)"
	superLayer : box_full
	x : 50
time_text.html = "Default-time : " + time
time_text.style.color = "rgba(0,0,0,1)"
time_text.style.paddingTop = "23px"

circle_01 = new Layer
	width : 80, height : 80
	backgroundColor : "rgba(73,181,255,1)"
	x : 50
	superLayer : box_full
circle_01.borderRadius = circle_01.width/2	

circle_02=circle_01.copy()
circle_03=circle_01.copy()
circle_02.superLayer = box_full
circle_03.superLayer = box_full

circle_01.y = 100
circle_02.y = circle_01.y + 110
circle_03.y = circle_02.y + 110

circle_01.states.add
	second : x : Screen.width - (circle_01.width + 50)
circle_01.states.animationOptions =
	curve : ease_in_out
circle_01.html = "감속"
circle_01.style.textAlign = "center"
circle_01.style.paddingTop = "27px"
		
circle_02.states.add
	second : x : Screen.width - (circle_02.width + 50)
circle_02.states.animationOptions =
	curve : ease_in
circle_02.html = "가속"
circle_02.style.textAlign = "center"
circle_02.style.paddingTop = "27px"
		
circle_03.states.add
	second : x : Screen.width - (circle_03.width + 50)
circle_03.states.animationOptions =
	curve : spring
circle_03.html = "탄성"
circle_03.style.textAlign = "center"
circle_03.style.paddingTop = "27px"


go_speed = new Layer
	width : 120, height : 50	
	backgroundColor : "rgba(73,181,255,1)"
	superLayer : box_full
go_speed.centerX(0)
go_speed.y = circle_03.maxY + 50

go_speed.html = "speed"
go_speed.style.textAlign = "center"
go_speed.style.paddingTop = "10px"

go_speed.on Events.Click, (Events, layer) ->
	circle_01.states.next()
	circle_02.states.next()
	circle_03.states.next()


line_01 = new Layer
	width : Screen.width - 60, height : 2
	y : go_speed.maxY + 50
	superLayer : box_full
	backgroundColor : "rgba(0,0,0,0.1)"
line_01.centerX(0)


# page interaction -----------------------------------------------------
bg_box = new Layer
	width : Screen.width - 60, height : 400
	y : line_01.maxY + 50
	backgroundColor : "red"
	superLayer : box_full
bg_box.centerX(0)


#left-right
case_01_bg = new Layer
	width : 120, height : 160
	backgroundColor : "rgba(0,0,0,1)"
	superLayer : bg_box

case_01_page_lv1 = new Layer
	width : 120, height : 160
	backgroundColor : "rgba(200,200,200,1)"
	superLayer : case_01_bg
	
case_01_page_lv2 = new Layer
	width : 120, height : 160
	x : case_01_page_lv1.width
	backgroundColor : "rgba(225,225,225,1)"
	superLayer : case_01_bg
	
#top-down
case_02_bg = new Layer
	width : 120, height : 160
	x : case_01_bg.maxX + 20 
	backgroundColor : "rgba(0,0,0,1)"
	superLayer : bg_box

case_02_page_lv1 = new Layer
	width : 120, height : 160
	backgroundColor : "rgba(200,200,200,1)"
	superLayer : case_02_bg
	
case_02_page_lv2 = new Layer
	width : 120, height : 160
	y : case_02_page_lv1.height
	backgroundColor : "rgba(225,225,225,1)"
	superLayer : case_02_bg

#half-top-down
case_03_bg = new Layer
	width : 120, height : 160
	x : case_02_bg.maxX + 20 
	backgroundColor : "rgba(0,0,0,1)"
	superLayer : bg_box

case_03_page_lv1 = new Layer
	width : 120, height : 160
	backgroundColor : "rgba(200,200,200,1)"
	superLayer : case_03_bg
	
case_03_page_dim = new Layer
	width : 120, height : 160
	backgroundColor : "rgba(0,0,0,1)"
	superLayer : case_03_bg
	opacity : 0
	
case_03_page_lv2 = new Layer
	width : 120, height : 160
	y : case_03_page_lv1.height
	backgroundColor : "rgba(225,225,225,1)"
	superLayer : case_03_bg
	
#slide-menu	
case_04_bg = new Layer
	width : 120, height : 160
	x : case_03_bg.maxX + 20 
	backgroundColor : "rgba(0,0,0,1)"
	superLayer : bg_box

case_04_page_lv1 = new Layer
	width : 120, height : 160
	backgroundColor : "rgba(200,200,200,1)"
	superLayer : case_04_bg
	
case_04_page_dim = new Layer
	width : 120, height : 160
	backgroundColor : "rgba(0,0,0,1)"
	superLayer : case_04_bg
	opacity : 0

case_04_page_lv2 = new Layer
	width : 120, height : 160
	x : -case_04_bg.width
	backgroundColor : "rgba(225,225,225,1)"
	superLayer : case_04_bg
	
	
#bottom_sheets
case_05_bg = new Layer
	width : 120, height : 160
	x : case_04_bg.maxX + 20 
	backgroundColor : "rgba(0,0,0,1)"
	superLayer : bg_box

case_05_page_lv1 = new Layer
	width : 120, height : 160
	backgroundColor : "rgba(200,200,200,1)"
	superLayer : case_05_bg
	
case_05_page_dim = new Layer
	width : 120, height : 160
	backgroundColor : "rgba(0,0,0,1)"
	superLayer : case_05_bg
	opacity : 0

case_05_page_lv2 = new Layer
	width : 120, height : 40
	y : case_05_bg.height
	backgroundColor : "rgba(225,225,225,1)"
	superLayer : case_05_bg

#popup
case_06_bg = new Layer
	width : 120, height : 160
	x : case_05_bg.maxX + 20 
	backgroundColor : "rgba(0,0,0,1)"
	superLayer : bg_box

case_06_page_lv1 = new Layer
	width : 120, height : 160
	backgroundColor : "rgba(200,200,200,1)"
	superLayer : case_06_bg
	
case_06_page_dim = new Layer
	width : 120, height : 160
	backgroundColor : "rgba(0,0,0,1)"
	superLayer : case_06_bg
	opacity : 0

case_06_page_lv2 = new Layer
	width : 60, height : 40
	backgroundColor : "rgba(225,225,225,1)"
	opacity : 0
	superLayer : case_06_bg
case_06_page_lv2.centerX(0)
case_06_page_lv2.centerY(20)

#popup
case_07_bg = new Layer
	width : 120, height : 160
	y : case_01_bg.maxY + 50 
	backgroundColor : "rgba(0,0,0,1)"
	superLayer : bg_box

case_07_page_lv1 = new Layer
	width : 120, height : 160
	backgroundColor : "rgba(200,200,200,1)"
	superLayer : case_07_bg

case_07_page_lv2 = new Layer
	width : 120, height : 160
	y : case_07_bg.height
	backgroundColor : "transparent"
	opacity : 1
	superLayer : case_07_bg
case_07_page_lv2_01 = new Layer
	width : 120, height : 60
	backgroundColor : "rgba(73,181,255,1)"
	superLayer : case_07_page_lv2
case_07_page_lv2_02 = new Layer
	width : 120, height : 120
	y : case_07_page_lv2_01.height
	backgroundColor : "rgba(225,225,225,1)"
	superLayer : case_07_page_lv2
case_07_page_lv2_03 = new Layer
	width : 120, height : 120
	y : case_07_bg.height
	backgroundColor : "rgba(240,240,240,1)"
	superLayer : case_07_page_lv2


	
# action-bottom
go_page = go_speed.copy()
go_page.superLayer = box_full

go_page.centerX(0)
go_page.y = bg_box.maxY + 50

go_page.html = "page"
go_page.style.textAlign = "center"
go_page.style.paddingTop = "10px"


go_page_condition = -1
go_page.on Events.Click, (Events, layer) ->
	go_page_condition = -go_page_condition

	# left-right
	if go_page_condition == 1	
		case_01_page_lv1.animate
			properties :
				scale : 0.9
			curve : ease_in
			time : time/1.5
		case_01_page_lv2.animate
			properties :
				x : 0
	else if go_page_condition == -1
		case_01_page_lv1.animate
			properties :
				scale : 1
		case_01_page_lv2.animate
			properties :
				x : case_01_page_lv1.width
			curve : ease_in
			time : time/1.5
	
	# top-down
	if go_page_condition == 1	
		case_02_page_lv1.animate
			properties :
				scale : 0.9
			curve : ease_in
			time : time/1.5
		case_02_page_lv2.animate
			properties :
				y : 0
	else if go_page_condition == -1
		case_02_page_lv1.animate
			properties :
				scale : 1
		case_02_page_lv2.animate
			properties :
				y : case_02_page_lv1.height
			curve : ease_in
			time : time/1.5
			
	# half-top-down
	if go_page_condition == 1	
		case_03_page_lv1.animate
			properties :
				scale : 0.7
				y : case_03_bg.height * 0.1
			curve : ease_in
			time : time/1.5
		case_03_page_dim.animate
			properties :
				opacity : 0.6
		case_03_page_lv2.animate
			properties :
				y : case_03_bg.height * 0.4
	else if go_page_condition == -1
		case_03_page_lv1.animate
			properties :
				scale : 1
				y : 0
		case_03_page_dim.animate
			properties :
				opacity : 0
		case_03_page_lv2.animate
			properties :
				y : case_03_bg.height
			curve : ease_in
			time : time/1.5
			
	# slide-menu
	if go_page_condition == 1
		case_04_page_dim.animate
			properties :
				opacity : 0.6
		case_04_page_lv2.animate
			properties :
				x : case_04_bg.width * -0.2
	else if go_page_condition == -1
		case_04_page_dim.animate
			properties :
				opacity : 0
		case_04_page_lv2.animate
			properties :
				x : -case_04_bg.width
			curve : ease_in
			time : time/1.5
			
	#bottom_sheet
	if go_page_condition == 1
		case_05_page_dim.animate
			properties :
				opacity : 0.6
		case_05_page_lv2.animate
			properties :
				y : case_05_bg.height-case_05_page_lv2.height
				opacity : 1
	else if go_page_condition == -1
		case_05_page_dim.animate
			properties :
				opacity : 0
		case_05_page_lv2.animate
			properties :
				y : case_05_bg.height
			curve : ease_in
			time : time/1.5
				
	# popup
	if go_page_condition == 1
		case_06_page_dim.animate
			properties :
				opacity : 0.6
		case_06_page_lv2.animate
			properties :
				y : case_06_page_lv2.y - 20
				opacity : 1
	else if go_page_condition == -1
		case_06_page_dim.animate
			properties :
				opacity : 0
		case_06_page_lv2.animate
			properties :
				y : case_06_page_lv2.y + 20
				opacity : 0
				
	# profile
	if go_page_condition == 1
		case_06_page_lv2.animate
			properties :
				y : case_06_page_lv2.y - 20
				opacity : 1
	else if go_page_condition == -1
		case_06_page_dim.animate
			properties :
				opacity : 0
		case_06_page_lv2.animate
			properties :
				y : case_06_page_lv2.y + 20
				opacity : 0
		



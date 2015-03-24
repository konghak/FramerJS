# This imports all the layers for "profile_you" into profile_youLayers
sketch = Framer.Importer.load "imported/profile_you"

Framer.Device.deviceType = "nexus-5-black"
Framer.Device.contentScale = 1.5
# Framer.Device.fullScreen = true

#기본 애니메이션 정의
Framer.Defaults.Animation = 
	curve : "cubic-bezier(0.2, 0.0, 0.2, 1)"
	time : 0.3


# print Framer.Device.screen.width
# print Framer.Device.screen.height 


#rename
#artboard-rename
basic = sketch.basic_artboard
profile_know = sketch.profile_know_artboard
tap_friends = sketch.tap_artboard

#layer-rename
#basic
status_bar = sketch.status_bar

#tap
favri = sketch.favri

#profile
popup_text = sketch.popup_text
layer_area = sketch.layer_area
bg_black = sketch.bg_black
bg_white = sketch.bg_white
bg_blue = sketch.bg_blue
bg_tag = sketch.bg_tag
popup = sketch.popup
menu = sketch.menu
profile_top = sketch.profile_top
profile_top_area = sketch.profile_top_area

#onload
basic.visible=true

tap_friends.visible=true
tap_friends.y = 48

profile_know.visible=true
profile_know.y = 1280

#import한 레이어 image null 하기 (스케치에서 저장된 레이어는 png이다.)
layer_area.image=null
bg_black.image=null
bg_white.image=null
bg_blue.image=null
bg_tag.image=null
profile_top_area.image=null

#bg layer 컬러 정의
layer_area.backgroundColor="transparent"
bg_black.backgroundColor="rgba(0,0,0,1)"
bg_white.backgroundColor="rgba(255,255,255,1)"
bg_blue.backgroundColor="rgba(73,181,255,1)"
bg_tag.backgroundColor="rgba(0,0,0,0.1)"

#basic_artboard 기본 레이어정의
basic_bg = new Layer
	width : 720, height : 1280
	backgroundColor : "rgba(255,255,255,1)"
	superLayer : basic

status_bar.placeBefore(basic_bg)



#기본영역 정의
layer_area.width = 720
layer_area.height = 1280

#dim layer 정의
layer_dim = new Layer
	width : 720, height : 1280
	backgroundColor : "rgba(0,0,0,0.6)"
	superLayer : layer_area
	

#기본페이지 btn 정의
btn_close = new Layer
	width : 60, height : 60
	x : 15, y : 15
	backgroundColor : "transparent"
	superLayer : profile_top

sketch.btn_close.superLayer = btn_close
sketch.btn_close.center()


btn_menu = new Layer
	width : 60, height : 60
	x : profile_top_area.width-75, y : 15
	backgroundColor : "transparent"
	superLayer : profile_top

sketch.btn_menu.superLayer = btn_menu
sketch.btn_menu.center()


profile_top_area.backgroundColor = "transparent"


#profile layer on
sketch.favri.on Events.Click,(event, layer) ->
	basic_bg.backgroundColor = "rgba(0,0,0,1)"
	
	tap_friends.animate
		properties :
			scale : 0.9

	profile_know.animate
		properties :
			y : 48



#popup layer 정의	
popup = new Layer
	width : 570, height : 320
	backgroundColor : "rgba(255,255,255,1)"
	borderRadius : 5
	opacity : 0
	shadowY : 45
	shadowBlur : 50
	shadowColor : "rgba(0,0,0,0.4)"
	superLayer : layer_area

btn_cancel = new Layer
	width : 110, height : 62
	x : 300, y : 224
	superLayer : popup
	
btn_del = new Layer
	width : 110, height : 62
	x : 444, y : 224
	superLayer : popup


# popup 중심충 좌상단으로 바꾸기
popup.originX = 0
popup.originY = 0



#popup 이벤트 animation
btn_cancel.on Events.Click,(event, layer)->
	popup.animate
		properties :
			opacity : 0
			y : popup_basic_y		
		time : 0.3
	Utils.delay 0.2, ->
		popup.visible = false
		
	layer_dim.animate 
		properties :
			opacity : 0
		time : 0.3
		curve : "cubic-bezier(0.80, 0.01, 0.3, 1.0)"	
	Utils.delay 0.4, ->
		layer_dim.visible = false

# delete animation

btn_del.on Events.Click, ->
	
	profile_know.placeBefore(tap_friends)
	
	tap_friends.visible = true
	tap_friends.animate
		properties : 
			scale : 1
		delay : 0.7
		time : 0.3
	
	#popup rotation	
	popup.animate
		properties :
			opacity : 1
			rotation : 15
		time : 0.8
	
	#popup y position	
	Utils.delay 0.6, ->
		popup.animate
			properties :
				opacity : 0.6
				y : popup_basic_y+750
			time : 0.5
			
		layer_dim.animate 
			properties :
				opacity : 0
			time : 0.5	
			
	Utils.delay 0.7, ->		
		profile_know.animate
			properties :
				y : popup_basic_y+750
			time : 0.5

	Utils.delay 1.5, ->
		layer_dim.visible = false
		popup.visible = false
		popup.rotation = 0
		profile_know.y = 0
		

#pop업 click시 닫히지 않게
popup.on Events.Click,(event, layer) ->


popup_text.superLayer = popup
popup_text.center()

	
popup.center()
popup_basic_y = popup.y + 100
popup.centerY(100)
popup.placeBefore(layer_dim)

	
#로드시
layer_dim.visible = false
popup.visible = false
menu.visible = false
menu.opacity = 0



#메뉴 리스트 생성
for i in [0..2]
	row = new Layer		
		name : i
		width : menu.width, height : 65
		backgroundColor : "red"
		opacity : 0
	row.y = (i * (row.height+10))+20
	row.superLayer = menu
	row.on Events.Click, (event, layer) ->
		if layer.name == 0
			print 'aaaa'
		else if layer.name == 1
			print 'bbbb'		
		else if layer.name == 2
			print 'cccc'
			menu.opacity = 0
			menu.visible = false
			
			#popup
			popup.placeBefore(layer_dim)
			popup.visible = true
			popup.animate
				properties :
					opacity : 1
					y : popup_basic_y - 100
				time : 0.3
				curve : "cubic-bezier(0.2, 0.0, 0.2, 1)"
					
			
			layer_dim.visible=true
			layer_dim.animate
				properties : 
					opacity : 0.6
				time : 0.3
				curve : "cubic-bezier(0.2, 0.0, 0.2, 1)"

				

#메뉴bg style
sketch.menu_bg.shadowY = 4
sketch.menu_bg.shadowBlur = 16
sketch.menu_bg.shadowColor = "rgba(0,0,0,0.40)"


#btn_menu click
btn_menu.on Events.Click, ->	
	menu.placeBefore(layer_dim)	
	menu.visible = true	
	menu.animate 
		properties :
			opacity : 1
		time : 0.2
		curve : "cubic-bezier(0.80, 0.01, 0.3, 1.0)"
	menu.placeBefore(layer_dim)	

	layer_dim.opacity = 0
	layer_dim.visible=true
	

#dim 레이어 click
layer_dim.on Events.Click, ->	
	menu.opacity = 0
	menu.visible = false
	
	popup.animate
		properties :
			opacity : 0
			y : popup_basic_y
		time : 0.3
	Utils.delay 0.5, ->
		popup.visible = false
	
	layer_dim.animate 
		properties :
			opacity : 0
		time : 0.3
		curve : "cubic-bezier(0.80, 0.01, 0.3, 1.0)"
	
	Utils.delay 0.4, ->
		layer_dim.visible = false
	

		


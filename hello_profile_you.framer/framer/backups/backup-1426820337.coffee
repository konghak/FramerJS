document.body.style.cursor = "auto"

# This imports all the layers for "profile_you" into profile_youLayers
sketch = Framer.Importer.load "imported/profile_you"

Framer.Device.deviceType = "nexus-5-black"
Framer.Device.contentScale = 1.5

#기본 애니메이션 정의
Framer.Defaults.Animation = 
	curve:  "cubic-bezier(0.2, 0.0, 0.2, 1)"
	time: "0.3"


# print Framer.Device.screen.width
# print Framer.Device.screen.height 

#rename
popup_text = sketch.popup_text
profile_know = sketch.profile_know
layer_area = sketch.layer_area
bg_black = sketch.bg_black
bg_white = sketch.bg_white
bg_blue = sketch.bg_blue
bg_tag = sketch.bg_tag
bg_btn_area = sketch.btn_area
popup = sketch.popup
menu = sketch.menu

#import한 레이어 image null 하기 (스케치에서 저장된 레이어는 png이다.)
layer_area.image=null
bg_black.image=null
bg_white.image=null
bg_blue.image=null
bg_tag.image=null
bg_btn_area.image=null

#bg layer 컬러 정의
layer_area.backgroundColor="transparent"
bg_black.backgroundColor="rgba(0,0,0,1)"
bg_white.backgroundColor="rgba(255,255,255,1)"
bg_blue.backgroundColor="rgba(73,181,255,1)"
bg_tag.backgroundColor="rgba(0,0,0,0.1)"

#기본영역 정의
layer_area.width = 720
layer_area.height = 1280

#dim layer 정의
layer_dim = new Layer
	width : 720, height : 1280
	backgroundColor : "rgba(0,0,0,0.6)"
	superLayer : layer_area
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

popup_text.superLayer = popup
popup_text.center()

print layerA = new Layer
layerA.copy().name = "dd"
print  layerA.copy()

layerA.on Events.Click, ->
	print "A"


	
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


#btn_menu clicl
sketch.btn_menu.on Events.Click, ->	
	menu.placeBefore(layer_dim)	
	menu.visible = true	
	menu.animate 
		properties :
			opacity : 1
		
	layer_dim.opacity = 0
	layer_dim.visible=true
	

#dim 레이어 click
layer_dim.on Events.Click, ->	
	menu.opacity = 0
	menu.visible = false
	layer_dim.visible=false
	
	print popup.y
	popup.animate
		properties :
			opacity : 0
			y : popup_basic_y
		time : 0.2
	Utils.delay 0.5, ->
		popup.visible = false
	print popup.y
	
popup.on Events.Click, ->
	print "hwllo"
		


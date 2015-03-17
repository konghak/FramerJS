# This imports all the layers for "profile_you" into profile_youLayers
profile_you = Framer.Importer.load "imported/profile_you"

Framer.Device.deviceType = "nexus-5-black"
Framer.Device.contentScale = 1.5

# print Framer.Device.screen.width
# print Framer.Device.screen.height 


#dim 레이어 
layer_dim = new Layer
	backgroundColor : "rgba(0,0,0,1)"
	width : Framer.Device.screen.width
	height : Framer.Device.screen.height 


#bg layer 컬러 정의
profile_you.bg_black.image=null
profile_you.bg_white.image=null
profile_you.bg_blue.image=null
profile_you.bg_tag.image=null
profile_you.bg_black.backgroundColor="rgba(0,0,0,1)"
profile_you.bg_white.backgroundColor="rgba(255,255,255,1)"
profile_you.bg_blue.backgroundColor="rgba(73,181,255,1)"
profile_you.bg_tag.backgroundColor="rgba(0,0,0,0.1)"

# print profile_you.bg
# print profile_you.bg_black
# print profile_you.bg_white
# print profile_you.bg_blue
# print profile_you.bg_tag
	
#로드시	
profile_you.menu.visible = false
profile_you.menu.opacity = 0
layer_dim.visible = false

#버튼영역 설정
profile_you.btn_area.opacity = 0

#메뉴 bg style
profile_you.menu_bg.shadowY = 4
profile_you.menu_bg.shadowBlur = 16
profile_you.menu_bg.shadowColor = "rgba(0,0,0,0.40)"

profile_you.btn_menu.on Events.Click, ->	
	profile_you.menu.visible = true
	profile_you.menu.animate 
		properties :
			opacity : 1
		time : 0.1
		curve : "spring(100, 10, 0)"
	
	#dim layer visible 
	layer_dim.visible=true
	layer_dim.opacity = 0.2
		
profile_you.menu.on Events.Click, ->
	profile_you.menu.animate 
		properties :
			opacity : 0
		time : 0.04
		curve : "spring(100, 10, 20)"
	layer_dim.opacity = 0.2
	Utils.delay 0.2, ->
		profile_you.menu.visible = false
	

layer_dim.on Events.Click, ->
	profile_you.menu.animate 
		properties :
			opacity : 0
		time : 0.04
		curve : "spring(100, 10, 20)"
	Utils.delay 0.2, ->
		profile_you.menu.visible = false
		layer_dim.visible=false
		


layerA = new Layer()
layerB = new Layer()

print layerA.index, layerB.index
# Draw layerB on top
layerB.placeBefore(layerA)
print layerA.index, layerB.index






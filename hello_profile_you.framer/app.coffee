# This imports all the layers for "profile_you" into profile_youLayers
profile_you = Framer.Importer.load "imported/profile_you"

Framer.Device.deviceType = "nexus-5-black"
Framer.Device.contentScale = 1.5



print Framer.Device.screen.width
print Framer.Device.screen.height 

#dim 레이어 
layer_dim = new Layer
	backgroundColor : "rgba(0,0,0,0.0)"
	width : Framer.Device.screen.width
	height : Framer.Device.screen.height 
	
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
		
	profile_you.menu.on Events.Click, ->
		profile_you.menu.visible = false
	layer_dim.visible = true	
	layer_dim.on Events.Click, ->
		layer_dim.visible = false
		profile_you.menu.visible = false
		
		
profile_you.menu.animate 
	opacity : 1
	curve : "spring(100, 10, 0)"
	



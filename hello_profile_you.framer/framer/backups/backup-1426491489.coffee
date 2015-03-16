# This imports all the layers for "profile_you" into profile_youLayers
profile_you = Framer.Importer.load "imported/profile_you"

Framer.Device.deviceType = "nexus-5-black"
Framer.Device.contentScale = 1.5


print Framer.Device.screen.width
print Framer.Device.screen.height 

profile_you.menu.visible = false

#버튼영역 설정
profile_you.btn_area.opacity = 0

#메뉴 bg style
profile_you.menu_bg.shadowY = 4
profile_you.menu_bg.shadowBlur = 16
profile_you.menu_bg.shadowColor = "rgba(0,0,0,0.40)"

profile_you.btn_menu.on Events.Click, ->
	profile_you.menu.visible = true
	profile_you.menu.on Events.Click, ->
		profile_you.menu.visible = false
		
	



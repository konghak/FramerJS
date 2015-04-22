# This imports all the layers for "hello_profile_" into hello_profile_Layers1
sketch = Framer.Importer.load "imported/hello_profile_"

Framer.Device.deviceType = "nexus-5-black"
Framer.Device.setContentScale(1, true)

# 기본 애니메이션 정의
Framer.Defaults.Animation = 
	curve : "cubic-bezier(0.2, 0.0, 0.2, 1)"
	time : 0.3
	
#import한 모든 layer direct로 불러들일 수 있게 (rename 필요없음)
Utils.globalLayers(sketch)


# ##component 정의

#dim layer 정의
layer_dim = new Layer
	name : "layer_dim"
	width : Screen.width, height : Screen.height 
	opacity : 0
	backgroundColor : "rgba(0,0,0,1)"
	
#popup layer 정의
popup = new Layer
	width : 855, height : 480
	backgroundColor : "rgba(255,255,255,1)"
	borderRadius : 4
	opacity : 1
	shadowY : 45
	shadowBlur : 50
	shadowColor : "rgba(0,0,0,0.4)"
	name : "popup"
	
popup.center()

popup_text.superLayer = popup
popup_text.center()


#more menu layer 정의
more_bg = new Layer
	width : 390, height : 500
	backgroundColor : "rgba(255,255,255,1)"
	borderRadius : 4
	opacity : 0
	scale : 0.2
	shadowY : 45
	shadowBlur : 50
	shadowColor : "rgba(0,0,0,0.4)"
	name : "more_bg"

#more_bg position
more_bg.x = Screen.width-(more_bg.width+40)
more_bg.y = status_bar.height+40

#more_bg 중심축 우상으로 바꾸기
more_bg.originX = 1
more_bg.originY = 0


# more_menu_list 생성 및 액션
for i in [0..3]
	row = new Layer		
		name : i
		width : 390, height : 90
		backgroundColor : "rgba(0,0,0,1)"
		opacity : 1
		superLayer : more_bg

	row.y = (i * (row.height+20))+40
	row.on Events.Click, (event, layer) ->
		if layer.name == 0
			print "01"
		else if layer.name == 1
			print "02"
		else if layer.name == 2
			print "03"
		else if layer.name == 3
			print "04"
	
	
# ### onload시 layer setting
more_bg.visible = false
popup.visible = false
layer_dim.visible = false

# ### profile onload시 setting
btn_favori.visible = false
btn_prev_b.visible = false


# ## 연락처 저장 후 bg color
bg_profile_top_know.visible = false
bg_profile_top_know.height = 0

# ##profile on/off interaction
favorites.on Events.Click,(event, layer) ->
	main.animate
		properties :
			scale : 0.9
			
	profile.animate
		properties :
			y : status_bar.height
			
btn_prev_w.on Events.Click,(event, layer) ->
	profile.animate
		properties :
			y : Screen.height
	
	main.animate
		properties :
			scale : 1
			

# ##profile btn_more interaction

btn_more.on Events.Click,(event, layer) ->
	more_bg.visible = true
	more_bg.animate
		properties :
			scale : 1
			opacity : 1
	
	layer_dim.visible = true
	
	layer_dim.on Events.Click, (event, layer) ->
		more_bg.visible = false
		more_bg.scale = 0.5
		more_bg.opacity = 0
		layer_dim.visible = false
		
# ##profile btn_savenum interaction

btn_savenum.on Events.Click,(event, layer) ->
	bg_profile_top_know.visible = true
	bg_profile_top_know.animate
		properties :
			height : bg_profile_top_unknow.height
		time : 0.1
	Utils.delay 0.1, ->
		bg_profile_top_unknow.visible = false


	

			



		
			











	




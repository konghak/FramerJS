# This imports all the layers for "hello_profile_" into hello_profile_Layers1
sketch = Framer.Importer.load "imported/hello_profile_"

Framer.Device.deviceType = "nexus-5-black"
Framer.Device.setContentScale(1, true)

# ##Include module 
# flip 모션 모듈
flipCard = require "flipCard"

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
	
# ### onload시 layer setting
more_bg.visible = false
popup.visible = false
layer_dim.visible = false

# ### profile onload시 setting

icon_camera.visible = false
icon_camera.opacity = 0

# ##white bg top 
bg_profile_top_white.y = - bg_profile_top_white.height

# ## 연락처 저장 후 bg color
bg_profile_top_know.visible = false
bg_profile_top_know.height = 0

profile_you = ""
profile_me = ""
prev_w_condtion = ""
prev_b_condtion = ""

# ##profile on/off interaction
fav_01_01.on Events.Click,(event, layer) ->
	main.animate
		properties :
			scale : 0.9
			
	profile.animate
		properties :
			y : status_bar.height
			
	profile_you = "on"
	profile_me = "off"
	prev_w_condtion = "profile_you_01_01"
	
	img_profile.visible = true
	text.visible = true
	list_profile.visible = true
	frontLayer.visible = true
	backLayer.visible = true
	
	img_profile_me.visible = false
	text_me.visible = false
	list_profile_me.visible = false
	
	btn_tag.visible = false
	
			
fav_01_02.on Events.Click,(event, layer) ->
	main.animate
		properties :
			scale : 0.9

	profile.animate
		properties :
			y : status_bar.height
	
	profile_you = "off"		
	profile_me = "on"
	prev_w_condtion = "profile_me_01_01"
			
	img_profile.visible = false
	text.visible = false
	list_profile.visible = false
	frontLayer.visible = false
	backLayer.visible = false
	
	img_profile_me.visible = true
	text_me.visible = true
	list_profile_me.visible = true
	
	btn_tag.visible = true
			

# ##profile btn_prev 
btn_prev_w = new Layer 
	x:50, y:52, width:90, height:70, image:"images/btn_prev_w.png"
	superLayer : profile
btn_prev_b = new Layer 
	x:50, y:52, width:90, height:70, image:"images/btn_prev_b.png"
	superLayer : profile
	opacity : 0
	
# btn_prev_b.visible = false

			
btn_prev_w.on Events.Click,(event, layer) -> 
	if prev_w_condtion == "profile_you_01_01"
		profile.animate
			properties :
				y : Screen.height
	
		main.animate
			properties :
				scale : 1
	else if prev_w_condtion == "profile_me_01_01"
		profile.animate
			properties :
				y : Screen.height
	
		main.animate
			properties :
				scale : 1
	
	keyboard.y = Screen.height
	
# ##profile object origin position
ori_img_profile = [img_profile.x, img_profile.y]
ori_text = [text.x, text.y]
		
# ##profile btn_savenum interaction, flip
# Set flip background layer
frontLayer = new Layer 
	x:0, y:0, width:90, height:70, image:"images/btn_savenum.png"
backLayer = new Layer 
	x:0, y:0, width:90, height:70, image:"images/btn_favori.png"

# flipEffect input: (front, back, perspective, x, y, interaction, superLayer )
flipCard.flipCard(frontLayer, backLayer, 1600, "spring(300,20,0)", 740, 52-22, profile)


backLayer.visible = false
frontLayer.on Events.Click,(event, layer) ->
	#top_bg color change
	backLayer.visible = true
	bg_profile_top_know.visible = true
	bg_profile_top_know.animate
		properties :
			height : bg_profile_top_unknow.height
		time : 0.1
	Utils.delay 0.1, ->
# 		bg_profile_top_unknow.visible = false
		frontLayer.visible = false
		
backLayer.on Events.Click,(event, layer) ->
	#top_bg color change
	frontLayer.visible = true
	bg_profile_top_know.animate
		properties :
			height : 0
		time : 0.1
	Utils.delay 0.1, ->
		bg_profile_top_know.visible = false
		backLayer.visible = true

		
# ##profile btn_more interaction
btn_more = new Layer 
	x:948, y:52, width:90, height:70, image:"images/btn_more.png"
	superLayer : profile


btn_more.on Events.Click,(event, layer) ->
	if profile_you == "on"
		more_bg.visible = true
		more_bg.animate
			properties : 
				scale : 1
				opacity : 1
			time : 0.2
		
		layer_dim.visible = true
	
		layer_dim.on Events.Click, (event, layer) ->
			more_bg.visible = false
			more_bg.scale = 0.2
			more_bg.opacity = 0
			layer_dim.visible = false
			
# ##profile btn_tag interaction
btn_tag = new Layer 
	x:770, y:52, width:90, height:70, image:"images/btn_tag.png"
	superLayer : profile


btn_tag.on Events.Click, (event, layer) ->
	prev_w_condtion = "profile_me_01_02"
	
	bg_profile_top_unknow.animate
		properties :
			height : 320
			
	bg_profile_top_know.animate
		properties :
			height : 320
			
	list_profile_me.animate
		properties :
			y : Screen.height
	
	list_tags.visible = true
	list_tags.animate
		properties :
			y : 320
	
	photo_profile_me.originX = 0
	photo_profile_me.orignY = 0
	photo_profile_me.animate
		properties :
			scale : 0
			x : -100
			y : this.y - 140
			
	text_me.animate
		properties :
			x : 63
			y : this.y + 80
			
	text_name_me.animate
		properties :
			scale : 0
	
	text_tags_me.originX = 0
	text_tags_me.orignY = 0
	text_tags_me.animate
		properties :
			scale : 1.4
			 

print photo_profile_me.point
print text_me.point
print photo_profile.point
print text_tags_me.point		
# ##profile btn_confirm interaction
btn_confirm = new Layer 
	x:948, y:52, width:90, height:70, image:"images/btn_confirm.png"
	superLayer : profile
	opacity : 0
	
btn_confirm.visible = false

# #more_menu_list 생성 및 액션
for i in [0..3]
	row = new Layer		
		name : i
		width : 390, height : 90
		backgroundColor : "transparent"
		opacity : 1
		superLayer : more_bg
	
	#font style
	row.style.color = "rgba(0,0,0,0.87)"
	row.style.fontSize = "45px"
	row.style.lineHeight = "45px"	
	row.style.padding = "20px 0px 0px 40px"
	
	#row 행간
	row.y = (i * (row.height+20))+40
	#list lable
	if row.name == 0
		row.html = "편집"
	else if row.name == 1
		row.html = "공유"
	else if row.name == 2
		row.html = "차단"
	else if row.name == 3
		row.html = "제거"
			
	row.on Events.Click, (event, layer) ->
		if layer.name == 0
			#more_bg unvisible
			more_bg.visible = false
			more_bg.animate
				properties :
					scale : 0.2
					opacity : 0
			layer_dim.visible = false
			
			#top_bg_white on
			bg_profile_top_white.animate
				properties :
					y : 0
			
			# btn change or unvisilbe
			btn_prev_b.visible = true
			btn_prev_b.animate
				properties :
					opacity : 1
					
			btn_prev_w.visible = false
			btn_prev_w.animate
				properties :
					opacity : 0
			
			frontLayer.visible = false
			backLayer.visible = false
			
			btn_more.visible = false		
			
			photo_size_after = [240,240]
			photo_profile.animate
				properties :
					width : photo_size_after[0]
					height : photo_size_after[1]

			icon_camera.visible = true		
			icon_camera.animate
				properties :
					opacity : 1
					x : photo_size_after[0] - icon_camera.width
					y : photo_size_after[1] - icon_camera.height
					
			img_profile.animate
				properties :
					y : bg_profile_top_white.height + 60
			
			text.animate
				properties :
					y : bg_top.height
					opacity : 0
			
			bg_profile_top_know.animate
				properties :
					height : 0
		
			bg_profile_top_unknow.animate
				properties :
					height : 0
								
			list_profile.animate
				properties :
					y : Screen.height
					
			list_profile_edit.animate
				properties :
					y : img_profile.maxY + 100
	
			# keboard on
			list_profile_edit.on Events.Click, (event, layer) ->
				keyboard.animate
					properties :
						y : Screen.height - keyboard.height
				
				keyboard.on Events.Click, (event, layer) ->
					bg_profile_top_know.animate
						properties :
							height : 171
					bg_profile_top_unknow.animate
						properties :
							height : 171
							
					btn_confirm.visible = true	
					btn_confirm.animate
						properties :
							opacity : 1
					
					btn_prev_b.animate
						properties :
							opacity : 0
					btn_prev_b.visible = false
					
					btn_prev_w.visible = true
					btn_prev_w.animate
						properties :
							opacity : 1
							
			#btn_prev befor modify
			btn_prev_b.on Events.Click, (event, layer) ->
				#top_bg_white on
				bg_profile_top_white.animate
					properties :
						y : -171
			
				# btn change or unvisilbe
				btn_prev_w.visible = true
				btn_prev_w.animate
					properties :
						opacity : 1
						
				btn_prev_b.visible = false
				btn_prev_b.animate
					properties :
						opacity : 0		
			
				frontLayer.visible = true
				backLayer.visible = true
			
				btn_more.visible = true		
			
				photo_size_after = [200,200]
				photo_profile.animate
					properties :
						width : photo_size_after[0]
						height : photo_size_after[1]

					
				icon_camera.animate
					properties :
						opacity : 0
						x : photo_size_after[0] - icon_camera.width
						y : photo_size_after[1] - icon_camera.height
				icon_camera.visible = false	
					
				img_profile.animate
					properties :
						y : ori_img_profile[1]
			
				text.animate
					properties :
						y : ori_text[1]
						opacity : 1
			
				bg_profile_top_know.animate
					properties :
						height : 580
		
				bg_profile_top_unknow.animate
					properties :
						height : 580
								
				list_profile.animate
					properties :
						y : status_bar.height + bg_top.height
					
				list_profile_edit.animate
					properties :
						y : Screen.height
						
				keyboard.y = Screen.height
		
		#btn_prev after modify
			btn_confirm.on Events.Click, (event, layer) ->
				
				btn_confirm.animate
					properties :
						opacity : 0
				btn_confirm.visible = false
				
				
				#top_bg_white on
				bg_profile_top_white.animate
					properties :
						y : -171
			
				# btn change or unvisilbe
				btn_prev_w.visible = true
				btn_prev_w.animate
					properties :
						opacity : 1
						
				btn_prev_b.visible = false
				btn_prev_b.animate
					properties :
						opacity : 0		
			
				frontLayer.visible = true
				backLayer.visible = true
			
				btn_more.visible = true		
			
				photo_size_after = [200,200]
				photo_profile.animate
					properties :
						width : photo_size_after[0]
						height : photo_size_after[1]

					
				icon_camera.animate
					properties :
						opacity : 0
						x : photo_size_after[0] - icon_camera.width
						y : photo_size_after[1] - icon_camera.height
				icon_camera.visible = false	
					
				img_profile.animate
					properties :
						y : ori_img_profile[1]
			
				text.animate
					properties :
						y : ori_text[1]
						opacity : 1
			
				bg_profile_top_know.animate
					properties :
						height : 580
		
				bg_profile_top_unknow.animate
					properties :
						height : 580
								
				list_profile.animate
					properties :
						y : status_bar.height + bg_top.height
					
				list_profile_edit.animate
					properties :
						y : Screen.height
						
				keyboard.y = Screen.height

			
				
					
					
			
		
			
	
		else if layer.name == 1
			print "02"
		else if layer.name == 2
			print "03"
		else if layer.name == 3
			print "04"




		
	


	

			



		
			











	





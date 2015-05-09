# This imports all the layers for "hello_profile_" into hello_profile_Layers1
sketch = Framer.Importer.load "imported/hello_profile_"

Framer.Device.deviceType = "nexus-5-black"
Framer.Device.setContentScale(0.7, true)

# ##Include module 
# flip 모션 모듈
modules_01 = require "button_ani"
modules_02 = require "page"

# 기본 애니메이션 정의
ease_in = "cubic-bezier(0.9, 0, 0.8, 0.9)"
ease_in_out = "cubic-bezier(0.25, 0.0, 0.16, 1)"

Framer.Defaults.Animation = 
	curve : "cubic-bezier(0.25, 0.0, 0.16, 1)"
	time : 0.4
	
# defaultsCurve = "cubic-bezier(0.2, 0.0, 0.2, 1)"
	
#import한 모든 layer direct로 불러들일 수 있게 (rename 필요없음)
Utils.globalLayers(sketch)


# ##component 정의

#dim layer 정의
layer_dim = new Layer
	name : "layer_dim"
	width : Screen.width, height : Screen.height 
	opacity : 0
	backgroundColor : "rgba(0,0,0,1)"

contraints = new Layer 
	width : Screen.width, height : Screen.height
	y : Screen.height/3
	backgroundColor : "transparent"
contraints.visible = false

noti_container = new Layer
	width : Screen.width, height : Screen.height
	y : Screen.height
	backgroundColor : "red"
noti_container.visible = false
	
#popup layer 정의
popup = new Layer
	width : 855, height : 480
	backgroundColor : "rgba(255,255,255,1)"
	borderRadius : 4
	opacity : 0
	shadowY : 45
	shadowBlur : 50
	shadowColor : "rgba(0,0,0,0.4)"
	name : "popup"

popup_text.superLayer = popup
popup_text.center()

btn_delete = new Layer
	width : 160, height : 95
	x : popup.maxX-185, y : popup.maxY-140
	backgroundColor : "transparent"
	superLayer : popup


# popup basic position, 정가운데에서 100 아래로
popup.centerX(0)
popup.centerY(200)

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

# ##profile object origin position
ori_img_profile = [img_profile.x, img_profile.y]
ori_text = [text.x, text.y]

ori_img_profile_me = [img_profile_me.x, img_profile_me.y]
ori_text_me = [text_me.x, text_me.y]

ori_profile_top = [profile_top.x, profile_top.y]
ori_list_profile = [list_profile.x, list_profile.y]
ori_list_profile_me = [list_profile_me.x, list_profile_me.y]

# ##profile_top basic position
# profile_top.y = ori_profile_top[1] + 400
img_profile.y = ori_img_profile[1] + 400
text.y = ori_text[1] + 400
img_profile_me.y = ori_img_profile_me[1] + 400
text_me.y = ori_text_me[1] + 400

bg_profile_top_blue.height = 1000
list_profile.y = ori_list_profile[1] + 400
list_profile_me.y = ori_list_profile_me[1] + 400

# ### profile onload시 setting

icon_camera.visible = false
icon_camera.opacity = 0

# ##white bg top 
bg_profile_top_white.y = - bg_profile_top_white.height

profile_you = ""
profile_me = ""

prev_w_condtion = ""
prev_b_condtion = ""

# ##profile on/off interaction
fav_01_01_on = (event, layer) ->
	#fav_01_02 on click off
	fav_01_02.off(Events.Click, fav_01_02_on)
	
	profile_you = "on"		
	profile_me = "off"
	
	prev_w_condtion = "profile_you_01"
	
	main.animate
		properties :
			scale : 0.9
			
	profile.animate
		properties :
			y : status_bar.height
			
	img_profile.animate
		properties : 
			y : ori_img_profile[1]
		time : 0.5
	
	text.animate
		properties :
			y : ori_text[1]
		time : 0.5
		
	bg_profile_top_blue.animate
		properties :
			height : 580
		time : 0.6

	list_profile.animate
		properties :
			y : ori_list_profile[1]
		time : 0.7
				
	img_profile.visible = true
	text.visible = true
	list_profile.visible = true
	frontLayer.visible = true
	backLayer.visible = true
	
	img_profile_me.visible = false
	text_me.visible = false
	list_profile_me.visible = false
	
	btn_tag.visible = false
	
fav_01_01.on(Events.Click, fav_01_01_on)
			
fav_01_02_on = (event, layer) ->
	fav_01_01.off(Events.Click, fav_01_01_on)
	profile_you = "off"		
	profile_me = "on"
	
	prev_w_condtion = "profile_me_01"
	
	text_tags_me_add.visible = false
	
	main.animate
		properties :
			scale : 0.9

	profile.animate
		properties :
			y : status_bar.height
	
	img_profile_me.animate
		properties : 
			y : ori_img_profile_me[1]
		time : 0.5
	
	text_me.animate
		properties :
			y : ori_text_me[1]
		time : 0.5
		
	bg_profile_top_blue.animate
		properties :
			height : 580
		time : 0.6
		
	list_profile_me.animate
		properties :
			y : ori_list_profile_me[1]
		time : 0.7
				
	img_profile.visible = false
	text.visible = false
	list_profile.visible = false
	frontLayer.visible = false
	backLayer.visible = false
	
	img_profile_me.visible = true
	text_me.visible = true
	list_profile_me.visible = true
	
	btn_filedadd_ok.visible = false
	
	btn_tag.visible = true
	btn_tag.animate
		properties : 
			opacity : 1
fav_01_02.on(Events.Click, fav_01_02_on)

			
# ##profile btn_prev 
btn_prev_w = new Layer 
	x:50, y:52, width:90, height:70, image:"images/btn_prev_w.png"
	superLayer : profile
btn_prev_b = new Layer 
	x:50, y:52, width:90, height:70, image:"images/btn_prev_b.png"
	superLayer : profile
	opacity : 0
btn_prev_search = new Layer 
	x:50, y:52, width:90, height:70, image:"images/btn_prev_w.png"
	superLayer : top_bg_blue

	

	
prev_w_condtion = ''
prev_b_condtion = ''

btn_prev_b.visible = false



# ## btn_prev interation	
btn_prev_w.on Events.Click,(event, layer) -> 
	if prev_w_condtion == "profile_you_01" or prev_w_condtion == "profile_me_01"
		fav_01_01.on(Events.Click, fav_01_01_on)
		fav_01_02.on(Events.Click, fav_01_02_on)
		profile.animate
			properties :
				y : Screen.height
			curve : ease_in
	
		main.animate
			properties :
				scale : 1
	
		keyboard.y = Screen.height
		
		Utils.delay 0.4, ->
			img_profile.y = ori_img_profile[1] + 400
			text.y = ori_text[1] + 400
			img_profile_me.y = ori_img_profile_me[1] + 400
			text_me.y = ori_text_me[1] + 400
			bg_profile_top_blue.height = 1000
			list_profile.y = ori_list_profile[1] + 400
			list_profile_me.y = ori_list_profile_me[1] + 400
		
	else if prev_w_condtion == "profile_you_edit_cancel"
	
		prev_w_condtion = "profile_you_01"
	
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
			
		bg_profile_top_blue.animate
			properties :
				height : 580
								
		list_profile.animate
			properties :
				y : bg_top.height
					
		list_profile_edit.animate
			properties :
				y : Screen.height
						
		keyboard.y = Screen.height
		
		btn_filedadd_ok.visible = false	
		
	else if prev_w_condtion =='list_tags_ok'
	
		prev_w_condtion = 'profile_me_01'
		btn_tag.animate
			properties : 
				opacity : 1
		btn_tag.visible = true
			
		bg_profile_top_blue.animate
			properties :
				height : 580
			
		list_profile_me.animate
			properties :
				y : profile_top.height	
		
		list_tags.animate
			properties :
				y : Screen.height
		Utils.delay 0.4, ->
			list_tags.visible = false
	
		# profile photo
		img_profile_me.originX = 0
		img_profile_me.originY = 0
		img_profile_me.animate
			properties :
				x : ori_img_profile_me[0]
				y : ori_img_profile_me[1]
				scale : 1
	
		# text		
		text_me.orignX = 0	
		text_me.orignY = 0		
		text_me.animate
			properties :
				x : ori_text_me[0]
				y : ori_text_me[1]

		text_name_me.originX = 0
		text_name_me.orignY = 0	
		text_name_me.animate
			properties :
				scale : 1
	
		text_tags_me.originX = 0
		text_tags_me.orignY = 0
		text_tags_me.animate
			properties :
				scale : 1
				
		keyboard.y = Screen.height
	
#btn_prev_b
btn_prev_b.on Events.Click, (event, layer) ->
	prev_w_condtion = 'profile_you_01'
				
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
			
	bg_profile_top_blue.animate
		properties :
			height : 580
								
	list_profile.animate
		properties :
			y : bg_top.height
					
	list_profile_edit.animate
		properties :
			y : Screen.height
						
	keyboard.y = Screen.height

		
# ##profile btn_savenum interaction, flip
# Set flip background layer
frontLayer = new Layer 
	x:0, y:0, width:90, height:70, image:"images/btn_savenum.png"
backLayer = new Layer 
	x:0, y:0, width:90, height:70, image:"images/btn_favori.png"

# flipEffect input: (front, back, perspective, x, y, superLayer )
modules_01.flipCard(frontLayer, backLayer, 1600, "spring(300,20,0)", 740, 52-22, profile)

		
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
			
			layer_dim.animate
				properties :
					opacity : 0		
			Utils.delay 0.4, ->
				layer_dim.visible = false
			
			popup.animate
				properties :
					y : 920
					opacity : 0
				time : 0.2
			Utils.delay 0.4, ->
				popup.visible = false
				
	else if profile_me == "on"
		main.animate
			properties :
				scale : 0.7
		profile.animate
			properties :
				scale : 0.7
		layer_dim.visible = true
		layer_dim.animate
			properties :
				opacity : 0.7
		
		noti_container.visible = true
		noti_container.animate
			properties :
				y : Screen.height/3
		modules_02.cardtype(noti_container)
		
		noti_container.draggable.enabled = true
		noti_container.draggable.horizontal = false

		noti_container.draggable.constraints = contraints.frame
		# Customize the momentum animation
		noti_container.draggable.momentumOptions = {
			friction: 10
			tolerance: 0.5
		}
		noti_container.draggable.bounceOptions = {
			tension: 400
			friction: 30
		}

		noti_container.on Events.DragEnd, ->
			if noti_container.y < Screen.height/5
				noti_container.animate
					properties :
						y : 0
					time : 0.1

			else if noti_container.y > Screen.height - (Screen.height/3*2 - 200)
				noti_container.animate
					properties :
						y : Screen.height
					time : 0.2
	
				layer_dim.animate
					properties :
						opacity : 0
				Utils.delay 0.2, ->
					layer_dim.visible=false
				main.animate
					properties :
						scale : 0.9
				profile.animate 
					properties :
						scale : 1
				noti_container.animate
					properties :
						y : Screen.height


				
		layer_dim.on Events.Click,(event, layer) ->
			layer_dim.animate
				properties :
					opacity : 0
			Utils.delay 0.2, ->
				layer_dim.visible=false
			main.animate
				properties :
					scale : 0.9
			profile.animate 
				properties :
					scale : 1
			noti_container.animate
				properties :
					y : Screen.height



# print modules_02.cardtype()


# ##profile btn_tag interaction
btn_tag = new Layer 
	x:770, y:52, width:90, height:70, image:"images/btn_tag.png"
	superLayer : profile


btn_tag.on Events.Click, (event, layer) ->
	btn_tag.animate
		properties : 
			opacity : 0
	Utils.delay 0.2, ->
		btn_tag.visible = false
	
	prev_w_condtion = 'list_tags_ok'
	
	bg_profile_top_blue.animate
		properties :
			height : 320
			
	list_profile_me.animate
		properties :
			y : Screen.height
	
	
	Utils.delay 0.05, ->

		list_tags.visible = true
		list_tags.animate
			properties :
				y : 320
	
	# profile photo
	img_profile_me.originX = 0
	img_profile_me.originY = 0
	img_profile_me.animate
		properties :
			x : 60
			scale : 0
	
	# text		
	text_me.orignX = 0	
	text_me.orignY = 0		
	text_me.animate
		properties :
			x : 63
			y : img_profile_me.maxY - img_profile_me.height - 10

	text_name_me.originX = 0
	text_name_me.orignY = 0	
	text_name_me.animate
		properties :
			scale : 0
			y : this.y - 50
	
	text_tags_me.originX = 0
	text_tags_me.orignY = 0
	text_tags_me.animate
		properties :
			scale : 1.4
			
	text_tags_me.on Events.Click, (event, layer) ->
		keyboard.animate
			properties :
				y : Screen.height - keyboard.height
	list_tags.on Events.Click, (event, layer) ->
		text_tags_me_add.visible = true
		btn_filedadd_ok.visible = true

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
		
			prev_b_condtion = 'profile_you_edit'
		
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
			
			bg_profile_top_blue.animate
				properties :
					height : 0
								
			list_profile.animate
				properties :
					y : Screen.height
			
			Utils.delay 0.05, ->		
				list_profile_edit.animate
					properties :
						y : img_profile.maxY + 100
	
			# keboard on
			list_profile_edit.on Events.Click, (event, layer) ->
				keyboard.animate
					properties :
						y : Screen.height - keyboard.height
				
				keyboard.on Events.Click, (event, layer) ->
					
					prev_w_condtion = 'profile_you_edit_cancel'
					
					bg_profile_top_blue.animate
						properties :
							height : 171
						curve : ease_in
						time : 0.2
							
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
			
				bg_profile_top_blue.animate
					properties :
						height : 580
				
				Utils.delay 0.05, ->			
					list_profile.animate
						properties :
							y : bg_top.height
					
				list_profile_edit.animate
					properties :
						y : Screen.height
						
				keyboard.y = Screen.height		
		
			
	
		else if layer.name == 1
			print "02"
		else if layer.name == 2
			print "03"
		else if layer.name == 3
		
			more_bg.visible = false
			more_bg.scale = 0.2
			more_bg.opacity = 0
			
			layer_dim.visible = true
			layer_dim.animate
				properties :
					opacity : 0.6
					
			popup.visible = true
			popup.animate
				properties :
					opacity : 1
					y : 720
				time : 0.2
					
			btn_delete.on Events.Click,(event, layer) ->
				popup.animate
					properties :
						y : Screen.height + 100
					curve : ease_in
					time : 0.4
					
				layer_dim.animate
					properties :
						opacity : 0		
											
				Utils.delay 0.35, ->
					main.animate
						properties :
							scale : 1
			
					profile.animate
						properties :
							y : Screen.height
							
				Utils.delay 0.5, ->
					main.animate
						properties :
							scale : 1		
					snack_bar.animate
						properties :
							y : snack_bar.y-snack_bar.height
					
					btn_search.animate
						properties :
							y : btn_search.y - snack_bar.height
					
					Utils.delay 2, ->
						snack_bar.animate
							properties :
								y : 1920
						btn_search.animate
							properties :
								y : btn_search.y + snack_bar.height
					
				Utils.delay 0.8, ->
					layer_dim.visible = false
					popup.visible = false
					popup.opacity = 0
					popup.y = 920
					
					
# ##search on/off interaction
btn_search.on Events.Click, (event, layer) ->
	top_bg_blue.animate
		properties :
			y : status_bar.height
	list_search_first.animate
		properties :
			y : 0
	keyboard.animate
		properties :
			y : Screen.height - keyboard.height
	
# top_bg_blue = new Layer
# 	width : Screen.width, height : 0
# 	y : status_bar.height
# 	backgroundColor : "rgba(73,181,255,1)"
	

	

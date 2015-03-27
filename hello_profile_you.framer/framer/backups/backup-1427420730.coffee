# This imports all the layers for "profile_you" into profile_youLayers
sketch = Framer.Importer.load "imported/profile_you"

Framer.Device.deviceType = "nexus-5-black"
Framer.Device.setContentScale(1.05, true)
# Framer.Device.fullScreen = true

#기본 애니메이션 정의
Framer.Defaults.Animation = 
	curve : "cubic-bezier(0.2, 0.0, 0.2, 1)"
	time : 0.3


# print Framer.Device.screen.width
# print Framer.Device.screen.height 



# ##rename
# #artboard-rename
top_layers = sketch.top_layers_artboard
basic = sketch.basic_artboard
profile_know = sketch.profile_know_artboard
main = sketch.main_artboard


# #layer-rename
#basic
status_bar = sketch.status_bar


#main
favri = sketch.favri

#profile
popup = sketch.popup
popup_text = sketch.popup_text

more = sketch.more


container = sketch.container
list_edit = sketch.list_edit
list = sketch.list
profile_top = sketch.profile_top
btn_profilephoto_edit = sketch.btn_profilephoto_edit
text_name = sketch.text_name
text_tag = sketch.text_tag


btn_prev = sketch.btn_prev
btn_prev_dark = sketch.btn_prev_dark
btn_more = sketch.btn_more
btn_confirm = sketch.btn_confirm
btn_star = sketch.btn_star
btn_share = sketch.btn_share
img_profile = sketch.img_profile

bg_black = sketch.bg_black
bg_white = sketch.bg_white
bg_blue = sketch.bg_blue
bg_tag = sketch.bg_tag


#import한 레이어 image null 하기 (스케치에서 저장된 레이어는 png이다.)
bg_white.image=null
bg_blue.image=null
bg_tag.image=null

#import한 레이어 짤리지 않게
container.scroll = true


#bg layer 컬러 정의
bg_white.backgroundColor="rgba(255,255,255,1)"
bg_blue.backgroundColor="rgba(73,181,255,1)"
bg_tag.backgroundColor="rgba(0,0,0,0.1)"


# ##basic_artboard 기본 레이어정의
basic_bg = new Layer
	width : 720, height : 1280
	backgroundColor : "rgba(255,255,255,1)"
	superLayer : basic

status_bar.placeBefore(basic_bg)

# ##top_layers_artboard 기본 레이어정의
# #dim layer 정의
layer_dim = new Layer
	name : "layer_dim"
	width : 720, height : 1280
	y : 0
	opacity : 0
	backgroundColor : "rgba(0,0,0,0.6)"
	superLayer : top_layers

	
# #popup layer 정의	
popup = new Layer
	width : 570, height : 320
	backgroundColor : "rgba(255,255,255,1)"
	borderRadius : 5
	opacity : 0
	shadowY : 45
	shadowBlur : 50
	shadowColor : "rgba(0,0,0,0.4)"
	name : "popup"
	superLayer : top_layers

# within text
popup_text.superLayer = popup
popup_text.center()

# within btn
btn_cancel = new Layer
	width : 110, height : 62
	x : 300, y : 224
	backgroundColor : "transparent"
	superLayer : popup
	
btn_del = new Layer
	width : 110, height : 62
	x : 444, y : 224
	backgroundColor : "transparent"
	superLayer : popup

# popup 중심충 좌상단으로 바꾸기 (for roation)
popup.originX = 0
popup.originY = 0

# popup 기본 위치
popup.center()
popup_basic_y = popup.y + 100
popup.centerY(100)
popup.placeBefore(layer_dim)




# ##profile_know_artboard 기본 레이어정의

# 첫 시작시 숨기기
more.visible = false
more.opacity = 0

btn_profilephoto_edit.visible = false
btn_profilephoto_edit.opacity = 0

btn_prev_dark.visible = false
btn_prev_dark.opacity = 0

# #기본영역 정의
layer_area = new Layer
	width : screen.width, height : screen.height
	superLayer : profile_know
	backgroundColor : "transparent"

more.placeBefore(layer_area)




# #기본페이지 btn 정의
profile_top.width = bg_blue.width

btn_prev = new Layer
	width : 60, height : 60
	x : 15, y : 15
	backgroundColor : "transparent"
	superLayer : container

sketch.btn_prev.superLayer = btn_prev
sketch.btn_prev.center()


btn_more = new Layer
	width : 60, height : 60
	x : profile_top.width-75, y : 15
	backgroundColor : "transparent"
	superLayer : container

sketch.btn_more.superLayer = btn_more
sketch.btn_more.center()



# ## onload 최초 위치 잡기
top_layers.visible = false
top_layers.y = 47
main.visible = true
main.y = 48
profile_know.visible = true
profile_know.y = 1280



# ## interaction

# # main
# profile 불러오기
sketch.favri.on Events.Click,(event, layer) ->
	basic_bg.backgroundColor = "rgba(0,0,0,1)"
	
	main.animate
		properties :
			scale : 0.9

	profile_know.animate
		properties :
			y : 48
			
	layer_area.visible = false

# #profile
# profile 닫기
btn_prev.on Events.Click, (event, layer) ->
	profile_know.animate
		properties :
			y : 1280
	main.animate
		properties :
			scale : 1

# btn_more click
btn_more.on Events.Click, ->	
	#more_bg 영역 클릭 가능하게
	layer_area.visible = true
	
	more.visible = true	
	more.animate 
		properties :
			opacity : 1
		time : 0.2
		curve : "cubic-bezier(0.80, 0.01, 0.3, 1.0)"
	#more_bg 영역 클릭해서 메뉴 닫을 수 있게
	layer_area.on Events.Click, (event, layer)->
		more.opacity = 0
		more.visible = false
		
		layer_area.visible = false
		
# more_bg style
sketch.more_bg.shadowY = 4
sketch.more_bg.shadowBlur = 16
sketch.more_bg.shadowColor = "rgba(0,0,0,0.40)"

# more_menu 생성
for i in [0..2]
	row = new Layer		
		name : i
		width : more.width, height : 65
		backgroundColor : "rgba(0,0,0,0)"
		opacity : 1
		superLayer : more
		
	row.y = (i * (row.height+10))+20
	row.on Events.Click, (event, layer) ->
		if layer.name == 0
		# 프로필 편집
			print 'aaaa'
			more.opacity = 0
			more.visible = false
			
			list.animate
				properties : 
					y : list.y+100
					opacity : 0
				
			bg_tag.animate
				properties : 
					opacity : 0
					
			text_tag.animate
				properties : 
					y : text_tag.y+100
					opacity : 0
				delay : 0.05
				
			btn_star.animate
				properties : 
					y : btn_star.y+100
					opacity : 0
				delay : 0.1
				
			btn_share.animate
				properties : 
					y : btn_share.y+100
					opacity : 0
				delay : 0.1
				
			text_name.animate
				properties : 
					y : text_name.y+100
					opacity : 0
				delay : 0.15	
				
			img_profile.animate
				properties :
					y : 150
				delay : 0.2
			btn_profilephoto_edit.visible = true							
			bg_blue.animate
				properties :
					height : 280
					y : 123
				delay : 0.25
			
			list_edit.animate
				properties : 
					y : 380
				time : 0.4
				delay : 0.25
			
			
			
			
		else if layer.name == 1
			print 'bbbb'		
		else if layer.name == 2
		# 연락처 제거
			more.opacity = 0
			more.visible = false			
			
			#popup 띄우기
			top_layers.visible = true
			
			layer_dim.visible=true
			layer_dim.animate
				properties : 
					opacity : 0.6
					y : 0
				time : 0.3
				curve : "cubic-bezier(0.2, 0.0, 0.2, 1)"			
			popup.visible = true
			popup.animate
				properties :
					opacity : 1
					y : popup_basic_y - 100
				time : 0.3
				curve : "cubic-bezier(0.2, 0.0, 0.2, 1)"
			#pop업 click시 닫히지 않게
			popup.on Events.Click,(event, layer) ->
				
			# btn_cancel animation
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
					layer_area.visible = false

					
			# btn_delete animation
			btn_del.on Events.Click, ->
	
				main.visible = true
				main.animate
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

			#dim 레이어 click
			layer_dim.on Events.Click, ->	

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
		
				layer_area.visible = false
	
				Utils.delay 0.4, ->
					layer_dim.visible = false
	

		


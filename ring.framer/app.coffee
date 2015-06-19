# This imports all the layers for "ring" into ringLayers
sketch = Framer.Importer.load "imported/ring"

# Framer.Device.deviceType = "nexus-5-black"
Framer.Device.setContentScale(0.7, true)

bg = new BackgroundLayer
	backgroundColor : "rgba(0,0,0,1)"
	

	

# 기본 애니메이션 정의
ease_in = "cubic-bezier(0.9, 0, 0.6, 0.9)"
ease_in_out = "cubic-bezier(0.25, 0.0, 0.16, 1)"
spring = "spring(180, 13, 5)"
time = 0.5

Framer.Defaults.Animation = 
	curve : "cubic-bezier(0.25, 0.0, 0.16, 1)"
	time : time


#import한 모든 layer direct로 불러들일 수 있게 (rename 필요없음)
Utils.globalLayers(sketch)
task.visible = false
call.visible = false

 
# blue bg 반복
# bg_blue_over.opacity = 0
Utils.interval 3,->
	text_name.animate
		properties :
			opacity : 0.4
		time : 1.2
		curve : ease_in
	Utils.delay 1.2, ->
		text_name.animate
			properties :
				opacity : 1
			time : 0.8
			curve : ease_in
 


container_reception = new Layer
	height : main.height - bg_blue.height
	width : main.width
	y : bg_blue.maxY
	superLayer : main
	backgroundColor : "transparent"

area_reception = new Layer
	width : 754, height : 300
	clip : false
	backgroundColor : "transparent"

area_drag = new Layer
	superLayer : area_reception
	backgroundColor : "transparent"
	width : 100, height : 100
	midX : area_reception.midX, midY : area_reception.midY
	clip : false

icon_phone = new Layer
	superLayer : area_drag 
	backgroundColor : "transparent"
	width : 72, height : 72
	
icon_phone_basic = new Layer
	image : "images/icon_phone.png"
	superLayer : area_drag 
	backgroundColor : "transparent"
	width : 72, height : 72
	superLayer : icon_phone
	
icon_phone_reject = new Layer
	image : "images/icon_phone_reject.png"
	superLayer : icon_phone
	backgroundColor : "transparent"
	width : 72, height : 72
	opacity : 0
	
icon_phone_accept = new Layer
	image : "images/icon_phone_accept.png"
	superLayer : icon_phone
	backgroundColor : "transparent"
	width : 72, height : 72
	opacity : 0


#수신, 거절버튼 정의
okradius = 90

btn_reject = new Layer
	width : okradius, height : okradius
	borderRadius : okradius/2
	backgroundColor : "transparent"
	borderWidth : 4
	borderColor : "#F26052"
	superLayer : area_reception
	

btn_reject.centerY()

btn_accept = new Layer
	width : okradius, height : okradius
	borderRadius : okradius/2
	backgroundColor : "transparent"
	borderWidth : 4
	borderColor : "#56CFAD"
	superLayer : area_reception

btn_accept.x = area_reception.width-okradius
btn_accept.centerY()

icon_phone.center()

area_reception.superLayer = container_reception
area_reception.center()





radiusLength = 140 #중심축에서 떨어진 원의 거리
radius = 10  #원 크기
numCircles = 14  #원 갯수
allCircles = [] #원 배열

for i in [1..numCircles]

	# 원둘레로 뿌려주기
	positions = 360 / numCircles
	angle = positions * i
       
	adjSide = Math.cos(angle * Math.PI/180)*radiusLength
	oppSide = Math.sin(angle * Math.PI/180)*radiusLength
	adjSide = Utils.round(adjSide, 0)
	oppSide = Utils.round(oppSide, 0)

	circle = new Layer
		superLayer : area_drag
		backgroundColor : "#000000"
		height : radius, width : radius
		x : adjSide+area_drag.width/2-radius/2
		y : oppSide+area_drag.height/2-radius/2
		opacity: 0.7
		borderRadius: radius/2
		name : "circle_" + i


	circle.states.add({
		out: {opacity : 0.8, opacity : 0,x : area_drag.width/2, y : area_drag.height/2}
		})
		
	circle.states.animationOptions = {
		curve: "spring(300,20,0)"
		delay: 0.01 * i
        }

	allCircles.push circle #add cirlce to an array


constraints = new Layer
	superLayer : area_reception
	width : area_reception.width-okradius-50
	backgroundColor : "transparent"
constraints.center()
	
area_drag.draggable.enabled = true
area_drag.draggable.vertical = false
area_drag.draggable.constraints = constraints.frame
area_drag.draggable.overdrag = false

area_drag.states.add
	orix : { x : 327}



area_drag.on Events.TouchStart, ->
	for i, j of allCircles
		j.states.switch('out')
area_drag.on Events.TouchEnd, ->
	for i, j of allCircles
		j.states.switch('default')
		
	if area_drag.midX <= 140
		task.visible = true
		main.animate
			properties :
				y : 1920
	else if area_drag.midX >= 614
		call.visible = true
		main.animate
			properties :
				opacity : 0
				
area_drag.on Events.DragEnd, ->
	area_drag.states.switch('orix')

area_drag.on "change:x", ->
# 	print area_drag.midX
	if area_drag.midX < 377
		btn_reject.scale = Utils.modulate(area_drag.midX, [377,120],[1,5])
		btn_reject.borderWidth = Utils.modulate(area_drag.midX, [377,120],[4,1])
		btn_reject.x = Utils.modulate(area_drag.midX, [377,120],[0,60])
		img_profile.opacity = Utils.modulate(area_drag.midX, [377,120],[1,0.2])
		callerid.y = Utils.modulate(area_drag.midX, [377,120],[344,354])
		callerid.scale = Utils.modulate(area_drag.midX, [377,120],[1,0.98])
		icon_phone.rotation = Utils.modulate(area_drag.midX, [377,120],[0,135])
		icon_phone_reject.opacity = Utils.modulate(area_drag.midX, [377,120],[0,1])
		icon_phone_basic.opacity = Utils.modulate(area_drag.midX, [377,120],[1,0])
	else if area_drag.midX > 377
		btn_accept.scale = Utils.modulate(area_drag.midX, [377,634],[1,5])
		btn_accept.borderWidth = Utils.modulate(area_drag.midX, [377,634],[4,1])
		btn_accept.x = Utils.modulate(area_drag.midX, [377,634],[664,604])
		callerid.scale = Utils.modulate(area_drag.midX, [377,634],[1,1.1])
		icon_phone_accept.opacity = Utils.modulate(area_drag.midX, [377,634],[0,1])
		icon_phone_basic.opacity = Utils.modulate(area_drag.midX, [377,634],[1,0])

task.on Events.Click, ->
	main.animate
		properties :
			y : 72
	Utils.delay 0.5, ->
		task.visible = false
		call.visible = false
		
call.on Events.Click, ->
	main.animate
		properties :
			opacity : 1
	Utils.delay 0.5, ->
		task.visible = false
		call.visible = false



modules_02 = require "page"

contraints = new Layer 
	width : Screen.width, height : Screen.height
	y : Screen.height/3

noti_container = new Layer
	width : Screen.width, height : Screen.height
	y : Screen.height/3
	backgroundColor : "rgba(255,255,255,1)"
modules_02.cardtype(noti_container)

noti_container.draggable.enabled = true
noti_container.draggable.horizontal = false

noti_container.draggable.constraints = noti_container.frame
# Customize the momentum animation
noti_container.draggable.momentumOptions = {
	friction: 10
	tolerance: 0.5
}

# Customize the bounce animation
# We make it snap back to its constraints really quickly
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
#     print noti_container.draggable.direction
    
 # Get the x and y position of the layer
# noti_container.on Events.DragMove, ->
#     print noti_container.draggable.offset
#     print noti_container.y

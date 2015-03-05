Framer.Device.deviceType = "iphone-6-spacegray"

bg = new BackgroundLayer
	backgroundColor:"#28AFFA"
	
layerA = new Layer
	backgroundColor : "#fff"
	width : 200, height : 200
	
layerB = new Layer
	backgroundColor : "#fff"
	width : 200, height : 200, borderRadius : layerA.width/2
	
	
layerA.center()
layerB.center()

layerA.y -= 520
layerA.x -= 120
layerB.x += 120
	

layerA.animate
	properties :
		rotation : 90
		borderRadius : 15
		y : screen.height - 400
	time : 0.5
	curve : "spring"
		
layerB.animate
	properties :
		rotation : 90
		borderRadius : 15
	
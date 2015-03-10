bg = new BackgroundLayer
bg.backgroundColor = "#49B5FF"

layerA = new Layer
	width : 200, height : 200
	backgroundColor : "#fff"

layerA.borderRadius = layerA.width/2
layerA.center()
originX = layerA.x
originY = layerA.y

window.onresize = ->
	layerA.center()
	originX = layerA.x
	originY = layerA.y
	

layerA.draggable.enbled = true
layerA.draggable.speedX = 0.2
layerA.draggable.speedY = 2

layerA.on Events.DragEnd, ->
	layerA.animate
		properties : 
			x : originX
			y : originY
		curve : "spring(300,18,10)"
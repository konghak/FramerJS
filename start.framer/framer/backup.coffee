Framer.Device.deviceType = "iphone-6-spacegray"

bg = new BackgroundLayer
	backgroundColor:"#28AFFA"
	
layerA = new Layer
	width : 160, height : 160, backgroundColor : "white"

layerB = new Layer
	width : 160, height : 160, backgroundColor : "white"
	
layerA.borderRadius = layerA.width/2

layerA.center()
layerB.center()
layerA.x-=100
layerB.x+=100

layerA.states.add(
	one : {scale : 2}
	two : {scale : 1}
)

layerA.states.animationOptions =
	curve : "spring(500,20,10)"


layerA.on Events.Click, ->
	layerA.states.next("one","two")
	print layerA.states.state
	
layerB.states.add (
	one : scale : 0.5, blur : 20
	two : scale : 1 , blur : 1
)
layerB.states.animationOptions = 
	curve : "spring(500,20,50)"
	time : 0.05
	repeat : 100
	
layerB.on Events.Click, ->
	layerB.states.next("one","two")
	
	
	
	
	

	
	


	
	
# image viewer prototype by Junhyuk Jang
# http://dribbble.com/junhyuk
# mail.hyuk@gmail.com

# set items
items = []
itemRows = 5
itemCols = 3
itemWidth = Screen.width/itemCols
itemHeight = Screen.height/itemRows
pics = ["1.png", "2.png", "3.png", "4.png", "5.png", "6.png", "7.png", "8.png", "9.png", "10.png", "11.png", "12.png", "13.png", "14.png", "15.png"]
count = 0

# set layers in items
addItem = (row, col) ->
	item = new Layer
		width: itemWidth
		height: itemHeight
		x: col * itemWidth
		y: row * itemHeight
		originX: .5 * col
		originY: .25 * row
		superLayer: container 
		image: "images/" + pics[count++]

# item states		
	item.states.add
		normal: {originX:.5 * col, originY:.25 * row, scale: 1, opacity:.3, y:item.y}
		large: {originX:.5 * col, originY:.25 * row, scale: 2, opacity:1}
		view: {originY:0, scale: 3, y:Screen.height * .2}
	item.states.animationOptions =
		curve: "spring(200,20,10)"
		time: .1
	item.states.switchInstant "normal"
	items.push item

# interactive container
container = new Layer
	width: itemWidth * itemWidth
	height: itemRows * itemHeight
	backgroundColor: 'transparent'

# touch events
container.on Events.TouchStart, (e) ->
	for item, i in items
		if (e.offsetY > item.minY && e.offsetY < item.maxY && e.offsetX > item.minX && e.offsetX < item.maxX)
			item.states.switch "large"
			item.bringToFront()
		else
			item.states.switch "normal"
			item.sendToBack()

# each image size up when you drag screen
	container.on Events.TouchMove, (e) ->
		for item, i in items
			if (e.offsetY > item.minY && e.offsetY < item.maxY && e.offsetX > item.minX && e.offsetX < item.maxX)
				item.states.switch "large"
				item.bringToFront()
			else
				item.states.switch "normal"
				item.sendToBack()

# image open	
container.on Events.TouchEnd, (e) ->
	for item, i in items
		if (e.offsetY > item.minY && e.offsetY < item.maxY && e.offsetX > item.minX && e.offsetX < item.maxX)
			item.states.switch "view"
			item.bringToFront()
			label = new Layer
				width: Screen.width
				height: 150
				backgroundColor: 'transparent'
			label.html = "<div style='font-size: 80px; text-align:center; position: relative; top:50px;'>#{pics[i]}</style>"
			
# image close		
	container.on Events.TouchMove, (e) ->
		for item, i in items
			item.states.switch "normal"
			item.sendToBack()
			label.destroy()

# rows and cols loop
for row in [0..itemRows-1]
	for col in [0..itemCols-1]
		addItem(row,col)
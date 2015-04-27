# Sketch Import
sketch = Framer.Importer.load "imported/simple-scroll"

# Set up a new ScrollComponent
# We only allow for vertical scrolling and inset the content 
scroll = new ScrollComponent 
	y: 128
	width: Screen.width
	height: Screen.height - 128 - 98
	superLayer: sketch.content
	scrollHorizontal: false
	contentInset: {top:32, bottom:32}

# Create and style the cards within a for-loop
# Learn more about loops: framerjs.com/learn/coffeescript/loops-and-conditionals/
for i in [0...20]
	layer = new Layer 
		backgroundColor: "#fff", 
		width: scroll.width - 48, height: 400 
		x: 24, y: (400 + 32) * i 
		borderRadius: 6
		superLayer: scroll.content
		
	layer.style.boxShadow = "0 1px 6px rgba(0,0,0,0.2)"
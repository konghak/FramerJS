# This imports all the layers for "scroll" into scrollLayers

Bg = new BackgroundLayer
	backgroundColor : 'rgba(255,255,255,1)'

sketch = Framer.Importer.load "imported/scroll"
Utils.globalLayers(sketch)

# Wrap the feed in a new ScrollComponent
scroll = ScrollComponent.wrap(bar)
scroll.frame = Screen.frame
scroll.contentInset =
	top: 100
	bottom : 100
scroll.scrollHorizontal = false


print scroll.content
print bar

# scroll = new ScrollComponent
# 	width : Screen.width
# 	height : Screen.height
# 	scrollHorizontal : false
# 	backgroundColor : 'rgba(255,255,255,1)'
# 	contentInset :
# 		top : 30
# 		bottom : 30	
# 	
# Wrap the "content" layer group






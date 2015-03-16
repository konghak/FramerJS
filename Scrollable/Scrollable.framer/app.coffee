# Sketch Import
sketch = Framer.Importer.load "imported/Scrollable"

# Make the content group scrollable
sketch.content.scroll = true

# Copy the images and place them within our navBar
blurredImages = sketch.images.copy()
blurredImages.superLayer = sketch.navBar

# We blur the copied content and darken it by lowering the brightness
blurredImages.blur = 40
blurredImages.brightness = 25

# Enable clipping on the navBar and bring its content to front
sketch.navBar.clip = true 
sketch.navBarContent.bringToFront()

# Make the blurred  layer scroll along with our content
sketch.content.on Events.Scroll, -> 
	blurredImages.y = -this.scrollY + sketch.images.y
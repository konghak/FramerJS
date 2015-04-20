(function() {
  var i, j, layer, scroll, sketch;

  sketch = Framer.Importer.load("imported/simple-scroll");

  scroll = new ScrollComponent({
    y: 128,
    width: Screen.width,
    height: Screen.height - 128 - 98,
    superLayer: sketch.content,
    scrollHorizontal: false,
    contentInset: {
      top: 32,
      bottom: 32
    }
  });

  for (i = j = 0; j < 20; i = ++j) {
    layer = new Layer({
      backgroundColor: "#fff",
      width: scroll.width - 48,
      height: 400,
      x: 24,
      y: (400 + 32) * i,
      borderRadius: 6,
      superLayer: scroll.content
    });
    layer._variableName = "layer";
    layer.style.boxShadow = "0 1px 6px rgba(0,0,0,0.2)";
  }

}).call(this);

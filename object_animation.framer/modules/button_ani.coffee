exports.flipCard = (one, two, perspective, flipCurve, x, y, superLayer) ->
    # Create a new container layer
    perspectiveLayer = new Layer
        width: one.width 
        height: one.height 
        backgroundColor: "transparent"
    perspectiveLayer.perspective = perspective
    perspectiveLayer.x = x
    perspectiveLayer.y = y
    perspectiveLayer.superLayer = superLayer
    
    container = new Layer
        width: one.width
        height: one.height
        backgroundColor: "transparent"
        superLayer: perspectiveLayer

    # Center the container
    container.center()
    
    #Set superLayer for both front and back layers
    two.superLayer = container
    one.superLayer = container
    
    # Rotate the back image on intial
    two.rotationY = 180    
    #######################
    # States
    #######################
    
    
    one.states.add
        one: {opacity: 1}
        two: {opacity: 0}
    one.states.animationOptions =
        curve: flipCurve
    one.states.switchInstant("one")
    
    two.states.add
        one: {opacity: 0}
        two: {opacity: 1}
    two.states.animationOptions =
        curve: flipCurve
    two.states.switchInstant("one")
    
    container.states.add
        one: {rotationY: 0}
        two: {rotationY: 180}
    container.states.animationOptions =
        curve: flipCurve
    container.states.switchInstant("one")
    container.on Events.Click, ->
        this.states.next(["two","one"])
        two.states.next(["two","one"])
        one.states.next(["two","one"])






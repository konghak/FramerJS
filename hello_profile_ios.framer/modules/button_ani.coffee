exports.flipCard = (front, back, perspective, flipCurve, x, y, superLayer) ->
    # Create a new container layer
    perspectiveLayer = new Layer
        width: front.width + 60
        height: front.height + 40
        backgroundColor: "transparent"
    perspectiveLayer.perspective = perspective
    perspectiveLayer.x = x
    perspectiveLayer.y = y
    perspectiveLayer.superLayer = superLayer
    
    container = new Layer
        width: front.width
        height: front.height
        backgroundColor: "transparent"
        superLayer: perspectiveLayer

    # Center the container
    container.center()
    
    #Set superLayer for both front and back layers
    back.superLayer = container
    front.superLayer = container
    
    # Rotate the back image on intial
    back.rotationY = 180    
    #######################
    # States
    #######################
    
    
    front.states.add
        front: {opacity: 1}
        back: {opacity: 0}
    front.states.animationOptions =
        curve: flipCurve
    front.states.switchInstant("front")
    
    back.states.add
        front: {opacity: 0}
        back: {opacity: 1}
    back.states.animationOptions =
        curve: flipCurve
    back.states.switchInstant("front")
    
    container.states.add
        front: {rotationY: 0}
        back: {rotationY: 180}
    container.states.animationOptions =
        curve: flipCurve
    container.states.switchInstant("front")
    container.on Events.Click, ->
        this.states.next(["back","front"])
        back.states.next(["back","front"])
        front.states.next(["back","front"])






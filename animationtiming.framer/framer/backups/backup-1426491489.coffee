bg = new BackgroundLayer
bg.backgroundColor = "white"

#오브젝트 기본 사이즈
basic_width = 100
basic_height = 100

#기본 마진
basic_margin = 20


ease = new Layer
	width : basic_width, height : basic_height, x : basic_margin
	backgroundColor : "#49B5FF"
	
ease_in = new Layer
	width : basic_width, height : basic_height, x : basic_margin
	backgroundColor : "#49B5FF"
	
ease_out = new Layer
	width : basic_width, height : basic_height, x : basic_margin
	backgroundColor : "#49B5FF"
	
ease_in_out = new Layer
	width : basic_width, height : basic_height , x : basic_margin
	backgroundColor : "#49B5FF"
	
ease_bezier = new Layer
	width : basic_width, height : basic_height , x : basic_margin
	backgroundColor : "#49B5FF"

#스타트 버튼
btn_start = new Layer
	width : basic_width+100, height : basic_height, x : basic_margin
	backgroundColor : "gray"
	
#원으로 만들기
ease.borderRadius = ease.width/2
ease_out.borderRadius = ease_out.width/2
ease_in.borderRadius = ease_in.width/2
ease_in_out.borderRadius = ease_in_out.width/2

ease_bezier.borderRadius = ease_bezier.width/2

	
ease.y = basic_margin
ease_out.y = ease.maxY+basic_margin
ease_in.y = ease_out.maxY+basic_margin
ease_in_out.y= ease_in.maxY+basic_margin
ease_bezier.y= ease_in_out.maxY+basic_margin+40
	
btn_start.center()
btn_start.y += 560

ease.states.add(
	start : { x : basic_margin }
	end : { x : bg.width-(basic_width+basic_margin)}
)
ease_out.states.add(
	start : { x : basic_margin }
	end : { x : bg.width-(basic_width+basic_margin)}
)
ease_in.states.add(
	start : { x : basic_margin }
	end : { x : bg.width-(basic_width+basic_margin)}
)
ease_in_out.states.add(
	start : { x : basic_margin }
	end : { x : bg.width-(basic_width+basic_margin)}
)
ease_bezier.states.add(
	start : { x : basic_margin }
	end : { x : bg.width-(basic_width+basic_margin)}
)

time = 0.5

# animation value
ease.states.animationOptions =
	curve : "ease"
	time : time
ease_out.states.animationOptions =
	curve : "ease-out"
	time : time
ease_in.states.animationOptions =
	curve : "ease-in"
	time : time
ease_in_out.states.animationOptions =
	curve : "ease-in-out"
	time : time
	
#http://easings.net/# 에서 값 조정
ease_bezier.states.animationOptions =
	curve : "cubic-bezier(0.80, 0.01, 0.3, 1.0)"
	time : time

btn_start.on Events.Click, ->
	ease.states.next("start","end")
	ease_out.states.next("start","end")
	ease_in.states.next("start","end")
	ease_in_out.states.next("start","end")
	ease_bezier.states.next("start","end")
	
	
bg = new BackgroundLayer
	backgroundColor : "rgba(255,255,255,1)"
	
	
case_01 = new Layer
	width : 60, height : 60
	backgroundColor : "rgba(123,223,3,1)"
	clip : false
case_01.borderRadius = case_01.width/2
case_01.center()

radiusLength = 140 #중심축에서 떨어진 원의 거리
radius = 10  #원 크기
numCircles = 20  #원 갯수
allCircles = [] #원 배열

for i in [1..numCircles]

	# 원둘레로 뿌려주기
	positions = 360 / numCircles
	angle = positions * i
	
	#월들 위치지정
	adjSide = Math.cos(angle * Math.PI/180)*radiusLength
	oppSide = Math.sin(angle * Math.PI/180)*radiusLength
	adjSide = Utils.round(adjSide, 0) #x축 소수점 제거
	oppSide = Utils.round(oppSide, 0) #y축 소수점 제거

	#월 레이어 생성
	circle = new Layer
		x : adjSide+case_01.width/2-radius/2
		y : oppSide+case_01.width/2-radius/2
		backgroundColor : "#000000"
		height : radius, width : radius
		opacity: 0
		borderRadius: radius/2
		name : "circle_" + i
		superLayer : case_01


	circle.states.add({
		out: {x:adjSide+case_01.width/2-radius/2, y:oppSide+case_01.width/2-radius/2, scale : 1.4, opacity : 0.8}
		})
		
	circle.states.animationOptions = {
		curve: "spring(300,20,0)"
		delay: 0.01 * i
        }

	allCircles.push circle #add cirlce to an array
	
case_01.on Events.Click,(event, layer) ->
	for i in [0..numCircles]
		allCircles[i].states.next()
	
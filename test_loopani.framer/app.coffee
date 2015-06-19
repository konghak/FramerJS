bg = new BackgroundLayer
	backgroundColor : "rgba(255,255,255,1)"
	
	
case_01 = new Layer
	width : 60, height : 60
case_01.center()

radiusLength = 140 #중심축에서 떨어진 원의 거리
radius = 10  #원 크기
numCircles = 30  #원 갯수
allCircles = [] #원 배열

for i in [1..numCircles]

	# 원둘레로 뿌려주기
	positions = 360 / numCircles
	angle = positions * i
       
	adjSide = Math.cos(angle * Math.PI/180)*radiusLength
	oppSide = Math.sin(angle * Math.PI/180)*radiusLength
	adjSide = Utils.round(adjSide, 0)
	oppSide = Utils.round(oppSide, 0)

	circle = new Layer
		x : adjSide+case_01.midX+radius/2
		y : oppSide+case_01.midY+radius/2
		backgroundColor : "#000000"
		height : radius, width : radius
		opacity: 0.7
		borderRadius: radius/2
		name : "circle_" + i


	circle.states.add({
		out: {opacity : 0.8, opacity : 0}
		})
		
	circle.states.animationOptions = {
		curve: "spring(300,20,0)"
		delay: 0.01 * i
        }

	allCircles.push circle #add cirlce to an array
# for i in [0..3]
# 	print "A"+i
# 	
# 	
# layers=[1,3,5,7]
# for layer in layers
# 	if layer is 2
# 		print layer
		

# for구문, 리스트 만들기, 스크롤링


bg = new BackgroundLayer 
bg.backgroundColor = "#2DD7AA"

container = new Layer
	width : 400, height : 600, backgroundColor : "transparent", clip : true
	
container.center()
window.onresize = ->
	container.center()
	

# row 사이즈 정의
row_width = 400
row_height = 100
row_Ydistance = row_height + 20

# row 갯수	
total_rnum = 10

for i in [0..total_rnum-1]
	row = new Layer 
		width : 400, height : 100, borderRadius : 8, opacity : 1
		backgroundColor : "white", y : i*120, superLayer : container
		
	row.html = row.index
	row.style.fontSize = "24px"
	row.style.fontWeight = "500"
	row.style.color = "#999"
	row.style.padding = "24px"
	
	# gradiation은로 opacity 조절하기
	row.opacity = 1-(i*(1/total_rnum))
	#print row.opacity
	
	
	
container.scroll = true





	
	






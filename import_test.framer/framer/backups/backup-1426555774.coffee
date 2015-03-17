# This imports all the layers for "import_test" into import_testLayers1

importA = Framer.Importer.load "imported/import_test"

Framer.Device.deviceType = "nexus-5-black"

# print Framer.Device.screen.width
# print Framer.Device.screen.height 

bg = new BackgroundLayer



layerB = new Layer

print importA.layerA.backgroundColor, layerB.backgroundColor

layerB.backgroundColor ="blue"
importA.layerA.backgroundColor = "transparent"

print importA.layerA.backgroundColor

print importA.layerA.backgroundColor, layerB.backgroundColor

importA.layerA.opacity = 0.5
importA.red.opacity = 0.2
# importA.groupA.blue.opacity = 0.2



#모든 레이어 선택
for aa, bb of importA
	print aa, bb

	
#특정그룹의 레이어 선택
for name, layer of importA.groupB.subLayers
	print name, layer


#객체 for문으로 돌려서 프로퍼티들 빼내기
myObject =
    name: "Koen"
    city: "Amsterdam"
    age: 31
    
for a, b  of myObject
	print a,b
	
	
myArray = [1, 2, 3, 4, 5]

for number in myArray
    print number 

for number of myArray
    print number 
    


    

# This imports all the layers for "import_test" into import_testLayers1

importA = Framer.Importer.load "imported/import_test"

Framer.Device.deviceType = "nexus-5-black"

# print Framer.Device.screen.width
# print Framer.Device.screen.height 

bg = new BackgroundLayer



importA.layerA.opacity = 0.5
importA.red.opacity = 0.2
# importA.groupA.blue.opacity = 0.2

#모든 레이어 선택
for name, layer of importA
	print name, layer
	
#특정그룹의 레이어 선택
for name, layer in importA.groupB.subLayers
	print name, layer

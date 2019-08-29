extends Node2D

var dirt = preload("res://scenes/dirt.tscn")
var dirtRocks = preload("res://scenes/dirtRock.tscn")
#var levelNode = Node2D.new()

var levelOne = {}
var levelSize = 50
var tileX = -64
var tileY = -24
var list = [['cat'],['dog']]

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	
#	add_child(levelNode)

	for tile in range(1,11):
#		top 10 tiles
		# key is number 1-50 value is dirt instance()
		levelOne[tile] = dirt.instance()
		levelOne[tile].position.y = tileY
		tileX += 128
		levelOne[tile].position.x += tileX
		add_child(levelOne[tile])
		
	tileY += 128
	tileX = 64
	
	for tile in 50:
		# make a new tile
		levelOne[tile] = dirt.instance()
		# make sure it doesn't pass X
		if tileX > get_viewport().size.x:
			tileX = 64
			tileY += 128

		levelOne[tile].position.x = tileX
		levelOne[tile].position.y = tileY
		tileX += 128

		add_child(levelOne[tile])
		
	tileY += 128
	tileX = 64
	
	for tile in 10:
#		bottom 10 tiles
		levelOne[tile] = dirt.instance()
		levelOne[tile].position.y = tileY
		levelOne[tile].position.x += tileX
		tileX += 128
		add_child(levelOne[tile])
		
		
	#randomize it
	# !!! not working
	# random int 1 - 50
	var num = randi()%levelSize+1
	print('number: ', num)

	levelOne[num] = dirtRocks.instance()

	print('levelsize at end: ', levelOne.size())
	
	# add it to the node. Not just the array
#	main.add_child(levelOne.num)


	print('############################')
	print('############################')
	print('Done building level')
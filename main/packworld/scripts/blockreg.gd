extends Node

var block = preload("res://components/block.tscn")

const blocks = {
	"stone": {
		"name": "stone",
		"texture": "res://assets/blocks/stone.png",
		"blocktexture": "res://assets/blocks/stone.tres"
	},
	"dirt": {
		"name": "dirt",
		"texture": "res://assets/blocks/dirt.png",
		"blocktexture": "res://assets/blocks/dirt.tres"
	},
	"grass": {
		"name": "grass",
		"texture": "res://assets/blocks/grass.png",
		"blocktexture": "res://assets/blocks/grass.tres"
	}
}

func inst(pos, blockid):
#	instantiate block
	var blockinstance = block.instantiate()
	#	send pos to block
	blockinstance.position = pos
	#	send blockid to block
	blockinstance.blockid = blockid
	add_child(blockinstance)

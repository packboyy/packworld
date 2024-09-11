extends Node

const items = {
	"drill": {
		"name": "drill",
		"texture": "res://assets/items/drill.png",
		"stacksize": 3
	}
}

#func inst(pos, blockid):
##	instantiate block
	#var blockinstance = block.instantiate()
	##	send pos to block
	#blockinstance.position = pos
	##	send blockid to block
	#blockinstance.blockid = blockid
	#add_child(blockinstance)

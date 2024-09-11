extends Node

@export var slotid:int = 0

@onready var itemtexture = $itemtexture
@onready var stackamount = $stackamt
	
	
func _process(float) -> void:
	updt()

func updt():
	var player = get_tree().get_first_node_in_group("player")
	var itemid = player.inv.inventory[slotid].id
	var amount:int =  player.inv.inventory[slotid].amt
	stackamount.set_text(str(amount))
	if itemid != "none":
		if load(BlockReg.blocks.get(itemid).texture) != null:
			itemtexture.texture = load(BlockReg.blocks.get(itemid).texture)
		else:
			itemtexture.texture = load(ItemReg.items.get(itemid).texture)



	
	

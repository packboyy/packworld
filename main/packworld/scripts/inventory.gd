extends Node

@export var invsize:int = 5

var inventory = {}
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for i in (invsize):
		inventory[i] = {
		"id": "none",
		"amt": 0
		}
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func additem(itemid, amt):
	for i in(invsize):
		if inventory[i].amt == 0:
			inventory[i].id = itemid
			var oldamt = inventory[i].amt
			inventory[i].amt = oldamt + amt
			print(inventory[i].id)
			print(inventory[i].amt)
			break
		else:
			if inventory[i].id == itemid:
				var oldamt = inventory[i].amt
				inventory[i].amt = oldamt + amt
				break
		

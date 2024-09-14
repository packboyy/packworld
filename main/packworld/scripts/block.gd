extends StaticBody3D

@export var blockid:String

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var blockmesh = $blockmesh
	blockmesh.set_surface_override_material(0, load(BlockReg.blocks.get(blockid).blocktexture))
	#print(block_id)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _input_event(camera: Camera3D, event: InputEvent, event_position: Vector3, normal: Vector3, shape_idx: int) -> void:
#	block breakingg
	if event is InputEventMouseButton and event.is_pressed():
		if Input.is_action_pressed("click_left"):
			queue_free()
			var player = get_tree().get_first_node_in_group("player")
			player.inv.additem(blockid, 1)
			player.selectedpos = round(position)
			print(player.selectedpos)
	

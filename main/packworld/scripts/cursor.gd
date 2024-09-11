extends Node

# Load the custom images for the mouse cursor.
var mouse = load("res://assets/mouse.png")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Input.set_custom_mouse_cursor(mouse)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

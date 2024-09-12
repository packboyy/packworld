extends Camera3D

var zoomspeed: float = 0.05
var minzoom: float = 0.001
var maxzoom: float = 2.0
var dragsens: float = 0.0009

var fingers := {}

func _input(event):
	if event is InputEventMouseMotion and Input.is_action_pressed("click_left"):
		var coords:Vector2 = Vector2(position.x, position.y)
		coords.x -= event.relative.x * dragsens * position.z
		coords.y += event.relative.y * dragsens * position.z
		position.x = coords.x
		position.y = coords.y
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_WHEEL_UP):
		position.z += position.z * zoomspeed
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_WHEEL_DOWN):
		position.z -= position.z * zoomspeed
		
	if event is InputEventScreenTouch and !event.pressed:
		fingers.erase(event.index)
	
	elif event is InputEventScreenTouch and event.pressed:
		var screenpos = event.position
		var coords = Vector2(position.x, position.y)
		fingers[event.index] = [screenpos, coords]

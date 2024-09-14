extends Camera3D

var zoomspeed: float = 0.001
var minzoom: float = 0.001
var maxzoom: float = 100.0
var dragsens: float = 0.002
var oldpos: float = 1.0
var startdist: float = 0
var fingers := {}

func _input(event):
	if event is InputEventMouseMotion and Input.is_action_pressed("click_left") or event is InputEventScreenDrag and fingers.size() == 1:
		var coords:Vector2 = Vector2(position.x, position.y)
		coords.x -= event.relative.x * dragsens * position.z
		coords.y += event.relative.y * dragsens * position.z
		position.x = coords.x
		position.y = coords.y
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_WHEEL_UP):
		position.z += position.z * zoomspeed
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_WHEEL_DOWN):
		position.z -= position.z * zoomspeed
		
	
	if event is InputEventScreenTouch and event.pressed:
		#finger touches
		fingers[event.index] = event.position
		#if there's two fingers, set startdist to the distance between them
		if fingers.size() == 2:
			var fingerpos = fingers.values()
			startdist = fingerpos[0].distance_to(fingerpos[1])
			oldpos = position.z
	elif event is InputEventScreenTouch and !event.pressed:
		#finger lifted
		fingers.erase(event.index)
		if fingers.size() < 2:
			startdist = 0.0
	if event is InputEventScreenDrag:
		fingers[event.index] = event.position
		if fingers.size() == 2:
			var fingerpos = fingers.values()
			var currentdist = fingerpos[0].distance_to(fingerpos[1])
			if startdist > 0:
				var zoomfactor = (currentdist - startdist) * zoomspeed
				position.z = clamp(oldpos * -zoomfactor, minzoom, maxzoom)
			
#func _handle_drag(event: InputEventScreenDrag):
	#if fingers.size() == 2:
			#var fingerpos = fingers.values()
			#var currentdist = fingerpos[0].distance_to(fingerpos[1])
			#var zoomfactor = (currentdist - startdist) * zoomspeed
			#position.z = clamp(startzoom - zoomfactor, minzoom, maxzoom)

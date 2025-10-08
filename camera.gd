extends Camera2D

func _process(delta: float) -> void:
	position.y += Input.get_axis("up","down") * 3
	position.x += Input.get_axis("left","right") * 3
	
func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.is_pressed():
			if event.button_index == MOUSE_BUTTON_WHEEL_UP:
				zoom *= 1.2
			if event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
				zoom *= 0.8

extends TileMapLayer

var ButtonHeld = false

var types = {"Wall":Vector2i(1,0),"JumpPad":Vector2i(0,0),"LeftPad":Vector2i(4,0),"RightPad":Vector2i(5,0),}
var type = "Wall"
var erase := false

func _process(delta: float) -> void:
	ButtonHeld = Input.is_action_pressed("click")
	for i in range(9):
		if Input.is_action_pressed(str(i + 1)):
			if i < len(types):
				type = types.keys()[i]
				var x = $"../CanvasLayer/Sprite2D".region_rect
				$"../CanvasLayer/Sprite2D".region_rect = Rect2(types[type].x * 16, types[type].y * 16,16,16)
	if Input.is_action_just_pressed("erase toggle"):
		erase = !erase
		$"../CanvasLayer/Eraser".visible = erase
		$"../CanvasLayer/Eraser_inactive".visible = !erase
	$"../Erase".position = (get_global_mouse_position() - Vector2(4,4)).snapped(Vector2(16,16))
	if ButtonHeld:
		if !erase:
			set_cell(local_to_map(get_global_mouse_position()),0,types[type])
		else:
			erase_cell(local_to_map(get_global_mouse_position()))

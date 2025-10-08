extends CharacterBody2D

var dir = 1
var no_wallie = 0

var touching = false


func _process(delta: float) -> void:
	if touching:
		velocity.y = -150
	velocity.x = dir * 50
	velocity += 0.01 * get_gravity()
	if no_wallie > 0:
		no_wallie -= 1
	if is_on_wall() and no_wallie < 1:
		dir = -dir
		no_wallie =3
	move_and_slide()

func _on_jump_pad_body_entered(body: Node2D) -> void:
	velocity.y = -150
	touching = true

func _on_jump_pad_body_exited(body: Node2D) -> void:
	touching = false

func _on_right_pad_body_entered(body: Node2D) -> void:
	dir = 1

func _on_left_pad_body_entered(body: Node2D) -> void:
	dir = -1

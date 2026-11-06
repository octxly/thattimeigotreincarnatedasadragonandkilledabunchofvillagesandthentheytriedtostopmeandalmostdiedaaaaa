extends CharacterBody2D


const SPEED = 300.0

func get_input():
	var input_dir = Input.get_vector("left", "right", "up", "down")
	velocity = input_dir * SPEED
	
	if velocity.x > 0:
		$Sprite2D.flip_h = true
	elif velocity.x < 0:
		$Sprite2D.flip_h = false

func _physics_process(delta: float) -> void:
	get_input()
	move_and_collide(velocity * delta)

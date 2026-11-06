extends CharacterBody2D

@onready var dragon = get_tree().get_first_node_in_group("dragon")

const SPEED = 200.0
var direction = Vector2.ZERO

func _on_timer_timeout():
	check_target()

func check_target():
	# Check
	if dragon == null:
		print("hi")
		return
	
	var dragon_pos = dragon.global_position
	direction = global_position.direction_to(dragon_pos)

func _physics_process(delta: float) -> void:
	velocity = direction * SPEED
	
	if velocity.x > 0:
		$Sprite2D.flip_h = true
	elif velocity.x < 0:
		$Sprite2D.flip_h = false
	
	move_and_collide(velocity * delta)

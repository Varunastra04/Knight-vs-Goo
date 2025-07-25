extends Node2D

const SPEED = 60
var direction = 1

@onready var ray_cast_right: RayCast2D = $RayCastRight
@onready var ray_cast_left: RayCast2D = $RayCastLeft
@onready var ray_cast_down_left: RayCast2D = $RayCastDownLeft
@onready var ray_cast_down_right: RayCast2D = $RayCastDownRight
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D


func _process(delta: float) -> void:
	
	if direction == 1 and ray_cast_right.is_colliding():
		direction = -1
		animated_sprite.flip_h = true
	if direction == -1 and ray_cast_left.is_colliding():
		direction = 1
		animated_sprite.flip_h = false
	
	if direction == 1 and not ray_cast_down_right.is_colliding():
		direction = -1
		animated_sprite.flip_h = true
	if direction == -1 and not ray_cast_down_left.is_colliding():
		direction = 1
		animated_sprite.flip_h = false 

	position.x += direction * SPEED * delta

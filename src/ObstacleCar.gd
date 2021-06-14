extends KinematicBody2D

onready var player = get_node("/root/Game/Player")
export var velocity = Vector2(-30,0)

func _physics_process(delta):
	set_render_z()
	velocity = move_and_slide(velocity)
	if (global_position.x < -30):
		queue_free()

func set_render_z():
	if (player.global_position.y < global_position.y):
		z_index = 3
	else:
		z_index = 0

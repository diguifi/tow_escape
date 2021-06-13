extends KinematicBody2D

onready var player = get_node("/root/Game/Player")
var speed = 5
var player_pos_offset = Vector2(35,-2)

func _physics_process(delta):
	var dir = ((player.global_position-player_pos_offset) - global_position).normalized()
	move_and_collide(dir * speed * delta)


func _on_Area2D_body_entered(body):
	Signals.emit_signal('reset_score')
	get_tree().reload_current_scene()


func _on_Area2D_area_entered(area):
	Signals.emit_signal('reset_score')
	get_tree().reload_current_scene()

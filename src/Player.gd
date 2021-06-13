extends KinematicBody2D

var speed = 25
var max_x = 95
var min_x = 0
var max_y = 52
var min_y = 25
var velocity = Vector2.ZERO
var time = 0

func get_input():
	velocity = Vector2.ZERO
	if Input.is_action_pressed('ui_right') && position.x < max_x:
		velocity.x += 1
	if Input.is_action_pressed('ui_left') && position.x > min_x:
		velocity.x -= 1
	if Input.is_action_pressed('ui_down') && position.y < max_y:
		velocity.y += 1
	if Input.is_action_pressed('ui_up') && position.y > min_y:
		velocity.y -= 1

	velocity = velocity.normalized() * speed

func _physics_process(delta):
	time += delta
	set_points()
	get_input()
	velocity = move_and_slide(velocity)

func set_points():
	if time > 1:
		time = 0
		Signals.emit_signal('update_score',1)

func _on_Area2D_body_entered(body):
	Signals.emit_signal('reset_score')
	get_tree().reload_current_scene()

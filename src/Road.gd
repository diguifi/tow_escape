extends Node

onready var road1 = $Part1
onready var road2 = $Part2
export var scroll_speed = 50
var window_width = 127

func _physics_process(delta):
	move(delta)
	
func move(delta):
	road1.position.x -= scroll_speed * delta
	if (road1.position.x < -window_width):
		road1.position.x = window_width
	road2.position.x -= scroll_speed * delta
	if (road2.position.x < -window_width):
		road2.position.x = window_width

extends Node2D

onready var level_timer = $Timer
onready var game = get_node("/root/Game")
var scenes = []
export var path_to_obstacle = ""
export var chance_to_spawn = 0.8
export (Array, PackedScene) var obstacles
var random_scene = RandomNumberGenerator.new()
var selected_scene_index = 0
var is_player_dead = false
var last_index = -1

func _ready():
	load_level_scenes()
	_spawn_car()

func load_level_scenes():
	scenes.clear()
	scenes = obstacles

func _spawn_car():
	var percent = randf()
	if (!scenes.empty() && (percent < chance_to_spawn)):
		random_scene.randomize()
		selected_scene_index = random_scene.randi_range(0, scenes.size()-1)
		avoid_duplicate_chuncks()
		last_index = selected_scene_index
		var temp = scenes[selected_scene_index].instance()
		add_child_below_node(game, temp)

func avoid_duplicate_chuncks():
	if (selected_scene_index == last_index):
		if (selected_scene_index + 1 <= scenes.size()-1):
			selected_scene_index += 1
		else:
			selected_scene_index -= 1

func _player_dead():
	is_player_dead = true

func _on_Timer_timeout():
	call_deferred("_spawn_car")

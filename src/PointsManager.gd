extends Node

var points = 0
var max_points = 0

func _ready():
	Signals.connect("update_score", self, "_update_score")
	Signals.connect("reset_score", self, "_reset_score")
	
func _update_score(score_to_add):
	points += score_to_add
	if (points > max_points):
		max_points = points
		
func _reset_score():
	points = 0

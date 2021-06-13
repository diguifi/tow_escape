extends Control

onready var points_lbl = $Points
onready var max_points_lbl = $MaxPoints

func _ready():
	Signals.connect("update_score", self, "_update_score")
	Signals.connect("reset_score", self, "_reset_score")
	update_text()
	
func _update_score(score_to_add):
	update_text()
		
func _reset_score():
	update_text()

func update_text():
	points_lbl.text = String(PointsManager.points)
	max_points_lbl.text = String(PointsManager.max_points)

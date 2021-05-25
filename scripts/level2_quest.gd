extends Node2D


func _ready():
	G.quest_level = self

func back():
	G.quest2_complete = true
	G.load_level(2)

func _on_dead_area_body_entered(body):
	get_tree().reload_current_scene()

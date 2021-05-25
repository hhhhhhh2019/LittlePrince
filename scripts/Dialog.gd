extends Control

func _ready():
	G.dialog = self


func _on_yes_pressed():
	hide()
	G.level.to_quest()


func _on_no_pressed():
	if G.level.quest_complete == true:
		G.load_level(G.level_id + 1)
	hide()

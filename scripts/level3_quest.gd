extends Node2D


var first_super_jump = true


func _ready():
	G.quest_level = self
	G.quest_player.chest_open = true

func back():
	G.quest3_complete = true
	G.load_level(3)


func _on_jump_body_entered(body):
	if first_super_jump == false:
		print("super jump")
		G.quest_player.vel.y = -700
		G.quest_player.speed = 14
		$Timer.start()
	first_super_jump = false

func _on_Timer_timeout():
	G.quest_player.speed = 10

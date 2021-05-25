extends Node2D


var angle = 0
var quest_complete = false


func _ready():
	G.level = self


func _physics_process(delta):
	quest_complete = G.quest3_complete
	
	angle += 0.008
	
	$background.material.set_shader_param("angle", angle + $can_rotate.rotation)


func to_quest():
	G.load_level("3_quest")

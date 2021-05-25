extends Node2D


var angle = 0
var quest_complete = false


func _ready():
	G.level = self


func _physics_process(delta):
	angle += 0.007
	
	G.quest1_complete = quest_complete
	
	$background.material.set_shader_param("angle", angle + $can_rotate.rotation)

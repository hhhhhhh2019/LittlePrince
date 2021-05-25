extends Node2D


var angle = 0
var quest_complete = false
var lamp_changed = false


func _ready():
	G.level = self


func _physics_process(delta):
	quest_complete = G.quest5_complete
	
	angle += 0.02
	angle = angle - floor(angle / (PI * 2)) * angle
	
	if angle < PI:
		$can_rotate/lamp.animation = "on"
		if lamp_changed == false:
			$can_rotate/lamper/sprite.frame = 0
			lamp_changed = true
	else:
		$can_rotate/lamp.animation = "off"
		if lamp_changed == true:
			$can_rotate/lamper/sprite.frame = 0
			lamp_changed = false
	
	$background.material.set_shader_param("angle", angle + $can_rotate.rotation)


func to_quest():
	G.load_level("5_quest")

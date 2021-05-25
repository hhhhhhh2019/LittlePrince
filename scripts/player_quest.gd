extends KinematicBody2D

var vel = Vector2(0, 0)
var speed = 10
var jump_power = 400
var grav = 12

var on_stairs = false
var chest = false
var door = false
var chest_open = false


func _ready():
	G.quest_player = self


func _physics_process(delta):
	if Input.is_action_pressed("ui_left"):
		vel.x -= speed
		$sprite.animation = "walk"
		$sprite.flip_h = true
	elif Input.is_action_pressed("ui_right"):
		vel.x += speed
		$sprite.animation = "walk"
		$sprite.flip_h = false
	else:
		vel.x = 0
		$sprite.animation = "idle"
		$sprite.flip_h = false
	
	vel.x = clamp(vel.x, -200, 200)
	
	if Input.is_action_pressed("ui_up") and (is_on_floor() or on_stairs):
		vel.y = -jump_power
	elif Input.is_action_pressed("ui_down") and on_stairs:
		vel.y = jump_power
	elif not (is_on_floor() or on_stairs):
		vel.y = min(400, vel.y + grav)
	
	vel = move_and_slide(vel, Vector2.UP)

	if Input.is_action_just_pressed("ui_use"):
		if door and chest_open:
			G.quest_level.back()
		if chest:
			chest_open = true
			
			G.quest_level.get_node("level/chest/sprite").texture = load("res://textures/chest_open.png")
			G.quest_level.get_node("level/door/sprite").texture = load("res://textures/door_open.png")

func _on_area_area_entered(area):
	$label1.show()
	
	if area.name == "stairs":
		on_stairs = true
		$label1.hide()
	if area.name == "chest":
		chest = true
	if area.name == "door":
		door = true


func _on_area_area_exited(area):
	if area.name == "stairs":
		on_stairs = false
	if area.name == "chest":
		chest = false
	if area.name == "door":
		door = false
	
	$label1.hide()

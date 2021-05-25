extends AnimatedSprite

var obj = null

func _ready():
	G.level = self


func _physics_process(delta):
	if Input.is_action_pressed("ui_right"):
		animation = "walk"
		flip_h = false
		G.level.get_node("can_rotate").rotate(-0.01)
	
	elif Input.is_action_pressed("ui_left"):
		animation = "walk"
		flip_h = true
		G.level.get_node("can_rotate").rotate(0.01)
	
	else:
		animation = "idle"
		flip_h = false
	
	if Input.is_action_just_pressed("ui_use") and obj:
		$Dialog.set_position(Vector2(-1800, -950))
		if obj.name == "rose":
			G.quest1_complete = true
			G.level.quest_complete = true
		if G.level.quest_complete:
			G.dialog.get_node("ask").text = G.asks[obj.name+"_complete"]
			$Dialog.get_node("buttons1").hide()
			$Dialog.get_node("buttons2").show()
			$Dialog.show()
		else:
			G.dialog.get_node("ask").text = G.asks[obj.name]
			$Dialog.get_node("buttons1").show()
			$Dialog.get_node("buttons2").hide()
			$Dialog.show()
		
	if Input.is_action_pressed("ui_cancel"):
		G.goto("Choose_level")


func _on_area_area_entered(area):
	obj = area
	$label1.show()


func _on_area_area_exited(area):
	obj = null
	$label1.hide()

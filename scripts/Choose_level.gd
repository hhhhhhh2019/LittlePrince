extends Control



func _on_level1_pressed():
	G.load_level(1)


func _on_level2_pressed():
	G.load_level(2)


func _on_level3_pressed():
	G.load_level(3)


func _on_level4_pressed():
	G.load_level(4)


func _on_level5_pressed():
	G.load_level(5)


func _on_level6_pressed():
	G.load_level(6)


func _on_level7_pressed():
	G.load_level(7)


func _on_back_pressed():
	G.goto("Main_Menu")

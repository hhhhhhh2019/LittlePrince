extends Control



func _on_exit_pressed():
	G.exit()


func _on_settings_pressed():
	G.goto("Settings")


func _on_play_pressed():
	G.goto("Choose_level")

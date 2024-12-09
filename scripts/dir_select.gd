extends Control
@onready var game_select = get_node("../Game_select")

func _on_installed_games_pressed() -> void:
	hide()
	game_select.show()

func _on_games_on_usb_pressed() -> void:
	hide()
	game_select.show()

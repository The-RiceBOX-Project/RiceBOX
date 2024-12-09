extends Control
var games_folder = "games"
var mnt_folder = "mnt"

@onready var Game_button = preload("res://scenes/game_button.tscn")

@onready var Dir_select = get_node("../Dir_select")
@onready var game_buttons = $ScrollContainer/HBoxContainer
@onready var game_details_page = get_node("../Game_details")

func _ready() -> void:
	add_buttons()


func add_buttons() -> void:
	for game in DirAccess.get_directories_at(games_folder):
		var node = Game_button.instantiate()
		node.game_path = games_folder + "/" + game
		game_buttons.add_child(node)
		node.connect("game_selected", game_details_page._on_game_selected)
		
	for game in DirAccess.get_directories_at(mnt_folder):
		var node = Game_button.instantiate()
		node.game_path = mnt_folder + "/" + game
		node.is_on_usb = true
		game_buttons.add_child(node)
		node.connect("game_selected", game_details_page._on_game_selected)

func refresh():
	for child in game_buttons.get_children():
		game_buttons.remove_child(child)
	add_buttons()
	show()



func _on_back_pressed() -> void:
	hide()
	Dir_select.show()

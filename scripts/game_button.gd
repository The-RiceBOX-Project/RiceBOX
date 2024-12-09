extends TextureButton

@export var game_path : String
@export var is_on_usb = false
signal game_selected(game_path, is_on_usb)


func _ready() -> void:
	texture_normal = load(game_path + "/icon.png")


func _on_pressed() -> void:
	game_selected.emit(game_path, is_on_usb)

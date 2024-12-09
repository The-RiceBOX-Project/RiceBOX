extends Panel
@onready var icon = $Game_icon
@onready var game_name = $Name
@onready var game_description = $Description
@onready var game_version = $Version
@onready var game_creators = $Creators
@onready var download_or_update_button = $Download_or_Update
@onready var delete_button = $Delete
@onready var executeable = ''
var game_dir_path = ''

@onready var games_list = get_node("../Game_select")


func _on_game_selected(game_path, is_on_usb):
	game_dir_path = game_path
	var manifest_file = FileAccess.open(game_path + "/manifest.json", FileAccess.READ)
	var manifest_json = JSON.parse_string(manifest_file.get_as_text())
	
	executeable = game_path + "/exec"
	
	icon.texture = load(game_path + "/icon.png")
	game_name.text = manifest_json.name
	game_description.text = manifest_json.description
	game_version.text = manifest_json.version_display
	game_creators.text = manifest_json.creators
	
	if is_on_usb:
		download_or_update_button.text = "Download"
		delete_button.hide()
	else:
		delete_button.show()
		download_or_update_button.text = "Update"

	games_list.hide()
	show()


func _on_back_pressed() -> void:
	hide()
	games_list.refresh()


func _on_run_pressed() -> void:
	OS.execute(executeable, [])


func _on_delete_pressed() -> void:
	OS.execute("rm", ["-rf", game_dir_path])
	_on_back_pressed()

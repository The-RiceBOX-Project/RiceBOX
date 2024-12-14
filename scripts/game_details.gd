extends Panel
@onready var icon = $Game_icon
@onready var game_name = $Name
@onready var game_description = $Description
@onready var game_version = $Version
@onready var game_creators = $Creators
@onready var download_or_update_button = $Download_or_Update
@onready var delete_button = $Delete
@onready var play_button = $Run
var version_num = 0
@onready var executeable = ''
var game_dir_path = ''
var games_dir = "games"
var mnt_dir = "mnt"
var _is_on_usb = false


@onready var games_list = get_node("../Game_select")


func _on_game_selected(game_path, is_on_usb):
	game_dir_path = game_path
	var manifest_file = FileAccess.open(game_path + "/manifest.json", FileAccess.READ)
	var manifest_json = JSON.parse_string(manifest_file.get_as_text())
	
	executeable = game_path + "/exec"
	
	icon.texture = ImageTexture.create_from_image(Image.load_from_file(game_path + "/icon.png"))
	game_name.text = manifest_json.name
	game_description.text = manifest_json.description
	game_version.text = manifest_json.version_display
	game_creators.text = manifest_json.creators
	version_num = manifest_json.version
	
	if is_on_usb:
		download_or_update_button.text = "Download"
		_is_on_usb = true
		delete_button.hide()
	else:
		_is_on_usb = false
		delete_button.show()
		download_or_update_button.text = "Update"
	
	
	games_list.hide()
	$Focus_delay.start()
	show()


func _on_back_pressed() -> void:
	hide()
	games_list.refresh()
	games_list.show()


func _on_run_pressed() -> void:
	OS.execute(executeable, [])


func _on_delete_pressed() -> void:
	OS.execute("rm", ["-rf", game_dir_path])
	_on_back_pressed()


func _on_download_or_update_pressed() -> void:
	var game_dir_name = ''
	if _is_on_usb:
		game_dir_name = game_dir_path.lstrip(mnt_dir)
	else:
		game_dir_name = game_dir_path.lstrip(games_dir)
	print(game_dir_name)
	print(["-rf", mnt_dir + game_dir_name, games_dir + game_dir_name])
	OS.execute("cp", ["-rf", mnt_dir + game_dir_name, games_dir + game_dir_name])
	_on_back_pressed()


func _on_focus_delay_timeout() -> void:
	play_button.grab_focus()

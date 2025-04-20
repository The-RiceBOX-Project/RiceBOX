extends Panel

@onready var icon = $Game_icon
@onready var game_name = $Name
@onready var game_description = $Description
@onready var game_version = $Version
@onready var game_creators = $Creators
@onready var download_or_update_btn = $Download_or_Update
@onready var delete_btn = $Delete
@onready var play_btn = $Run
@onready var games_list = get_node("../Game_select")

@onready var executable = ""
var version_num = 0
var game_dir_path = ""
var _is_on_usb = false

const GAMES_DIR = "games"
const MNT_DIR = "mnt"


func _on_game_selected(game_path: String, is_on_usb: bool) -> void:
	game_dir_path = game_path
	_is_on_usb = is_on_usb
	
	var manifest_file = FileAccess.open(game_path + "/manifest.json", FileAccess.READ)
	var manifest_json = JSON.parse_string(manifest_file.get_as_text())
	
	executable = game_path + "/exec"
	
	icon.texture = ImageTexture.create_from_image(Image.load_from_file(game_path + "/icon.png"))
	game_name.text = manifest_json.name
	game_version.text = manifest_json.version_display
	game_creators.text = manifest_json.creators
	version_num = manifest_json.version
	game_description.text = manifest_json.description
	
	while game_description.get_line_count() > 3:
		game_description.text = game_description.text.substr(0, game_description.text.length() - 4) + "..."
	
	if is_on_usb:
		download_or_update_btn.text = "Download"
		download_or_update_btn.show()
		delete_btn.hide()
	else:
		download_or_update_btn.hide()
		delete_btn.show()
	
	games_list.hide()
	show()
	await get_tree().create_timer(0.2).timeout
	play_btn.grab_focus()


func _on_back_pressed() -> void:
	hide()
	games_list.refresh()
	games_list.show()


func _on_run_pressed() -> void:
	OS.execute(executable, [])


func _on_delete_pressed() -> void:
	OS.execute("rm", ["-rf", game_dir_path])
	_on_back_pressed()


func _on_download_or_update_pressed() -> void:
	var game_dir_name = ""
	
	if _is_on_usb:
		game_dir_name = game_dir_path.lstrip(MNT_DIR)
	else:
		game_dir_name = game_dir_path.lstrip(GAMES_DIR)
	
	var src = MNT_DIR + game_dir_name
	var dst = GAMES_DIR + game_dir_name
	
	OS.execute("cp", ["-rf", src, dst])
	_on_back_pressed()

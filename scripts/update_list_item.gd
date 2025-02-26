extends Control
var version
var date
var download_url
@onready var http_req = $HTTPRequest
@onready var update_text = get_node("../../../UpdatingText")
@onready var check_for_updates = get_node("../../../Check_for_updates")
@onready var download_completed = get_node("../../../DownloadCompleted")
@onready var updates_list = get_node("../../")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Version.text = version
	$Date.text = date


func _on_update_pressed() -> void:
	http_req.request(download_url)
	update_text.text = "Downloading version " + version + "..."
	update_text.show()
	updates_list.hide()
	check_for_updates.hide()

func _on_http_request_request_completed(_result: int, response_code: int, _headers: PackedStringArray, body: PackedByteArray) -> void:
	print("aaa")
	if response_code != 200:
		print("Download failed")
		return
	var file = FileAccess.open("updates/menu", FileAccess.WRITE)
	file.store_buffer(body)
	file.close()
	update_text.hide()
	download_completed.get_node("Label").text = "Update " + version + " has been downloaded, please restart your console in order to apply it."
	download_completed.show()
	

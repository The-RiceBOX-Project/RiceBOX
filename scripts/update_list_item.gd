extends Control
var version
var date
var download_url
@onready var http_req = $HTTPRequest

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Version.text = version
	$Date.text = date


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_update_pressed() -> void:
	print(download_url)
	http_req.request(download_url)


func _on_http_request_request_completed(result: int, response_code: int, headers: PackedStringArray, body: PackedByteArray) -> void:
	print("aaa")
	if response_code != 200:
		print("Download failed")
		return
	var file = FileAccess.open("updates/menu", FileAccess.WRITE)
	file.store_buffer(body)
	file.close()
	print("Update Downloaded")

extends TextureButton


func _on_pressed() -> void:
	OS.execute("poweroff", [])

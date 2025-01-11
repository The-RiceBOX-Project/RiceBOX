extends TextureButton


func _on_pressed() -> void:
	OS.execute("poweroff", [])


func _on_arduino_data_recieved(myString: String) -> void:
	print(myString)

extends Control
@export var textBox : Control
@export var exitFocus : Control
var is_uppercase = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for button in get_children():
		if button.name != "background":
			button.clicked.connect(_on_button_clicked)
	


func _on_focus_entered():
	show()
	$Space.grab_focus()




func _on_button_clicked(key):
	if key == "backspace":
		textBox.text = textBox.text.erase(textBox.text.length() - 1)
	elif key == "shift":
		print("shift")
		if is_uppercase:
			for button in get_children():
				if button.name != "background" and button.text != "EXIT":
					button.text = button.text.to_lower()
			is_uppercase = false
		else:
			for button in get_children():
				if button.name != "background" and button.text != "EXIT":
					button.text = button.text.to_upper()
			is_uppercase = true
	elif key == "EXIT":
		hide()
		exitFocus.grab_focus()
	else:
		textBox.text += key

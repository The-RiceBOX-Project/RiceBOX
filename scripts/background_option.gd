extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func set_image(image : Image):
	$Image.texture = image

func show_outline():
	$SelectedOutline.show()

func hide_outline():
	$SelectedOutline.hide()

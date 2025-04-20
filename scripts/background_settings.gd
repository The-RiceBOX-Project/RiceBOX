extends Control
var background_option_scene = preload("res://scenes/background_option.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for file in DirAccess.get_files_at("backgrounds"):
		var background = Image.load_from_file("backgrounds/" + file)
		if background != null:
			print(background)
			var node = background_option_scene.instantiate()
			$ScrollContainer/GridContainer.add_child(node)
			node.get_node("Image").texture = background

extends Control
var background_option_scene = preload("res://scenes/background_option.tscn")
@export var backgrounds : Array[Resource]
var config = ConfigFile.new()
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	config.load("selected_background.txt")
	if config.has_section_key("background", "background"):
		get_tree().get_first_node_in_group("Background").texture = config.get_value("background", "background")
	
	for background in backgrounds:
		var node = background_option_scene.instantiate()
		$ScrollContainer/GridContainer.add_child(node)
		node.get_node("Image").texture = background
	
	var i = 0
	for node in $ScrollContainer/GridContainer.get_children():
		if i > 0:
			node.get_node("Focus").focus_neighbor_left = node.get_node("Focus").get_path_to($ScrollContainer/GridContainer.get_children()[i - 1].get_node("Focus"))
		if i < $ScrollContainer/GridContainer.get_child_count() - 1:
			node.get_node("Focus").focus_neighbor_right = node.get_node("Focus").get_path_to($ScrollContainer/GridContainer.get_children()[i + 1].get_node("Focus"))
		i += 1
	

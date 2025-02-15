extends Control
@onready var internet_tab = $Internet
@onready var updates_tab = $Updates

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("show"):
		$AnimationPlayer.play("hide")


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "summon":
		$Buttons.get_child(0).grab_focus()
		$Internet._on_refresh_timeout()
	elif anim_name == "hide":
		get_tree().paused = false


func _on_internet_pressed() -> void:
	internet_tab.show()
	internet_tab.process_mode = Node.PROCESS_MODE_INHERIT
	updates_tab.hide()
	updates_tab.process_mode = Node.PROCESS_MODE_DISABLED

func _on_updates_pressed() -> void:
	internet_tab.hide()
	internet_tab.process_mode = Node.PROCESS_MODE_DISABLED
	updates_tab.show()
	updates_tab.process_mode = Node.PROCESS_MODE_INHERIT

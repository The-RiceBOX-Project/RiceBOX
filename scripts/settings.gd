extends Control


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("show"):
		$AnimationPlayer.play("hide")


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "summon":
		$Buttons.get_child(0).grab_focus()
		$Internet._on_refresh_timeout()
	elif anim_name == "hide":
		get_tree().paused = false

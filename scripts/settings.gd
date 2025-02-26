extends Control
@onready var internet_tab = $Internet
@onready var updates_tab = $Updates
@onready var date_and_time_tab = $"Date&Time"
@onready var poweroff_tab = $Poweroff

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
	updates_tab.hide()
	date_and_time_tab.hide()
	poweroff_tab.hide()

func _on_updates_pressed() -> void:
	internet_tab.hide()
	updates_tab.show()
	date_and_time_tab.hide()
	poweroff_tab.hide()


func _on_poweroff_pressed() -> void:
	internet_tab.hide()
	updates_tab.hide()
	date_and_time_tab.hide()
	poweroff_tab.show()


func _on_date_time_pressed() -> void:
	internet_tab.hide()
	updates_tab.hide()
	date_and_time_tab.show()
	poweroff_tab.hide()

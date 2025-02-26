extends Control
@onready var hours_input = $VBoxContainer/HBoxContainer/Hours
@onready var mins_input = $VBoxContainer/HBoxContainer/Mins

func _on_change_pressed() -> void:
	var hours = str(hours_input.value)
	var mins = str(mins_input.value)
	
	if int(hours) < 10:
		hours = "0" + hours
		
	if int(mins) < 10:
		mins = "0" + mins
	
	print('"' + hours + ':' + mins + ':00"')
	OS.execute("sudo", ["date", "-s", '"' + hours + ':' + mins + ':00"'])

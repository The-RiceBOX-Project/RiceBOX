extends Node
var mount_dir = "mnt"

func _ready():
	_on_timer_timeout()

func _on_timer_timeout() -> void:
	OS.execute("sudo", ["mount", "/dev/sda1", mount_dir])

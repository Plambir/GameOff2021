extends Control

func _ready():
	get_tree().paused = true


func _on_Play_pressed():
	hide()
	get_tree().paused = false

extends Control

export(NodePath) var __best_score_path
export(NodePath) var __score_path

func _ready():
	get_node(__best_score_path).text = str(Storage.data.get("best_score", 0))
	get_node(__score_path).text = str(Storage.data.get("score", 0))

func _on_Play_pressed():
	get_tree().change_scene("res://Game.tscn")

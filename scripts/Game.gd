extends Spatial

onready var __particles : CPUParticles = $CPUParticles
onready var __rock_generator = $RockGenerator
onready var __player = $Player

func _on_RockGenerator_spawn():
	__rock_generator.speed += 0.1
	__particles.initial_velocity += 0.1
	__player.speed_boost += 0.001

func _on_Player_die():
	get_tree().change_scene("res://End.tscn")

extends Spatial
class_name RockGenerator

signal spawn

var speed = 100

onready var __origin = $Rock

func _ready():
	randomize()
	__origin.visible = false

func _on_Timer_timeout():
	var new = __origin.duplicate()
	var x = rand_range(-30.0, 30.0)
	var y = rand_range(-30.0, 30.0)
	var scale = rand_range(0.8, 1.1)
	get_parent().add_child(new)
	#get_tree().get_root().add_child(new)
	new.translation = Vector3(x, y, translation.z)
	new.scale = Vector3(scale, scale, scale)
	new.visible = true
	new.speed = speed
	print(speed)
	emit_signal("spawn")
	$Timer.start()


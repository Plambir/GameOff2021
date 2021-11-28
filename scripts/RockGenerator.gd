extends Spatial

onready var __origin = $Rock

func _ready():
	randomize()
	__origin.visible = false

func _on_Timer_timeout():
	var new = __origin.duplicate()
	var x = rand_range(-30.0, 30.0)
	var y = rand_range(-30.0, 30.0)
	var scale = rand_range(0.8, 1.2)
	get_tree().get_root().add_child(new)
	new.translation = Vector3(x, y, translation.z)
	new.scale = Vector3(scale, scale, scale)
	new.visible = true


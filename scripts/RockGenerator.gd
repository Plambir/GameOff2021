extends Spatial

onready var __origin = $Rock

func _ready():
	randomize()
	__origin.visible = false

func _on_Timer_timeout():
	var new = __origin.duplicate()
	var x = rand_range(-40.0, 40.0)
	var y = rand_range(-40.0, 40.0)
	get_tree().get_root().add_child(new)
	new.translation = Vector3(x, y, translation.z)
	new.visible = true


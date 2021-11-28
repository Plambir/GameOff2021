extends Spatial

export(float) var rot = 0.1

func _process(delta):
	rotate_z(rot * delta)

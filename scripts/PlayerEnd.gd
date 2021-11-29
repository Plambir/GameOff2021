extends KinematicBody

const ROTATE = 0.5

func _process(delta):
	rotate(Vector3.UP, ROTATE * delta)

extends KinematicBody

const FORWARD = Vector3(0, 0, -80)

func _physics_process(delta):
	if not visible:
		return
	move_and_collide(FORWARD * delta)
	if translation.z < -10:
		queue_free()


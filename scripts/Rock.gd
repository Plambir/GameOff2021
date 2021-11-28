extends KinematicBody

var speed = 100
const FORWARD = Vector3(0, 0, -1)

func _physics_process(delta):
	if not visible:
		return
	move_and_collide(FORWARD * speed * delta)
	if translation.z < -10:
		queue_free()


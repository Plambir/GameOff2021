extends KinematicBody

var __velocity : Vector3

var speed_boost = 1
const SPEED = 0.5
const MAX_SPEED = 0.5

const UP = Vector3(0, SPEED, 0)
const DOWN = Vector3(0, -SPEED, 0)
const LEFT = Vector3(SPEED, 0, 0)
const RIGHT = Vector3(-SPEED, 0, 0)
const AREA_SPHERE = 40.0

func _ready():
	pass

func __get_input(delta):
	var up = Input.is_action_pressed("forward")
	var down = Input.is_action_pressed("backward")
	var left = Input.is_action_pressed("left")
	var right = Input.is_action_pressed("right")
	if up and not down:
		__velocity += UP * delta
	elif down and not up:
		__velocity += DOWN * delta
	else:
		__velocity.y = lerp(__velocity.y, 0, 0.3);

	if left and not right:
		__velocity += LEFT * delta
	elif right and not left:
		__velocity += RIGHT * delta
	else:
		__velocity.x = lerp(__velocity.x, 0, 0.3);
		#__velocity.x = 0;

	__velocity.x = clamp(__velocity.x, -MAX_SPEED, MAX_SPEED)
	__velocity.y = clamp(__velocity.y, -MAX_SPEED, MAX_SPEED)
	__velocity.z = clamp(__velocity.z, -MAX_SPEED, MAX_SPEED)

	return __velocity * speed_boost

func _physics_process(delta):
	var velocity = __get_input(delta)
	move_and_collide(velocity)
	var position = Vector3.ZERO - translation
	if position.length() > AREA_SPHERE:
		var pos = (translation - Vector3.ZERO).normalized() * AREA_SPHERE
		translation = pos

func _on_Area_body_entered(body):
	body.queue_free()
	get_tree().reload_current_scene()

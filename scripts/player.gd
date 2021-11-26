extends KinematicBody

var __velocity : Vector3

const SPEED = 15.0

const UP = Vector3(0, SPEED, 0)
const DOWN = Vector3(0, -SPEED, 0)
const LEFT = Vector3(SPEED, 0, 0)
const RIGHT = Vector3(-SPEED, 0, 0)
const FORWARD = Vector3(0, 0, 0)
const AREA_SPHERE = 40.0

func _ready():
	pass

func __get_input():
	__velocity = Vector3.ZERO
	if Input.is_action_pressed("forward"):
		__velocity += UP
	if Input.is_action_pressed("backward"):
		__velocity += DOWN
	if Input.is_action_pressed("left"):
		__velocity += LEFT
	if Input.is_action_pressed("right"):
		__velocity += RIGHT
	return __velocity

func _physics_process(delta):
	var velocity = FORWARD + __get_input()
	move_and_collide(velocity * delta)
	var position = Vector3.ZERO - translation
	if position.length() > AREA_SPHERE:
		var pos = (translation - Vector3.ZERO).normalized() * AREA_SPHERE
		translation = pos

func _on_Area_body_entered(body):
	body.queue_free()
	get_tree().reload_current_scene()

extends KinematicBody

var __velocity : Vector3

const UP = Vector3(0, 5, 0)
const DOWN = Vector3(0, -5, 0)
const LEFT = Vector3(5, 0, 0)
const RIGHT = Vector3(-5, 0, 0)
const FORWARD = Vector3(0, 0, 10)

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

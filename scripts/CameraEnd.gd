extends InterpolatedCamera

export(NodePath) var target_path

const AREA_SPHERE = 20.0

onready var __target : KinematicBody = get_node(target_path)

var __origin_position : Vector3

func _ready():
	__origin_position = translation

func _physics_process(delta):
	var new_translation = __target.translation
	new_translation.z = __origin_position.z
	translation = lerp(translation, new_translation, 0.1)
	look_at(__target.translation, Vector3.UP)


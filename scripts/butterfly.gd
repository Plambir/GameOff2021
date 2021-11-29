extends Spatial

func _ready():
	var a = $AnimationPlayer.get_animation("ArmatureAction")
	a.loop = true
	$AnimationPlayer.play("ArmatureAction")

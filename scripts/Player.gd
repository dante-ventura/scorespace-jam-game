extends RigidBody2D

var last_y_velocity = 0

func _physics_process(_delta):
	var cur_y_velocity = linear_velocity.y
	
	if (cur_y_velocity < 50 and
		last_y_velocity > 575):
		AudioManager.get_node("GameImpact").play()
		$AnimatedSprite.animation = "ouch"
		$AnimatedSprite.play()
	
	last_y_velocity = cur_y_velocity


func _on_AnimatedSprite_animation_finished():
	$AnimatedSprite.animation = "idle"

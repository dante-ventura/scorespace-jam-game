extends Node2D

var rotation_rad = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func get_input():
	if (!Input.is_action_pressed("gameplay_rotate_right") and
		!Input.is_action_pressed("gameplay_rotate_left")):
		rotation_rad = move_toward(rotation_rad, 0, 0.008)
		
	if Input.is_action_pressed("gameplay_rotate_right"):
		rotation_rad = max(rotation_rad-0.008, -0.1)
	if Input.is_action_pressed("gameplay_rotate_left"):
		rotation_rad = min(rotation_rad+0.008, 0.1)

func _physics_process(delta):
	get_input()
	rotate(rotation_rad)

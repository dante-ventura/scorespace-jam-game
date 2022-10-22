extends Node2D

export(NodePath) var player_spawn_point
export var rotation_speed = 0.005
export var max_rotation_speed = 0.05
var rotation_rad = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func get_input():
	if (!Input.is_action_pressed("gameplay_rotate_right") and
		!Input.is_action_pressed("gameplay_rotate_left")):
		rotation_rad = move_toward(rotation_rad, 0, rotation_speed)
		
	if Input.is_action_pressed("gameplay_rotate_left"):
		rotation_rad = max(rotation_rad-rotation_speed, -max_rotation_speed)
	if Input.is_action_pressed("gameplay_rotate_right"):
		rotation_rad = min(rotation_rad+rotation_speed, max_rotation_speed)

func _physics_process(_delta):
	get_input()
	rotate(rotation_rad)

extends Node

onready var min_label = get_node("Min")
onready var sec_label = get_node("Sec")
onready var ms_label = get_node("Ms")

var time = 0
var timer_on = false

# Called when the node enters the scene tree for the first time.
func _ready():
	timer_on = true
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(timer_on):
		time += delta
	var secs = fmod(time, 60)
	var mins = fmod(time, 60*60) / 60
	var milli = fmod(time, 1) * 1000
	min_label.text = "%02d" % [mins]
	sec_label.text = "%02d" % [secs]
	ms_label.text = "%02d" % [milli/10]

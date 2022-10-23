extends Label

export(bool) var is_selected = false
export(PackedScene) var switch_to_scene

var start_pos = rect_position

var hover_distance = 30
var at_start = true
var tween = Tween.new()
var hover_dir = 1
var tween_speed = 20


# Called when the node enters the scene tree for the first time.
func _ready():
	add_child(tween)
	tween.connect("tween_completed", self, "_on_Tween_Completed")
	tween.playback_speed = 20

func _process(_delta):
	if !is_selected:
		tween.remove_all()
		rect_position = start_pos
		at_start = true
		return
	if at_start:
		hover(true)
		at_start = false

func hover(half = false):
	tween.playback_speed = tween_speed
	if half: tween.playback_speed *= 1.5
	
	var new_dist = hover_distance/2 if half else hover_distance
	tween.interpolate_property(self, "rect_position",
	rect_position, Vector2(rect_position.x, rect_position.y + new_dist*hover_dir),
	Tween.TRANS_CIRC, Tween.EASE_OUT)
	hover_dir *= -1
	tween.start()
	
func _on_Tween_Completed(_object: Object, _key: NodePath):
	hover()

extends Area2D

signal vector_created(vector)

export var max_length = 200

var touch_down = false
var start_position = Vector2.ZERO
var end_position = Vector2.ZERO
var vector = Vector2.ZERO

func on_input_event(viewport, event, shape_idx):
	if event.is_action_pressed("ui_touch"):
		touch_down = true
		start_position = event.position

func reset_values():
	start_position = Vector2.ZERO
	end_position = Vector2.ZERO
	vector = Vector2.ZERO
	update()

func _input(event):
	if not touch_down:
		return null
	
	if event.is_action_released("ui_touch"):
		touch_down = false
		emit_signal("vector_created", vector)
		reset_values()
	
	if event is InputEventMouseMotion:
		end_position = event.position
		vector = -(end_position - start_position) .clamped(max_length)
		update()

func _ready():
	connect("input_event", self, "on_input_event")

func _draw():
	draw_line(start_position - global_position,
	(end_position - global_position),
	Color.cornflower, 8)
	
	draw_line(start_position - global_position,
	start_position - global_position + vector,
	Color.red, 16)
	

# https://youtu.be/8-198msNlGg

extends KinematicBody

const MOUSE_SENSITIVITY: float = 0.3
var MOVE_SPEED #: float = 1.0
const WALK_SPEED: float = 10.0
const RUN_SPEED: float = 30.0

onready var look_pivot: Spatial = $lookPivot

# Called when the node enters the scene tree for the first time.
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _input(event):
	if event is InputEventMouseMotion:
		rotate_y(deg2rad(-1 * event.relative.x * MOUSE_SENSITIVITY))
		look_pivot.rotate_x(deg2rad(event.relative.y) * MOUSE_SENSITIVITY)
		look_pivot.rotation.x = clamp(look_pivot.rotation.x, deg2rad(-90), deg2rad(90))
	if Input.is_action_pressed("ui_cancel"):
		get_tree().quit()
	if event.is_action_pressed("toggle_fullscreen"):
		OS.window_fullscreen = !OS.window_fullscreen

func _physics_process(_delta):
	MOVE_SPEED = WALK_SPEED
	if Input.is_action_pressed("run"):
		MOVE_SPEED = RUN_SPEED
	else:
		MOVE_SPEED = WALK_SPEED
	var input_direction = get_input_direction()
# warning-ignore:return_value_discarded
	move_and_slide(input_direction * MOVE_SPEED, Vector3.UP)
	
func get_input_direction() -> Vector3:
	var z: float = (
		Input.get_action_strength("forward") - Input.get_action_strength("back")
	)
	var x: float = (
		Input.get_action_strength("left") - Input.get_action_strength("right")
	)
	return transform.basis.xform(Vector3(x, 0, z)).normalized()

extends Camera

var red = preload("res://environments/red_env.tres")
var black = preload("res://environments/black_env.tres")
var panorama = preload("res://environments/panorama_env.tres")
var keepblack = preload("res://environments/keepblack_env.tres")
var glow = preload("res://environments/glow_env.tres")
var ocean = preload("res://environments/ocean_env.tres")

var envs = [red, black, panorama, ocean, keepblack, glow]
# hardcoded but could maybe not be?

var i := 0

func toggle_sky():
	self.set_environment(envs[i])
	if i < (len(envs) - 1):
		i += 1
	else:
		i = 0
	# written like this to make it scale,
	# but maybe a for loop would be better

func _ready():
	# pick an initial "neutral" environment at random
	# doesn't scale though. not conveniently anyways
	randomize()
	envs.shuffle()
	if randf() > 0.5:
		i = envs.find(red)
	else:
		i = envs.find(black)
	toggle_sky()

func _input(event):
	if event.is_action_pressed("toggle_sky"):
		toggle_sky()

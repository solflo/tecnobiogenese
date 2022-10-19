extends Camera

var red = load("res://red_env.tres")
var black = load("res://black_env.tres")

var envs = [red, black]
var i = 0

func _input(event):
	if event.is_action_pressed("toggle_sky"):
		self.set_environment(envs[i])
		if i == 0:
			i = 1
		else:
			i = 0

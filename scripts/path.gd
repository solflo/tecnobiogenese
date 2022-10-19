extends Spatial

var min_speed = 2 # never works with negatives :/
var max_speed = 7
var random_speed = []

func _ready():
	randomize()
	
	for _i in range(8):
		random_speed.append(rand_range(min_speed, max_speed))



func _process(delta: float) -> void:
	var child_index = 0
	
	for path in $SpawnPath.get_children():
		if child_index % 2 == 0:
			path.offset += delta * random_speed[child_index]
		else:
			path.offset -= delta * random_speed[child_index]
		child_index += 1

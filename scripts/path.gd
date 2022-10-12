extends Spatial

var t := 0.0
export var min_speed = 2 # never works with negatives :/
export var max_speed = 5
var random_speed


func _ready():
	randomize()
	random_speed = rand_range(min_speed, max_speed)
	
	print("speed: ", random_speed)
	
	if random_speed > 0 && random_speed < 1:
		random_speed += 2
	
	print("speed: ", random_speed)



func _process(delta: float) -> void:
		t += delta
		$SpawnPath/SpawnLoc.offset = t * random_speed

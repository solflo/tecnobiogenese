extends Spatial

export (PackedScene) var mob_scene


func _ready():
	randomize()

	var mob = mob_scene.instance()

	var mob_spawn_location = get_node("SpawnPath/SpawnLoc")
	mob_spawn_location.unit_offset = randf()
	
	var player_position = $player.transform.origin
	mob.initialize(mob_spawn_location.translation, player_position)

	add_child(mob)

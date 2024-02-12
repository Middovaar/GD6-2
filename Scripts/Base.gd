extends Node2D


@onready var wierdLevel = preload("res://Levels/WierdLevel.res").instantiate()
@onready var spikesLevel = preload("res://Levels/SpikeLevel.res").instantiate()
@onready var normalLevel = preload("res://Levels/NormalLevel.res").instantiate()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass






func _on_what_level_to_queue_free(LevelToRelieve):
	match LevelToRelieve:
		"normal":
			remove_child($NormalLevel)
		"wierd":
			remove_child($WierdLevel)
		"spikes":
			remove_child($SpikeLevel)
		_:
			pass


func _on_level_changer(LevelWeGoingTo):
	
	match LevelWeGoingTo:
		"normal":
			add_child(normalLevel)

		"wierd":
			"goto wierd"
			add_child(wierdLevel)

		"spikes":
			"goto spikes"
			add_child(spikesLevel)

		_:
			pass



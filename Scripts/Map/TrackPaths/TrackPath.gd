extends Node2D

func _ready():
	add_to_group("road")

func get_track_path():
	return $Paths/PathTrack

extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	Events.connect("game_over_signal",self,"on_game_over_signal")
	$Elements.visible = false

func end_game():
	get_tree().paused = true
	$Elements.visible = true

func on_game_over_signal(var type):
	# TODO: set elements
	#call_deferred("end_game")
	pass

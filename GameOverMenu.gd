extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	Events.connect("game_over_signal",self,"on_game_over_signal")
	$Elements.visible = false

func end_game():
	get_tree().paused = true
	$Elements.visible = true

func on_game_over_signal(var type):
	if type == Enums.GAME_OVER_TYPE.VICTORY:
		$Elements/VictoryLabel.visible = true
	else:
		$Elements/GameOverLabel.visible = true
	
	call_deferred("end_game")


func _on_RestartButton_pressed():
	Events.emit_signal("button_pressed_signal","start")


func _on_QuitButton_pressed():
	Events.emit_signal("button_pressed_signal","menu")

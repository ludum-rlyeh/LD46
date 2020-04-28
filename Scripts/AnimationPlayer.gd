extends AnimationPlayer

func play_animation(name : String):
	if current_animation != name:
		play(name)

extends TextureButton


func _on_button_down() -> void:
	#Global.play_sfx(Global.SFX_CLICK)
	FmodServer.play_one_shot("event:/General/Click")
	scale=Vector2(0.75,0.75)

func _on_button_up() -> void:
	scale=Vector2(1,1)

func _on_mouse_entered() -> void:
	#Global.play_sfx(Global.SFX_HOVER)
	FmodServer.play_one_shot("event:/General/Hover")

extends TextureButton


func _on_button_down() -> void:
	Global.play_sfx(Global.SFX_CLICK)
	scale=Vector2(0.75,0.75)

func _on_button_up() -> void:
	scale=Vector2(1,1)

func _on_mouse_entered() -> void:
	Global.play_sfx(Global.SFX_HOVER)

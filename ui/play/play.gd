extends Control

func _ready() -> void:
	Global.fmod_play_bgm("event:/InGame/BGM")

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("esc"):
		if %Pause.visible:%Pause.hide()
		else:%Pause.show()

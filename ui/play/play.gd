extends Control

const BGM = ("uid://biouban5j674v")
const BGM_1 = ("uid://bged0mawyhgu0")

func _ready() -> void:
	Global.play_bgm(BGM_1)

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("esc"):
		if %Pause.visible:%Pause.hide()
		else:%Pause.show()

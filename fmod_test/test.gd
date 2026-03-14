extends Node2D

var master_string_bank: FmodBank
var master_bank: FmodBank
func _ready() -> void:
	master_string_bank = FmodServer.load_bank("res://assets/Banks/Master.strings.bank", FmodServer.FMOD_STUDIO_LOAD_BANK_NORMAL)
	master_bank = FmodServer.load_bank("res://assets/Banks/Master.bank", FmodServer.FMOD_STUDIO_LOAD_BANK_NORMAL)

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("mouse_left"):FmodServer.play_one_shot("event:/General/Click")
	if Input.is_action_just_pressed("mouse_right"):FmodServer.play_one_shot("event:/General/Hover")
	

class_name Template
extends Control

signal start
signal end

@onready var animation_player: AnimationPlayer = $AnimationPlayer

var num_characters_per_second=20
var dialogue:Array=[]

var amount_characters_shown:float=0
var order=0

func _ready() -> void:
	animation_player.process_mode=Node.PROCESS_MODE_ALWAYS
	reset_dialogue(dialogue[0])
	order=1
	start.emit()

func _unhandled_input(event: InputEvent) -> void:
	pass

func _physics_process(delta: float) -> void:
	if %Label.visible_ratio >=1:
		if Input.is_action_just_pressed("mouse_left"):
			if order<dialogue.size():
				reset_dialogue(dialogue[order])
				order+=1
			else:
				end.emit()
				process_mode=Node.PROCESS_MODE_DISABLED
	else:
		amount_characters_shown+=num_characters_per_second*delta
		%Label.visible_characters=amount_characters_shown
		if Input.is_action_just_pressed("mouse_left"):%Label.visible_ratio=1

func reset_dialogue(data:Array):
	%Label.text=data[0]
	%Label.visible_ratio=0
	amount_characters_shown=0

class_name Character
extends Control

@onready var ap_pos: AnimationPlayer = $AnimationPlayerPos
@onready var ap_face: AnimationPlayer = $AnimationPlayerFace
@onready var ap_decoration: AnimationPlayer = $AnimationPlayerDecoration
@onready var ap_entrance: AnimationPlayer = $AnimationPlayerEntrance

func _ready() -> void:visible=true

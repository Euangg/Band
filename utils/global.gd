extends Node

func _on_bgm_finished() -> void:%Bgm.play()
func play_bgm(path_bgm:String):
	%Bgm.stream=load(path_bgm)
	%Bgm.play()
func stop_bgm():%Bgm.stop()

const SFX_HOVER_NEW = preload("uid://barloaf1xgk4f")
const SFX_HOVER = preload("uid://b4mixqm2j1bn4")
const SFX_CLICK_START = preload("uid://1i3dv7a5nmg0")
const SFX_CLICK = preload("uid://blvylweyoknbr")
const SFX = preload("uid://2jlkqhwk1evi")
func play_sfx(stream:AudioStream):
	var sfx:AudioStreamPlayer=SFX.instantiate()
	sfx.stream=stream
	%Sfx.add_child(sfx)


var name_player:String="主角"

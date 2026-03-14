extends Node

var master_string_bank: FmodBank
var master_bank: FmodBank

func _ready() -> void:
	master_string_bank = FmodServer.load_bank("res://sound/banks/Master.strings.bank", FmodServer.FMOD_STUDIO_LOAD_BANK_NORMAL)
	master_bank = FmodServer.load_bank("res://sound/banks/Master.bank", FmodServer.FMOD_STUDIO_LOAD_BANK_NORMAL)

var fmod_bgm:FmodEvent=null
func fmod_play_bgm(str:String):
	if fmod_bgm:
		fmod_bgm.stop(0)
		fmod_bgm.release()
		fmod_bgm=null
	fmod_bgm=FmodServer.create_event_instance(str)
	fmod_bgm.start()

func _on_bgm_finished() -> void:%Bgm.play()
func play_bgm(path_bgm:String):
	%Bgm.stream=load(path_bgm)
	%Bgm.play()
func stop_bgm():%Bgm.stop()

const SFX = preload("uid://2jlkqhwk1evi")
func play_sfx(stream:AudioStream):
	var sfx:AudioStreamPlayer=SFX.instantiate()
	sfx.stream=stream
	%Sfx.add_child(sfx)

var name_player:String="主角"

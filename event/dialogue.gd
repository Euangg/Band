class_name Dialogue
extends Control

const T_PLAYER = preload("uid://bo1y6d1dfawxa")
const T_JING = preload("uid://mtnni4lr3c0v")
const T_LIN = preload("uid://e3ihs6hr6ilm")
const T_CHEN = preload("uid://qe32vruxdtwl")
const T_CHENG = preload("uid://dc2138sf8ux06")
const NARRATAGE = preload("uid://btfcmqtv05irh")

const S_笑死我了 = preload("uid://x6o0a4a5fent")

var current_template:Control=null
var next_template:Control=null

@onready var jin_zi_jun: Character = $JinZiJun
@onready var lin_yi_yan: Character = $LinYiYan
@onready var chen_ji_wei: Character = $ChenJiWei
@onready var cheng_xiao_yi: Character = $ChengXiaoYi

func _ready() -> void:
	hide_all_characters()
	
	var t:Template=T_CHEN.instantiate()
	t.start.connect(func():
		chen_ji_wei.ap_entrance.play("show")
		chen_ji_wei.ap_pos.play("l")
		lin_yi_yan.ap_entrance.play("show")
		lin_yi_yan.ap_pos.play("r")
		lin_yi_yan.ap_face.play("闭嘴")
		t.animation_player.play("l")
		)
	t.dialogue=[
		["wow，"+Global.name_player+"，你从哪搞了个男娘过来？",0]
		]
	t.end.connect(func():
		sel_笑死我了()
		)
	add_child(t)
	current_template=t
	
func _physics_process(delta: float) -> void:pass

func sel_笑死我了():
	var s:Selection=S_笑死我了.instantiate()
	s.select_1.connect(dia_笑死我了)
	s.select_2.connect(dia_这么说过分了点)
	ready_template(s)

func dia_笑死我了():
	var t_next:Template=T_PLAYER.instantiate()
	t_next.start.connect(func():
		t_next.animation_player.play("坏笑")
		)
	t_next.dialogue=[
		["笑死我了，怎么直接叫人家男娘啊哈哈哈哈哈哈哈",0]
		]
	t_next.end.connect(dia_笑死我了2)
	ready_template(t_next)

func dia_笑死我了2():
	var t_next:Template=T_LIN.instantiate()
	t_next.start.connect(func():
		lin_yi_yan.ap_face.play("苦笑")
		t_next.animation_player.play("r")
		)
	t_next.dialogue=[
		["你们这么说不太好吧，不知道人家的性别就——",0]
		]

	t_next.end.connect(func():dia2())
	ready_template(t_next)

func dia_这么说过分了点():
	var t_next:Template=T_PLAYER.instantiate()
	t_next.start.connect(func():
		t_next.animation_player.play("严肃")
		)
	t_next.dialogue=[
		["这么说别人过分了点吧",0]
		]
	t_next.end.connect(dia_这么说过分了点2)
	ready_template(t_next)

func dia_这么说过分了点2():
	var t_next:Template=T_LIN.instantiate()
	t_next.start.connect(func():
		lin_yi_yan.ap_face.play("苦笑")
		t_next.animation_player.play("r")
		)
	
	t_next.dialogue=[
		["对啊，这么说不太好吧，不知道人家的性别就——",0]
		]
	t_next.end.connect(func():dia2())
	ready_template(t_next)

func dia2():
	var t_next:Template=T_CHEN.instantiate()
	t_next.start.connect(func():
		t_next.animation_player.play("l")
		)
	t_next.dialogue=[
		["“你怎么敢定义ta的性别”是吧，笑死我了",0],
		]
	t_next.end.connect(func():dia3())
	ready_template(t_next)

func dia3():
	var t_next:Template=T_JING.instantiate()
	t_next.start.connect(func():
		hide_all_characters()
		jin_zi_jun.ap_entrance.play("show")
		)
	t_next.dialogue=[
		["你闭嘴行不行，就不能让别人自己说话吗？",0]
		]
	t_next.end.connect(func():
		jin_zi_jun.ap_entrance.play("hide")
		dia4())
	ready_template(t_next)
	
func dia4():
	var t_next:Template=T_CHENG.instantiate()
	t_next.start.connect(func():
		cheng_xiao_yi.ap_entrance.play("show")
		cheng_xiao_yi.ap_face.play("闭嘴害羞")
		cheng_xiao_yi.ap_decoration.play("说话")
		)
	t_next.dialogue=[
		["大…大家好，我是节奏吉他。"+Global.name_player+"让我过来的。",0],
		]
	t_next.end.connect(func():
		cheng_xiao_yi.ap_entrance.play("fade_hide")
		cheng_xiao_yi.ap_decoration.play("RESET")
		dia4_1())
	ready_template(t_next)

func dia4_1():
	var t_next:Template=T_CHENG.instantiate()
	t_next.start.connect(func():
		cheng_xiao_yi.ap_entrance.play("fade_show")
		cheng_xiao_yi.ap_face.play("捂嘴说话")
		)
	t_next.dialogue=[
		["我叫程晓依，是…男生……\n啊啊不过这不重要啦……也可以把我当成女生的……",0],
		]
	t_next.end.connect(func():
		cheng_xiao_yi.ap_entrance.play("hide")
		dia5())
	ready_template(t_next)

func dia5():
	var t_next:Template=T_CHEN.instantiate()
	t_next.start.connect(func():
		chen_ji_wei.ap_entrance.play("show")
		t_next.animation_player.play("l")
		)
	t_next.dialogue=[
		["你也可以把我当成沃尔玛购物袋的。",0]
		]
	t_next.end.connect(func():dia6())
	ready_template(t_next)

func dia6():
	var t_next:Template=T_LIN.instantiate()
	t_next.start.connect(func():
		lin_yi_yan.ap_entrance.play("show")
		lin_yi_yan.ap_face.play("微笑")
		t_next.animation_player.play("r"))
	t_next.dialogue=[
		["太好了，小荆，我们有节奏吉他了。",0]
		]
	t_next.end.connect(func():
		hide_all_characters()
		nar1())
	ready_template(t_next)
	
func nar1():
	var t_next:Template=NARRATAGE.instantiate()
	t_next.dialogue=[
		["荆子君瞪了陈继为维一眼，从包里的一叠谱子中取出其中三张，递给了程晓依",0]
		]
	t_next.end.connect(dia7)
	ready_template(t_next)

func dia7():
	var t_next:Template=T_JING.instantiate()
	t_next.start.connect(func():
		jin_zi_jun.ap_entrance.play("show")
		)
	t_next.dialogue=[
		["弹这个。",0]
		]
	t_next.end.connect(func():
		jin_zi_jun.ap_entrance.play("hide")
		dia8())
	ready_template(t_next)

func dia8():
	var t_next:Template=T_CHENG.instantiate()
	t_next.start.connect(func():
		cheng_xiao_yi.ap_entrance.play("show")
		)
	t_next.dialogue=[
		["好……不过我可能要先熟悉一下。",0]
		]
	t_next.end.connect(func():
		cheng_xiao_yi.ap_entrance.play("hide")
		dia9()
		)
	ready_template(t_next)

func dia9():
	var t_next:Template=T_JING.instantiate()
	t_next.start.connect(func():
		jin_zi_jun.ap_entrance.play("show")
		)
	t_next.dialogue=[
		["那你自己看会吧。其他人先排。",0]
		]
	t_next.end.connect(func():
		jin_zi_jun.ap_entrance.play("hide")
	)
	ready_template(t_next)


func hide_all_characters():
	jin_zi_jun.ap_entrance.play("hide")
	lin_yi_yan.ap_entrance.play("hide")
	chen_ji_wei.ap_entrance.play("hide")
	cheng_xiao_yi.ap_entrance.play("hide")

func ready_template(template:Control):
	template.modulate.a=0
	template.process_mode=Node.PROCESS_MODE_DISABLED
	add_child(template)
	next_template=template
	fade_to()

func fade_to():
	var t1=create_tween()
	t1.tween_property(current_template,"modulate:a",0.0,0.2)
	t1.parallel().tween_property(next_template,"modulate:a",1.0,0.2)
	t1.tween_callback(set_template)

func set_template():
	current_template.queue_free()
	current_template=next_template
	next_template=null
	current_template.process_mode=Node.PROCESS_MODE_INHERIT

class_name Selection
extends Control

signal select_1
signal select_2

func _on_button_pressed() -> void:select_1.emit()
func _on_button_2_pressed() -> void:select_2.emit()

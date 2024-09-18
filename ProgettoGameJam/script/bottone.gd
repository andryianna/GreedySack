extends Node2D

signal pressed
@export var peso_limite = 1.5
var schiacciato = preload("res://sprite/buttonon.png")
var premuto = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if peso_limite != 1.5:
		$Label.text = str((peso_limite - 1) / 0.05)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_2d_area_entered(area: Area2D) -> void:
	if !premuto:
		if area.get_parent().weight_modifier > peso_limite:
			$AudioStreamPlayer.play()
			pressed.emit()
			premuto = true
			$StaticBody2D/buttonoff.texture = schiacciato
		pass # Replace with function body.

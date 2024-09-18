extends Node2D

@export var peso_limite = 1.5
var suono = preload("res://sounds/ground-breaking.mp3")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if peso_limite != 1.5:
		$Label.text = str((peso_limite - 1) / 0.05)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.get_parent().weight_modifier > peso_limite:
		get_parent().add_child(AudioStreamPlayer.new())
		get_parent().get_child(-1).stream = suono
		get_parent().get_child(-1).play()
		queue_free()
	

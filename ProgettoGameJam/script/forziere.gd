extends Node2D

@export var numero_monete = 25
var aperto = preload("res://sprite/light-wood-open.png")
var moneta = preload("res://scene/moneta_gravità.tscn")
var open = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.get_parent().key == true and open == false:
		open = true
		$StaticBody2D/chiuso.texture = aperto
		for i in range(1, numero_monete):
			var monetai= moneta.instantiate()
			if randi_range(1, 2) == 1:
				monetai.linear_velocity = Vector2(50, -800)
			else: 
				monetai.linear_velocity = Vector2(-50, -800)
			monetai.position = Vector2(position.x, position.y - 100)
			get_parent().call_deferred("add_child", monetai)
		
	pass # Replace with function body.

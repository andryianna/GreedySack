extends Node2D

var aperto = preload("res://sprite/light-wood-open.png")
var moneta = preload("res://scene/moneta.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_2d_area_entered(area: Area2D) -> void:
	print(area.get_parent().key)
	if area.get_parent().key == true:
		$StaticBody2D/chiuso.texture = aperto
		for i in range(1, 25):
			var monetai= moneta.instantiate()
			if randi_range(1, 2) == 1:
				monetai.linear_velocity = Vector2(50, -800)
			else: 
				monetai.linear_velocity = Vector2(-50, -800)
			monetai.position = Vector2(position.x, position.y + 50)
			get_parent().add_child(monetai)
		
	pass # Replace with function body.

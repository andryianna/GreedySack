extends Node2D

@export var numero_monete = 25 

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for i in range(numero_monete + 1, 26):
		print("Eliminata")
		get_node("Moneta" + str(i)).get_child(0).visible = false
		get_node("Moneta" + str(i)).get_child(1).disabled = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

extends Node2D

func attiva():
	$StaticBody2D/AnimationPlayer.play("movimento")
	await $StaticBody2D/AnimationPlayer.animation_finished
	$StaticBody2D/AnimationPlayer.pause()

func disattiva():
	$StaticBody2D/AnimationPlayer.play_backwards("movimento")
	await $StaticBody2D/AnimationPlayer.animation_finished
	$StaticBody2D/AnimationPlayer.pause()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_bottone_pressed() -> void:
	attiva()
	pass # Replace with function body.

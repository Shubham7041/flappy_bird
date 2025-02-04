extends Node2D

@onready var character_body_2d: CharacterBody2D = $CharacterBody2D
@onready var timer: Timer = $Timer
@onready var color_rect: ColorRect = $ColorRect
var is_paused = true
@onready var canvas_layer: CanvasLayer = $CanvasLayer
@onready var background: Sprite2D = $Background

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	game(is_paused) # Replace with function body.

func game(is_paused) -> void:
	for node in get_tree().get_nodes_in_group('gameplay'):
		node.set_physics_process(!is_paused)

func freeze_scene() -> void:
	for node in get_tree().get_nodes_in_group('pipes'):
		node.set_physics_process(false)
	character_body_2d.set_physics_process(false)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("flap"):
		canvas_layer.visible = false 
		game(false)
	if character_body_2d.position.y >= 0:
		timer.start()


func _on_timer_timeout() -> void:
	get_tree().reload_current_scene() # Replace with function body.


func _on_button_pressed() -> void:
	pass # Replace with function body.

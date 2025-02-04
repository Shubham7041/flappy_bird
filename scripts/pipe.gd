extends Area2D

@onready var timer: Timer = $Timer
@export var SPEED = 90
@onready var player: CharacterBody2D = $"../../CharacterBody2D"
@onready var color_rect: ColorRect = $"../../ColorRect"

func _ready() -> void:
	color_rect.visible = false
# This funciton freezes anything on the screen
func freeze_scene() -> void:
	color_rect.visible = true
	for node in get_tree().get_nodes_in_group('pipes'):
		node.SPEED = 0
	player.set_physics_process(false)

func _physics_process(delta: float) -> void:
	position.x -= SPEED * delta
	

func _process(delta: float) -> void:
	# Checking if player touches the roof
	if player.position.y <= 0:
		freeze_scene()
		timer.start()
	


func _on_timer_timeout() -> void:
	get_tree().reload_current_scene() # Replace with function body.

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	position.x = 520
	position.y = randi_range(240, 420) # Replace with function body.


func _on_pipes_body_entered(body: Node2D) -> void:
	freeze_scene()
	timer.start() # Replace with function body.


func _on_body_entered(body: Node2D) -> void:
	freeze_scene()
	timer.start() # Replace with function body.

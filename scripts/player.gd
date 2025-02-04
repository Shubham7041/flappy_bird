extends CharacterBody2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var timer: Timer = $AnimatedSprite2D/animation_timer

const GRAVITY : float = 9.81
var max_y_velocity = 300
var jump_velocity : float = -300


func _ready() -> void:
	pass
	
func _physics_process(delta: float) -> void:
	if velocity.y <= max_y_velocity:
		velocity.y += GRAVITY
	 
	if Input.is_action_just_pressed("flap"):
		velocity.y = jump_velocity
		# When "Space Bar" is pressed change the sprite angle 
		rotation_degrees = -20
		animated_sprite_2d.frame = animated_sprite_2d.frame + 1
		timer.start(0.2)
		
	move_and_slide()


func _on_killzone_body_entered(body: Node2D) -> void:
	print("You Died!")


func _on_timer_timeout() -> void:
	# Get the character back to normal
	rotation_degrees = 0
	animated_sprite_2d.frame = 0 # Replace with function body.


func _on_pipe_body_entered(body: Node2D) -> void:
	set_physics_process(false) # Replace with function body.

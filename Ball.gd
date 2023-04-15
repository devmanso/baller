extends RigidBody2D

export var ball_bounce = .5
export var ball_friction = .2

func _ready():
	set_bounce(ball_bounce)
	set_friction(ball_friction)

func launch(force : Vector2):
	apply_impulse(Vector2.ZERO, force)


func on_ball_body_entered(body):
	pass

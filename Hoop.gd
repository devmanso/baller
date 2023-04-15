extends Area2D


func _on_Hoop_body_entered(body):
	if body.name == "Ball":
		position.x = rand_range(10, 1000)
		position.y = rand_range(10, 550)

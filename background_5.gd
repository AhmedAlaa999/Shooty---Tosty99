extends Sprite2D

var speed = 5
func _process(delta):
	position.x -= speed * delta
	if position.x <= -texture.get_width():
		position.x = 0

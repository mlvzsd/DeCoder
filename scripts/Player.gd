extends Node2D

var to_walk = 0
var can_walk = true
var velocity = Vector2(0, 0)
var ray_cast

func _ready():
	hide()

# warning-ignore:unused_argument
func _process(delta):
	if to_walk == 0:
		check_input()
	
	if to_walk > 0:
		to_walk -= 1
		
		if can_walk:
			position += velocity * 2
		
		if to_walk == 3:
			position.y -= 1
			$Camera2D.position.y += 1
			$AnimatedSprite.frame = ($AnimatedSprite.frame + 1) % 4

func start(pos, dir = "down"):
	position = pos
	$AnimatedSprite.animation = dir
	
	match dir:
		"up":
			ray_cast = $RayCast2DUp
		
		"down":
			ray_cast = $RayCast2DDown
		
		"left":
			ray_cast = $RayCast2DLeft
		
		"right":
			ray_cast = $RayCast2DRight
	
	can_walk = not ray_cast.is_colliding()
	
	show()

func check_input():
	velocity = Vector2(0, 0)
	
	if Input.is_action_pressed("ui_up"):
		$AnimatedSprite.animation = "up"
		velocity = Vector2(0, -1)
		ray_cast = $RayCast2DUp
	
	elif Input.is_action_pressed("ui_down"):
		$AnimatedSprite.animation = "down"
		velocity = Vector2(0, 1)
		ray_cast = $RayCast2DDown
	
	elif Input.is_action_pressed("ui_left"):
		$AnimatedSprite.animation = "left"
		$AnimatedSprite.flip_h = false
		velocity = Vector2(-1, 0)
		ray_cast = $RayCast2DLeft
	
	elif Input.is_action_pressed("ui_right"):
		$AnimatedSprite.animation = "left"
		$AnimatedSprite.flip_h = true
		velocity = Vector2(1, 0)
		ray_cast = $RayCast2DRight
	
	if velocity.length() != 0:
		to_walk = 8
		position.y += 1
		can_walk = not ray_cast.is_colliding()
		$Camera2D.position.y -= 1
		$AnimatedSprite.frame += 1

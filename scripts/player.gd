extends KinematicBody2D

const UP = Vector2(0, -1)
const GRAVITY = 10
const SPEED = 90
const JUMP_HEIGHT = -215

var motion = Vector2()
var spawned = false

func _ready():
	$SndSpawn.play(0);
	pass

func _physics_process(delta):
	
	motion.y += GRAVITY
	
	if Input.is_action_pressed("ui_right"): #Moving Right
		motion.x = SPEED
		$Sprite.flip_h = false
		$Sprite.play("Run")
	elif Input.is_action_pressed("ui_left"): #Moving Left
		motion.x = -SPEED
		$Sprite.flip_h = true
		$Sprite.play("Run")
	else:
		motion.x = 0
		$Sprite.play("Idle")
	
	if is_on_floor():
		if Input.is_action_just_pressed("ui_up"): #Jumping
			motion.y = JUMP_HEIGHT
			$SndJump.play(0)
	else:
		$Sprite.play("Jump")
	
	if motion.y > 10:
		$Sprite.play("Fall")
	
	#print(motion)
	motion = move_and_slide(motion, UP)
	pass

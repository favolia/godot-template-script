extends CharacterBody2D

var SPEED : int = 100

var player_state : String

var anim_name: String = ""
var last_direction: String = "b-idle"

func _physics_process(delta):
	# set key in "Project/Project setting/Input Map"
	# key "A" = left, "W" = up, "S" = down, "D" = right,
	var direction = Input.get_vector("left", "right", "up", "down")
	
	if direction.x == 0 and direction.y == 0:
		player_state = "idle"
	elif direction.x != 0 or direction.y != 0:
		player_state = "walking"
		
	velocity = direction * SPEED
	move_and_slide()
	
	play_animation(direction)

func play_animation(dir):
		
	match player_state:
		"idle":
			$AnimatedSprite2D.play(last_direction)
		"walking":
			
			if abs(dir.x) >= 0.5 and abs(dir.y) >= 0.5:
				if dir.x > 0 and dir.y > 0:
					anim_name = "br-walk"
				elif dir.x < 0 and dir.y > 0:
					anim_name = "bl-walk"
				elif dir.x < 0 and dir.y < 0:
					anim_name = "tl-walk"
				else:
					anim_name = "tr-walk"
			else:
				if dir.x > 0:
					anim_name = "r-walk"
				elif dir.x < 0:
					anim_name = "l-walk"
				elif dir.y > 0:
					anim_name = "b-walk"
				elif dir.y < 0:
					anim_name = "t-walk"
			last_direction = anim_name

			if anim_name == "":
				anim_name = "b-idle"

			$AnimatedSprite2D.play(anim_name)
	
	last_direction = anim_name.split("-")[0]+"-idle" if anim_name != "" else "b-idle"


func player():
	pass
	
	
	
	
	
	
	
	
	
	
	
	

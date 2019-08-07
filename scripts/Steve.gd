extends KinematicBody

var velocity = Vector3(0, 0, 0)
const SPEED = 6
const ROTSPEED = 6

func _ready():
	print("Steve Ready!")
	
func _physics_process(delta):
	if Input.is_action_pressed("ui_left") and Input.is_action_pressed("ui_right"):
		velocity.x = 0
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -SPEED * delta
		$MeshInstance.rotate_z(deg2rad(ROTSPEED))
	elif Input.is_action_pressed("ui_right"):
		velocity.x = SPEED * delta
		$MeshInstance.rotate_z(deg2rad(-ROTSPEED))
	else:
		velocity.x = lerp(velocity.x, 0, 0.1)
		# $MeshInstance.rotate_z(deg2rad(lerp($MeshInstance.rotation.x, 0, 0.1)))

	if Input.is_action_pressed("ui_up") and Input.is_action_pressed("ui_down"):
		velocity.z = 0
	elif Input.is_action_pressed("ui_up"):
		velocity.z = -SPEED * delta
		$MeshInstance.rotate_x(deg2rad(-ROTSPEED))
	elif Input.is_action_pressed("ui_down"):
		velocity.z = SPEED * delta
		$MeshInstance.rotate_x(deg2rad(ROTSPEED))
	else:
		velocity.z = lerp(velocity.z, 0, 0.1)
		print($MeshInstance.rotation)
		# $MeshInstance.rotate_x(deg2rad(lerp($MeshInstance.rotation.z, 0, 0.1)))
	
	move_and_collide(velocity);
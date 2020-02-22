extends RigidBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var can_shoot = true

const laser = preload("res://laser_ship.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	mode = MODE_KINEMATIC

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if Input.is_action_pressed("left"):
    	position.x = position.x - 2
	if Input.is_action_pressed("right"):
    	position.x = position.x + 2
	if Input.is_action_pressed("fire") && can_shoot == true:
		shoot()

func disable_shoot():
	can_shoot = false
	var t = Timer.new()
	t.set_wait_time(0.25)
	t.set_one_shot(true)
	self.add_child(t)
	t.start()
	yield(t, "timeout")
	t.queue_free()
	can_shoot = true
	
func shoot():
	
	var pos_left = get_node("gun/left").get_global_position()
	var pos_right = get_node("gun/right").get_global_position()
	create_laser(pos_left)
	create_laser(pos_right)
	disable_shoot()
	pass
	
func create_laser(pos):
	var lasers = laser.instance()
	lasers.set_position(pos)
	add_child(lasers)
	pass
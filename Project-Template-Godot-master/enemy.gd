extends Area2D

export var velocity = Vector2()
onready var scorekeep = get_node("/root/new_script")

# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group("enemy")
	set_process(true)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	translate(velocity * delta)
	if get_position().x>get_viewport_rect().size.x-16 || get_position().x<16:
		velocity.x = -velocity.x
	if get_position().y+16>get_viewport_rect().size.y:
		queue_free()
		get_tree().change_scene("res://scene_score.tscn")
		scorekeep.score=0
		
	pass
	
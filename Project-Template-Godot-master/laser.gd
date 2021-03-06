extends Area2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var velocity = Vector2()
var xpos
onready var scorekeep = get_node("/root/new_script")

# Called when the node enters the scene tree for the first time.
func _ready():
	connect("area_entered", self, "_on_area_entered")
	xpos = position.x
	set_process(true)
	
	
	pass # Replace with function body.

func _on_area_entered(other):
	if(other.is_in_group("enemy")):
		other.queue_free()
		queue_free()
		scorekeep.score+=1
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x = xpos
	translate(velocity*delta)
	pass

extends Area2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var velocity = Vector2()

# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(true)
	
	
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	translate(velocity*delta)
	pass

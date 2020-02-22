extends Node

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

const kamikaze = preload('res://enemy_kamikaze.tscn')
const side_to_side = preload('res://enemy_sidetoside.tscn')

# Called when the node enters the scene tree for the first time.
func _ready():
	spawn()
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func spawn():
	while true:
		randomize()
	
		var enemy = kamikaze.instance()
		var pos = Vector2()
		pos.x  = rand_range(16, get_viewport().get_visible_rect().size.x-16)
		pos.y  = 0-16
		enemy.set_position(pos)
		add_child(enemy)
		
		var enemy2 = side_to_side.instance()
		pos.x  = rand_range(16, get_viewport().get_visible_rect().size.x-16)
		pos.y  = 0-16
		enemy.set_position(pos)
		add_child(enemy2)
	
		var t = Timer.new()
		t.set_wait_time(1)
		t.set_one_shot(true)
		self.add_child(t)
		t.start()
		yield(t, "timeout")
		t.queue_free()
	
	pass

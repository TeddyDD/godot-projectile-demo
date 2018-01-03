extends Node2D

var projectile

func _ready():
	set_process(true)
	projectile = load("res://projectile.tscn")
	
func _process(delta):
	if Input.is_action_pressed("ui_accept"):
		var v = projectile.instance()
		v.set_pos(get_pos())
		v.initial_angle = get_node("visualizer").initial_angle
		v.initial_velocity = get_node("visualizer").initial_velocity
		v.gravity = get_node("visualizer").gravity
		get_tree().get_root().add_child(v)
		prints(get_node("visualizer").fly_time(), "time")
		

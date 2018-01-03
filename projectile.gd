extends Node2D

var initial_angle
var initial_velocity
var gravity
var velocity
var t = 0

func _ready():
	velocity = velfrom(initial_angle, initial_velocity)
	set_process(true)

func velfrom(initial_angle, initial_velocity):
	var a = deg2rad(initial_angle)
	return Vector2( initial_velocity * cos(a),\
	                    -initial_velocity * sin(a))

func _process(delta):
	velocity.y += gravity * delta
	var motion = velocity * delta
	set_pos(get_pos() + motion)
	
	set_rot(velocity.angle()+PI)

func _on_Area2D_area_enter( area ):
	if area.get_name() == "ground":
		queue_free()

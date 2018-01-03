extends Node2D

export var limit = 100 # points to draw
var initial_angle setget set_angle # deg
var initial_velocity # px/s

# not really precise here but It's just an example
# use target y - player y.
onready var inital_height = get_parent().get_item_rect().size.height

export var draw_time = false

var gravity
var velocity
var a # angle in radians

func set_angle(value):
	initial_angle = value
	a = deg2rad(initial_angle)
	

func pos_at_time(t):
	return Vector2( get_pos().x + initial_velocity * t * cos(a) ,\
	                -(get_pos().y + initial_velocity * t * sin(a) - 0.5 * gravity * pow(t,2)))

func height_at(x):
	return gravity * pow(x, 2) \
	       / (2 * pow(initial_velocity,2) \
	       * pow(cos(a),2)) \
	       + x * tan(a)
	
	
func max_distance():
	return (-2 * ( -tan(a) * 2 * pow(initial_velocity,2) \
	           * cos(a) * cos(a) / (2*gravity)))

func fly_time():
	return 10 * (max_distance() \
	       / initial_velocity * cos(a))

func _draw():
	var i = limit if draw_time else (max_distance())
	var s = sign(i)
#	broken FIXME
#	i = i + inital_height if s > 0 else i - inital_height
	var step = abs(i)/limit
	while round(i ) != 0:
		if draw_time:
			draw_circle(pos_at_time(i), 5, Color(0,1,1))
		else:
			draw_circle(Vector2(i, height_at(-i)), 5, Color(0,1,1))
		if s > 0:
			i -= step
		else:
			i += step
	draw_circle(Vector2(max_distance(),0),5, Color(0,1,0))
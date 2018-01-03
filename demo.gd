extends Node2D

func _ready():
	get_node("gui/VBoxContainer/velocity").set_value(100)
	get_node("gui/VBoxContainer/angle").set_value(45)
	get_node("gui/VBoxContainer/gravity").set_value(9.8)
	get_node("gui/VBoxContainer/limit").set_val(32)


func _on_velocity_value_changed( value ):
	get_node("shooter/visualizer").initial_velocity = value
	get_node("shooter/visualizer").update()
	get_node("gui/VBoxContainer/vel-label").set_text("Velocity: %d" % value)

func _on_angle_value_changed( value ):
	get_node("shooter/visualizer").initial_angle = value
	get_node("shooter/visualizer").update()
	get_node("gui/VBoxContainer/ang-label").set_text("Angle: %d" % value)

func _on_gravity_value_changed( value ):
	get_node("shooter/visualizer").gravity = value
	get_node("shooter/visualizer").update()
	get_node("gui/VBoxContainer/grav-label").set_text("Gravity: %d" % value)


func _on_limit_value_changed( value ):
	get_node("shooter/visualizer").limit = value
	get_node("shooter/visualizer").update()
	get_node("gui/VBoxContainer/limit-label").set_text("Plot points: %d" % value)


func _on_timeplot_toggled( pressed ):
	get_node("shooter/visualizer").draw_time = pressed
	get_node("shooter/visualizer").update()

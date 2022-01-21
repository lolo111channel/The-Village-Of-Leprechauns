extends Node2D


func _process(delta):
	global_position = Vector2(get_parent().pos.x-16,0)

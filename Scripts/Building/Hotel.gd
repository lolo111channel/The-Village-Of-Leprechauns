extends "res://Scripts/Building.gd"


func _ready():
	get_parent().max_people += add_max_people
	get_parent().gain_people += gain_people
	
	get_parent().max_working_people += add_max_working_people
	get_parent().gain_working_people += gain_working_people
	
	
	global_position = Vector2(get_parent().pos.x,-60)
	get_parent().pos += Vector2(64,0)
	
	tween.interpolate_property(self,"position",Vector2(get_parent().pos.x,-120),Vector2(get_parent().pos.x,0),0.25,Tween.TRANS_LINEAR,Tween.EASE_IN_OUT)
	tween.start()

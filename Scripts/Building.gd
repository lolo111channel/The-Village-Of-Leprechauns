extends Node2D


export var cost:int = 100
export var add_max_people:int = 5
export var gain_people:float = 0.1

export var add_max_working_people:int = 2
export var gain_working_people:float = 0.2

onready var tween:Tween = $Tween

func _ready():
	get_parent().max_people += add_max_people
	get_parent().gain_people += gain_people
	
	get_parent().max_working_people += add_max_working_people
	get_parent().gain_working_people += gain_working_people
	
	
	global_position = Vector2(get_parent().pos.x,-60)
	get_parent().pos += Vector2(64,0)
	
	tween.interpolate_property(self,"position",Vector2(get_parent().pos.x,-120),Vector2(get_parent().pos.x,0),0.25,Tween.TRANS_LINEAR,Tween.EASE_IN_OUT)
	tween.start()
	
	
	

	


func _on_Tween_tween_completed(object, key):
	$whack.play()

	




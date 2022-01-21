extends Sprite




func _on_Area2D_input_event(viewport, event, shape_idx):
	if(event is InputEventMouseButton):
		if(event.is_pressed() and event.button_index == BUTTON_LEFT):
			get_parent().get_node("Fleshpot_Menu").visible = true

func _process(delta):
	global_position = Vector2(get_viewport_rect().size.x/2,global_position.y)


func _on_Cancel_pressed():
	get_parent().get_node("Fleshpot_Menu").visible = false
	

func _on_Buy_pressed():
	var level = get_tree().get_nodes_in_group("level")[0]
	if(level.money >= 25000):
		$buy.play()
		get_tree().change_scene("res://Scenes/Levels/Rainbow.tscn")
		
	else:
		$not_moeny.play()

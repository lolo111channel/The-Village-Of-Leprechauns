extends Node2D


onready var research_panel:CenterContainer = get_parent().get_node("Canvas/Research")
onready var margin4 = get_owner().get_node("Canvas/Margin4")

var is_research:bool = false

var title_research:String = "0"
var id_research:int = 0
var cost_research:int = 0

var timer:float = 0.0

func _process(delta):
	timer += delta
	
	if(is_research): 
		margin4.visible = true
		
		margin4.get_node("Panel/Grid/Label").text = title_research
		margin4.get_node("Panel/Grid/Label2").text = str(cost_research)+"c"
		margin4.get_node("Panel/Grid/HSlider").max_value = cost_research
		
		
		if(timer >= 0.5):
			get_parent().money -= margin4.get_node("Panel/Grid/HSlider").value
			cost_research -= margin4.get_node("Panel/Grid/HSlider").value
			
			
			timer = 0
		
		if(cost_research <= 0):
			is_research = false
			
			var panels = get_tree().get_nodes_in_group("research")
			for i in panels.size():
				if(panels[i].id == id_research):
					panels[i].add_to_build()
					panels[i].queue_free()
					
					$AudioStreamPlayer.play()
					
					break
			
	else: 
		margin4.visible = false
		margin4.get_node("Panel/Grid/HSlider").value = 0
		
		
func _on_Button_pressed():
	if(!is_research):
		if(research_panel.visible == true):
			research_panel.visible = false
		else:
			research_panel.visible = true

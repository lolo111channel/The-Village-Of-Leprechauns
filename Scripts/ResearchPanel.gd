extends CenterContainer

export var id:int = 0
export var prefab:PackedScene
export var cost:int


var margin4
var research_panel 
var research
var panel

onready var level = get_tree().get_nodes_in_group("level")[0]

onready var building_panel_prefab = load("res://Scenes/Prefabs/BuildingPanel.tscn")

func _ready():
	margin4 = level.get_node("Canvas/Margin4")
	research_panel = level.get_node("Canvas/Research")
	research = level.get_node("Research")
	panel  = level.get_node("Canvas/Panel/Grid/Scroll/Vbox")
	


func _on_Research_pressed():
	$sound.play()
	
	research.is_research = true
	research_panel.visible = false
	
	research.id_research = id
	research.cost_research = cost
	research.title_research = $Panel/GridContainer/Title/Label.text
	

func add_to_build():
	var building_panel = building_panel_prefab.instance()
	
	building_panel.rect_min_size = Vector2(112,23)
	
	building_panel.prefab = prefab
	building_panel.get_node("Panel/Grid/Center/Label").text = $Panel/GridContainer/Title/Label.text
	
	
	panel.add_child(building_panel)

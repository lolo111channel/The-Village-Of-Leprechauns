extends CenterContainer

export var prefab:PackedScene

onready var level = get_tree().get_nodes_in_group("level")[0]

func _ready():
	var a = prefab.instance()
	$Panel/Grid/Grid/Label.text = str(a.cost) + "c"
	a.queue_free()

func _on_Build_pressed():
	var building = prefab.instance()
	
	if(level.money >= building.cost):
		level.money -= building.cost
		level.add_child(building)
		
		$sound.play()
	else:
		$sound2.play()
	

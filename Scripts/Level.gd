extends Node2D


var gain_people:float = 0.1
var max_people:int = 0
var people:float = 0

var max_working_people:int = 0
var gain_working_people:float = 0.1
var working_people:float = 0

var money:float= 3000
var taxes:float = 0.05

onready var money_label:Label = $Canvas/Margin/Label
onready var people_label:Label = $Canvas/Margin2/Grid/Label
onready var working_people_label:Label = $Canvas/Margin2/Grid/Label2

onready var slider:HSlider = $Canvas/Margin4/Panel/Grid/HSlider

var pos:Vector2 = Vector2(0,0)

var timer:float
var timer2:float 
var timer3:float
var timer4:float

var gain_money


func _process(delta):
	timer += delta
	timer2 += delta
	timer3 += delta
	
	
	people = clamp(people,0,max_people)
	working_people = clamp(working_people,0,max_working_people)
	working_people = clamp(working_people,0,max_people)
	
	
	gain_people = clamp(gain_people,0,3.0)
	gain_working_people = clamp(gain_working_people,0,3.0)
	
	gain_money = (taxes * int(people))+(int(working_people * 0.95)) * delta
	if(timer2 >= 0.5):
		money += gain_money
		timer2 = 0
	
	if(timer >= 0.05 and people < max_people and people >= 0):
		people += gain_people * (max_people/5) * delta
		timer = 0
	
	if(timer3 >= 0.1 and working_people < max_working_people and people > working_people):
		working_people += gain_working_people + (people/10) * delta
		timer3 = 0
	
	
	update_ui(delta)
	game_over()

func update_ui(delta):
	money_label.text = Global.rounding_value(money,"")+"c" + "/" + str(stepify(gain_money - slider.value,0.01))
	people_label.text = str(stepify(people,1))+"/"+str(max_people)+"P"
	working_people_label.text = str(stepify(working_people,1))+"/"+str(max_working_people)+"W"
	

func game_over():
	if money <= -10:
		$Canvas/Game_Over.visible = true
		get_tree().paused = true



func _on_Button_pressed():
	get_tree().paused = false
	get_tree().reload_current_scene()

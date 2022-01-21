extends Node


func rounding_value(moneyx:float,y:String):
	var x:float
	
	if(moneyx >= 1000 and moneyx < 1000000):
		x = moneyx / 1000;
		y = str(stepify(x,0.01)) + "K"
	elif(moneyx >= 1000000 and  moneyx < 1000000000):
		x = moneyx / 1000000
		y =  str(stepify(x,0.01)) + "M"   
	elif(moneyx >= 1000000000 and moneyx < 1000000000000 ):
		x = moneyx / 1000000000;
		y = str(stepify(x,0.01)) + "B"
	elif(moneyx >= 1000000000000):
		x = moneyx / 1000000000000;
		y = str(stepify(x,0.01)) + "T"
	else:
		y = str(stepify(moneyx,0.01))
		
	return y;

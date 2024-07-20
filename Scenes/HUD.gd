extends Control

var money = 5000
var moneyChange=false
var changeAmount=0
var day = 1
var fulfilledContracts = 0
var contractsRequired = 4
var Date = Time.get_datetime_dict_from_datetime_string("2060-1-1T08:00:00",false)
var calYear = Date.year
var calMonth = Date.month
var calDay = Date.day
var hour = Date.hour
var minute = Date.minute
var second = Date.second
var pause = false
var fast = false


# Called when the node enters the scene tree for the first time.
func _ready():
	$Money.text = "$: "+str(money)
	$Add.hide()
	$Subtract.hide()
	$Day.text = "Day: "+str(day)
	$"Fulfilled Contracts".text="Contracts: "+str(fulfilledContracts)+"/"+str(contractsRequired)
	$Date.text = str(calMonth)+"/"+str(calDay)+"/"+str(calYear)
	$Time.text = str(hour)+":"+str(minute)+":"+str(second)


func _contract_check():
	if(day%7==0&&fulfilledContracts!=contractsRequired||money<-10000):
		$GameOver.visible=true
	else:
		$GameOver.visible=false	


func _update_time():
	if($FFWD.button_pressed):
		second=second+4
	if($Pause.button_pressed):
		second=second
	else:
		second=second+2
	if(second>=60):
		second=0
		minute=minute+1
	if(minute>=60):
		minute=0
		hour=hour+1
	$Time.text = str(hour)+":"+str(minute)+":"+str(second)


func _input(event):
	if(event.is_action_pressed("Add Money")):
		changeAmount+=500
		moneyChange=true
	if(event.is_action_pressed("Subtract Money")):
		changeAmount-=500
		moneyChange=true


func _update_date():
	if($" Day".button_pressed||hour==24):
		$" Day".button_pressed=false
		$" Day".disabled = true
		day=day+1
		calDay=calDay+1
		hour=8
		minute=0
		second=0
	if(calDay>=28):
		calDay=1
		calMonth=calMonth+1
	if(calMonth>=13):
		calMonth=1
		calYear=calYear+1
	$Day.text = "Day: "+str(day)
	$Date.text = str(calMonth)+"/"+str(calDay)+"/"+str(calYear)
	$Time.text = str(hour)+":"+str(minute)+":"+str(second)
	$" Day".disabled=false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	_contract_check()
	_update_date()
	_update_time()
	if(moneyChange==true&&changeAmount!=0):
		if(changeAmount<0):
			$Subtract.text="- "+str(abs(changeAmount))
			$Subtract.visible=true
			money-=1
			changeAmount+=1
			$Money.text="$: "+str(money)
		if(changeAmount>0):
			$Add.text="+ "+str(changeAmount)
			$Add.visible=true
			money+=1
			changeAmount-=1
			$Money.text="$: "+str(money)
	if(changeAmount==0):
		$Add.visible=false
		$Subtract.visible=false
		moneyChange=false
	if(money<0):
		$Money.add_theme_color_override("font_color","#cf0000")
	elif(money>=0):
		$Money.add_theme_color_override("font_color","#00cf00")


func _on_pause_pressed():
	$Play.button_pressed=false
	$FFWD.button_pressed=false


func _on_play_pressed():
	$FFWD.button_pressed=false
	$Pause.button_pressed=false


func _on_ffwd_pressed():
	$Pause.button_pressed=false
	$Play.button_pressed=false

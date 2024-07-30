extends Control

var money = 5000
var changeAmount=0
var day = 1
var fulfilledContracts=0
var contractsRequired=0
var Date = Time.get_datetime_dict_from_datetime_string("2060-1-1T08:00:00",false)
var calYear = Date.year
var calMonth = Date.month
var calDay = Date.day
var hour = Date.hour
var minute = Date.minute
var second = Date.second
var pause = false
var fast = false

@onready var gameover = $/root/Node3D/Camera3D/Panel

signal dayPassed()
signal weekPassed()
# Called when the node enters the scene tree for the first time.
func _ready():
	var contractGen= Callable($Contracts,"gen_new_contracts")
	weekPassed.connect(contractGen)
	var restock=Callable($/root/Node3D/Camera3D/MarketUi/Ingredients,"_restock")
	dayPassed.connect(restock)
	var new_day=Callable($/root/Node3D/Camera3D/SynthesizerUi,"_new_day")
	dayPassed.connect(new_day)
	contractsRequired = self.get_meta("RequiredContracts")
	$Money.text = str(money)
	$Day.text = "Day: "+str(day)
	$Date.text = str(calMonth)+"/"+str(calDay)+"/"+str(calYear)
	$Time.text = str(hour)+":"+str(minute)+":"+str(second)


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
	if(event.is_action_pressed("Subtract Money")):
		changeAmount-=500


func _update_date():
	if($"Pass Day".button_pressed||hour==24):
		$"Pass Day".button_pressed=false
		$"Pass Day".disabled = true
		dayPassed.emit()
		day=day+1
		calDay=calDay+1
		hour=8
		minute=0
		second=0
		if(day%7==0&&day!=0&&fulfilledContracts!=contractsRequired||money<-10000&&day!=0):
			gameover.show()
			set_process_input(false)
		elif(day%7==0&&day!=0):
			contractsRequired+=contractsRequired/2
			fulfilledContracts=0
			set_meta("RequiredContracts",contractsRequired)
			weekPassed.emit()
		else:
			gameover.hide()
	if(calDay>=28):
		calDay=1
		calMonth=calMonth+1
	if(calMonth>=13):
		calMonth=1
		calYear=calYear+1
	$Day.text = "Day: "+str(day)
	$Date.text = str(calMonth)+"/"+str(calDay)+"/"+str(calYear)
	$Time.text = str(hour)+":"+str(minute)+":"+str(second)
	$"Pass Day".disabled=false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	_update_date()
	_update_time()
	fulfilledContracts=get_meta("FulfilledContracts")
	$"Fulfilled Contracts".text="Contracts: "+str(fulfilledContracts)+"/"+str(contractsRequired)
	if(self.get_meta("MoneyChange")):
		changeAmount=self.get_meta("ChangeAmount")
		if(changeAmount<0):
			$"Subtract Amount".text=str(abs(changeAmount))
			$Subtract.show()
			$"Subtract Amount".show()
			money-=5
			changeAmount+=5
			self.set_meta("ChangeAmount",changeAmount)
			$Money.text=str(money)
		if(changeAmount>0):
			$"Add Amount".text=str(changeAmount)
			$Add.show()
			$"Add Amount".show()
			money+=5
			changeAmount-=5
			self.set_meta("ChangeAmount",changeAmount)
			$Money.text=str(money)
	if(changeAmount==0):
		$Add.hide()
		$Subtract.hide()
		$"Add Amount".hide()
		$"Subtract Amount".hide()
		self.set_meta("MoneyChange",false)
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



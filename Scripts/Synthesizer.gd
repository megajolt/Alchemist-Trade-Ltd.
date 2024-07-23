extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_1_pressed():
	print("Button1")
	$BotIngredientWindow.visible=!$BotIngredientWindow.visible
	$TextureRect2/Button2.disabled=!$TextureRect2/Button2.disabled
	$TextureRect3/Button3.disabled=!$TextureRect3/Button3.disabled
	$TextureRect4/Button4.disabled=!$TextureRect4/Button4.disabled


func _on_button_2_pressed():
	print("Button2")
	$BotIngredientWindow.visible=!$BotIngredientWindow.visible
	$TextureRect1/Button1.disabled=!$TextureRect1/Button1.disabled
	$TextureRect3/Button3.disabled=!$TextureRect3/Button3.disabled
	$TextureRect4/Button4.disabled=!$TextureRect4/Button4.disabled
	
func _on_button_3_pressed():
	print("Button3")
	$TopIngredientWindow.visible=!$TopIngredientWindow.visible
	$TextureRect1/Button1.disabled=!$TextureRect1/Button1.disabled
	$TextureRect2/Button2.disabled=!$TextureRect2/Button2.disabled
	$TextureRect4/Button4.disabled=!$TextureRect4/Button4.disabled
	


func _on_button_4_pressed():
	print("Button4")
	$TopIngredientWindow.visible=!$TopIngredientWindow.visible
	$TextureRect1/Button1.disabled=!$TextureRect1/Button1.disabled
	$TextureRect2/Button2.disabled=!$TextureRect2/Button2.disabled
	$TextureRect3/Button3.disabled=!$TextureRect3/Button3.disabled

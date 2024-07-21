extends Node3D

@onready var marketUI = $Camera3D/MarketUi
@onready var stockUI = $Camera3D/StockUi
@onready var synthesizerUI = $Camera3D/SynthesizerUi
@onready var libUI = $Camera3D/LibraryUi

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
		if($Camera3D/RayCast3D.get_collider()==$"Ingredient Market/RigidBody3D"):
			marketUI.show()
			stockUI.hide()
			libUI.hide()
			synthesizerUI.hide()
		
		if($Camera3D/RayCast3D.get_collider()==$"Ingredient Stocks/RigidBody3D"):
			stockUI.show()
			marketUI.hide()
			libUI.hide()
			synthesizerUI.hide()
		if($Camera3D/RayCast3D.get_collider()==$"Recipe Lookup/RigidBody3D"):
			libUI.show()
			synthesizerUI.hide()
			marketUI.hide()
			stockUI.hide()
		if($Camera3D/RayCast3D.get_collider()==$"Synthesizer/RigidBody3D"):
			synthesizerUI.show()
			libUI.hide()
			marketUI.hide()
			stockUI.hide()
			




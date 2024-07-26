extends Panel

var textureRect1
var textureRect2

var itemNames
# Called when the node enters the scene tree for the first time.
func _ready():
	textureRect1=$/root/Node3D/Camera3D/SynthesizerUi/TextureRect1
	textureRect2=$/root/Node3D/Camera3D/SynthesizerUi/TextureRect2


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	itemNames=get_meta("IngredientList")


func _on_item_list_item_selected(index):
	if(textureRect1.get_node("Button1").disabled||textureRect2.get_node("Button2").disabled):
		var itemIcon=$ItemList.get_item_icon(index)
		$ItemList.deselect_all()
		set_meta("ItemImageData",itemIcon)
		set_meta("SelectedItemName",itemNames[index])
		set_meta("ItemIndex",index)

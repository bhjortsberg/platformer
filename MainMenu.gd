extends Control

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

signal start_game
signal exit_game
signal new_game

# Called when the node enters the scene tree for the first time.
func _ready():
	var image = load("res://assets/button.svg.png")
	get_node("CanvasLayer/ContinueGameTextureButton").set_normal_texture(image)
	get_node("CanvasLayer/NewGameTextureButton").set_normal_texture(image)
	get_node("CanvasLayer/ExitGameTextureButton").set_normal_texture(image)


#	var font = DynamicFont.new()
#	font.font_data = load("res://assets/fonts/verdanab.ttf")
#	font.size = 10
#	var label = get_node("CanvasLayer/Label")
#	label.set_text("New Game")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_TextureButton_pressed():
	print("New game")
	emit_signal("new_game")



func _on_ContinueGameTextureButton_pressed():
	print("Continue game")
	emit_signal("start_game")


func _on_ExitGameTextureButton_pressed():
	print("Exit game")
	emit_signal("exit_game")

extends Control

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

signal start_game
signal exit_game
signal new_game

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_ExitGame_pressed():
	print("Exit game")
	emit_signal("exit_game")


func _on_NewGame_pressed():
	print("New game")
	get_tree().reload_current_scene()
	emit_signal("new_game")


func _on_NewGameButton_pressed():
	print("New game")
	emit_signal("new_game")


func _on_ContinueButton_pressed():
	emit_signal("start_game")


func _on_ExitGameButton_pressed():
	get_tree().quit()

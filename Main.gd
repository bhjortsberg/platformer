extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var main = get_node("/root/main_vars")

# Called when the node enters the scene tree for the first time.
func _ready():
	print("hide menu:" + str(main.do_hide_menu))
	print("first run:" + str(main.first_run))
	if main.do_hide_menu:
		hide_menu()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if main.first_run:
		get_node("Stage").get_tree().set_pause(true)
	main.first_run = false
	if main.do_hide_menu:
		hide_menu()
	else:
		show_menu()

func show_menu():
	get_node("MainMenu/CanvasLayer/NewGameButton").show()
	get_node("MainMenu/CanvasLayer/ContinueButton").show()
	get_node("MainMenu/CanvasLayer/ExitGameButton").show()
	get_node("MainMenu/CanvasLayer/ExitGame").show()
	get_node("MainMenu/CanvasLayer/NewGame").show()
	get_node("MainMenu/CanvasLayer/NewGameLabel").show()

func hide_menu():
	get_node("MainMenu/CanvasLayer/NewGameButton").hide()
	get_node("MainMenu/CanvasLayer/ContinueButton").hide()
	get_node("MainMenu/CanvasLayer/ExitGameButton").hide()
	get_node("MainMenu/CanvasLayer/ExitGame").hide()
	get_node("MainMenu/CanvasLayer/NewGame").hide()
	get_node("MainMenu/CanvasLayer/NewGameLabel").hide()
		
func _on_MainMenu_start_game():
	main.do_hide_menu = true
	get_node("Stage").get_tree().set_pause(false)


func _on_Stage_stage_pause():
	print("stage paused")
	show_menu()
	get_node("Stage").get_tree().set_pause(true)

func _on_MainMenu_exit_game():
	get_tree().quit()


func _on_MainMenu_new_game():
	get_tree().reload_current_scene()
	main.do_hide_menu = true
	print("After reload")
	get_node("Stage").get_tree().set_pause(false)
	print("After unpause")
	

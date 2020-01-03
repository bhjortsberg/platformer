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
		show_menu(false)

func _notification(what):
	if what == MainLoop.NOTIFICATION_WM_GO_BACK_REQUEST:
		_on_Stage_stage_pause()
	if what == MainLoop.NOTIFICATION_WM_QUIT_REQUEST:
		_on_Stage_stage_pause()

func show_menu(show_continue):
	get_node("MainMenu/CanvasLayer/NewGameTextureButton").show()
	if show_continue:
		get_node("MainMenu/CanvasLayer/ContinueGameTextureButton").show()
	else:
		get_node("MainMenu/CanvasLayer/ContinueGameTextureButton").hide()
	get_node("MainMenu/CanvasLayer/ExitGameTextureButton").show()

func hide_menu():
	get_node("MainMenu/CanvasLayer/NewGameTextureButton").hide()
	get_node("MainMenu/CanvasLayer/ContinueGameTextureButton").hide()
	get_node("MainMenu/CanvasLayer/ExitGameTextureButton").hide()

func _on_MainMenu_start_game():
	main.do_hide_menu = true
	get_node("Stage").get_tree().set_pause(false)


func _on_Stage_stage_pause():
	print("stage paused")
	show_menu(true)
	get_node("Stage").get_tree().set_pause(true)

func _on_MainMenu_exit_game():
	get_tree().quit()


func _on_MainMenu_new_game():
	get_tree().reload_current_scene()
	main.do_hide_menu = true
	print("After reload")
	get_node("Stage").get_tree().set_pause(false)
	print("After unpause")
	

extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var main = get_node("/root/main_vars")

var admob = null

# Called when the node enters the scene tree for the first time.
func _ready():
	# AdMod
	if (Engine.has_singleton("AdMob")):
		admob = Engine.get_singleton("AdMob")
		admob.init(false, get_instance_id())
		admob.loadBanner("ca-app-pub-3940256099942544/6300978111", false)
		admob.loadInterstitial("ca-app-pub-3940256099942544/1033173712")

	if main.new_game:
		hide_menu()
	else:
		show_menu(false)
		get_node("Stage").get_tree().set_pause(true)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _notification(what):
	if what == MainLoop.NOTIFICATION_WM_GO_BACK_REQUEST:
		_on_Stage_stage_pause()
	if what == MainLoop.NOTIFICATION_WM_QUIT_REQUEST:
		_on_Stage_stage_pause()

func show_menu(_show_continue):
	get_node("MainMenu/CanvasLayer/NewGameTextureButton").show()
	if _show_continue:
		get_node("MainMenu/CanvasLayer/ContinueGameTextureButton").show()
	else:
		get_node("MainMenu/CanvasLayer/ContinueGameTextureButton").hide()
	get_node("MainMenu/CanvasLayer/ExitGameTextureButton").show()

	if admob:
		admob.showBanner()

func hide_menu():
	get_node("MainMenu/CanvasLayer/NewGameTextureButton").hide()
	get_node("MainMenu/CanvasLayer/ContinueGameTextureButton").hide()
	get_node("MainMenu/CanvasLayer/ExitGameTextureButton").hide()
	if admob:
		admob.hideBanner()

func _on_MainMenu_start_game():
	hide_menu()
	get_node("Stage").get_tree().set_pause(false)


func _on_Stage_stage_pause():
	print("stage paused")
	# Show continue if new game has been selected
	show_menu(main.new_game)
	get_node("Stage").get_tree().set_pause(true)

func _on_MainMenu_exit_game():
	main.new_game = false
	if admob:
		admob.showInterstitial()
	else:
		get_tree().quit()

func _on_interstitial_close():
	print("Interstitial closed")
	get_tree().quit()

func _on_MainMenu_new_game():
	get_tree().reload_current_scene()
	main.new_game = true
	get_node("Stage").get_tree().set_pause(false)
	

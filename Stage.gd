extends Node

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	# get_tree().set_pause(true)
	pass	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

signal stage_pause


func _on_Player_game_stopped():
	# Show the menu
	print("stage: paused")
	emit_signal("stage_pause")


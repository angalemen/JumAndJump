extends Node

@onready var gos = $UILayer/GameOverScreen
@onready var gos2 = $UILayer/VictoryScreen

var player = null
# Called when the node enters the scene tree for the first time.
func _ready():
	player = get_tree().get_first_node_in_group("player")
	player.killed.connect(_on_player_killed)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_area_2d_body_entered(body):
	if body.name == "Player":
		Global.vida-=1
		get_tree().change_scene_to_file("res://nivl_2.tscn")
	if Global.vida <= 0:
		player.die()

func _on_player_killed():
	gos.visible = true
	
	
func _on_area_2d_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if body.name == "Player":
		gos2.visible = true

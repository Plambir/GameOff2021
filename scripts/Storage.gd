extends Node

const FILE = "user://game.save"

var data : Dictionary

func _init():
	data = {}

func clear():
	var dir = Directory.new()
	dir.remove(FILE)

func save_data():
	var game_data = File.new()
	game_data.open_encrypted_with_pass(FILE, File.WRITE, FILE)
	game_data.store_var(data)
	game_data.close()

func load_data():
	var game_data = File.new()
	if not game_data.file_exists(FILE):
		return
	game_data.open_encrypted_with_pass(FILE, File.READ, FILE)
	var load_data = game_data.get_var()
	if load_data != null:
		data = load_data
	game_data.close()

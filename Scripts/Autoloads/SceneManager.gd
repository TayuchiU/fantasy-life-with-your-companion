extends Node


var scenes_data: Dictionary = {}
var current_scene_data: Dictionary = {}


func load_scenes_from_folder(folder_path: String) -> void:
	var dir = DirAccess.open(folder_path)
	if dir:
		print("dir: ", dir)
		for file_name in dir.get_files():
			print("file_name: ", file_name)
			if file_name.ends_with(".json"):
				var file_path = folder_path + "/" + file_name
				var file = FileAccess.open(file_path, FileAccess.READ)
				if file:
					var json_data = file.get_as_text()
					file.close()
					var json = JSON.new()
					var result = json.parse(json_data)
					if result == OK:
						var parsed_data = json.data
						var scene_name = parsed_data.get("scene_name", file_name)
						scenes_data[scene_name] = parsed_data


func load_scene(scene_name: String) -> bool:
	if scenes_data.has(scene_name):
		current_scene_data = scenes_data[scene_name]
		return true
	return false


func get_current_scene_data() -> Dictionary:
	print("current_scene_data: ", current_scene_data)
	return current_scene_data

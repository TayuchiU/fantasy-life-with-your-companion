extends Resource
class_name ImageFilesList


@export var file_names : Array[String]

func add_file_name(fn: String) -> void:
	if !".import" in fn:
		file_names.append(fn)


func get_file_names() -> Array[String]:
	return file_names

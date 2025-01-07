extends Node

signal safe_sleeping

func safe_sleep():
	GameValues.calendar += 1
	print("Emitting safe_sleeping")
	safe_sleeping.emit()

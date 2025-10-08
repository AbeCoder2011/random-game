extends Node

var SAVE_LOCATION = "user://save/save.tres"
var LOAD_LOCATION = SAVE_LOCATION


func _ready() -> void:
	DirAccess.make_dir_absolute("user://save/")
	SAVE()
	LOAD()

func SAVE():
	var save = SAVE_DATA.new()
	save.x = 12121 #REPLACE WITH SAVE DATA
	var res := ResourceSaver.save(save,SAVE_LOCATION)
	
	
func LOAD():
	var save = ResourceLoader.load(LOAD_LOCATION,"",ResourceLoader.CACHE_MODE_IGNORE).duplicate(true)

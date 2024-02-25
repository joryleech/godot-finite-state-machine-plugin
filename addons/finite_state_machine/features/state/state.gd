extends Resource
@export var name : String
@export var tags : Array[String]

signal state_change_requested

func _init():
	pass
	
func on_enter():
	pass
	
func on_exit():
	pass
	
func update(_delta):
	pass
	
func physics_update(_delta):
	pass
	
func has_tag(tag_name : String):
	tags.any(func(tag): return tag == tag_name)

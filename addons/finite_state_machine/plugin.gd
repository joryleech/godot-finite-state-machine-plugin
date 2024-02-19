@tool
extends EditorPlugin

func _enter_tree():
	
	add_custom_type("FiniteStateMachine", "Node", preload("res://addons/finite_state_machine/features/state_manager/state_manager.gd"), preload("res://addons/finite_state_machine/icon.png"))
	add_custom_type("State", "Resource", preload("res://addons/finite_state_machine/features/state/state.gd"), preload("res://addons/finite_state_machine/state-icon.png"))
	pass


func _exit_tree():
	# Clean-up of the plugin goes here.
	remove_custom_type("FiniteStateMachine")
	remove_custom_type("State")
	pass

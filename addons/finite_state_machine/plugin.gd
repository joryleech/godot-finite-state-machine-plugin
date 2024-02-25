@tool
extends EditorPlugin

var state_transition_editor = null

const AUTOLOAD_NAME: String = "FiniteStateMachine"
const AUTOLOAD_PATH: String = "res://addons/finite_state_machine/FiniteStateMachine.gd"

func _enter_tree():
	#Create Custom Node Types
	add_autoload_singleton(AUTOLOAD_NAME, AUTOLOAD_PATH)
	add_custom_type("FiniteStateMachine", "Node", preload("res://addons/finite_state_machine/features/state_manager/state_manager.gd"), preload("res://addons/finite_state_machine/icon.png"))
	add_custom_type("State", "Resource", preload("res://addons/finite_state_machine/features/state/state.gd"), preload("res://addons/finite_state_machine/state-icon.png"))
	#Load State Transition Editor into the editor - TODO
	#state_transition_editor = preload("res://addons/finite_state_machine/features/state_transition_editor/StateTransitionEditor.gd").new()
	#state_transition_editor.editor_interface = get_editor_interface()
	#add_child(state_transition_editor)
	pass


func _exit_tree():
	# Clean-up of the plugin goes here.
	remove_custom_type("FiniteStateMachine")
	remove_custom_type("State")
	remove_autoload_singleton(AUTOLOAD_NAME)

	if(state_transition_editor):
		state_transition_editor.queue_free()
	pass

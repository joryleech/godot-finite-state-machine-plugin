@tool
extends Node

var current_state_manager : FiniteStateMachine.StateManager = null
var editor_interface : EditorInterface
func _enter_tree():
	print("entering tree")
	_setup_transition_window_signal_connections()

func _exit_tree():
	pass

func _setup_transition_window_signal_connections():
	editor_interface.get_selection().selection_changed.connect(_on_editor_interface_selection_changed)

func _on_editor_interface_selection_changed():
	var selected_nodes = editor_interface.get_selection().get_selected_nodes()
	print(selected_nodes)
	if(selected_nodes.size() == 1):
		var node = selected_nodes[0]
		if(node is FiniteStateMachine.StateManager):
			set_state_manager(node)

func set_state_manager(state_manager):
	if(current_state_manager != state_manager):
		current_state_manager = state_manager
		print(state_manager)


extends Node

@export var current_state : FiniteStateMachine.State
#TODO conver to dictionary
@export var available_states : Array[FiniteStateMachine.State] = []
@export var allow_new_states : bool = false

signal state_changed
signal state_entered
signal state_exited

@export var state_variables : Dictionary

enum StateTransitionCheckType {
	per_frame,
	per_physics_tick,
	on_change,
	disabled
}
@export var check_state_transition_type : StateTransitionCheckType = StateTransitionCheckType.disabled
@export var state_transition_triggers : Array[FiniteStateMachine.StateTransitionTrigger]




func set_check_state_type(new_type : StateTransitionCheckType):
	check_state_transition_type = new_type
	
func get_current_state() -> FiniteStateMachine.State:
	return current_state
	
func call_current_state(method : String, params = {}):
	if(current_state):
		current_state.call(method, params)
	
func _set_state(new_state : FiniteStateMachine.State):
	if(current_state):
		current_state.on_exit()
		emit_signal("state_exited", current_state)
	current_state = new_state
	current_state.on_enter()
	emit_signal("state_changed", new_state)
	if(new_state):
		emit_signal("state_entered", new_state)
		
func _process(delta):
	if(check_state_transition_type == StateTransitionCheckType.per_frame):
		process_state_transition_triggers()
	if(current_state):
		current_state.update(delta)
	
func _physics_process(delta):
	if(check_state_transition_type == StateTransitionCheckType.per_physics_tick):
		process_state_transition_triggers()
	if(current_state):
		current_state.update(delta)
		
func process_state_transition_triggers():
	var current_states_triggers : Array[FiniteStateMachine.StateTransitionTrigger] = state_transition_triggers.filter(func(trigger : FiniteStateMachine.StateTransitionTrigger): return trigger.starting_state == current_state)
	for trigger : FiniteStateMachine.StateTransitionTrigger in current_states_triggers:
		if(trigger.check_active(state_variables)):
			set_state_by_state(trigger.ending_state)
			return
		
func set_state_by_index(index : int):
	assert(index >= 0 && index < available_states.size(), "State index out of bounds")
	_set_state(available_states[index])

func set_state_by_name(name : String):
	var filtered_states = available_states.filter(func(state : FiniteStateMachine.State): return state.name == "name")
	assert(filtered_states >= 1, "State name not found in available states")
	_set_state(filtered_states[0])

func set_state_by_state(state : FiniteStateMachine.State):
	if(available_states.has(state)):
		_set_state(state)
	elif(allow_new_states):
		available_states.push_back(state)
		_set_state(state)
	else:
		_set_state(null)

func set_state_dangerously(state : FiniteStateMachine.State):
	_set_state(state)
	
#################################
# Variable Setters
#################################
	
func set_variable_float(key : String, value : float):
	state_variables[key] = value
	if(check_state_transition_type == StateTransitionCheckType.on_change): #TODO DRY
		process_state_transition_triggers()
		
func set_variable_bool(key : String, value : bool):
	state_variables[key] = value
	if(check_state_transition_type == StateTransitionCheckType.on_change): #TODO DRY
		process_state_transition_triggers()

func set_variable(key : String, value):
	state_variables[key] = value
	if(check_state_transition_type == StateTransitionCheckType.on_change): #TODO DRY
		process_state_transition_triggers()

func set_variable_int(key : String, value : int):
	state_variables[key] = value
	if(check_state_transition_type == StateTransitionCheckType.on_change): #TODO DRY
		process_state_transition_triggers()
		
func set_variable_string(key : String, value : String):
	state_variables[key] = value
	if(check_state_transition_type == StateTransitionCheckType.on_change): #TODO DRY
		process_state_transition_triggers()

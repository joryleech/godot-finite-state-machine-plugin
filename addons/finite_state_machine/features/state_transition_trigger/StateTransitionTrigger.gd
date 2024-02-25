extends Resource
@export var name : String
@export var starting_state : FiniteStateMachine.State
@export var ending_state : FiniteStateMachine.State

@export var conditions : Array[Condition]

func check_active(state : Dictionary) -> bool:
	print(name)
	return conditions.all(func (condition : Condition): return condition.check_active(state))

class_name IntCondition
extends Condition
enum IntConditionType {
	equal_to,
	greater_than,
	less_than,
	greater_than_or_equals,
	less_than_or_equals
}

@export var condition_type : IntConditionType
@export var key : String
@export var value : int

func is_active(state):
	var checking_value : int = state.get(key, 0)
	match(condition_type):
		IntConditionType.equal_to:
			return checking_value == value
		IntConditionType.greater_than:
			return checking_value > value
		IntConditionType.less_than:
			return checking_value < value
		IntConditionType.greater_than_or_equals:
			return checking_value >= value
		IntConditionType.less_than_or_equals:
			return checking_value <= value
	return false
		

extends Condition
enum FloatConditionType {
	equal_to,
	greater_than,
	less_than,
	greater_than_or_equals,
	less_than_or_equals
}

@export var condition_type : FloatConditionType
@export var key : String
@export var value : float

func is_active(state):
	var checking_value : float = state.get(key, 0)
	match(condition_type):
		FloatConditionType.equal_to:
			return checking_value == value
		FloatConditionType.greater_than:
			return checking_value > value
		FloatConditionType.less_than:
			return checking_value < value
		FloatConditionType.greater_than_or_equals:
			return checking_value >= value
		FloatConditionType.less_than_or_equals:
			return checking_value <= value
	return false
		

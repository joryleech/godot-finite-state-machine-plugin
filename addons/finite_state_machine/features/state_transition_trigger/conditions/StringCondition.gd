class_name StringCondition
extends Condition
enum StringConditionType {
	equals,
	contains,
	begins_with,
	ends_with
}

@export var condition_type : StringConditionType
@export var key : String
@export var value : String

func is_active(state):
	var checking_value : String = state.get(key, "")
	match(condition_type):
		StringConditionType.equals:
			return checking_value == value
		StringConditionType.contains:
			return checking_value.contains(value)
		StringConditionType.begins_with:
			return checking_value.begins_with(value)
		StringConditionType.ends_with: 
			return checking_value.ends_with(value)
		

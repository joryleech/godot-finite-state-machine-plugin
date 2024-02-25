extends Control

@onready var state_label = $"Panel/ScrollContainer/VBoxContainer/State Label"
@onready var tabs_label = $"Panel/ScrollContainer/VBoxContainer/Tags Label"

@export var state_machine : Node
# Called when the node enters the scene tree for the first time.
func _ready():
	render_state(state_machine.get_current_state())
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func render_state(state):
	state_label.text = state.name
	
func _on_finite_state_machine_state_changed(current_state):
	render_state(current_state)
	pass # Replace with function body.

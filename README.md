

# Godot Finite State Machine Plugin
A plugin that allows the creation of a generalized Finite State Machine nodes, controlled by resources. 

## Features
* General Finite State Machine Node
* Resource based states
	* Accessible via name, id, reference, or index
* Manual or Automatic control of state transitions.
	* Manual control via scripting
	* Automatic control via resource based transition logic

## Installation
* Copy the contents of the ``/addons`` folder to your projects ``res://addons`` folder.
* Enable ``FiniteStateMachine`` in ``Project > Project Settings > Plugins``


## Nodes
### FiniteStateManager
A node that can manage State object.
#### Parameters
**Current State** the currently active state object.
**Available States**(Optional) An array of states that the Finite State Manager can access. Filling the access of states by name or index, rather than just by reference.
**Allow New States** If active, allows for additional states to be automatically added to the available states list, just by changing the state via script or automated transition trigger.

**State Variables** (Optional) A dictionary of all state variables that can be accessed by the default Condition objects. If the automated state transition triggers are not being used, this is unnecessary.

**Check State Transition Types** (optional) Select the frame of time that the automated transition triggers can be checked.
Options are: Per Frame, Per Physics Tick, On Change, or Disabled.

**State Transition Triggers** (Optional)
An array of StateTransitionTriggers, which will be checked according to the state transition types timeframe. Used to create complex automated logic similar to the animator transitions.

## Resources
### State
A state is an abstract object used to represent a single state in the FiniteStateManager.

#### Methods
All methods on the State object are abstract, but are handled by the FiniteStateManager appropriately when the state is the active state.

**_init()** : called on initialization of the resource.
**on_enter():**  called when the state becomes the current state
**on_exit():**  called when the state is no longer the current state
**update(delta)** : called on each frame the state is active
**physics_update(delta)**  called each physics tick the state is active.

#### Parameters
**Name:** A String that can be used to access this state.
**Tags:** An array of strings that can be accessed for more information on the state.

### StateTransitionTrigger
The state transition triggers can be used by the FiniteStateManager node to change the current state automatically.

#### Parameters
**Name (optional):** Visual only, no current use.
**Starting State:** A State object. The finite state manager will only check this transition trigger if the current state is the same as the triggers stating state.
**Ending State:** A State object. If the triggers conditons all return true, the finite state manager will set the current state to this.
**Conditions:** An array of Condition objects. Upon checking the trigger, all conditions will be checked.

### Condition
A condition resource is a resource that provides a truthy value to the state transition trigger. 

There are several included premade conditions in the project.
* FloatCondition:
* IntCondition:
* StringCondition

Each can be used to check several logical operations on the state of the FiniteStateManager. 



## TODO List
**Plugin**
* Small refactor to prevent polluting the global namespace.
* Better Icons.
* Less confusing documentation?

**Sample Scene**
* Organize sample scene scripts
* Make character controller motion based off states.

## License
The plugin is available as open source under the terms of the  [MIT License](https://opensource.org/licenses/MIT).

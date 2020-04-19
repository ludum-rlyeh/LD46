extends Node

class_name StateMachine

const DEBUG = true

var state: Object

var history = []

func _ready():
	# Set the initial state to the first child node
	state = $FollowPath
	_enter_state([])
	
func change_to(new_state, params : Array):
	history.append(state.name)
	state.set_block_signals(true)
	state.is_active = false
	state = get_node(new_state)
	_enter_state(params)

func _enter_state(var params : Array):
	if DEBUG:
		print("Entering state: ", state.name)
	# Give the new state a reference to this state machine script
	state.fsm = self
	state.set_block_signals(false)
	state.is_active = true
	state.enter(params)

# Route Game Loop function calls to
# current state handler method if it exists
func _process(delta):
	if state.has_method("process"):
		state.process(delta)

func _physics_process(delta):
	if state.has_method("physics_process"):
		state.physics_process(delta)

func _input(event):
	if state.has_method("input"):
		state.input(event)

func _unhandled_input(event):
	if state.has_method("unhandled_input"):
		state.unhandled_input(event)

func _unhandled_key_input(event):
	if state.has_method("unhandled_key_input"):
		state.unhandled_key_input(event)

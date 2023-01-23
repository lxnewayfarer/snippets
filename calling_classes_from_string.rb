# Get some user's state (e.g. "main_menu") and convert it to a class name (camelize and inflect)
state = StateMachine.current_state.camelize

# Search declared handler constant (class)
interaction_class = "StateInteractions::#{state}::Handle".constantize

# Run handler
interaction_class.run!(user: user)

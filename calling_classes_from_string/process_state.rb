# Get some user's state (e.g. "main_menu") and convert it to a class name (camelize and inflect)
state = StateMachine.current_state.classify
# Search declared handler constant (class)
handler = "StateInteractions::#{state}::Handle".constantize
# Run handler
handler.run!(user: user)

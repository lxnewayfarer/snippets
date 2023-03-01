# Get some user's state (e.g. "main_menu") and convert it to a class name (camelize and inflect)
# Note: it is better to use #camelize instead of #classify to avoid unexpected inflection problem
state = StateMachine.current_state.classify

# Search declared handler constant (interaction class)
interaction_class = "StateInteractions::#{state}::Handle".constantize

# Run handler
interaction_class.run!(user: user)

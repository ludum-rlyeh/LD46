extends Node

# Put here all the signals
# To emit signals from a node, call Events.emit_signal("[action_in_past]_signal")
# To receive signals in a node, call connect(Events, "[action_in_past]_signal", node, "_on_[slot name]")

signal moved_signal
signal button_pressed_signal

signal game_over_signal
signal died_signal

extends Node2D
class_name IceRectangle

signal melted(node_id)


@export var melting_time: float = 2.0

@onready var melt_timer: Timer = $meltTimer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	melt_timer.wait_time = melting_time
	melt_timer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_melt_timer_timeout() -> void:
	melted.emit(self)
	queue_free()

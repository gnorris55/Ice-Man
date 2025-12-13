extends Node2D
class_name IceRectangle

signal melted(node_id)
signal ice_hit(projectile_position, projectile_radius)

@export var melting_time: float = 2.0
@onready var spawn_ice_effect: CPUParticles2D = $spawnIceEffect

@onready var melt_timer: Timer = $meltTimer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	melt_timer.wait_time = melting_time
	melt_timer.start()
	spawn_ice_effect.emitting = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass




func _on_melt_timer_timeout() -> void:
	remove_self()
	
func remove_self():
	melted.emit(self)
	queue_free()
	


func _on_projectile_detector_area_entered(area: Area2D) -> void:
	print()
	ice_hit.emit(area.global_position, 3)

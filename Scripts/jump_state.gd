extends Resource
class_name JumpState

@export var animation_name : String
@export var jump_height : float
@export var apex_duration : float

#var jum_velocity : float = (2.0 * jum_height) / jum_time_to_peak
#var jum_gravity : float = (-2.0 * jum_height) / (jum_time_to_peak * jum_time_to_peak)
#var fal_gravity : float = (-2.0 * jum_height) / (jum_time_to_descent * jum_time_to_descent)

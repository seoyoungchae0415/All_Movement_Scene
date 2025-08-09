extends Resource
class_name JumpState

@export var animation_name : String
@export var jump_height : float = 1
@export var apex_duration : float = 0.5

#@export var jum_height : float
#@export var jum_time_to_peak : float
#@export var jum_time_to_descent : float

var shouldwork : float = 2 * jump_height / apex_duration

#var jum_velocity : float = (2.0 * jum_height) / jum_time_to_peak
#var jum_gravity : float = (-2.0 * jum_height) / (jum_time_to_peak * jum_time_to_peak)
#var fal_gravity : float = (-2.0 * jum_height) / (jum_time_to_descent * jum_time_to_descent)

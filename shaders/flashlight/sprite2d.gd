extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	if material:
		material.set_shader_parameter("scale", scale);


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


# Copy this function to your code
func _input(event):
	if event is InputEventMouseMotion and material:
		material.set_shader_parameter("mouse_pos", event.position);

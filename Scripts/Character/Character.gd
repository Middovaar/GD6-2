extends CharacterBody2D

var run_speed = 350
var jump_speed = -1 * 1200
var gravity = 2500

@export var CurrentLevelActive:String = "normal"

signal LevelChanger(LevelWeGoingTo)
signal WhatLevelToQueueFree(LevelToRelieve)


func get_input():
	velocity.x = 0
	var right = Input.is_action_pressed('Forward')
	var left = Input.is_action_pressed('Back')
	var jump = Input.is_action_just_pressed('Jump')
	
	## Level Switch Debug
	var WierdLevel = Input.is_action_just_pressed('WierdDebug')
	var SpikeLevel = Input.is_action_just_pressed('SpikeDebug')
	var NormalLevel = Input.is_action_just_pressed('NormalDebug')
	
	## Controls
	if is_on_floor() and jump:
		velocity.y = jump_speed
	if right:
		velocity.x += run_speed
	if left:
		velocity.x -= run_speed
	
	## Exits Game
	var quit = Input.is_action_just_pressed('Quit')
	if quit:
		get_tree().quit(0)
	
	
	
	
	
	
	## Debug Level Switches
	var LevelWeGoingTo:String
	var LevelToRelieve:String
	
	if NormalLevel and CurrentLevelActive != "normal":
		"Goto Normal Level"
		LevelWeGoingTo = "normal"
		velocity.y = jump_speed
		
		match CurrentLevelActive:
			"normal":
				LevelToRelieve = "normal"
				emit_signal("WhatLevelToQueueFree", LevelToRelieve)
			"wierd":
				LevelToRelieve = "wierd"
				emit_signal("WhatLevelToQueueFree", LevelToRelieve)
			"spikes":
				LevelToRelieve = "spikes"
				emit_signal("WhatLevelToQueueFree", LevelToRelieve)
		
		CurrentLevelActive = "normal"
		emit_signal("LevelChanger", LevelWeGoingTo)
		
	if WierdLevel and CurrentLevelActive != "wierd":
		"Goto Wierd Level"
		LevelWeGoingTo = "wierd"
		velocity.y = jump_speed
		
		match CurrentLevelActive:
			"normal":
				LevelToRelieve = "normal"
				emit_signal("WhatLevelToQueueFree", LevelToRelieve)
			"wierd":
				LevelToRelieve = "wierd"
				emit_signal("WhatLevelToQueueFree", LevelToRelieve)
			"spikes":
				LevelToRelieve = "spikes"
				emit_signal("WhatLevelToQueueFree", LevelToRelieve)
		
		CurrentLevelActive = "wierd"
		emit_signal("LevelChanger", LevelWeGoingTo)
		
	if SpikeLevel and CurrentLevelActive != "spikes":
		"Goto Spike Level"
		LevelWeGoingTo = "spikes"
		velocity.y = jump_speed
		
		match CurrentLevelActive:
			"normal":
				LevelToRelieve = "normal"
				emit_signal("WhatLevelToQueueFree", LevelToRelieve)
			"wierd":
				LevelToRelieve = "wierd"
				emit_signal("WhatLevelToQueueFree", LevelToRelieve)
			"spikes":
				LevelToRelieve = "spikes"
				emit_signal("WhatLevelToQueueFree", LevelToRelieve)
		
		CurrentLevelActive = "spikes"
		emit_signal("LevelChanger", LevelWeGoingTo)
	
func _physics_process(delta):
	velocity.y += gravity * delta
	get_input()
	move_and_slide()

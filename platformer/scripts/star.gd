extends Area2D
tool

enum TRANSITION_TYPES  { 
	LINEAR = 0,
	SINE = 1,
	QUINT = 2,
	QUART = 3,
	QUAD = 4,
	EXPO = 5,
	ELASTIC = 6,
	CUBIC = 7,
	CIRC = 8,
	BOUNCE = 9,
	BACK = 10
}

onready var _tween = $Tween as Tween
export(Array) var tween_values = [Vector2(), Vector2()]
export(TRANSITION_TYPES) var transitiontype
export(float) var time 

var direction := 1

func _ready() -> void:
	if Engine.editor_hint:
		return
	start_tween()


func start_tween() -> void:
	_tween.interpolate_property(self, "position", tween_values[0], tween_values[1] , time, transitiontype, Tween.EASE_IN_OUT)
	_tween.start()

func _on_Tween_tween_completed(object: Object, key: NodePath) -> void:
	tween_values.invert()
	start_tween()

func _draw() -> void:
	if Engine.editor_hint:
		draw_line(tween_values[0], tween_values[1],Color.white)


func _on_Star_body_entered(body: Node) -> void:
	GameEvents.emit_signal("player_hit_spikes")

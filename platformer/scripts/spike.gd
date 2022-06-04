extends Area2D


func _on_Spikes_body_entered(body: Node) -> void:
	GameEvents.emit_signal("player_hit_spikes")

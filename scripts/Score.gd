extends Label

var score = 0

func _on_RockGenerator_spawn():
	score += 1
	text = str(score)

func _on_Player_die():
	if Storage.data.get("best_score", 0) < score:
		Storage.data["best_score"] = score
	Storage.data["score"] = score

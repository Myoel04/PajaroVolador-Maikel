extends CanvasLayer

func _ready() -> void:
	Global.connect("on_increment_score", change_score)#cada vez que se emita la señal se cambia el score
	#Global.increment_score("on_increment_score",change_score())
func _process(delta: float) -> void:
	#$lPuntuacion.text = str(Global.score) #cojo la puntuacion la paso a texto y se la asigno al score
	pass

func change_score():
	$lPuntuacion.text = str(Global.score)

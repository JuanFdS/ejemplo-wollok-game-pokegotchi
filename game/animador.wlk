import game.TemporaryVisual.*

object animador {
	method anima(animacion, tiempoEnMilisegundos) {
		new TemporaryVisual(visual=animacion, timeInMilliseconds=tiempoEnMilisegundos).draw()
	}
	
	method animaEn(animacion, tiempoEnMilisegundos, posicion) {
		new TemporaryVisual(visual=animacion, timeInMilliseconds=tiempoEnMilisegundos).drawIn(posicion)
	}
}

object animadorDeMentira {
	method anima(animacion, tiempoEnMilisegundos) {}
	
	method animaEn(animacion, tiempoEnMilisegundos, posicion) {}
}
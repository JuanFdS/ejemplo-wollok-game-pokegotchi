import gameConfiguration.*

object movimiento {
	method mover(personajeLibre, direccion){
		const nuevaPosicion = direccion.posicionSiguiente(personajeLibre.position())
		personajeLibre.position(nuevaPosicion)
	}
}

object haciaArriba {
	method posicionSiguiente(posicion) = posicion.up(1)	
}

object haciaAbajo {
	method posicionSiguiente(posicion) = posicion.down(1)	
}

object haciaLaDerecha {
	method posicionSiguiente(posicion) = posicion.right(1)	
}

object haciaLaIzquierda {
	method posicionSiguiente(posicion) = posicion.left(1)	
}

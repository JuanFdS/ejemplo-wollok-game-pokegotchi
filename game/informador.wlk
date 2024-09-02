import wollok.game.*

object informadorMudo {

	method informar(_mensaje) {
	}

	method habilidadFueUsada(_nombreDePokemon, _nombreDeAtaque) {
	}

}

class Brock {

	const dondeHabla
	var libre = true

	method image() = "brock.png"

	method informar(mensaje) {
		if(libre) {
			self.ocuparse()
			game.say(dondeHabla, mensaje)
		}
	}
	
	method ocuparse() {
		libre = false
		game.schedule(1500, { libre = true })
	}

	method habilidadFueUsada(nombreDePokemon, nombreDeAtaque) {
		self.informar(nombreDePokemon + " usó " + nombreDeAtaque)
	}

}

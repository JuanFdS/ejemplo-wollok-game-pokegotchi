import wollok.game.*
import estadio.*
import brock.*
import game.AnimatedSprite.*


class Charmander {
	const sprite = new AnimatedSprite(name="charmander/resized_", imageExtension="png", quantityOfFrames=54)
	
	method usarHabilidad(pokemon) {
		brock.habilidadFueUsada("Charmander", "ascuas")
		estadio.aumentarTemperatura(5)
		pokemon.aumentarHambre(10)
	}

	method alegria() = estadio.sensacionTermica()

	method evolucion() = new Charmeleon()

	method image() = sprite.image()
}

class Squirtle {
	const sprite = new AnimatedSprite(name="squirtle/resized_", imageExtension="png", quantityOfFrames=32)

	method usarHabilidad(pokemon) {
		brock.habilidadFueUsada("Squirtle", "danza lluvia")
		estadio.empezaALlover()
		pokemon.aumentarHambre(30)
	}

	method alegria() = if (estadio.lloviendo()) 70 else 30

	method evolucion() = new Wartortle()

	method image() = sprite.image()

}

class Bulbasaur {
	const sprite = new AnimatedSprite(name="bulbasaur/resized_", imageExtension="png", quantityOfFrames=52)

	var obtuvoEnergiaDelSol = 0

	method usarHabilidad(pokemon) {
		brock.habilidadFueUsada("Bulbasaur", "sintesis")
		if (estadio.lloviendo()) {
			self.absorberEnergiaDelSol(pokemon, 1)
		} else {
			self.absorberEnergiaDelSol(pokemon, 10)
		}
	}

	method absorberEnergiaDelSol(pokemon, cantidadDeEnergia) {
		pokemon.disminuirHambre(cantidadDeEnergia)
		obtuvoEnergiaDelSol += 1
		brock.informar("Bulbasaur absorbió energía del sol")
	}

	method alegria() = obtuvoEnergiaDelSol * 10

	method evolucion() = new Ivysaur()

	method image() = sprite.image()

}

class Charmeleon {
	const sprite = new AnimatedSprite(name="charmeleon/resized_", imageExtension="png", quantityOfFrames=58)

	method alegria() = 50 + (estadio.temperatura() / 2)

	method usarHabilidad(pokemon) {
		brock.habilidadFueUsada("Charmeleon", "llamarada")
		estadio.aumentarTemperatura(30)
		pokemon.aumentarHambre(5)
	}

	method evolucion() {
		self.error("No tiene evolucion")
	}
	
	method image() = sprite.image()

}

class Wartortle {
	const sprite = new AnimatedSprite(name="wartortle/resized_", imageExtension="png", quantityOfFrames=43)

	var alegria = 40

	method alegria() = alegria

	method usarHabilidad(pokemon) {
		brock.habilidadFueUsada("Wartortle", "giro rápido")
		alegria *= 1.5
		pokemon.aumentarHambre(10)
	}

	method evolucion() {
		self.error("No tiene evolucion")
	}

	method image() = sprite.image()

}

class Ivysaur {
	const sprite = new AnimatedSprite(name="ivysaur/resized_", imageExtension="png", quantityOfFrames=59)

	var bayasComidas = 0

	method alegria() = bayasComidas * 20

	method usarHabilidad(pokemon) {
		brock.habilidadFueUsada("Ivysaur", "día soleado")
		estadio.secarse()
		pokemon.aumentarHambre(15)
	}

	method evolucion() {
		self.error("No tiene evolucion")
	}

	method image() = sprite.image()

}


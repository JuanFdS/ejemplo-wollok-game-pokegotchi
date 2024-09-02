import wollok.game.*
import estadio.*
import game.AnimatedSprite.*
import game.Image.*

class Especie {

	// variables y metodos que necesito para cosas relacionadas a wollok game
	const sprite = new AnimatedSprite(name = { self.nombre() + "/" }, quantityOfFrames = { self.quantityOfFrames() })
	method evolucion() = ninguna
	
	method grito() = "gritos/" + self.nombre() + ".ogg"

	method animacionHabilidad() = new Image(imagePath = "empty.png")

	method menuSprite() = self.nombre() + "/menu.png"

	method image() = sprite.image()
	
	method sonidoHabilidad() = "attack.mp3"

	method quantityOfFrames()

	method nombre()

	// metodos del dominio
	method tieneEvolucion() = self.evolucion() != ninguna
	
	method evolucionar(pokemon) {
		if(self.tieneEvolucion()) {
			pokemon.especie(self.evolucion())
		} else {
			self.error("No tiene evolución")
		}
	}

	method usarHabilidad(pokemon)

	method alegria()

	method comerBaya(pokemon) {
		pokemon.disminuirHambre(1)
	}

}

class Charmander inherits Especie {
	override method evolucion() = new Charmeleon()

	override method nombre() = "charmander"

	override method quantityOfFrames() = 54

	override method animacionHabilidad() = new AnimatedSprite(name = { "ascuas/" }, quantityOfFrames = { 7 })

	override method usarHabilidad(pokemon) {
		estadio.aumentarTemperatura(3)
		pokemon.aumentarHambre(1)
	}

	override method alegria() = estadio.sensacionTermica()

}

class Squirtle inherits Especie {
	override method evolucion() = new Wartortle()

	override method nombre() = "squirtle"

	override method quantityOfFrames() = 32

	override method usarHabilidad(pokemon) {
		estadio.empezaALlover()
		pokemon.aumentarHambre(3)
	}

	override method alegria() = if (estadio.lloviendo()) 7 else 3

	override method image() = sprite.image()

}

class Bulbasaur inherits Especie {

	var vecesQueObtuvoEnergiaDelSol = 0
	
	override method evolucion() = new Ivysaur()

	override method nombre() = "bulbasaur"

	override method quantityOfFrames() = 52

	override method usarHabilidad(pokemon) {
		if (estadio.soleado()) {
			self.absorberEnergiaDelSol(pokemon, 10)
		} else {
			self.absorberEnergiaDelSol(pokemon, 1)
		}
	}

	method absorberEnergiaDelSol(pokemon, cantidadDeEnergia) {
		pokemon.disminuirHambre(cantidadDeEnergia)
		vecesQueObtuvoEnergiaDelSol += 1
	}

	override method alegria() = vecesQueObtuvoEnergiaDelSol * 3

}

class Charmeleon inherits Especie {

	override method nombre() = "charmeleon"

	override method quantityOfFrames() = 58

	override method animacionHabilidad() = new AnimatedSprite(name = { "lanzallamas/" }, quantityOfFrames = { 10 })

	override method alegria() = 5 + (estadio.temperatura() / 2)

	override method usarHabilidad(pokemon) {
		estadio.aumentarTemperatura(3)
		pokemon.aumentarHambre(2)
	}

}

class Wartortle inherits Especie {

	var alegria = 4

	override method nombre() = "wartortle"

	override method quantityOfFrames() = 43

	override method animacionHabilidad() = new AnimatedSprite(name = { "twister/" }, quantityOfFrames = { 20 })

	override method alegria() = alegria

	override method usarHabilidad(pokemon) {
		alegria *= 1.2
		pokemon.aumentarHambre(1)
	}

}

class Ivysaur inherits Especie {

	var bayasComidas = 0

	override method nombre() = "ivysaur"

	override method quantityOfFrames() = 59

	override method alegria() = bayasComidas * 2

	override method usarHabilidad(pokemon) {
		estadio.secarse()
		pokemon.aumentarHambre(1)
	}

	override method comerBaya(pokemon) {
		super(pokemon)
		bayasComidas += 1
	}

}

object ninguna {}

/*TODO: implementar a jigglypuff */
//nombre de jigglypuff: "jigglypuff"
//quantityOfFrames de jigglypuff: 16
//sonidoHabilidad: "jigglypuffSong.mp3"

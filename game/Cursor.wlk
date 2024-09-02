import game.AnimatedSprite.*
import wollok.game.*

class Cursor {

	const entrenador
	const sprite = new AnimatedSprite(name = {"cursor/"}, imageExtension = "png", quantityOfFrames = {9})
	var property indiceDePokemonApuntado = 0

	method image() = sprite.image()

	method cambiarPokemonSeleccionado() {
		indiceDePokemonApuntado = (indiceDePokemonApuntado + 1) % entrenador.equipo().size()
	}

	method position() = game.at(indiceDePokemonApuntado * 2, game.height() - 2)

}
import game.TemporaryVisual.*
import informador.*
import animador.*
import ejercicio.estadio.*
import game.AnimatedSprite.*
import wollok.game.*
import game.sonidista.*

//La idea del objeto 'juego', es que lo notifiquemos cuando suceden ciertos eventos de nuestro juego, y ese objeto se encarga
//de realizar los efectos (animaciones, sonidos, etc) necesarios. De manera que no tengamos los efectos repartidos por todo el código,
//si no concentrados todos acá. Además, también hace que sea mucho más fácil hacer que esos efectos no se intenten producir en un ambiente
//en el que no tendría sentido: por ejemplo, si intentasemos correr los tests, el juego no está andando en ese momento así que no podemos reproducir sonidos,
//para que esto no nos traiga problemas, podemos hacer que cuando vayamos a correr los tests, el sonidista del juego sea el 'sonidistaMudo' que no hace
//nada realmente cuando le decimos que toque algo.

object juego {
	var property informador = informadorMudo
	var property animador = animadorDeMentira
	var property sonidista = sonidistaMudo
	method empezoElJuego() {
		sonidista.loop("palletTown.mp3", 90)
		game.schedule(0, { informador.informar("Apretá F para cambiar de pokemon") })
		game.schedule(2000, { informador.informar("Apretá Q para alimentarlo") })
		game.schedule(4000, { informador.informar("Apretá W para que use su habilidad") })
		game.schedule(6000, { informador.informar("Apretá E para intentar hacerlo evolucionar") })
	}
	method habilidadFueUsada(pokemon) {
		animador.animaEn(pokemon.animacionHabilidad(), 700, game.origin())
		sonidista.tocar(pokemon.sonidoHabilidad())
	}
	method bayaFueComida(pokemon) {
		animador.animaEn(new AnimatedSprite(name={"hearts/"}, quantityOfFrames={8}), 500, game.center().down(1))
		sonidista.tocar(pokemon.grito())
		informador.informar("Se le dio una baya al pokemon")
	}
	method temperaturaSubio(sensacionTermica) {
		informador.informar("La temperatura subió a " + sensacionTermica.toString())
	}
	method seLargoALlover() {
		informador.informar("Se largó a llover")
	}
	method dejoDeLlover(){
		informador.informar("Salió el sol")
	}
	method pokemonEvoluciono() {
		informador.informar("Tu pokemon evoluciono!")
		sonidista.tocar("evolution.mp3")
	}
}

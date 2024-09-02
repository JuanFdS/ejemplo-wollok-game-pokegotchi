import game.juego.*
import game.AnimatedSprite.*

object estadio {

	var property temperatura = 0
	var property clima = soleado

	method aumentarTemperatura(grados) {
		temperatura += grados
		juego.temperaturaSubio(self.sensacionTermica())
	}

	method sensacionTermica() = clima.sensacionTermica(temperatura)

	method empezaALlover() {
		clima = lluvioso
	}

	method secarse() {
		clima = soleado
	}

	method lloviendo() = clima.lloviendo()

	method soleado() = clima.soleado()

	method image() = clima.image()

}

object lluvioso {

	const sprite = new AnimatedSprite(name = { "danza lluvia/lluvia_estado_" }, imageExtension = "png", quantityOfFrames = { 7 })

	method image() = sprite.image()

	method lloviendo() = true
	
	method soleado() = false

	method sensacionTermica(temperatura) = temperatura / 2
}

object soleado {

	const sprite = new AnimatedSprite(name = { "dia soleado/sol_" }, imageExtension = "png", quantityOfFrames = { 20 })

	method image() = sprite.image()

	method lloviendo() = false
	
	method soleado() = true

	method sensacionTermica(temperatura) = temperatura

}


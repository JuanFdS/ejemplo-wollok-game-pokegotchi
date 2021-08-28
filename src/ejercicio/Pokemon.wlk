import wollok.game.*
import game.juego.*


class Pokemon {
	var property especie
	var property hambre = 0

	method felicidad() = 0.max(self.alegria() - hambre)

	method alegria() = especie.alegria()

	method usarHabilidad() {
		juego.habilidadFueUsada(self)
		especie.usarHabilidad(self)
	}

	method disminuirHambre(cantidad) {
		hambre = 0.max(hambre - cantidad)
	}
	
	method aumentarHambre(cantidad) {
		hambre += cantidad
	}

	method comerBaya() {
		especie.comerBaya(self)
	}

	method evolucionar() {
		if (self.felicidad() >= 5) {
			especie.evolucionar(self)
		} else {
			self.error("No puede evolucionar, necesita tener al menos 5 de felicidad y su felicidad es " + self.felicidad().toString())
		}
	}

	method image() = especie.image()
	
	method menuSprite() = especie.menuSprite()
	
	method grito() = especie.grito()
	
	method animacionHabilidad() = especie.animacionHabilidad()
	
	method sonidoHabilidad() = especie.sonidoHabilidad()

}


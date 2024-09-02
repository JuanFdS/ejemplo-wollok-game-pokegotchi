import game.juego.*

class Entrenador {
	var property equipo = []
	
	method pokemonActual() = equipo.first()
	
	method cambiarPokemon() {
		equipo = equipo.drop(1) + equipo.take(1)
	}
	
	method darDeComer() {
		self.pokemonActual().comerBaya()
		juego.bayaFueComida(self.pokemonActual())
	}
	
	method ordenarUsarHabilidad() {
  		self.pokemonActual().usarHabilidad()
	}
	
	method intentarEvolucionar() {
		self.pokemonActual().evolucionar()
		juego.pokemonEvoluciono()
	}
	
	method image() = self.pokemonActual().image()
}

class Baya {
	var property valorNutritivo = 10
}


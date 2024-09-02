import movimientos.*
import wollok.game.*
import ejercicio.Entrenador.*
import ejercicio.Especies.*
import ejercicio.Pokemon.*
import informador.*
import clock.*
import game.AnimatedSprite.*
import game.displays.*
import game.juego.*
import game.animador.*
import ejercicio.estadio.*
import game.Cursor.*
import game.Image.*
import game.sonidista.*


object config {

	const bulbasaur = new Pokemon(especie = new Charmander())
	const charmander = new Pokemon(especie = new Squirtle())
	const squirtle = new Pokemon(especie = new Bulbasaur())
	const entrenador = new Entrenador(equipo = [ charmander, bulbasaur, squirtle ])
	const cursor = new Cursor(entrenador = entrenador)

	method alturaMaxima() = 12

	method anchoMaximo() = 10

	method configurarJuego() {
		self.configurarSonido()
		self.configurarReloj()
		self.configurarAnimador()
		self.configurarVentana()
		self.agregarComponentesVisuales()
		self.configurarAcciones()
	}
	
	method configurarSonido() {
		juego.sonidista(sonidista)
	}
	
	method configurarReloj() {
		game.onTick(60, "Advance time", { clock.advanceTime(1)})
	}
	
	method configurarAnimador() {
		juego.animador(animador)
	}

	method configurarVentana() {
		game.title("Pokemon: Herencia vs composicion")
		game.height(self.alturaMaxima())
		game.width(self.anchoMaximo())
	}

	method agregarMenuDeEquipo() {
		var unoccuppiedTopLeft = game.at(0, game.height() - 2)
		entrenador.equipo().forEach{ pokemon =>
			game.addVisualIn(new MenuEquipoDisplay(pokemon = pokemon), unoccuppiedTopLeft)
			unoccuppiedTopLeft = unoccuppiedTopLeft.right(2)
		}
		game.addVisual(cursor)
	}

	method agregarInformador() {
		const burbujaDeTexto = new Image(imagePath="empty.png")
		const brock = new Brock(dondeHabla = burbujaDeTexto)
		juego.informador(brock)
		game.addVisualIn(brock, game.at(0, 0))
		game.addVisualIn(burbujaDeTexto, game.at(2, 2))
	}

	method agregarPokemonActual() {
		new PokemonActualDisplay(entrenador = entrenador).draw()
	}
	
	method agregarClima() {
		game.addVisualIn(estadio, game.origin())
	}
	
	method agregarTermometro() {
		const termometro = new TermometroDisplay(getTemperatura = { estadio.sensacionTermica() })
		game.addVisualIn(termometro, game.center().down(1).right(3))
	}

	method agregarComponentesVisuales() {
		game.boardGround("arena.png")
		self.agregarMenuDeEquipo()
		self.agregarPokemonActual()
		self.agregarClima()
		self.agregarTermometro()
		self.agregarInformador()
	}

	method configurarAcciones() {
		keyboard.f().onPressDo({ entrenador.cambiarPokemon()
			cursor.cambiarPokemonSeleccionado()
		})
		keyboard.e().onPressDo({ entrenador.intentarEvolucionar()})
		keyboard.q().onPressDo({ entrenador.darDeComer()})
		keyboard.w().onPressDo({ entrenador.ordenarUsarHabilidad()})
	}

}


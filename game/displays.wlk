import NumberFormatter.*
import wollok.game.*
import game.Image.*
import game.AnimatedSprite.*


class NumberDisplay {

	const getNumber = { 0 }
	var quantityOfDigits = 1
	var digitDisplays = []

	method draw(position) {
		quantityOfDigits.times{ d => digitDisplays.add(new DigitDisplay(digit = d, getNumber = getNumber, startNumberPosition = position))}
		digitDisplays.forEach{ digitDisplay => game.addVisual(digitDisplay)}
	}
}

class DigitDisplay {

	const digit = 1
	const getNumber = { 0 }
	const startNumberPosition

	method position() = startNumberPosition.left((digit - 1).div(3))

	method image() {
		const number = getNumber.apply().truncate(0)
		const numberName = if (digit > number.digits()) "0" else number.toString().charAt(number.digits() - digit)
		const numberPosition = ((3 - digit).abs() % 3).toString()
		return "digits/" + numberName + numberPosition + ".png"
	}

}

class PokemonActualDisplay {

	const property entrenador

	method image() = self.pokemon().image()
	
	method pokemon() = entrenador.pokemonActual()
	
	method draw() {
		game.addVisualIn(self, game.center().left(1).down(3))

		game.addVisualIn(new Image(imagePath = "stats.png"), game.at(game.width() - 5, 0))

		const felicidadDisplay = new NumberDisplay(getNumber = { self.pokemon().felicidad() }, quantityOfDigits = 3)
		felicidadDisplay.draw(game.at(game.width() - 2, 1))

		const hambreDisplay = new NumberDisplay(getNumber = { self.pokemon().hambre() }, quantityOfDigits = 3)
		hambreDisplay.draw(game.at(game.width() - 2, 2))
		
		const sleepDisplay = new SleepDisplay(durmiendo = { false /*TODO: completar con código que dice si el pokemon esta durmiendo o no */ })
		game.addVisualIn(sleepDisplay, game.center().down(1).left(1))
	}

}

class SleepDisplay {
	const durmiendo = { false }
	
	const sleepAnimation = new AnimatedSprite(name={"zzz/"}, quantityOfFrames={12}) 
	
	method image() = if(durmiendo.apply()) sleepAnimation.image() else "empty.png"
}

class MenuEquipoDisplay {

	const property pokemon

	method image() = pokemon.menuSprite()

}

class TermometroDisplay {
	const getTemperatura = { 0 }
	
	method image() {
		const temperatura = getTemperatura.apply()
		if(temperatura < 6) {
			return "termometro/px_termometro_1.png"
		} else if(temperatura < 12) {
			return "termometro/px_termometro_2.png"
		} else {
			return "termometro/px_termometro_3.png"
		}
	}
}



import wollok.game.*

class TemporaryVisual {
	const visual
	const timeInMilliseconds

	method draw() {
		game.addVisual(self)
		self.scheduleRemoval()
	}
	
	method drawIn(position) {
		game.addVisualIn(self, position)
		self.scheduleRemoval()
	}
	
	method scheduleRemoval() {
		game.schedule(timeInMilliseconds, { self.remove() })
	}

	method remove() {
		game.removeVisual(self)
	}

	method image() = visual.image()
	
	method position() = visual.position()

}

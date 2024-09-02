object clock {
	var property timePassed = 0
	
	method advanceTime(time) {
		timePassed += time
	}
}

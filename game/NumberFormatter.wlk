import wollok.game.*

object numberFormatter {
	method toStringWithLeadingZeros(number, quantityOfZeros) {
		var leadingZeros = []
		quantityOfZeros.times { i => leadingZeros.add(0) }
		return leadingZeros.join("") + number.toString()
	}
	
	method toStringPaddingLeadingZeros(number, maxDigits) {
		return self.toStringWithLeadingZeros(number, maxDigits - number.digits())
	}
}


/** First Wollok example */
import wollok.game.*

object lionel {
	
	var property position = game.at(3,5)
	
	method image() {
		return "lionel-titular.png"
	}

	method retroceder() {
		position = game.at(0.max(position.x() - 1), position.y()) 
	}
	
	method avanzar() {
		position = game.at((game.width() - 1).min(position.x() + 1), position.y()) 
	}

	method validarSiTienePelota(pelota) {
		return if (not self.tienePelota(pelota)) {
			self.error("Lionel no tiene la pelota")
		}
	}

	method tienePelota(pelota) {
		return self.position() == pelota.position()
	}

	method patear(pelota) {
		self.validarSiTienePelota(pelota)
		pelota.position(game.at((game.width() - 1).min(position.x() + 3), position.y()))
	}
	
}


object pelota {
	const property image="pelota.png"
	var property position = game.at(5,5)	
}

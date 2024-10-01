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
	
	method hacerTaquito() {
		self.validarEstaSobreLaPelota()
		pelota.rodarParaAtras(2)

	}

	method validarEstaSobreLaPelota() {
		if (not self.estaSobreLaPelota()) {
			self.error("No tengo la pelota")
		}
	}

	method estaSobreLaPelota() {
		return self.position() ==  pelota.position()
	}
}


object pelota {
	const property image="pelota.png"
	var property position = game.at(5,5)	

	method rodarParaAtras(posiciones) {
		position = game.at(0.max(position.x() - posiciones), position.y())
	}
}

/** First Wollok example */
import wollok.game.*

object lionel {
	
	var property position = game.at(3,5)
	var property casaca = camisetaTitular


	
	method image() {
		return "lionel-" + casaca.estado() +".png"
	}

	method retroceder() {
		position = game.at(0.max(position.x() - 1), position.y()) 
	}
	
	method avanzar() {
		position = game.at((game.width() - 1).min(position.x() + 1), position.y()) 
	}


	method camiseta(){
		self.validarCamiseta()
		casaca.cambiarCamiseta()

	}


	method validarCamiseta(){
		if(not self.estaEnBordeIzquierdo()){
			self.error("No me puedo cambiar la camiseta aca")
		}
	}

	method validarSiTienePelota() {
		return if (not self.tienePelota()) {
			self.error("Lionel no tiene la pelota")
		}
	}

	method tienePelota() {
		return self.position() == pelota.position()
	}

	method patear() {
		self.validarSiTienePelota()
		pelota.position(game.at((game.width() - 1).min(position.x() + 3), position.y()))
	}

	
<<<<<<< HEAD
	method hacerTaquito() {
		self.validarSiTienePelota()
		pelota.rodarParaAtras(2)

	}

	method estaEnBordeIzquierdo(){
		return position.x() == 0
>>>>>>> main
	}
}


object pelota {
	const property image="pelota.png"
	var property position = game.at(5,5)	

	method rodarParaAtras(posiciones) {
		position = game.at(0.max(position.x() - posiciones), position.y())
	}
}

object camisetaTitular{

	const property estado = "titular"
	
	method cambiarCamiseta(){
		lionel.casaca(camisetaSuplente)
	}
}


object camisetaSuplente{

	const property estado = "suplente"
	
	method cambiarCamiseta(){
		lionel.casaca(camisetaTitular)
	}
}

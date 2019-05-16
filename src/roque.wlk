import pepita.*
import wollok.game.*
import ciudades.*
import comidas.*

object roque {
	var property image = "jugador.png"
	var property position = game.at(1,5)
	var property comida = null
	var property granosAlpiste = 0
	
	method move(nuevaPosicion){
		position = nuevaPosicion
		granosAlpiste += 1
	}

	
	method agarrar(_comida){
		if (comida != null){
			game.addVisualIn(comida, game.at(1.randomUpTo(10).truncate(0), 1.randomUpTo(10).truncate(0)))
			game.whenCollideDo(_comida, {entrenador => entrenador.agarrar(comida)})
			comida = _comida
			game.removeVisual(comida)
			
		}
		else {
			comida = _comida
			game.removeVisual(comida)
			
		}
	}
	
	method alimentar(ave){
		if (comida != null) {
			ave.come(comida)
			self.soltar(comida)
			comida = null
	}
}
	method tomarComida(_comida) {
		if (comida != null) {
		self.soltar(comida)
	}
		game.removeVisual(_comida)
		comida = _comida
}

	method soltar(_comida) {
		game.addVisualIn(_comida, self.randomPositionInGame())
		game.whenCollideDo(_comida, { entrenador => entrenador.tomarComida(_comida)})
}
	method dejarComida(_comida) {
		_comida.estasSiendoDejadoPor(self)
	}

	method randomPositionInGame() {
		return game.at(1.randomUpTo(10).truncate(0), 1.randomUpTo(10).truncate(0))
}

	method chocasteCon(alguien) {
		game.say(self, "!Hola Pepita")
		game.say(pepita, "Hola Roque")
	}

//method tieneComida() = comida == alpiste || comida == manzana
	
}

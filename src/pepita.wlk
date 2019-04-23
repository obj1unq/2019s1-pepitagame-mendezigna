import ciudades.*
import wollok.game.*
import comidas.*

object pepita {
	var property energia = 50
	var property ciudad = buenosAires 
	var property position = game.at(3,3)
	var amiga 
	method image(){
		return if (self.estaGorda()) { "pepita-gorda-raw.png" }
		else { "pepita.png" } 
	}

	method come(comida) {
		energia = energia + comida.energia()
	}
	
	method volaHacia(unaCiudad) {
		if (self.position() == unaCiudad.position()) {
			game.say(self, "Ya Estoy!")
		}
		else {
			self.move(unaCiudad.position())
			ciudad = unaCiudad
		}
	}

	method energiaParaVolar(distancia) = 15 + 5 * distancia
	
	method move(nuevaPosicion) {
		if (self.leAlcanzaLaEnergia(nuevaPosicion)){
			energia -= self.energiaParaVolar(position.distance(nuevaPosicion))
			self.position(nuevaPosicion)
		}
		else { game.say(self, "Dame de comer Primero!")}
	}
	method leAlcanzaLaEnergia(posicion) = (energia - self.energiaParaVolar(position.distance(posicion))) > 0 
	method volarYComer(comida){
		game.removeVisual(comida)
		self.move(comida.position())
		self.come(comida)
		
		
	}	
	
	method estaGorda() = energia > 100
	method nuevaAmiga(ave) {
		if (amiga != ave )
		game.say(self, "Hola" + ave.nombre())
		amiga = ave
	}
}

object pepona {
	var property image = "pepona.png"
	var property position = game.at(4, 2)
	method nombre() = "Pepona"
}

object pipa {
	var property position = game.at(5, 8)
	var property image = "pepitaCanchera.png"
	method nombre() = "Pipa"
}



object roque {
	var property image = "jugador.png"
	var property position = game.at(1,5)
	var property comida = null
	
	method move(nuevaPosicion){
		position = nuevaPosicion
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
	method tieneComida() = comida == alpiste || comida == manzana
	
}
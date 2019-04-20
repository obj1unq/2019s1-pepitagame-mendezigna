import ciudades.*
import wollok.game.*

object pepita {
	var property energia = 100
	var property ciudad = buenosAires 

	var property position = game.at(3,3)
	method image(){
		return if (self.estaGorda()) { "pepita-gorda-raw.png" }
		else { "pepita.png" } 
	}

	method come(comida) {
		energia = energia + comida.energia()
	}
	
	method volaHacia(unaCiudad) {
		if (ciudad == unaCiudad) {
			game.say(self, "Ya Estoy!")
		}
		else {
			self.move(unaCiudad.position())
			ciudad = unaCiudad
		}
	}

	method energiaParaVolar(distancia) = 15 + 5 * distancia

	method move(nuevaPosicion) {
		if (energia -= self.energiaParaVolar(position.distance(nuevaPosicion)) > 0){
			energia -= self.energiaParaVolar(position.distance(nuevaPosicion))
			self.position(nuevaPosicion)
		}
		else { game.say(self, "Dame de comer Primero!")}
	}
	
	method comer(comida){
		self.move(comida.position())
		self.come(comida)
		game.removeVisual(comida)
	}	
	
	method estaGorda() = energia > 100
}

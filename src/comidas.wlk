import wollok.game.*

class Manzana {
	var property position = self.randomPositionInGame()
	method image() = "manzana.png"
	method energia() = 80
	method randomPositionInGame() {
		return game.at(1.randomUpTo(10).truncate(0), 1.randomUpTo(10).truncate(0))
	}
	method chocasteCon(alguien) {
		alguien.come(self)
		game.removeVisual(self)
	}
	method estasSiendoDejadoPor(alguien) {
		game.addVisualIn(self, alguien.position())
	}
}

class Alpiste {
	var property position = self.randomPositionInGame()
	var property cant = 0
	
	method image() = "alpiste.png"
	
	method energia() = 0.5 * cant
	
	method randomPositionInGame() {
		return game.at(1.randomUpTo(10).truncate(0), 1.randomUpTo(10).truncate(0))
	}
	method chocasteCon(alguien) {
		alguien.come(self)
		game.removeVisual(self)
	}
	method estasSiendoDejadoPor(alguien) {
		cant = alguien.granosAlpiste()
		game.addVisualIn(self, alguien.position())
		alguien.granosAlpiste(0)
	}
}

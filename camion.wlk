import cosas.*

object camion {

	const cosas = #{}

	method vaciar() {
		cosas.clear()
	}	

	method cargar(unaCosa) {
		if (!cosas.contains(unaCosa)) {
			cosas.add(unaCosa)
		}
	}

	method descargar(unaCosa) {
		if (cosas.contains(unaCosa)) {
			cosas.remove(unaCosa)
		}
	}

	method cosasCargadas() {
		return cosas
	}

	method todoPesoEsPar() {
		return cosas.all { cosa => cosa.peso() % 2 == 0 }
	}

	method hayAlgoQuePesa(unPeso) {
		return cosas.any { cosa => cosa.peso() == unPeso }
	}

	method tara() {
		return 1000
	}

	method pesoDeLaCarga() {
		return cosas.sum { cosa => cosa.peso() }
	}

	method pesoTotal() {
		return self.tara() + self.pesoDeLaCarga()
	}

	method estaExcedido() {
		return self.pesoTotal() > 2500
	}

	method cosaConPeligrosidad(nivel) {
		return cosas.find { cosa => cosa.nivelPeligrosidad() == nivel }
	}

	method cosasQueSuperan(nivel) {
		return cosas.filter { cosa => cosa.nivelPeligrosidad() > nivel }
	}

	method cosasMasPeligrosasQue(otraCosa) {
		return self.cosasQueSuperan(otraCosa.nivelPeligrosidad())
	}

	method puedeCircular(nivelMaximo) {
		return !self.estaExcedido() &&
			cosas.all { cosa => cosa.nivelPeligrosidad() <= nivelMaximo }
	}

	method hayAlgoEntre(min, max) {
	return cosas.any { cosa => cosa.peso() >= min && cosa.peso() <= max }
	}

	method cosaMasPesada() {
		return cosas.max { cosa => cosa.peso() }
	}

	method pesos() {
		return cosas.map { cosa => cosa.peso() }
	}

	method totalBultos() {
		return cosas.sum { cosa => cosa.bultos() }
	}

	method accidentarse() {
		cosas.forEach { cosa => cosa.accidentarse() }
	}

	method transportar(destino, camino) {
		if (camino.puedeTransitar(self)) {
			cosas.forEach { cosa => destino.agregar(cosa) }
			self.vaciar()
		}
	}
}
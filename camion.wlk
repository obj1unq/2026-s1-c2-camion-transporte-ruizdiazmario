import cosas.*

object camion {

	const cosas = #{}

	method vaciar() {
		cosas.clear()
	}	

	method cargar(unaCosa) {
	if (!self.yaEstaCargada(unaCosa)) {
		cosas.add(unaCosa)
		}
	}

	method yaEstaCargada(unaCosa) {
		return cosas.contains(unaCosa)
	}

	method descargar(unaCosa) {
		if (!cosas.contains(unaCosa)) {
			self.error("No se puede descargar una ya que no está en el camión")
		}
		cosas.remove(unaCosa)
	}

	method cosas() {
		return cosas
	}

	method todoPesoEsPar() {
		return cosas.all { cosa => cosa.peso().even() }
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

	method pesoMaximo() {
		return 2500
	}

	method estaExcedido() {
		return self.pesoTotal() > self.pesoMaximo()
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
			self.tieneAlgunaCosaPermitida(nivelMaximo)
	}

	method tieneAlgunaCosaPermitida(nivelMaximo) {
		return cosas.any { cosa => cosa.nivelPeligrosidad() <= nivelMaximo }
	}

	method hayAlgoEntre(min, max) {
		return cosas.any { cosa => cosa.peso().between(min, max) }
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
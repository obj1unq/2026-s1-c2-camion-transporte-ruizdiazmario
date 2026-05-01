object knightRider {
	method peso() {
		return 500 
	}
	
	method nivelPeligrosidad() { 
		return 10 
	}

	method bultos() {
		return 1
	}

	method accidentarse() {
		// no hace nada
	}
}

object arenaAGranel {
	var pesoActual = 0
	
	method peso() { 
		return pesoActual 
	}
	method nivelPeligrosidad() { 
		return 1
	}

	method pesoActual(unPeso) {
		pesoActual = unPeso
	}

	method bultos() {
		return 1
	}

	method accidentarse() {
		pesoActual = pesoActual + 20
	}
}

object bumblebee {
	var estaTransformado = true
	
	method peso() { 
		return 800
	}
	
	method nivelPeligrosidad() {
		if (estaTransformado) {
			return 15
		} else {
			return 30
		}
	}

	method estaTransformado() {
		return estaTransformado
	}

	method estaTransformado(unEstado) {
		estaTransformado = unEstado
	}

	method bultos() {
		return 2
	}

	method accidentarse() {
		estaTransformado = !estaTransformado
	}
}

object paqueteDeLadrillos {
	var cantidadDeLadrillos = 0
	
	method peso() {
		return cantidadDeLadrillos * 2
	}
	
	method nivelPeligrosidad() { 
		return 2 
	}

	method cantidadDeLadrillos() {
		return cantidadDeLadrillos
	}

	method cantidadDeLadrillos(cantidad) {
		cantidadDeLadrillos = cantidad
	}

	method bultos() {
		if (cantidadDeLadrillos <= 100) {
			return 1
		} else if (cantidadDeLadrillos <= 300) {
			return 2
		} else {
			return 3
		}
	}

	method accidentarse() {
		if (cantidadDeLadrillos <= 12) {
			cantidadDeLadrillos = 0
		} else {
			cantidadDeLadrillos = cantidadDeLadrillos - 12
		}
	}
}

object bateriaAntiaerea {
	var tieneMisiles = false
	
	method peso() {
		if (tieneMisiles) {
			return 300
		} else {
			return 200
		}
	}
	
	method nivelPeligrosidad() {
		if (tieneMisiles) {
			return 100
		} else {
			return 0
		}
	}

	method tieneMisiles() {
		return tieneMisiles
	}
	
	method tieneMisiles(estado) {
		tieneMisiles = estado
	}

	method bultos() {
		if (tieneMisiles) {
			return 2
		} else {
			return 1
		}
	}

	method accidentarse() {
		tieneMisiles = false
	}
}

object residuosRadiactivos {
	var pesoActual = 0
	
	method peso() { 
		return pesoActual 
	}

	method nivelPeligrosidad() { 
		return 200 
	}

	method pesoActual(unPeso) {
		pesoActual = unPeso
	}

	method bultos() {
		return 1
	}

	method accidentarse() {
		pesoActual = pesoActual + 15
	}
}

object contenedorPortuario {
	const cosas = #{}

	method vaciar() {
		cosas.clear()
	}

	method agregar(unaCosa) {
		cosas.add(unaCosa)
	}

	method peso() {
		return 100 + cosas.sum { cosa => cosa.peso() }
	}

	method nivelPeligrosidad() {
		if (cosas.isEmpty()) {
			return 0
		} else {
			return cosas.max { cosa => cosa.nivelPeligrosidad() }.nivelPeligrosidad()
		}
	}

	method bultos() {
		return 1 + cosas.sum { cosa => cosa.bultos() }
	}

	method accidentarse() {
		cosas.forEach { cosa => cosa.accidentarse() }
	}
}

object embalajeDeSeguridad {
	var cosa = null

	method envolver(unaCosa) {
		cosa = unaCosa
	}

	method peso() {
		return cosa.peso()
	}

	method nivelPeligrosidad() {
		return cosa.nivelPeligrosidad() / 2
	}

	method bultos() {
		return 2
	}

	method accidentarse() {
		// no hace nada
	}
}
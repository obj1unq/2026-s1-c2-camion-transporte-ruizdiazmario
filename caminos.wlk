object ruta9 {

	method puedeTransitar(camion) {
		return camion.puedeCircular(20)
	}
}

object caminosVecinales {
	var maxPeso = 0

	method configurarMaximo(unPeso) {
		maxPeso = unPeso
	}

	method puedeTransitar(camion) {
		return camion.pesoTotal() <= maxPeso
	}
}
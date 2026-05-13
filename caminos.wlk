object ruta9 {

	method puedeTransitar(camion) {
		const nivelMaximoPermitido = 20
		return camion.puedeCircular(nivelMaximoPermitido)
	}
}

object caminosVecinales {
	var maxPeso = 0

	method maxPeso(unPeso) {
		maxPeso = unPeso
	}

	method puedeTransitar(camion) {
		return camion.pesoTotal() <= maxPeso
	}
}
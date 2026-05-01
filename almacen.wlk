object almacen {
	const cosas = #{}

	method agregar(unaCosa) {
		cosas.add(unaCosa)
	}

	method cosas() {
		return cosas
	}
}
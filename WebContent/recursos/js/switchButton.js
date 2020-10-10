const switchButton = document.getElementById('switchButton')

if(switchButton){
	switchButton.addEventListener('click', e=>{
		const ciudadOrigen = document.querySelector('.selected')
		const ciudadDestino = document.querySelector('.selected2')
		
		let ciudadOrigenText=ciudadOrigen.textContent
		let ciudadDestinoText=ciudadDestino.textContent
		
		if(ciudadOrigenText!=="Seleccionar ciudad de origen" && ciudadDestinoText!=="Seleccionar ciudad de destino"){
			ciudadOrigen.textContent=ciudadDestinoText
			ciudadDestino.textContent=ciudadOrigenText
			
			
			let a = ciudadDestinoText.toLowerCase()
			console.log(a)
			let newCiudadOrigenSelected = document.getElementById(a)
						console.log(newCiudadOrigenSelected)

			if(newCiudadOrigenSelected){
				newCiudadOrigenSelected.checked=true;
				console.log(newCiudadOrigenSelected)
			}
			
			let b = ciudadOrigenText.toLowerCase()+"2"
			console.log(b)
			let newCiudadDestinoSelected = document.getElementById(b)
						console.log(newCiudadDestinoSelected)

			if(newCiudadDestinoSelected){
				newCiudadDestinoSelected.checked=true;
				console.log(newCiudadDestinoSelected)
			}
		}
		
		
		
		
	})
}
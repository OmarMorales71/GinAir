const equipajeExtraButton = document.querySelectorAll('.equipaje-extra');
const cancelarVueloButton = document.querySelectorAll('.cancelar-vuelo');
const precioMaletaExtra = 25
let event
if(equipajeExtraButton){
	let numVuelos=0
	for(let currentButton of equipajeExtraButton){
		
		currentButton.addEventListener('click', e=>{
			console.log(e.target)
			event=e.target
			let theParent = e.target.parentNode
			
			numVuelos = theParent.id.charAt(theParent.id.length-1);
			
			console.log(numVuelos)
			const select = document.createElement('select')
			const labelPrecioExtra = document.createElement('p')
			const precioExtra = document.createElement('span')
			labelPrecioExtra.textContent=`+\u20ac`
			precioExtra.textContent="0"
				precioExtra.id=`precioExtra${numVuelos}`
					labelPrecioExtra.style.fontSize="0.8rem"
					labelPrecioExtra.style.display="inline"
					
			labelPrecioExtra.appendChild(precioExtra)
			// div.classList.add('circle')
			const parent = e.target.parentNode
			select.required=true
			select.name=parent.id
			select.id=`select-${parent.id}`
			const equipajeActual=document.getElementById(`equipajeActual${numVuelos}`)
			if(equipajeActual){
				console.log(`${numVuelos} ` + equipajeActual.textContent)
				equipajeExtraRestante = 5 - (equipajeActual.textContent)
				
				for(let i=0; i<=equipajeExtraRestante; i++){
					const option = document.createElement('option')
					if(i===0)option.selected=true
					
					option.value=i
					option.textContent=i
					select.appendChild(option)
				}
			}
			let spanPrecio =`precioExtra${numVuelos}`
			select.addEventListener("click", e=>{
				if(e.target.children.length===0){
					const labelPrecioExtra_aux = document.getElementById(spanPrecio)
					
					if(labelPrecioExtra_aux){
						let precioNuevoExtra = precioMaletaExtra * parseInt(e.target.value)
						
						labelPrecioExtra_aux.textContent=precioNuevoExtra
					}
				}
			})
			parent.appendChild(select);
			parent.appendChild(labelPrecioExtra)
			const inputDefault = document.getElementById(`defaultEquipajeExtra${numVuelos}`);
			console.log(inputDefault)
			if(inputDefault){
				inputDefault.remove()
			}
			currentButton.remove()
		})
		
	}
}


if(cancelarVueloButton){
	for(let currentCancelButton of cancelarVueloButton){
		
		
		
		currentCancelButton.addEventListener('click', e=>{
			
			let opcion = confirm("¿Estas seguro que quieres cancelar tu vuelo? Se reembolsará el 80% del total pagado");
		    if (opcion) {
		    	const padreElement = e.target.parentNode
				
				const input = padreElement.children[0]
				console.log(input)
				const removeForm = document.querySelector("form")
				
				const formulario = document.createElement('form')
				formulario.appendChild(input);
				formulario.action="busquedaModificadaMostrarReserva"
					formulario.method="POST"
				console.log(formulario);
				removeForm.remove();
				document.querySelector('body').appendChild(formulario)
				formulario.submit();
			}
			
			
			
			
		
		})
	}
	
}

const submit = document.getElementById('submit-container');

let confirmacionExtraEquipaje=()=>{
	return confirm('¿Estas seguro de incrementar tu equipaje? (25 euros cada equipaje extra)')
}




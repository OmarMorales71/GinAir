const VuelosIdaContainer = document.getElementById("ContenedorVuelosIda")
const VuelosRegresoContainer = document.getElementById("ContenedorVuelosRegreso")




if(VuelosIdaContainer){
	VuelosIdaContainer.children[0].classList.add("radioSeleccionado");
	a = VuelosIdaContainer.children[0].children[0].children[0].checked=true
	VuelosIdaContainer.addEventListener('click', e=>{
		
		let vueloSeleccionado = e.target.parentNode
		
		let radioSeleccionado = vueloSeleccionado.children[0].children[0];
		
		radioSeleccionado.checked="true"
		
	let el = document.querySelector('#ContenedorVuelosIda .radioSeleccionado');
		if(el)el.classList.remove('radioSeleccionado');
		
		console.log(vueloSeleccionado)
		 vueloSeleccionado.classList.add('radioSeleccionado');
		console.log(vueloSeleccionado)
	})
	
}


if(VuelosRegresoContainer){
	VuelosRegresoContainer.children[0].classList.add("radioSeleccionado");
	VuelosRegresoContainer.children[0].children[0].children[0].checked=true
	VuelosRegresoContainer.addEventListener('click', e=>{
		
		let vueloSeleccionado = e.target.parentNode
		
		let radioSeleccionado = vueloSeleccionado.children[0].children[0];
		
		radioSeleccionado.checked="true"
		
	let el = document.querySelector('#ContenedorVuelosRegreso .radioSeleccionado');
		if(el)el.classList.remove('radioSeleccionado');
		
		console.log(vueloSeleccionado)
		 vueloSeleccionado.classList.add('radioSeleccionado');
		console.log(vueloSeleccionado)
	})
	
}



const backButton = document.getElementById("regresar_vuelos");

if(backButton){
	backButton.addEventListener("click", e=>{
		history.back();
	})
}

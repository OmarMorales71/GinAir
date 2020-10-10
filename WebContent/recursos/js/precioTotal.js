let labelPrecioVuelo1 = document.getElementById("precioVuelo1")
let labelPrecioVuelo2 = document.getElementById("precioVuelo2")

let inputPrecioVuelo1 = document.getElementById("inputPrecioVuelo1")
let inputPrecioVuelo2 = document.getElementById("inputPrecioVuelo2")

let precioVuelo1
let precioVuelo2

let precioTotalVuelo1
let precioTotalVuelo2
const precioMaletaExtra=25
let equipaje1 = document.getElementById("equipaje_vuelo1")
let equipaje2 = document.getElementById("equipaje_vuelo2")
let precioTotal = document.getElementById("precioTotal");


if (labelPrecioVuelo1 && labelPrecioVuelo2) {
	precioVuelo1 = parseFloat(document.getElementById("precioVuelo1").textContent);
	precioVuelo2 = parseFloat(document.getElementById("precioVuelo2").textContent);
	
	precioTotalVuelo1=precioVuelo1
	precioTotalVuelo2=precioVuelo2
	
	inputPrecioVuelo1.value=precioTotalVuelo1
	inputPrecioVuelo2.value=precioTotalVuelo2
	if (precioTotal) {
		precioTotal.value = precioTotalVuelo1+precioTotalVuelo2
	}
} else if (labelPrecioVuelo1) {
	precioVuelo1 = parseFloat(document.getElementById("precioVuelo1").textContent);
	precioTotalVuelo1=precioVuelo1
	inputPrecioVuelo1.value=precioTotalVuelo1
	
	const form=document.getElementById('formularioCliente')
	
	let equipaje2_hidden = document.createElement('input')
	equipaje2_hidden.name="equipaje_vuelo2"
	equipaje2_hidden.setAttribute('type','text')
	equipaje2_hidden.value="0"
	form.appendChild(equipaje2_hidden)
	
	let inputPrecioVuelo2_hidden = document.createElement('input')
	inputPrecioVuelo2_hidden.name="precioVuelo2"
		inputPrecioVuelo2_hidden.setAttribute('type','text')
	inputPrecioVuelo2_hidden.value="0"
	form.appendChild(inputPrecioVuelo2_hidden)
	
	
	
	
	if (precioTotal) {
		precioTotal.value = precioTotalVuelo1
	}
}




let cantEquipaje1=1
let cantEquipaje2=1

let updatePrecioTotal
if(equipaje1 && equipaje2 && precioVuelo1 && precioVuelo2){
	updatePrecioTotal=()=>{
		labelPrecioVuelo1.textContent=parseFloat(precioVuelo1 +((precioMaletaExtra)*(cantEquipaje1-1)))
		inputPrecioVuelo1.value=parseFloat(precioVuelo1 +((precioMaletaExtra)*(cantEquipaje1-1)))
		labelPrecioVuelo2.textContent=parseFloat(precioVuelo2 +((precioMaletaExtra)*(cantEquipaje2-1)))
		inputPrecioVuelo2.value=parseFloat(precioVuelo2 +((precioMaletaExtra)*(cantEquipaje2-1)))
		
	precioTotal.value=	parseFloat(labelPrecioVuelo1.textContent)+parseFloat(labelPrecioVuelo2.textContent)
	}
}else if(equipaje1 && precioVuelo1){
	updatePrecioTotal=()=>{
		labelPrecioVuelo1.textContent=parseFloat(precioVuelo1 +((precioMaletaExtra)*(cantEquipaje1-1)))
		inputPrecioVuelo1.value=parseFloat(precioVuelo1 +((precioMaletaExtra)*(cantEquipaje1-1)))
		precioTotal.value=parseFloat(labelPrecioVuelo1.textContent)
	}
}

if(equipaje1){
	equipaje1.children[0].selected=true
	equipaje1.addEventListener("click", e=>{
		if(e.target.children.length===0){
			cantEquipaje1=parseInt(e.target.value);
			updatePrecioTotal()
		}
	})
}

if(equipaje2){
	equipaje2.children[0].selected=true
	equipaje2.addEventListener("click", e=>{
		if(e.target.children.length===0){
			cantEquipaje2=parseInt(e.target.value);
			updatePrecioTotal()
		}
	})
}



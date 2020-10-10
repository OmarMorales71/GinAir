const sourceContainer = document.getElementById("sourcecity-container")
const destContainer = document.getElementById("destcity-container")



if(sourceContainer){
	sourceContainer.addEventListener('click', e=>{
		
		let selectedRadio = e.target.children[0]
		
		selectedRadio.checked="true"
	})	
}

if(destContainer){
	destContainer.addEventListener('click', e=>{
		
		let selectedRadio = e.target.children[0]
		
		selectedRadio.checked="true"
	})
}

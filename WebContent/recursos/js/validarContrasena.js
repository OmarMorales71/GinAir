let validarPassword=()=>{
		let password1=document.getElementById('password1')
		if(!password1){
			password1=document.getElementById('password')
		}else{
			
			if(password1.value.length<5){
				const msjError=document.getElementById('longitudContrasena')
				
				msjError.textContent="La contraseña debe tener 5 caracteres minimo."
				return false;
			}else{
				const msjError=document.getElementById('longitudContrasena')
				
				msjError.textContent=""
				
			}
		}
		const password2=document.getElementById('passwordConfirm')
		console.log(password1)
		console.log(password2)
		if(password1 && password2){
			if(password1.value===password2.value){
				return true
			}else{
				const msjError=document.getElementById('confirmarContrasena')
				
				msjError.textContent="Las contraseñas no coinciden."
				return false;
			}
		}
		
		return false;
	
	}
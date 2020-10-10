const passwordContainer = document.getElementById("passwordContainer")
const rootPath = document.getElementById("raiz")

const restoreButton = document.getElementById("restorePassword")

if(restoreButton && rootPath){

    restoreButton.addEventListener('click', e=>{
        const xhr = new XMLHttpRequest()
        path=rootPath.value+"/recursos/data/formularioRestaurarContrasena.html"
        
        
        xhr.open("GET", path, true)

        xhr.addEventListener('load', e1=>{
           
        	 console.log(e1.target)
            passwordContainer.innerHTML=e1.target.responseText

            restoreButton.remove()
        })

        xhr.send()
    })

}
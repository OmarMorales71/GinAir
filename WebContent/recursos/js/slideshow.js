
	const contextPath=document.getElementById("rutaContexto").textContent
	const ciudadActual=document.getElementById("ciudadActual").textContent
    const imagenes =[`${contextPath}/recursos/images/${ciudadActual}/${ciudadActual}1.jpg`,`${contextPath}/recursos/images/${ciudadActual}/${ciudadActual}2.jpg`,`${contextPath}/recursos/images/${ciudadActual}/${ciudadActual}3.jpg`,`${contextPath}/recursos/images/${ciudadActual}/${ciudadActual}4.jpg`,`${contextPath}/recursos/images/${ciudadActual}/${ciudadActual}5.jpg`,`${contextPath}/recursos/images/${ciudadActual}/${ciudadActual}6.jpg`,`${contextPath}/recursos/images/${ciudadActual}/${ciudadActual}7.jpg`]

    let i=1

    const img1 = document.getElementById('img1')
    const img2 = document.getElementById('img2')

    const progressBar = document.getElementById('progress-bar')
    const divIndicadores = document.getElementById('indicadores')

    let porcentaje_base = 100/imagenes.length
    
    let porcentaje_actual = porcentaje_base

    for (let index = 0; index < imagenes.length; index++) {
        const div = document.createElement('div')
        div.classList.add('circle')
        div.id=index
        divIndicadores.appendChild(div);
    }

    progressBar.style.width = `${porcentaje_base}%`

    img1.src = imagenes[0]
    const circulos = document.querySelectorAll('.indicadores .circle')

    circulos[0].classList.add('resaltado')
    
    const slideshow=()=>{
        img2.src=imagenes[i]

        let circulo_actual = Array.from(circulos).find(el=>el.id==i)
        console.log(circulo_actual.id)
        Array.from(circulos).forEach(cir=>cir.classList.remove('resaltado'))

        circulo_actual.classList.add('resaltado')

        img2.classList.add('active')
        i++

        porcentaje_actual+=porcentaje_base

        progressBar.style.width=`${porcentaje_actual}%`

        if(i===imagenes.length){
            i=0
            porcentaje_actual=porcentaje_base-porcentaje_base
        }

        setTimeout(()=>{
            img1.src = img2.src
            img2.classList.remove('active')
        },1000)


    }

    setInterval(slideshow,4000)

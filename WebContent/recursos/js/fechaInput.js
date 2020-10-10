const today = new Date();

const todayString = today.getFullYear() + "-" + (today.getMonth() + 1) + "-"
		+ today.getDate()

let maxFecha = document.getElementById("fechaNacimiento")

if (maxFecha) {
	maxFecha.setAttribute('required', true)
	maxFecha.setAttribute('max', todayString)

}

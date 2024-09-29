function login(user,pass){
    //Funcion para el ingreso de usuarios
    window.alert('Ingreso correctamente '+ user);
    
}
function registro(user,telefono,correo,pass){
    //Funcion para el registo
    window.alert('Se registro correctamente '+ user);
}
function enviarDatos(contacto){
    //funcion para el envio del formulario de contacto
    window.alert('Se enviaron los Datos correctamente'+contacto);
}

//las contantes para guardar la informacion de los formularios de contacto, login y registro
const formContacto = document.querySelector("#contacto");
const formLogin = document.querySelector("#login");
const formRegistro = document.querySelector("#registro");

//Si exite el formulario contacto captura los datos para almacenarlos
if(formContacto!==null) {
    formContacto.addEventListener("submit", function (event) {
        let nombre = document.getElementById('nombre').value;
        let correo= document.getElementById('email').value;
        let telefono= document.getElementById('telefono').value;
        let asunto= document.getElementById('asunto').value;
        let mensaje= document.getElementById('mensaje').value;
    
        let contacto=[nombre,correo,telefono,asunto,mensaje];
        console.log(contacto);
        if (!(nombre==null)) {
           
            enviarDatos(contacto);
            
        }else{
                window.alert('Error')
        }
    });
} 
//Si exite el formulario de login captura los datos para almacenarlos
if(formLogin!==null) {
    formLogin.addEventListener("submit", function (event) {

        let user = document.getElementById('user').value;
        let pass= document.getElementById('pass').value;
       
        if (!(user==null)) {
            login(user,pass);
        }else{
            window.alert('Error')
        }
    });
}

//Si exite el formulario de registro captura los datos para almacenarlos
if(formRegistro!==null) {
    formRegistro.addEventListener("submit", function (event) {

        let user = document.getElementById('user').value;
        let telefono= document.getElementById('telefono').value;
        let correo = document.getElementById('correo').value;
        let pass= document.getElementById('pass').value;
        if (!(user==null)) {
            registro(user,telefono,correo,pass);
        }else{
            window.alert('Error')
        }
    });
}

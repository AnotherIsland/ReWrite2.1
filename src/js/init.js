//Implementaciones de Materialize
$(document).ready(function(){
  $('.sidenav').sidenav();
  $('.parallax').parallax()
  $('.collapsible').collapsible();
  $('select').formSelect();
  $('.modal').modal();
});


//Funcionalidad de los módulos
function mostrarTipoRef(){
  let btn = document.getElementById('tipoRef');
  if(btn.hidden == true){
    document.getElementById('tipoRef').hidden = false;
  }else {
    document.getElementById('tipoRef').hidden = true;
  }
}
function mostrarEstrofa() {
  let btn = document.getElementById('tipoEstro');
  if(btn.hidden == true){
    document.getElementById('tipoEstro').hidden = false;
  }else {
    document.getElementById('tipoEstro').hidden = true;
  }
}
function mostrarCompartir() {
  let btn = document.getElementById('share');
  if(btn.hidden == true){
    document.getElementById('share').hidden = false;
  }else {
    document.getElementById('share').hidden = true;
  }
}
function newRef(ref){
  let refer = document.createElement('div');//Crea el div donde irán los inputs para añadir una referencia
  //aun no sé como generar un id distinto para cada nueva referencia :C
  let h7 = document.createElement('h7');
  let label = document.createElement('label');
  let inputs= [];
  var inputN = null;

  for(let i = 1; i<=6; i++){
    inputN = document.createElement('input');
    inputs[i] = inputN;
    inputs[i].type = 'text';
    inputs[i].setAttribute('class','input-field oculto refi');
  }
  let input7 = document.createElement('input');//input de submit
  //inputs[3].type = 'number';

  //Para el input de submit
  input7.type = 'submit';
  input7.setAttribute('name','agregar');
  input7.setAttribute('class','btn agregar waves-effect waves-light');
  input7.setAttribute('onclick','agregaRef(this)');
  input7.value = 'Agregar';

  //Para el span y label
  h7.innerHTML = 'Nueva Referencia';
  label.innerHTML = 'Fecha de consulta: ';
  label.setAttribute('for','fechaConsulta');

  inputs[1].setAttribute('placeholder','Autor');
  inputs[2].setAttribute('placeholder','Título');
  inputs[3].setAttribute('placeholder','Año de publicación');

  inputs[1].setAttribute('name','autor');
  inputs[2].setAttribute('name','titulo');
  inputs[3].setAttribute('name','anio');
  inputs[1].id = 'autor';
  inputs[2].id = 'titulo';
  inputs[3].id = 'anio';

  //Para validar inputs
  inputs[1].setAttribute('onkeypress','validap();');
  inputs[2].setAttribute('onkeypress','validap();');
  inputs[3].setAttribute('onkeypress','validaNum();validaAnio(this);');
  inputs[3].setAttribute('maxlength','4');
  inputs[4].setAttribute('onkeypress','validap();');

  if(ref.value == '1'){//Si es referencia bibliografica
    inputs[4].setAttribute('placeholder','Editorial');
    inputs[5].setAttribute('placeholder','Lugar');
    inputs[6].setAttribute('placeholder', 'Páginas');
    inputs[4].setAttribute('name','editorial');
    inputs[5].setAttribute('name','lugar');
    inputs[6].setAttribute('name', 'paginas');
    inputs[4].id = 'editorial';
    inputs[5].id = 'lugar';
    inputs[6].id =  'paginas';
    inputs[5].setAttribute('onkeypress','validap();');
    inputs[6].setAttribute('onkeypress','validaNum();');
  }else if(ref.value == '2'){//Si es referencia web
    inputs[4].setAttribute('placeholder','Sitio Web');
    inputs[5].setAttribute('placeholder','Fecha de consulta');
    inputs[6].setAttribute('placeholder','URL');
    inputs[4].setAttribute('name','sitioWeb');
    inputs[5].setAttribute('name','fechaConsulta');
    inputs[6].setAttribute('name','URL');
    inputs[4].id = 'sitioWeb';
    inputs[5].id = 'fechaConsulta';
    inputs[6].id = 'URL';
    inputs[5].type = 'text';
    inputs[6].type = 'URL';
  }

  //Añadiendo al div de referencias
  refer.appendChild(h7);
  for(let i = 1; i<=6; i++){
    refer.appendChild(inputs[i]);
  }
  refer.appendChild(input7);
  document.getElementById('referencias').appendChild(refer);


  //document.getElementById('elID del input para el autor recién generado').focus();

  //let idCuenta = document.getElementsByClassName('nRef');
  //refer.id =  idCuenta + 1;
}
function agregaRef(submit) {
  let refe = document.createElement('p');
  let autor = document.getElementsByName('autor');
  let inputs = document.getElementsByClassName('input-field oculto refi');

  //Primero invalida campos vacíos
  for (let i = 0; i < inputs.length; i++){
    if( inputs[i].value === ''){
      //confirm('Faltar llenar algún campo');
      var instance = M.Modal.getInstance(elem);
      instance.open();
      inputs[i].focus();
      break;
    }
  }



  refe.innerHTML = '';
  document.getElementById('referencias').appendChild(refe);
}
function agregaPalabra(pal){
  let palabra = null;
  let icon = null;
  let span = null;
  if(pal.value !== ''){
    palabra = document.createElement('li');
    icon = document.createElement('i');
    span = document.createElement('span');

    palabra.setAttribute('class','white-text');
    icon.setAttribute('class', 'tiny material-icons');
    span.setAttribute('class','white-text');

    icon.innerHTML = 'check';
    span.innerHTML = '&nbsp;'+ pal.value;

    palabra.appendChild(icon);
    palabra.appendChild(span);
    document.getElementById('listaClaves').appendChild(palabra);
    pal.value = '';
  }else{
    return false;
  }
}
//Validaciones
function validaAnio(num){
  if(num.length > 4){
    event.returnValue = false;
  }
}
function validaNum(){
  var x = event.keyCode;
  var tel = '0123456789';
  var numero = String.fromCharCode(x);

  if(tel.indexOf(numero) === -1){
    event.returnValue = false;
  }
}
function validap(){
  var x = event.keyCode;
  var letras = 'qwertyuiopasdfghjklñmnbvcxz QWERTYUIOPÑLKJHGFDSAZXCVBNMáéíóú';
  var letra = String.fromCharCode(x);

  if(letras.indexOf(letra) === -1){
    event.returnValue = false;
  }
}
function vNumyLetras(){
  var x = event.keyCode;
  var letras = 'qwertyuiopasdfghjklñmnbvcxz QWERTYUIOPÑLKJHGFDSAZXCVBNMáéíóú1234567890!?#$%&';
  var letra = String.fromCharCode(x);

  if(letras.indexOf(letra) === -1){
    event.returnValue = false;
  }
}
function valCorreo(){
  var x = event.keyCode;
  var letras = 'qwertyuiopasdfghjklnmnbvcxzQWERTYUIOPNLKJHGFDSAZXCVBNM-_1234567890@.';
  var letra = String.fromCharCode(x);

  if(letras.indexOf(letra) === -1){
    event.returnValue = false;
  }
}
function validaRegistro(formulario){
  if(formulario.email.value.length === 0){
    confirm('Falta escribir correo');
    formulario.email.focus();
    return(false);
  }
  else {
    if (formulario.password.value.length === 0) {
      confirm('Falta escribir una contraseña');
      formulario.password.focus();
      return (false);
    }
    else {
      if (formulario.password1.value.length === 0) {
        confirm('Falta confirmar la contraseña');
        formulario.password1.focus();
        return (false);
      }
    }
  }
  if(formulario.password.value !== formulario.password1.value){
    confirm('Las contraseñas no coinciden');
    return (false);
  }
  //Valida que no inserten caracteres especiales
  let nom = formulario.email.value;
  let cadena = 'qwertyuiopasdfghjklmnbvcxzQWERTYUIOPLKJHGFDSAZXCVBNM!#$%&?¿-_@1234567890';
  let nomValid = true;

  for(k = 0; k < 3; k++){
    if(k = 1){
      nom = formulario.password.value;
    }else{
      nom = formulario.password1.value;
    }
    for(i = 0; i < nom.length; i++){
      for(j = 0; j < cadena.length; j++){
        if(nom.charAt(i) === cadena.charAt(j) ){
          break;
        }
      }
      if(j === cadena.length){
        nomValid = false;
        confirm('Caracteres inválidos');
        return(false);
      }
    }
  }

}
function validaInicio(formulario){
  if(formulario.usuario.value.length === 0){
    confirm('Falta escribir usuario o correo');
    formulario.usuario.focus();
    return(false);
  }
  else {
    if (formulario.password.value.length === 0) {
      confirm('Falta escribir una contraseña');
      formulario.password.focus();
      return (false);
    }
  }
  //Valida que no inserten caracteres especiales
  let nom = formulario.usuario.value;
  let cadena = 'qwertyuiopasdfghjklmnbvcxzQWERTYUIOPLKJHGFDSAZXCVBNM!#$%&?¿-_@1234567890';
  let nomValid = true;

  for(k = 0; k < 2; k++){
    if(k = 1){
      nom = formulario.password.value;
    }
    for(i = 0; i < nom.length; i++){
      for(j = 0; j < cadena.length; j++){
        if(nom.charAt(i) === cadena.charAt(j) ){
          break;
        }
      }
      if(j === cadena.length){
        nomValid = false;
        confirm('Caracteres inválidos');
        return(false);
      }
    }
  }
}





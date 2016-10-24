
/* Variables globales para la identificacion de telelfonos y correos */
var contTels = 2;
var contMail = 2;

function verificarCP() {
    cp = document.getElementById("cp").value;
    var regExp = /([a-z]|[A-Z])/g;
    var result = cp.match(regExp);

    if (result !== null) {
        alert("Codigo postal no valido");//mostrarMensaje("#hideCP");
        document.getElementById("cp").focus();
    } else {
        result = String(result);

        if (result.length > 6) {
            alert("Codigo postal no debe ser mayor a 5 digitos");
            document.getElementById("cp").focus();
        }
    }
}

function moreTel() {
    tel = document.getElementById("tel").value;
    var regExp = /([a-z]|[A-Z])/g;
    var result = tel.match(regExp);

    if (result !== null) {
        alert("Inserte un numero");
        document.getElementById("tel").focus();
    } else {
        result = String(result);

        if (result.length <= 15) {
            var desicionUser = confirm("Desea aniadir un numero telefonico mas?");

            if (desicionUser) {
                var newTel = document.createElement("input");
                document.getElementById("tels").appendChild(newTel).id = "tels" + contTels;
                document.getElementById("tels" + contTels).setAttribute("type", "text");
                document.getElementById("tels" + contTels).setAttribute("placeholder", "01 800 i wanna be sedated");
                document.getElementById("tels" + contTels).focus();
                document.getElementById("tels" + contTels).setAttribute("onfocusout", "moreTel()");
                document.getElementById("tels" + contTels++).focus();
            }
        }
    }
}

function moreMail() {
    var mail = document.getElementById("email").value;
    var regExp = /^[a-z]([\w\.]*)@[a-z]([\w\.]*)\.[a-z]{2,3}$/;
    //var result = mail.match( regExp ); //regresa todas las coincidencias
    var mailValido = regExp.test(mail);//si coincide regresa true en caso contrario false

    if (mailValido) {
        var desicionUser = confirm("Desea aniadir otro correo electronico?");

        if (desicionUser) {
            var newTel = document.createElement("input");
            document.getElementById("mails").appendChild(newTel).id = "mails" + contMail;
            document.getElementById("mails" + contMail).setAttribute("type", "text");
            document.getElementById("mails" + contMail).setAttribute("placeholder", "nile@song.com");
            document.getElementById("mails" + contMail).focus();
            document.getElementById("mails" + contMail++).setAttribute("onfocusout", "moreMail()");
        }
    } else {
        alert("Direccion de correo electronica no valida");
        document.getElementById("email").focus();
    }
}

/* Funcion jquery fundamental añadir jquery para poder usar*/
function mostrarMensaje(IDmensaje) {
    $(function () {
        $(IDmensaje).dialog({
            modal: true,
            buttons: {
                Ok: function () {
                    $(this).dialog("close");
                }
            }
        });
    });
}

function eliminarFila(id) {
    if( confirm("Seguro de querer eliminar la fila?") ) {
        id.style.display = "none";
        var x = id.firstChild.firstChild.nodeValue;//=id a eliminar;
        
        $.ajax( {
            type: "post",
            url: "RegSuc",
            data: { eliminar: x },
            success: function( data ) {
                alert( data );
            }
        } ); 
    }
}

/* AJAX para conectar con el servidor */
function mostrarDatos( idTab ) {
    var mge = "prueba";
    var tabDelete = idTab.getAttribute("href");
    
    $.ajax({
        type: "post", //metodo a utilizar
        url: "RegSuc", //nombre del servlet en el servidor
        data: {consultar: mge}, //mensaje: correo variable que se recibe en servlet mge contenido que se envia
        success: function (data) {
            if (data !== "") {
                var sucursales = data.split("**");
                var len = sucursales.length;
                var sucData, len2;
                var cabecera = "<tr> <th>ID</th><th>Nombre Sucursal</th><th>Estado</th><th>Telefono</th><th>Mail</th></tr>";
                document.getElementById("bajas").innerHTML = cabecera;
                document.getElementById("update").innerHTML = cabecera;
                
                for( var i = 0; i < len; i++ ) {
                    sucData = sucursales[i].split("__");
                    len2 = sucData.length;
                    var fila = document.createElement("tr");
                    fila.setAttribute("id", i );
                    if( tabDelete === "#tabs-3" ) {
                        fila.setAttribute("onclick", "eliminarFila(this)" );
                        document.getElementById("bajas").appendChild(fila);
                    } else {
                        document.getElementById("update").appendChild(fila);
                    }
                    
                    for( var j = 0; j < len2; j++ ) {
                       var col = document.createElement("td");
                       var txt = document.createTextNode( sucData[j] );
                       col.appendChild( txt );
                       document.getElementById(i).appendChild( col );
                    }
                }
            } else {
                alert("No hay datos que mostrar");
                
            }
        }
    });
}














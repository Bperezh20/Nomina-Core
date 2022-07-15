window.onload = function () {
  HORA();
  getAreas();
};

/**
 * Muestra la hora del
 * servidor en tiempo real
 * en el formato de 12 horas
 */
const HORA = () => {
  // Constante que almacena el id del elemento donde
  // se va a mostrar el reloj
  const ID_ELEMENT = document.getElementById("reloj");
  const ID_FECHA = document.getElementById("fecha");

  // Función que añade un cero a la izquierda
  // a la hora, minutos y segundos cuando el
  // valor de estos es inferior a 10
  const CERO = (n) => (n = n < 10 ? "0" + n : n);
  let hora, minutos, segundos, meridiano;

  // Funcion que retorna el Reloj
  const RELOJ = () => {
    const DATE = new Date();
    hora = DATE.getHours();
    minutos = DATE.getMinutes();
    segundos = DATE.getSeconds();
    dia = DATE.getDate();
    mes = DATE.getUTCMonth();
    anio = DATE.getFullYear();

    // Determinar el meridiano
    meridiano = hora < 12 ? "am" : "pm";

    // Dar formato de 12 horas ya que por defecto el formato es de 24 horas
    hora = hora == 0 ? 12 : hora || hora > 12 ? (hora -= 12) : hora;

    // Dar formato de dos digitos a fecha
    dia = dia < 10 ? `0${dia}` : dia;
    mes = mes < 10 ? `0${mes}` : mes;

    newFecha = `${dia}-${mes}-${anio}`;
    ID_FECHA.textContent = newFecha;

    return (ID_ELEMENT.textContent = `${CERO(hora)}:${CERO(minutos)}:${CERO(
      segundos
    )} ${meridiano}`);
  };

  // Llama a la función RELOJ cada segundo
  // para que se vaya actualizando la hora
  return setInterval(RELOJ, 1000);
};

/**
 * Recupera los tipos de marcajes y los carga en un
 * option dentro del html
 *
 * @return string
 */
function getAreas() {
  // Define class and method required
  let controlerRequest = {
    class: "Mark",
    classMethod: "getMarkType",
  };

  // Creante and send http request
  $.ajax({
    method: "POST",
    url: "../controler/app/MainConfigurationService.php",
    async: true,
    dataType: "json",
    data: {
      request: controlerRequest,
    },
    success: function (result) {
      // Se genera codigo html dinamico
      select = ``;
      select += `<option value="0" selected>Seleccione marca...</option>`;
      result.forEach(function elementBody(markTypes) {
        select += `<option value="${markTypes.id}">`;
        select += markTypes.name;
        select += `</option>`;
      });

      // Se recupera elemento por su id y se agrega codigo dinamico armado previamente
      document.getElementById("selectMarkType").innerHTML = select;
    },
    error: function (x, y) {
      console.log(x);
      console.log(y);
    },
  });
}

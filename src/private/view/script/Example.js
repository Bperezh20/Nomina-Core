var baseClass = null;

function getBaseClass(name) {
    if (globalThis.baseClass === null) {
        globalThis.baseClass = name;
    }

    return baseClass;
}

function testJS() {
    // Define class and method required
    let controlerRequest = {
        class: 'Example',
        classMethod: 'test'
    };

    // Creante and send http request
    $.ajax({
        method: "POST",
        url: "../controler/app/MainConfigurationService.php",
        async: true,
        dataType: 'json',
        data: {
            request: controlerRequest,
            params: {
                name: 'jose',
                lastName: 'Mazariegos'
            }
        },
        success: (function (result) {
            console.log(result);
        }),
        error: (function (x, y){
            console.log(x);
            console.log(y);
        })
    });
}

function testWithConstructJS() {
    // Define class and method required
    let controlerRequest = {
        class: 'ExampleWithConstruct',
        classMethod: 'printSimpleMessage',
        constructParams: {
            message: "Estoy en el constructor"
        }
    };

    // Creante and send http request
    $.ajax({
        method: "POST",
        url: "../controler/app/MainConfigurationService.php",
        async: true,
        dataType: 'json',
        data: {
            request: controlerRequest,
        },
        success: (function (result) {
            console.log(result);
        }),
        error: (function (x, y){
            console.log(x);
            console.log(y);
        })
    });
}

function buildTable(){
    let controlerRequest = {
        class: 'Example',
        classMethod: 'getRandomInfo'
    };

    $.ajax({
        method: "POST",
        url: "../controler/app/MainConfigurationService.php",
        async: true,
        dataType: 'json',
        data: {
            request: controlerRequest,
            params: {
                name: 'jose',
                lastName: 'Mazariegos'
            }
        },
        success: (function (result) {
            let html = ``;

            html += `<table class="table table-hover">`;
            html += `<thead> <tr>`;
            result['header'].forEach(function elementHeader (header) {
                html += `<th>`;
                html += header;
                html += `</th>`;
            });
            html += `</tr></thead>`;

            html += `<tbody>`;
            result['body'].forEach(function elementBody (
                bodyObject
            ){
                html += `<tr>`;
                html += `<td>` + bodyObject.no + `</td>`;
                html += `<td>` + bodyObject.dato1 + `</td>`;
                html += `<td>` + bodyObject.dato2 + `</td>`;
                html += `<td>` + bodyObject.dato3 + `</td>`;
                html += `<td>` + bodyObject.dato4 + `</td>`;
                html += `<td>` + bodyObject.dato5 + `</td>`;
                html += `</tr>`;
            });
            html += `</tbody> </table>`;

            console.log(html);
            document.getElementById('autoTable').innerHTML = html;
        }),
        error: (function (x, y){
            console.log(x);
            console.log(y);
        })
    });
}

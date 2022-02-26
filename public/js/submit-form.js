import { URL, isJson, newTokenData } from "./script.js";

$(document).ready(function () {
    const ui = {
        csrf_token: $('#ajax_csrf').val(),
        postBtn: $('#submit-post'),
        amount: $('#amount'),
        buyer: $('#buyer'),
        receipt_id: $('#receipt_id'),
        items: $('#items'),
        buyer_email: $('#buyer_email'),
        note: $('#note'),
        city: $("#city"),
        phone: $('#phone'),
    };

    ui.postBtn.click(function (event) {
        const displayError = $('.display-error');
        displayError.html('');
        displayError.fadeOut();

        var formData = {
            amount: ui.amount.val(),
            buyer: ui.buyer.val(),
            receipt_id: ui.receipt_id.val(),
            items: ui.items.val(),
            buyer_email: ui.buyer_email.val(),
            note: ui.note.val(),
            city: ui.city.val(),
            phone: ui.phone.val(),
            csrf_token: $('#ajax_csrf').val(),
        };

        $.ajax({
            type: "POST",
            url: `${URL}/ajax/write/submit-form`,
            data: formData,
            dataType: "json",
            encode: true,
        }).done(function (response) {
            if(response.status === 200) {
                location.replace(`${URL}/home`);
            } else {                
                Object.entries(response).forEach(([key, value]) => {
                    displayError.append(`<li>${value}</li>`);
                });
                
                displayError.fadeIn();
            }
        }).fail(function (response) {
            $('.error-div').html(
                `<div class="alert alert-danger">${response.message}
                    <button type="button" class="close" data-dismiss="alert">&times;</button>
                </div>`
              );
        });;
    });
  });
// return;
// const postBtn = document.querySelector("#submit-post2");
// postBtn.addEventListener("click", () => {
//     const data = newTokenData({
//         'title': document.querySelector('#title').value,
//         'tagline': document.querySelector('#tagline').value,
//         'content': document.querySelector('.ql-editor').innerHTML,
//         'tags': document.querySelector('#tags').value,

//     });

//     fetch(`${URL}/ajax/write/submit-form`, {
//         method: "POST",
//         body: data
//     })
//     .then(response => response.text())
//     .then(result => {
//         if(isJson(result)) {
//             let toast = document.getElementById('draft-err-toast');
//             let bsAlert = new bootstrap.Toast(toast, { delay: 6000 });
//             let obj = JSON.parse(result);

//             if(obj.status === 200) {
//                 location.replace(`${URL}/form?a=${obj.article_id}`);
//             } else {
//                 delete obj.status;
//                 toast.querySelector('.toast-body').innerHTML = `${obj[Object.keys(obj)[0]]}`;
//                 bsAlert.show();
//             }
//         }
//     })
// });
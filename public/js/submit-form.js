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

    $('#submit-form').validate();

    ui.phone.change(function() {
        let phone = ui.phone.val();
        if(phone.slice(0, 2) != '88') {
            ui.phone.val('88' + phone);
        }
    });

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

       let hasError = validateBeforeSubmit();
       if(hasError) {
           return false;
       }

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
        });
    });

    function validateBeforeSubmit() {
        var hasError = '';
        $("#submit-form :input").each(function (i, field) {
            var input = $(this); 
            if(input.hasClass('error')) {
                hasError = true;
            }
        });

        return hasError;
    }

});
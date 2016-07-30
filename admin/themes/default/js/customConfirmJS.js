var confirmResult = false;
$("body").on("click", "[data-bb]", function (ev) {
    if (confirmResult != true) {
        var tiklanan = $(this);
        ev.preventDefault();
        bootbox.confirm($(tiklanan).attr("data-confirm-text"), function (result) {
            confirmResult = result;
            if (confirmResult == true) {
                $(tiklanan)[0].click();
                confirmResult = false;
            }
        });
    }
});

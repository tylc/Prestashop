/**
 * PrestaShop module created by VEKIA, a guy from official PrestaShop community ;-)
 *
 * @author    VEKIA https://www.prestashop.com/forums/user/132608-vekia/
 * @copyright 2010-2020 VEKIA
 * @license   This program is not free software and you can't resell and redistribute it
 *
 * CONTACT WITH DEVELOPER http://mypresta.eu
 * support@mypresta.eu
 */

$('document').ready(function () {
    $('#send_aap_button').fancybox({
        'hideOnContentClick': false
    });

    if (aapfree_aapfree_GDPR != 1) {
        $('#sendAAPEmail').click(function () {
            aapfreeEmail();
        });
    }

});

function aapfreeEmail() {
    var author = $('#aapfree_author').val();
    var email = $('#aapfree_email').val();
    var phone = $('#aapfree_phone').val();
    var question = $('#aapfree_question').val();
    var id_product = $('#id_product_send').val();
    if (email && !isNaN(id_product)) {
        $.ajax({
            url: aapfree_frontcontroller,
            type: "POST",
            headers: {"cache-control": "no-cache"},
            data: {
                action: 'sendQuestion',
                secure_key: aapfree_secureKey,
                author: author,
                phone: phone,
                question: question,
                id_lang: aapfree_id_lang,
                email: email,
                id_product: id_product
            },
            dataType: "json",
            success: function (result) {
                $.fancybox.close();
                var msg = result ? aapfree_confirmation : aapfree_problem;
                var title = aapfree_title;
                fancyMsgBoxaapfree(msg, title);
            }
        });
    } else {
        $('#send_AAP_form_error').show().text(aapfree_missingFields);
    }
}

function fancyMsgBoxaapfree(msg, title) {
    if (title) msg = "<h2 style=\"padding-bottom:10px;\">" + title + "</h2><p>" + msg + "</p>";
    msg += "<br/><p class=\"submit\" style=\"text-align:right; padding-bottom: 0\"><input class=\" btn btn-primary\" type=\"button\" value=\"OK\" onclick=\"$.fancybox.close();\" /></p>";
    $.fancybox(msg, {
        'autoDimensions': false,
        'width': 500,
        'height': 'auto',
        'transitionIn': 'none',
        'transitionOut': 'none'
    });
}


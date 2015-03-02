(function() {

    'use strict';

    $('body').on('click', '.addToCart', function() {
        var id = $(this).attr('data-id');
        $.ajax({
            type: "POST",
            url: '/cart',
            data: 'add_prod=' + id,
            success: function(data) {
                window.location.href = 'cart';
            }
        });
    });

    $('body').on('click', '.cart_remove_prod', function(e) {
        var id = $(this).attr('data-id');
        $.ajax({
            type: "POST",
            url: '/cart',
            data: 'remove_prod=' + id,
            success: function(data) {
                window.location.href = 'cart';
            }
        });
        e.preventDefault();
    });

    $('form.order').submit(function(e) {
        var name = $('#order_name').val(),
            mail = $('#order_mail').val();

        if (!name.length || !mail.length) {
            alert('Fill all fields!');
            return false;
        }

        $.ajax({
            type: "POST",
            url: '/order',
            data: 'name=' + name + '&mail=' + mail,
            success: function(data) {
                debugger
                window.location.href = 'order';
            }
        });
        e.preventDefault();
    })

})();
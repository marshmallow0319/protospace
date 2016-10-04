$(document).on("turbolinks:load", function(){
    $('.js-preview').each(function(){
        var preview = $(this),
        image = preview.find('.js-image');
        image.change(
            function(){
            if ( !this.files.length ) {
                return;
            }
            var file = this.files[0]
            var fr = new FileReader();
            fr.readAsDataURL(file);
            fr.onload = function(){
                preview.css({'background-image':'url(' + fr.result + ')', 'background-size':'contain'});
            }
            }
        );
    });
});

//$(function(){
//$('h1').css({color: 'red'});
//});

//$('.new-author').find('input[type="text"] , input[type="number", ')

$(function(){
    $('h1').css({color: 'red'});

    $('.new-author')
    .on('ajax.send', function(){
        $('.authors').append('<img class="loader" style="height: 80px;" src="https://media.giphy.com/media/Gyr0iZMDKlfsA/giphy.gif" />)
    });

    .on('ajax:complete', function(){
        $('.loader').remove();
    })

});
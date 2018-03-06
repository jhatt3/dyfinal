// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
// require turbolinks
//= require_tree .

// $(document).ready(function () {
//     var trigger = $('.hamburger'),
//         overlay = $('.overlay'),
//        isClosed = false;

//     function buttonSwitch() {

//         if (isClosed === true) {
//             overlay.hide();
//             trigger.removeClass('is-open');
//             trigger.addClass('is-closed');
//             isClosed = false;
//         } else {
//             overlay.show();
//             trigger.removeClass('is-closed');
//             trigger.addClass('is-open');
//             isClosed = true;
//         }
//     }

//     trigger.click(function () {
//         buttonSwitch();
//     });

//     $('[data-toggle="offcanvas"]').click(function () {
//         $('#wrapper').toggleClass('toggled');
//     });
// });

$(document).ready(function() {
    $(document).delegate('.open', 'click', function(event){
        $(this).addClass('oppenned');
        event.stopPropagation();
    });
    $(document).delegate('body', 'click', function(event) {
        $('.open').removeClass('oppenned');
    });
    $(document).delegate('.cls', 'click', function(event){
        $('.open').removeClass('oppenned');
        event.stopPropagation();
    });
});


$(document).ready(function (){

function initialize() {

    var mapOptions = {
    center: { lat: 33.755165,  lng: -84.401016 },
    zoom: 5,
    scrollwheel:false
    };

    var marker = new google.maps.Marker({
        position: myCoords,
        map: map,
    });
    
    var map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);    
    }
    
    google.maps.event.addDomListener(window, 'load', initialize);
});
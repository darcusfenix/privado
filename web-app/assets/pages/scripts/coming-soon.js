var ComingSoon = function () {

    return {
        //main function to initiate the module
        init: function () {
            var austDay = new Date("Agost 9, 2015 00:00:00");
            $('#defaultCountdown').countdown({until: austDay});
            $('#year').text(austDay.getFullYear());
        }

    };

}();
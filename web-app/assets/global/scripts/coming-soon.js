var ComingSoon = function () {

    return {
        //main function to initiate the module
        init: function () {
            var d = "2015/08/09 00:00:00";
            var df = "2015/08/09 00:00:01";
            var austDay = new Date(d);
            $('#defaultCountdown').countdown({until: austDay});
            $('#year').text(austDay.getFullYear());
            $("#test").countdown1(df, function (event) {
                if (event.type === 'finish') {
                    $("#cont").removeClass("hidden");
                    $("#titulo").text("¡Bienvenid@!");
                    $("#texto").text("El registro ha comenzado, da click en el siguiente botón para iniciar tu proceso de inscripción.");
                }
            });
        }
    };

}();


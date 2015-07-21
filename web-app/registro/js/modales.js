window.addEvent("domready", function(e){
  /* Alert */
  $("alert").addEvent("click", function(e){
    e.stop();
    var SM = new SimpleModal({"btn_ok":"Alert button"});
        SM.show({
          "title":"Alert Modal Title",
          "contents":"Lorem ipsum dolor sit amet..."
        });
  })
  
  $("confirm").addEvent("click", function(e){
    e.stop();
    var SM = new SimpleModal({"btn_ok":"Confirm button"});
        SM.show({
          "model":"confirm",
          "callback": function(){
            alert("Action confirm!");
          },
          "title":"Confirm Modal Title",
          "contents":"Lorem ipsum dolor sit amet..."
        });
  })
});
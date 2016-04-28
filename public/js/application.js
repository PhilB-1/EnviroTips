$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
  $("nav h2 button").on("click", function(){
    $("nav h4").show();
  });

  $("#subscribe-now").on("click", function(event){
    event.preventDefault();

    $.ajax({
      method: "GET",
      url: "/users/new"
    }).done(function(msg){
      $("#subscribe-now").hide();
      $("h3").append(msg);

    });
  })

  $("h3").on("submit", "form", function(event){
    event.preventDefault();
    var formInfo = $(this).serialize();

    $.ajax({
      method: "POST",
      url: "/users",
      data: formInfo
    }).done(function(msg){
      $("form").hide();
      // $("form").find("input[type=text]").val("");
      // $("form").find("textarea").val("");
    })
  })
});

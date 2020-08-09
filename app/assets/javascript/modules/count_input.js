$(document).on('turbolinks:load', function() {
  $("#CountLetters").on('keyup', function(){
    console.log("aaa")
    $(".NumberOfLetters").text($(this).val().length + '/1000 文字');
  });
});

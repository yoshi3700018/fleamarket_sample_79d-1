$(document).on('turbolinks:load', function() {
  
  // $(".NumberOfLetters").text($(this).val().length + '/1000 文字');

  $("#CountLetters").on('keyup', function(){

    $(".NumberOfLetters").text($(this).val().length + '/1000 文字');
  });
});

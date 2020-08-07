// ナビゲーションバーのカテゴリ表示を実装の検討用として

$(function(){
  // mouseover時に第一階層カテゴリが表示
  // hamlに隠し要素として表示 mouseoverで、 hidden <=> visible
  $("#Nav_Categories").mouseover(function(e){
    console.log("checker2")
  });

});
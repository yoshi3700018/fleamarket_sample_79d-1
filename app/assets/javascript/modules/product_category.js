$(document).on('turbolinks:load', function() {
  // カテゴリーセレクトオプションを作成する
  function appendOption(category) {
    let html = 
      `<option value="${category.id}" data-category="${category.id}">${category.name}</option>`;
    return html;
  };
  // level2(子)の表示領域を定義する
  function appendLevel2(insertHTML) {
    var level2Html
    level2Html = `<div class="SelectCategory" id="Level2">
                    <select class="Select_Default" id="Level2_Form" >
                      <option value="---" data-category="---">選択してください</option>
                      ${insertHTML}
                    </select>
                  </div>
                `;
    $('#Level2').append(level2Html);
  };
  // level3(孫)の表示領域を定義する
  function appendLevel3(insertHTML) {
    var level3Html
    level3Html = `<div class="SelectCategory" id="Level3">
                    <select class="Select_Default" id="Level3_Form" name="product[category_id]">
                      <option value="---" data-category="---">選択してください</option>
                      ${insertHTML}
                    </select>
                  </div>
                `;
    $('#Level3').append(level3Html);
  };

  // カテゴリーグループ２層を表示する発火条件を定義
  $("#Level1_Form").on("change", function() {
    console.log("checker")
    var value1 = $("#Level1_Form").val();
    console.log(value1)
    if (value1 != "") {
      $.ajax({
        type  : 'GET',
        url   :  '/products/search_level2',
        data  : { 
          level1_id: value1
        },
        dataType: 'json'
      })
      .done(function(level2) {
        $("#Level2").empty();
        $("#Level3").empty();
        // サイズ表示領域を追加する場合の定義を追加するか？ Active_Hashを使うか?
        var insertHTML = '';
        level2.forEach(function(child) {
          insertHTML += appendOption(child);
        });
        appendLevel2(insertHTML);
        $('#Level1').prop("disabled", false);
      })
      .fail(function() {
        alert("カテゴリーを選択してください");
      });
    } else {
      $('#Level2').remove();
      $('#Level1').prop("disabled", false);
    }
  });
  // カテゴリーグループ3層を表示する発火条件を定義
  $(".InputData__CategoryForm").on("change", "#Level2_Form", function() {
    var value2 = $("#Level2_Form option:selected").data("category");
    if (value2 != "") {
      $.ajax({
        type  : 'GET',
        url   : '/products/search_level3',
        data  : {
          level2_id: value2
        },
        dataType: 'json'
      })
      .done(function(level3) {
        $("#Level3").empty();
        var insertHTML = '';
        level3.forEach(function(level3) {
          insertHTML += appendOption(level3);
        });
        appendLevel3(insertHTML);
        $('#Level1').prop("disabled", false);
        $('#Level2').prop("disabled", false);
      })
      .fail(function() {
        alert('第二カテゴリが選択されていません');
      })
    } else {
      $('#Level2').remove();
      $('#Level3').remove();
      $('#Level1').prop("disabled", false);
      $('#Level2').prop("disabled", false);
    };
  });
});
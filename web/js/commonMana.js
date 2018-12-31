(function($){
  $('body').height(document.body.clientHeight);

  $('#fullpage1').fullpage();

  $('.addBox').hide();
  $('#addgoods1').on('click',function(){
    if($('#add2').is(':hidden')){
      $('#add2').show(500);
    }else{
      $('#add2').hide(500);
    }
  });
})(jQuery)

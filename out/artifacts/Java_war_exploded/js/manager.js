(function($){
  $('body').height(document.body.clientHeight);

  $('#fullpage').fullpage({
    scrollingSpeed: 500,
    anchors: ['userspage', 'goodspage'],
    menu: '#menu',
    onLeave:function(origin,destination,direction){
      if(origin.index==0 && destination.index==1){
        $('#users-nav').removeClass('cur');
        $('#goods-nav').addClass('cur');
        if($('#add1').is(':visible')){
          $('#add1').hide(500);
        }
      }
      if(origin.index==1 && destination.index==0){
        $('#goods-nav').removeClass('cur');
        $('#users-nav').addClass('cur');
        if($('#add2').is(':visible')){
          $('#add2').hide(500);
        }
      }
    }
  });

  $('.addBox').hide();
  $('#adduser').on('click',function(){
    if($('#add1').is(':hidden')){
      $('#add1').show(500);
    }else{
      $('#add1').hide(500);
    }
  });
  $('#addgoods').on('click',function(){
    if($('#add2').is(':hidden')){
      $('#add2').show(500);
    }else{
      $('#add2').hide(500);
    }
  });
})(jQuery)

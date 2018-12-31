/*瀑布流*/
window.onscroll=function(){
	var windowHeight = document.documentElement.clientHeight||document.body.clientHeight;
	var srcollTop = document.documentElement.scrollTop ||document.body.scrollTop;
  var srcollH = document.documentElement.scrollHeight ||document.body.scrollHeight;
  if (srcollTop+windowHeight  >= srcollH-60) {
    createDiv();
  }
};

function createDiv(){
  var innerWidth =  window.innerWidth;
 console.log(innerWidth);
  var menu=document.getElementById("menu");
  var divP = document.createElement('div');
  var divC = document.createElement('div');
  var divG = document.createElement('div');
  var a = document.createElement('a');
  var img = document.createElement('img');
  var span = document.createElement('span');
  var p = document.createElement('p');
  var h3 = document.createElement('h3');

  divP.className="col-lg-3 col-sm-4";
  divC.className="thumbnail";
  divG.className="caption";
  a.className="btn btn-primary";
  a.innerHTML="加入菜篮";
  a.href="";
  img.src="img/breakfast.png";
  span.innerHTML="对菜的描述";
  h3.innerHTML="菜名";
  p.appendChild(a);
  span.appendChild(p);
  divG.appendChild(h3);
  divG.appendChild(p);
  divG.appendChild(span);
  divC.appendChild(img);
  divC.appendChild(divG);
  divP.appendChild(divC);

//防止出现appendChild的"剪切"的问题，克隆divp
  var div1=divP.cloneNode(true);
  var div2=divP.cloneNode(true);
  var div3=divP.cloneNode(true);
  var div4=divP.cloneNode(true);
  /*大屏幕一次加四个*/
 if (innerWidth>=1200) {
   menu.appendChild(div1);
   menu.appendChild(div2);
   menu.appendChild(div3);
   menu.appendChild(div4);
 }
 /*中屏幕一次加三个*/
 else if (innerWidth<1200 && innerWidth>=768) {
   menu.appendChild(div1);
   menu.appendChild(div2);
   menu.appendChild(div3);
 }
 /*极小屏幕一次加一个*/
 else{
   menu.appendChild(div1);
   menu.appendChild(div2);
 }
}

/*搜索框判空*/
(function(){
  var inputSearch=document.getElementById("search-input");
  var formSearch=document.getElementById("search-form");

  formSearch.addEventListener("submit",function(e){
     if (inputSearch.value=="") {
       e.preventDefault();
    }else{
      return true;
    }
});
})();

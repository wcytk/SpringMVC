/*判断时是否输入为空*/
function check() {
	var inputGroup=document.getElementsByClassName("form-control");
	var btnSuccess=document.getElementsByClassName("btn-success")[0];
	/*焦点离开时是否为空*/
	for (var i = 0; i<inputGroup.length; i++) {
		(function(i){
			inputGroup[i].addEventListener("blur",function(){
			if (inputGroup[i].value=="") {
				inputGroup[i].style.border="1px solid rgb(196, 33, 42)";
			}
			else{
				 inputGroup[i].style.border="1px solid #ccc"; 
			}
		} );
		})(i);
	}
	function btnCheck() {
		for (var i = 0; i<inputGroup.length; i++) {
			if (inputGroup[i].value=="") {
				return false;
			}
		}return true;
	}
	return btnCheck();
}

 
 
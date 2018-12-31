/*判断时是否输入为空*/
function check() {
    var inputGroup = document.getElementsByClassName("form-control");
    var btnSuccess = document.getElementsByClassName("btn-success")[0];
    var n = false;
    /*焦点离开时是否为空*/
    $.ajax(
        {
            async: false,
            type: "POST",
            url: "/checkUser",
            data: "username=" + $("#username-text").val(),
            dataType: "json",
            success: function (data) {
                if (data.result === "1") {
                    n = true;
                } else {
                    alert("用户名已被注册");
                    n = false;
                }
            },
            error: function () {
                alert("加载失败，请重试！");
                n = false;
            }
        }
    );
    $.ajax(
        {
            async: false,
            type: "POST",
            url: "/checkEmail",
            data: "email=" + $("#truename-text").val(),
            dataType: "json",
            success: function (data) {
                if (data.result === "1") {
                    n = true;
                } else {
                    alert("邮箱已被注册");
                    n = false;
                }
            },
            error: function () {
                alert("加载失败，请重试！");
                n = false;
            }
        }
    );
    for (var i = 0; i < inputGroup.length; i++) {
        (function (i) {
            inputGroup[i].addEventListener("blur", function () {
                if (inputGroup[i].value === "") {
                    inputGroup[i].style.border = "1px solid rgb(196, 33, 42)";
                }
                else {
                    inputGroup[i].style.border = "1px solid #ccc";
                }
            });
        })(i);
    }

    function btnCheck() {
        for (var i = 0; i < inputGroup.length; i++) {
            if(n){
                if (inputGroup[i].value === "") {
                    inputGroup[i].style.border = "1px solid rgb(196, 33, 42)";
                    return false;
                }
                inputGroup[i].style.border = "1px solid #ccc";
            }else {
                return false;
            }
        }
        return true;
    }
    return btnCheck();
}
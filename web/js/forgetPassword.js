var passWordTip = g("password-tip");
var passWordText = g("password-text");
var confirmText = g("confirm-text");
var confirmTip = g("confirm-tip");
var trueEmailText = g("truename-text");
var trueEmailTip = g("truename-tip");
var idNumberText = g("idnumber-text");
var idNumberTip = g("idnumber-tip");
var makeSure = g("make-sure");
var submitButton = g('submit-button');
var identifyingCode = document.getElementsByName('identifying-code')[0];

/*判断是否传入的字符串是否是6-12位字母与数字组合的函数*/
function isName(str) {
    var Regx = /^[\da-z]{6,12}$/i;
    if (Regx.test(str)) {
        return true;
    } else {
        return false;
    }
}

/*焦点判断*/


/*邮箱*/
function isTrueEmail(TrueEmailstr) {
    var reg = new RegExp("^[a-z0-9]+([._\\-]*[a-z0-9])*@([a-z0-9]+[-a-z0-9]*[a-z0-9]+.){1,63}[a-z0-9]+$"); //正则表达式
    if (reg.test(TrueEmailstr)) {
        return true;
    }
    else {
        return false;
    }
}

trueEmailText.onfocus = function () {
    trueEmailVal = trueEmailText.value;
    if (isTrueEmail(trueEmailVal) == true) {
        trueEmailText.className = 'input-normal form-control';
        trueEmailTip.className = 'col-md-4 col-md-offset-2';
        trueEmailTip.innerHTML = '<img src="img/right.png" />';
    } else {
        trueEmailTip.className = 'tip col-md-4 col-md-offset-2';
        trueEmailTip.innerHTML = '请输入真实邮箱！';
    }

    /*键盘输入的时候判断*/
    document.onkeyup = function () {
        trueEmailVal = trueEmailText.value;
        if (isTrueEmail(trueEmailVal) == true) {
            trueEmailText.className = 'input-normal form-control';
            trueEmailTip.className = 'col-md-4 col-md-offset-2';
            trueEmailTip.innerHTML = '<img src="img/right.png" />';
        } else if (isTrueEmail(trueEmailVal) == false) {
            trueEmailTip.className = 'tip col-md-4 col-md-offset-2';
            trueEmailTip.innerHTML = '请输入真实邮箱！';
        }
    }
};

/*发送验证码*/
var send = 0;
identifyingCode.onclick = function () {
    var email = $('#truename-text').val();
    if (confirm("确定要发送吗？")) {
        $.ajax({
            url: "/youxiang",
            type: "POST",
            dataType: "json",
            // contentType : "application/json",
            data: {"email": email},
            success: function (data) {
                alert("发送成功！");
            }
        });
    }
    if (send === 0) {
        send = 1;
        identifyingCode.style.color = "#ccc";
        var seconds = 30, time = null;
        identifyingCode.innerHTML = "重发(" + seconds + "s)";
        time = setInterval(function () {
            seconds--;
            identifyingCode.innerHTML = "重发(" + seconds + "s)";
            if (seconds == 0) {
                clearInterval(time);
                identifyingCode.style.color = "#555";
                identifyingCode.innerHTML = "重发";
                seconds--;
                send = 0;
            }
        }, 1000);
    }
};
/*验证码*/


idNumberText.onfocus = function () {
    idNumberVal = idNumberText.value;
    if (isIDNumber(idNumberVal) == true) {
        idNumberText.className = 'input-normal form-control';
        idNumberTip.className = 'col-md-4 col-md-offset-2';
        idNumberTip.innerHTML = '<img src="img/right.png" />';
    } else {
        idNumberTip.className = 'tip col-md-4 col-md-offset-2';
        idNumberTip.innerHTML = '请输入验证码';
    }
};

/*确认提交*/
submitButton.onclick = function () {
    trueEmailVal = trueEmailText.value;
    idNumberVal = idNumberText.value;
    if (isTrueEmail(trueEmailVal) == false) {
        trueEmailTip.className = 'tip-warm col-md-4 col-md-offset-2';
        trueEmailText.className = 'input-warm form-control';
        identifyingCode.className = 'input-group-addon';
        trueEmailTip.innerHTML = '请输入真实邮箱';
    }
};
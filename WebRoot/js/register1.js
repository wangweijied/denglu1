
//检查身份证格式
function scCard() {
	var scCard = document.getElementById("sc_card_num").value;
	if (scCard.length != 0) {
		if (!checkCard(scCard)) {
			document.getElementById("card_errorTips").innerHTML = "<font color='red'>身份证号码格式错误</font>";
		    return false;
		} else {
			document.getElementById("card_errorTips").innerHTML = "";
		     return true;
		}
	}
	else{
		document.getElementById("card_errorTips").innerHTML = "<font color='red'>请填入身份证号码</font>";	   
		return false;
	}
}
// 检查号码是否符合规范，包括长度，类型
function checkCard(obj) {
	// 身份证号码为15位或者18位，15位时全为数字，18位前17位为数字，最后一位是校验位，可能为数字或字符X
	var reg = /(^\d{15}$)|(^\d{17}(\d|X)$)/;
	if (reg.test(obj) === false) {
		return false;
	}
	return true;
};


// 检查email邮箱
function isEmail() {
	str = document.getElementById("email").value;

	var reg = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((\.[a-zA-Z0-9_-]{2,3}))$/;
	if (!reg.test(str)) {
		document.getElementById("email_errorTips").innerHTML = "<font color='red'>电子邮箱格式错误</font>";
	    return false;
	} else {
		document.getElementById("email_errorTips").innerHTML = "";
		return true;
	}
}
//检查密码格式和密码两次是否一致
function validate_confirmpass() {
	passw = document.getElementById("passw").value;
	confirm_passw = document.getElementById("passw_confirm").value;
	if (passw.replace(/(^\s*)|(\s*$)/g,"")==""){
		document.getElementById("pass_errorTips").innerHTML = "<font color='red'>用户密码不能为空</font>";	
	    return false;
	}
	else {	
        document.getElementById("pass_errorTips").innerHTML = ""; 	
	   if (passw != confirm_passw) {
		document.getElementById("passw_errorTips").innerHTML = "<font color='red'>密码与确认密码不一致</font>";
	    return false;
	   }	
	   else {
		document.getElementById("passw_errorTips").innerHTML = "";
	    return true;
	   }
    }
}
//检查手机号码
function isPhone() {
	str = document.getElementById("phone").value;

	var reg =  /^1\d{10}$/;
	if (!reg.test(str)) {
		document.getElementById("phone_errorTips").innerHTML = "<font color='red'>电子号码格式错误</font>";
	    return false;
	} else {
		document.getElementById("phone_errorTips").innerHTML = "";
		return true;
	}
}
//检查用户名
function validate_username() {
	username = document.register_form.username.value;
	if (username.length > 15 || username.length < 6) {
		document.getElementById("username_errorTips").innerHTML = "<font color='red'>用户名长度必须为6-15之间</fonut>";
	    return false;
	} else {
		document.getElementById("username_errorTips").innerHTML = "";
	    return true;
	}
}
//检查所有输入信息是否正确
function checkreg(){
    if(scCard() && isEmail() && validate_confirmpass() && isPhone() && validate_username())
        return true;
    else
	    alert("请输入正确的信息!");
	     return false;
}
function LoginView(User, Password) {
	var html = '<div id="container">';
	html += '<div id="dialog"></div>';
	html += '<div id="mask"><img id="WaitIcon" style="width:125px;" src="img/waitingIcon.gif" /></div>';
	html += '<table><tr><th colspan="2">';
	html += '<div id="login_logo">KMexpenses - Login</div>';
	html += '</th></tr><tr><td id="login-container">';
	html += '<form name="RegistrationForm" id="RegistrationForm">';
	html += '<div id="login_box"><label>Company:</label>';
	html += '<select required="required" name="CompanyField"></select><br />';
	html += '<div id="login_box"><label>User name:</label>';
	html += '<input type="text" autofocus="autofocus" required="required" name="UserNameEntryField" placeholder="User name" value="'+User+'" maxlength="20" /><br />';
	html += '<label>Password:</label>';
	html += '<input type="password" value="'+Password+'" required="required" name="Password" placeholder="Password" />';
	html += '<div id="demo_text">Please login here</div>';
	html += '<button class="button" type="submit" value="Login" name="SubmitUser" onclick="return LoginUser(CompanyField, UserNameEntryField, Password);">Login</button>';
	html += '</form>';
	html += '</div></td></tr></table></div>';
	CompanyList();
	document.getElementsByTagName("body")[0].innerHTML=html;
	return false;
}

function LoginUser(CompanyName, UserName, Password) {
	if (UserName.value.length==0) {
		alert('Login error', 'You must enter your user name', 'error');
		return false;
	}
	if (Password.value.length==0) {
		alert('Login error', 'You must enter your password', 'error');
		return false;
	}
	var Target=TargetRoot+"/php/index.php";
//	PostData="UserNameEntryField="+UserName.value+"&Password="+Password.value+"&uuid="+window.device.uuid;
	PostData="CompanyNameField="+CompanyName.value+"&UserNameEntryField="+UserName.value+"&Password="+Password.value;
	xmlhttp=new XMLHttpRequest();
	xmlhttp.onreadystatechange=function() {
		if (xmlhttp.readyState==4 && xmlhttp.status==200) {
			document.getElementById("mask").style["display"] = "none";
			document.getElementById("WaitIcon").style["display"] = "none";
			var response = JSON.parse(xmlhttp.responseText);
			switch (response['Code']) {
				case 0:
					SelectTabView(response['SID'], UserName.value, CompanyName.value);
					localStorage.setItem('DefaultDateFormat', response['DefaultDateFormat']);
					return false;
					break;
				case 1:
					alert('Login Error', 'Your User Name/Password combination is invalid. Please try again.', 'error');
					return false
					break;
				case 2:
					alert('Login Error', 'You have had too many failed attempts to login. Please contact us to verify your account.', 'error');
					return false
					break;
				case 3:
					alert('Server Error', 'There is a problem with our servers. Please see http://www.kwamoja.org for details', 'error');
					return false
					break;
				case 4:
					LoginView(UserName.value, Password.value);
					return false
					break;
			}
		}
	}
	document.getElementById("mask").style["display"] = "inline";
	document.getElementById("WaitIcon").style["display"] = "inline";
	xmlhttp.open("POST",Target,true);
	xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	xmlhttp.setRequestHeader("Cache-Control","no-store, no-cache, must-revalidate");
	xmlhttp.setRequestHeader("Pragma","no-cache");
	xmlhttp.send(PostData);
	return false;
}

function CompanyList() {
	var Target=TargetRoot+"/php/CompanyList.php";
	PostData='';
	xmlhttp=new XMLHttpRequest();
	xmlhttp.onreadystatechange=function() {
		if (xmlhttp.readyState==4 && xmlhttp.status==200) {
			document.getElementsByName("CompanyField")[0].innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("POST",Target,true);
	xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	xmlhttp.setRequestHeader("Cache-Control","no-store, no-cache, must-revalidate");
	xmlhttp.setRequestHeader("Pragma","no-cache");
	xmlhttp.send(PostData);
	return false;
}
